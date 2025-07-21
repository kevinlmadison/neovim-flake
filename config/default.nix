{pkgs, ...}: let
  # Fetch the stable nixpkgs branch
  stableNixpkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-23.05.tar.gz";
    sha256 = "0kz0n4ms62k1w9z9cf83mrjc3lix1sz8vn3lkd5afj5ayxz8pmzk";
  }) {};

  # Define the package from the stable nixpkgs
  stablePackage = stableNixpkgs.vimPlugins.none-ls-nvim {};
in {
  imports = [
    ./keymaps.nix
    ./style.nix
    ./telescope.nix
    ./treesitter.nix
    ./harpoon.nix
    ./folds.nix
    ./lsp.nix
    ./completion.nix
    ./format.nix
    ./lint.nix
    ./debug.nix
    ./gitsigns.nix
  ];

  config = {
    globals = {
      mapleader = " ";
    };

    opts = {
      autoindent = true;
      backspace = "indent,eol,start";
      smartcase = true;
      smartindent = true;
      smarttab = true;
      ignorecase = true;
      number = true;
      colorcolumn = "80";
      cursorcolumn = true;
      relativenumber = true;
      shiftwidth = 2;
      shiftround = true;
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
      list = true;
      listchars = "trail:¬,precedes:«,extends:»,tab:→⋅";
      wrap = true;
      swapfile = false; #Undotree
      backup = false; #Undotree
      undofile = true;
      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 8;
      signcolumn = "yes";
      updatetime = 50;
      foldlevelstart = 99;
      # clipboard = "unnamedplus";
      breakindent = true;
      completeopt = "menu,menuone,noselect";
    };

    highlight = {
      Comment.fg = "#ff00ff";
      Comment.bg = "#000000";
      Comment.underline = true;
      Comment.bold = true;
    };

    plugins = {
      mini = {
        enable = true;
        mockDevIcons = true;
        modules = {
          icons = {};
        };
      };
      none-ls = {
        enable = true;
        # package = stablePackage;
        sources.formatting = {
          prisma_format = {
            enable = false;
          };
          black = {
            enable = true;
          };
        };
        settings.root_dir = ''require("null-ls.utils").root_pattern(".git")'';
      };
      windsurf-vim = {
        enable = true;
        settings = {
          no_map_tab = true;
          disable_bindings = true;
        };
      };
      cursorline = {
        enable = true;
        settings = {
          cursorline = {
            enable = true;
            timeout = 0;
            number = true;
          };
        };
      };
      oil.enable = true;
      ollama.enable = true;
      undotree.enable = true;
      flash.enable = true;
      fugitive.enable = true;
      nvim-tree.enable = true;
      indent-blankline.enable = true;
      friendly-snippets.enable = true;
      comment.enable = true;
      vim-surround.enable = true;
      navic.enable = true;
      # mini.modules.pairs = {};
      nvim-autopairs.enable = true;
      nvim-autopairs.settings.check_ts = true;
      trouble.enable = true;
      ts-context-commentstring.enable = true;
      which-key = {
        enable = false;
        registrations = {
          "<leader>c" = {
            name = "[C]ode";
            _ = "which_key_ignore";
          };
          "<leader>d" = {
            name = "[D]ocument";
            _ = "which_key_ignore";
          };
          "<leader>g" = {
            name = "[G]it";
            _ = "which_key_ignore";
          };
          "<leader>h" = {
            name = "Git [H]unk";
            _ = "which_key_ignore";
          };
          "<leader>r" = {
            name = "[R]ename";
            _ = "which_key_ignore";
          };
          "<leader>s" = {
            name = "[S]earch";
            _ = "which_key_ignore";
          };
          "<leader>t" = {
            name = "[T]oggle";
            _ = "which_key_ignore";
          };
          "<leader>w" = {
            name = "[W]orkspace";
            _ = "which_key_ignore";
          };
        };
      };
    };
    extraPackages = with pkgs; [
      # Formatters
      alejandra
      # asmfmt
      # astyle
      ansible-language-server
      black
      cmake-format
      gofumpt
      golines
      gotools
      isort
      nodePackages.prettier
      prettierd
      rustfmt
      shfmt
      stylua
      # Linters
      # commitlint
      eslint_d
      ansible-lint
      golangci-lint
      # hadolint
      # html-tidy
      luajitPackages.luacheck
      markdownlint-cli
      nodePackages.jsonlint
      pylint
      ruff
      (python311.withPackages (ps:
        with ps; [
          python-lsp-server
          python-lsp-ruff
          python-lsp-black
          pylsp-rope
          pylsp-mypy
          pyls-isort
        ]))

      pyright
      shellcheck
      nil
      # vale
      yamllint
      # Debuggers / misc deps
      # asm-lsp
      # bashdb
      clang-tools
      # delve
      # fd
      # gdb
      ansible
      go
      # lldb_17
      # llvmPackages_17.bintools-unwrapped
      marksman

      # (nerdfonts.override {
      #   fonts = [
      #     "JetBrainsMono"
      #     "RobotoMono"
      #   ];
      # })

      python3
      ripgrep
      # rr
      # tmux-sessionizer
      zig
    ];
    extraConfigLua = ''
      vim.g.clipboard = {
        name = 'OSC 52',
        copy = {
          ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
          ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
        },
        paste = {
          ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
          ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
        },
      }
    '';
  };
}
