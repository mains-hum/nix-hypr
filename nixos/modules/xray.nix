{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.xray = {
    enable = true;
    settings = {
      inbounds = [
        {
          port = 1080;
          protocol = "socks";
          settings = {
            auth = "noauth";
            udp = true;
          };
        }
        {
          port = 1081;
          protocol = "http";
          settings = { };
        }
      ];
      outbounds = [
        {
          protocol = "vless";
          settings = {
            vnext = [
              {
                address = "144.31.166.105";
                port = 51736;
                users = [
                  {
                    id = "00178127-ca7e-4fe8-8aab-ee4765c365fb";
                    encryption = "none";
                  }
                ];
              }
            ];
          };
          streamSettings = {
            network = "tcp";
            security = "reality";
            realitySettings = {
              serverName = "www.amd.com";
              fingerprint = "chrome";
              show = false;
              publicKey = "0p6BO2BNxbsSKe0PvIFYC0t5fkst0bU3e-M3LDj2m1I";
              shortId = "1fbf4842b0";
              spiderX = "/";
            };
          };
        }
      ];
    };
  };

  networking.proxy.default = "http://127.0.0.1:1081";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.firewall.allowedTCPPorts = [
    1080
    1081
  ];
}
