{pkgs, config, ...}:

{
  programs.nvf = {
  	enable = true;
	settings = {
	  vim = {
            viAlias = true;
            vimAlias = true;
	    theme = {
		  enable = true;
		  name = "onedark";
		  style = "deep";
		};
	    
		statusline.lualine.enable = true;
		telescope.enable = true;
		autocomplete.nvim-cmp.enable = true;
                autopairs.nvim-autopairs.enable = true;
                filetree.neo-tree.enable = true;

                spellcheck.enable = true;
                languages = {
                  enableLSP = true;
                  enableTreesitter = true;

                  nix.enable = true;
                  clang.enable = true;
                  python.enable = true;
                };

                visuals = {
                  nvim-scrollbar.enable = true;
                  nvim-web-devicons.enable = true;
                  cinnamon-nvim.enable = true;
                  fidget-nvim.enable = true;
                  
                  highlight-undo.enable = true;
                  indent-blankline.enable = true;
                };

                tabline.nvimBufferline.enable = true;

                dashboard.dashboard-nvim.enable = true;

                ui = {
                  borders.enable = true;
                  noice.enable = true;
                  colorizer.enable = true;
                  illuminate.enable = true;
                  fastaction.enable = true;
                };
	  };
	};
  };
}
