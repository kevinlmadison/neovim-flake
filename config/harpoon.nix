{...}: {
  keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = "function() require'harpoon':list():add() end";
    }
    {
      mode = "n";
      key = "<C-e>";
      action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
    }
    {
      mode = "n";
      key = "<C-j>";
      action.__raw = "function() require'harpoon':list():select(1) end";
    }
    {
      mode = "n";
      key = "<C-k>";
      action.__raw = "function() require'harpoon':list():select(2) end";
    }
    {
      mode = "n";
      key = "<C-l>";
      action.__raw = "function() require'harpoon':list():select(3) end";
    }
    {
      mode = "n";
      key = "<C-m>";
      action.__raw = "function() require'harpoon':list():select(4) end";
    }
  ];
  plugins.harpoon = {
    enable = true; # The name, is the harpoon-maker-agen
  };
  # extraConfigLua = ''
  #   -- Primeagen Harpoon config
  #   local mark = require("harpoon.mark")
  #   local ui = require("harpoon.ui")
  #
  #   vim.keymap.set("n", "<leader>a", mark.add_file)
  #   vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
  #   vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
  #   vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
  #   vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
  #   vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
  # '';
}
