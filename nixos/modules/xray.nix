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
                port = 58749;
                users = [
                  {
                    id = "010c46ba-0029-4df6-8907-85bcdd875f35";
                    flow = "xtls-rprx-vision";
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
              serverName = "www.icloud.com";
              fingerprint = "chrome";
              show = false;
              publicKey = "nm9IsmymzM2tVhWgrStOBUAXVGNQCkaJjFZ48FrneRQ";
              shortId = "406d122ca9";
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
