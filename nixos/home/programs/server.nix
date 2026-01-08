{ pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ 25565 ];
  networking.firewall.allowedUDPPorts = [ 25565 ];

  services.minecraft-server = {
    enable = true;
    eula = true;
    openFirewall = true;

    package = pkgs.minecraft-server;

    jvmOpts = "-Xms6G -Xmx6G -jar /var/lib/minecraft/fabric.jar nogui";

    serverProperties = {
      server-port = 25565;
      online-mode = false;
      difficulty = "normal";
      gamemode = "survival";
      level-type = "minecraft:normal";
    };
  };

  environment.systemPackages = [ pkgs.jdk21 ];
}
