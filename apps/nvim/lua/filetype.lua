vim.filetype.add({
  extension = {
    -- Map podman quadlets files to Systemd units.
    container = 'systemd',
    network = 'systemd',
    image = 'systemd',
    pod = 'systemd',
    volume = 'systemd',
    build = 'systemd',
    kube = 'systemd',
  },
})
