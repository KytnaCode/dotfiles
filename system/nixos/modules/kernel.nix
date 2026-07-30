{
  lib,
  config,
  ...
}: {
  options.custom.kernel.hardening.enable = lib.mkEnableOption "enable kernel hardening";

  config = lib.mkIf config.custom.kernel.hardening.enable {
    boot = {
      kernel.sysctl = {
        "kernel.kptr_restrict" = 2;
        "kernel.dmesg_restrict" = 1;
        "kernel.printk" = "3 3 3 3";
        "kernel.unprivileged_bpf_disabled" = 1;
        "net.core.bpf_jit_harden" = 2;
        "dev.tty.ldisc_autoload" = 0;
        "vm.unprivileged_userfaultfd" = 0;
        "kernel.kexec_load_disabled" = 1;
        "kernel.sysrq" = 4;
        "kernel.perf_event_paranoid" = 3;
        "net.ipv4.icmp_echo_ignore_all" = 1;
        "net.ipv4.tcp_sack" = 0;
        "net.ipv4.tcp_dsack" = 0;
        "net.ipv4.tcp_fack" = 0;
        "kernel.yama.ptrace_scope" = 2;
        "vm.mmap_rnd_bits" = 32;
        "vm.mmap_rnd_compat_bits" = 16;
        "fs.protected_symlinks" = 1;
        "fs.protected_hardlinks" = 1;
        "fs.protected_fifos" = 2;
        "fs.protected_regular" = 2;
      };

      kernelParams = [
        "slab_nomerge"
        "init_on_alloc=1"
        "init_on_free=1"
        "page_alloc.shuffle=1"
        "pti=on"
        "randomize_kstack_offset=on"
        "vsyscall=none"
        "debugfs=off"
        "lockdown=confidentiality"
        "quiet"
        "loglevel=0"
      ];

      blacklistedKernelModules = [
        # Obscure network protocols.
        "dccp"
        "sctp"
        "rds"
        "tipc"
        "n-hdlc"
        "ax25"
        "netrom"
        "x25"
        "rose"
        "decnet"
        "econet"
        "af_802154"
        "ipx"
        "appletalk"
        "psnap"
        "p8023"
        "p8022"
        "can"
        "atm"

        # Uncommon filesystems.
        "cramfs"
        "freevxfs"
        "jffs2"
        "hfs"
        "hfsplus"
        "squashfs"
        "udf"

        # Networks filesystems.
        "cifs"
        "nfs"
        "nfsv3"
        "nfsv4"
        "ksmbd"
        "gfs2"

        # Vivid driver
        "vivid"
      ];
    };
  };
}
