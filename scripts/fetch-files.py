import sys
from pathlib import Path
import io
import yaml
from git import Repo
from hashlib import sha256

local_dir = ".fetch-files"


def main():
    if len(sys.argv) != 2:
        print("expected exactly one argument")

        return

    config_path = sys.argv[1]

    config = read_config(config_path)

    for file in config["files"]:
        get_file(file)


def get_file(file):
    repo = clone_or_get_repo(file["repo"])

    commit = repo.commit(file["rev"])

    targetFile = commit.tree / file["path"]

    with io.BytesIO(targetFile.data_stream.read()) as f:
        content = f.read().decode("utf-8")

    hsh = sha256(content.encode("utf-8"))

    if hsh.hexdigest() != file["sha256"]:
        raise Exception(f"sha256 hash mismatch {hsh.hexdigest()}")

    targetPath = Path(file["target"])

    if not targetPath.exists():
        write_file(targetPath, content)

        return

    if targetPath.is_dir():
        filepath = Path(file["path"])

        targetPath = targetPath.joinpath(filepath.name)

    if targetPath.exists():
        with open(targetPath, "r") as file:
            currentHsh = sha256(file.read().encode("utf-8")).hexdigest()

        if hsh.hexdigest() == currentHsh:
            return

    write_file(targetPath, content)

    return


def clone_or_get_repo(url: str):
    repo_path: Path = Path(local_dir).joinpath(url)

    if repo_path.exists():
        return Repo(repo_path)

    return Repo.clone_from(url, repo_path)


def write_file(targetPath: Path, content: str):
    with open(targetPath, "w") as file:
        file.write(content)


def read_config(config_path: str):
    with open(config_path, "r") as file:
        data = yaml.safe_load(file)

    return data


if __name__ == "__main__":
    main()
