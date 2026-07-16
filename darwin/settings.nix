{ self, ... }:
{
  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;

    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        NSNavPanelExpandedStateForSaveMode = true;
        AppleICUForce24HourTime = true;
      };

      dock = {
        autohide = true;
      };

      finder = {
        FXPreferredViewStyle = "Nlsv";
        CreateDesktop = false;
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      trackpad = {
        Clicking = true;
      };

    };
  };
}