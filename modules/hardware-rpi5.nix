{
  config, lib, pkgs, modulesPath, ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "usbhid"
        "usb_storage"
        "xhci_pci"
        "nvme"
      ];
      kernelModules = [
        "nvme"
      ];
    };
    kernel = {
      sysctl = {
        "vm.swappiness" = 10;
        "vm.dirty_writeback_centisecs" = 6000;
      };
    };
  };

  hardware = {
    enableRedistributableFirmware = true;
    deviceTree.filter = "bcm2712-rpi-5-b.dtb";
    raspberry-pi = {
      "5" = {
        fkms-3d = {
          enable = true;
        };
        overclock = {
          arm-freq = 2400; # MHz
          gpu-freq = 800;  # MHz
        };
      };
    };
  };
}
