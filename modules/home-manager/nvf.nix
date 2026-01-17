{pkgs, config, inputs, ...}:

let
	stdheader = pkgs.vimUtils.buildVimPlugin {
    name = "vim-stdheader";
    src = pkgs.fetchFromGitHub {
		owner = "42paris";
		repo = "42header";
		rev = "e6e6b191871545e0d43f1aad817070bc806b8fa7";
		hash = "sha256-WflranTZgaAoRTBqHsRuQEdvL15fv21ZRX77BzDMg0I=";
    };
  };
in
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  home.sessionVariables.EDITOR = "nvim";
  programs.nvf = {
  	enable = true;
	settings = {
	  vim = {
		extraPlugins = {
			stdheader = {
				package = stdheader;
				setup = ''
							vim.g.user42 = "maboualy"
							vim.g.mail42 = "maboualy@student.42.fr"
				'';
			};
		};
        viAlias = true;
        vimAlias = true;

        options = {
	    # scrollOffset = 5;
            tabstop = 4;
            shiftwidth = 4;
            softtabstop = 4;
            expandtab = false;
        };

	    theme = {
		  enable = true;
		  name = "onedark";
		  style = "deep";
        };
	    
        statusline.lualine.enable = true;
	    telescope.enable = true;
	    autocomplete.nvim-cmp = {
			enable = true;
			mappings.next = "<C-n>";
			mappings.previous = "<S-n>";
			mappings.confirm = "<C-CR>";
		};
        autopairs.nvim-autopairs.enable = true;
        filetree.neo-tree.enable = true;

        spellcheck.enable = true;
		lsp.enable = true;
        languages = {
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

        # globals = {
        #     mapleader = " ";
        # };
	  };
	};
  };
}
