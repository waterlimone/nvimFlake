{ pkgs, inputs, ... }:

{
  imports = [
    ./nixvim/plugins.nix  
    ./nixvim/files.nix
    ./nixvim/keymaps.nix
    ./nixvim/options.nix
  ];

  extraPackages = [ 
    pkgs.ripgrep  # Useful for Telescope
    pkgs.fd       # Useful for Telescope
    pkgs.git
  ];

  globals.mapleader = " "; # Sets leader to Space
  colorschemes.onedark = {
    enable = true;
    settings = {
      style = "darker";
      transparent = true;
      term_colors = true;    # Use terminal colors for better integration
      code_style = {
        comments = "italic";
        keywords = "none";
        functions = "none";
        strings = "none";
        variables = "none";
      };
    };
  };


  diagnostic = {
    settings = {
      signs = true; 
      underline = true;

      virtual_text = {
        spacing = 4;
        severity = { min = "hint"; };
        prefix = "●";
      };
      severity_sort = true;
      update_in_insert = false;
    };
  };


  extraConfigLua = ''
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN]  = "󰀪 ",
          [vim.diagnostic.severity.HINT]  = "󰌶 ",
          [vim.diagnostic.severity.INFO]  = "󰋽 ",
        },
      },
    })

    -- The Auto-Hover Diagnostic Window
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, {
          focusable = false,
          close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" },
          border = "rounded",
          source = "always",
          scope = "cursor",
        })
      end,
    })
  '';
}
