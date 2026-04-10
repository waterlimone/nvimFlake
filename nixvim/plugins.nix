{ pkgs, inputs, ... }:

{
  plugins = {
    # --- THE "TIME MACHINE" ---
    undotree.enable = true;

    # --- GIT: The Communicator ---
    lazygit.enable = true;

    # --- TERMINAL: The Executor ---
    toggleterm = {
      enable = true;
      settings = {
        open_mapping = "[[<C-t>]]"; # Ctrl+t to pop up a terminal
        direction = "float";
        float_opts.border = "rounded";
      };
    };

    # --- FILE EXPLORATION ---
    oil = {
      enable = true; 
      settings = {
        keymaps = {
          "<leader>t" = "actions.select_tab";
          "<leader>v" = "actions.select_vsplit"; # Opens on the right
          "<leader>s" = "actions.select_split";  # Opens on the bottom
          "<CR>" = "actions.select";
          "-" = "actions.parent";
          "g?" = "actions.show_help";
          "<C-p>" = "actions.preview";
        };
        view_options.show_hidden = true;
        delete_to_trash = true;
      };
    };

    trouble = {
      enable = true;
      settings = {
        auto_close = true; # Close the list when you jump to an error
      };
    };

    # --- UTILITIES ---
    web-devicons.enable = true;
    telescope = {
      enable = true;
      extensions.fzf-native.enable = true;
      settings = {
        defaults = {
          mappings = {
            # --- Normal Mode ---
            n = {
              "v" = "select_vertical";
              "s" = "select_horizontal";
              "t" = "select_tab";
              "q" = "close";
            };
            
            # --- Insert Mode ---  
            i = {
              "<C-v>" = "select_vertical";
              "<C-x>" = "select_horizontal";
              "<C-t>" = "select_tab";
            };
          };
          layout_config.prompt_position = "top";
          sorting_strategy = "ascending";
          
          vimgrep_arguments = [
            "${pkgs.ripgrep}/bin/rg"
            "--color=never"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
            "--smart-case"
            "--hidden"        # Look at hidden files too
            "--glob=!.git/*"  # But don't search inside the .git folder
          ];
        };
      };
    };
    # Replacing auto-pairs
    nvim-autopairs.enable = true;
    # Replacing GitGutter
    gitsigns = {
      enable = true;
      settings = {
        signcolumn = true;      # Keep the gutter visible
        numhl = false;          # Don't highlight the line numbers (cleaner)
        linehl = false;         # Don't highlight the whole line
        word_diff = false;
        watch_gitdir = {
          follow_files = true;
        };
        attach_to_untracked = true;
      };
    };

    flash = {
      enable = true;
      settings = {
        labels = "asdfghjklqwertyuiopzxcvbnm";
        search = {
          enabled = true; # Enhances regular / and ? search
        };
        jump = {
          autojump = true;
        };
      };
    };

    # Auto Completion
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        };
      };
    };


    lualine.enable = true;
    treesitter = {
      enable = true;

      settings.ensure_installed = [ "nix" "rust" "python" "cpp" "lua" "bash" "fortran" "make" ];
      settings.highlight.enable = true;
    }; 

    # Language Servers
    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        fortls.enable = true;
        rust_analyzer = {
                enable = true;
                installCargo = false;
                installRustc = false;
        };
        pyright.enable = true; # Python
        nixd = {
          enable = true;
          package = pkgs.nixd;
          settings = {
            nixpkgs.expr = "import ${pkgs.path} { }";
            formatting.command = [ "${pkgs.nixfmt}/bin/nixfmt" ];
            options = {
              # Only try this if home-manager is actually in our inputs
              home_manager.expr = if (inputs ? home-manager) 
                then "(builtins.getFlake \"${inputs.home-manager}\").options"
                else ""; 
              
              nixos.expr = if (inputs ? self)
                then "(builtins.getFlake \"${inputs.self}\").nixosConfigurations.mushi.options"
                else "";
            };
          };
        };
      };
    };
  };
}
