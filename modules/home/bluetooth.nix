{ ... }:
{
  programs.zsh = {
    initContent = ''
      # Connect to bluetooth devices shortcuts
      bt-conn-mac() {
        echo -e "connect $1 \nquit" | bluetoothctl
      }
      bt-disconn-mac() {
        echo -e "disconnect $1 \nquit" | bluetoothctl
      }
      bt-soundcore() {
        bt-conn-mac "F4:9D:8A:2A:A9:B0"
      }
      bt-d-soundcore() {
        bt-disconn-mac "F4:9D:8A:2A:A9:B0"
      }
      bt-jbl() {
        bt-conn-mac "F8:5C:7E:D3:82:7B"
      }
    '';
  };
}

