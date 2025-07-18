{...}: {
  plugins.nvim-ufo = {
    enable = true;
    settings = {
      providerSelector = ''
        function(bufnr, filetype, buftype)
         			return { 'treesitter', 'indent' }
         		end
      '';
    };
  };
  extraConfigLua = ''
    vim.keymap.set('n', 'zK', function()
    	local winid = require('ufo').peekFoldedLinesUnderCursor()
    	if not winid then
    		vim.lsp.buf.hover()
    	end
    end, { desc = "Pee[k] fold" })
  '';
}
