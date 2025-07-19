{...}: {
  colorschemes = {
    # gruvbox = {
    #   enable = true;
    #   settings = {
    #     palette_overrides = {
    #       dark0 = "#000000";
    #       dark1 = "#141414";
    #       dark3 = "#3c3836";
    #     };
    #   };
    # };
    rose-pine = {
      enable = true;
      settings = {
        variant = "moon";
        styles.transparency = true;
      };
      # transparentBackground = true;
      # transparentFloat = true;
    };
  };
  plugins = {
    lualine = {
      enable = true;
      settings = {
        options = {
          iconsEnabled = false;
          globalstatus = true;
          componentSeparators = {
            left = "|";
            right = "|";
          };
          sectionSeparators = {
            left = "";
            right = "";
          };
        };
      };
    };
  };
}
