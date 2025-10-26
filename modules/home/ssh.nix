{ ... }:
{
  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        addKeysToAgent = "1h";

        controlMaster = "auto";
        controlPath = "~/.ssh/control-%r@%h:%p";
        controlPersist = "10m";

        forwardAgent = false;
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
      };

      github = {
        host = "github.com";
        hostname = "ssh.github.com";
        user = "git";
        port = 443;
        identityFile = "~/.ssh/id_github";
        identitiesOnly = true;
      };

      mikrus = {
        host = "mikrus";
        hostname = "frog01.mikr.us";
        user = "frog";
        port = 12222;
        identityFile = "~/.ssh/id_mikrus";
        identitiesOnly = true;
      };

      ovh = {
        host = "ovh";
        hostname = "vps-a0cbd848.vps.ovh.net";
        user = "debian";
        port = 22;
        identityFile = "~/.ssh/id_ovh";
        identitiesOnly = true;
      };
    };
  };

  services.ssh-agent.enable = true;
}
