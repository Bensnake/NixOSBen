{config, pkgs, inputs, ...}:

{
imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    colorschemes.onedark.enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      termguicolors = true;

      clipboard = "unnamedplus";

      updatetime = 300;

      number = true;
      relativenumber = true;

      signcolumn = "yes";

      tabstop = 4;
      shiftwidth = 4;

      mouse = "a";

      scrolloff = 5;
    };

    plugins = {
      neo-tree.enable = true;

      comment.enable = true;

      web-devicons.enable = true;

      bufferline = {
      	enable = true;
      };

      lualine = {
      	enable = true;
	settings.options.icons_enabled = true;
	#theme = "onedark";
      };

      lsp = {
        enable = true;
	servers = {
	  nixd.enable = true;
	  clangd.enable = true;
	  cmake.enable = true;
	  java_language_server.enable = true;
	  pyright.enable = true;
	  lua_ls.enable = true;
	};
      };


      cmp = {
        enable = true;
	autoEnableSources = true;
	settings.sources = [
	  {name = "nvim_lsp";}
	  {name = "path";}
	];
      };

      cmp-nvim-lsp.enable = true;
      luasnip.enable = true;
      cmp_luasnip.enable = true;
      friendly-snippets.enable = true;

      treesitter = {
      	enable = true;
      };

      nvim-autopairs = {
      	enable = true;
      };
    };
  };
}
