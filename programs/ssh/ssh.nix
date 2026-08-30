{ pkgs, ... }:

{
  # Enable the SSH agent to remember your passphrase during the session
  programs.ssh.startAgent = true;

  # (Optional) Tell SSH specifically to use this key for GitHub
  programs.ssh.matchBlocks = {
    "github.com" = {
      identityFile = "~/.ssh/id_ed25519";
      identitiesOnly = true;
    };
  };
}



/*{ config, pkgs, ... }:

{
  # start the ssh agent
  services.ssh-agent = {
    enable = true;
  };

  # configure the ssh settings
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      # Auto load the keys into the agent for all ssh keys
      "*" = {
        AddKeysToAgent = "yes";
      };

      # Use the GitHub-specific SSH key
      "github.com" = {
        HostName = "github.com";
        User = "git";
        IdentityFile = "~/.ssh/githubKey";
        # only try the specified key for github
        IdentitiesOnly = true;
      };
    };
  };

  # Tell applications where the SSH agent socket is
  home.sessionVariables = {
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/ssh-agent";
  };
}
*/
