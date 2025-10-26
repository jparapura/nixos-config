{ ... }:
{
  programs.zsh = {
    initContent = ''
      # Use vi key bindings
      set -o vi
    '';
  };
}
