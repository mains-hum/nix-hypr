{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    extraConfig = "";

    configFile.text = ''
      $env.config = {
        show_banner: false
        edit_mode: vi 
        cursor_shape: {
          vi_insert: block
          vi_normal: underscore
        }
      }

      $env.PROMPT_COMMAND = { || 
        let dir = ($env.PWD | str replace $env.HOME "~")
        $"[($dir)] "
      }
      $env.PROMPT_COMMAND_RIGHT = { || "" }

      alias la = ls -a
      alias .. = cd ..
      alias ncgd = doas nix-collect-garbage -d
      alias ... = cd ../..
      alias gs = git status
      alias ga = git add
      alias gc = git commit
      alias gcl = git clone
      alias gp = git push
      alias gpom = git push origin main
      alias r = doas nixos-rebuild switch --flake /etc/nixos#nixos
      alias u = doas nix flake update
      alias scb = doas cargo build
      alias scr = doas cargo run
      alias cb = cargo build
      alias cr = cargo run
      alias grep = grep --color=auto
      alias sh = doas hx
      alias re = reboot
      alias h = hx
      alias j = joshuto
      alias s = synapce
      alias c = clear
      alias f = fastfetch
    '';
  };

  programs.starship.enable = false;
}
