{ pkgs, ... }:

{
  security.doas = {
    enable = true;
    extraRules = [
      {
        users = [ "nixos" ];
        keepEnv = true;
        persist = true;
        setEnv = [ "PATH" "HOME" "XDG_CONFIG_HOME" "TERM" ];
      }
    ];
  };

}
