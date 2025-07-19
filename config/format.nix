{...}: {
  plugins.conform-nvim = {
    enable = true;
    # formatters = {
    #   asmfmt = {
    #     command = "asmfmt";
    #     stdin = true;
    #   };
    # };
    settings = {
      format_on_save = {
        lspFallback = true;
        timeoutMs = 2000;
      };
      formatters_by_ft = {
        # asm = ["asmfmt"];
        c = ["astyle"];
        cpp = ["astyle"];
        css = ["prettierd" "prettier"];
        cmake = ["cmake_format"];
        go = ["goimports" "gofumpt" "golines"];
        html = ["prettierd" "prettier"];
        javascript = ["prettierd" "prettier"];
        javascriptreact = ["prettier"];
        json = ["prettier"];
        lua = ["stylua"];
        markdown = ["prettier"];
        nix = ["alejandra"];
        python = ["isort" "black"];
        rust = ["rustfmt"];
        sh = ["shfmt"];
        typescript = ["prettierd" "prettier"];
        typescriptreact = ["prettier"];
        yaml = ["prettierd" "prettier"];
      };
    };
  };

  extraConfigLuaPre = ''
    -- Formatting function for conform
    _G.format_with_conform = function()
    	local conform = require("conform")
    	conform.format({
    		lsp_fallback = true,
    		async = false,
    		timeout_ms = 2000,
    	})
    end
  '';
}
