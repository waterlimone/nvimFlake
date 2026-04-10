{ ... }:

{
  keymaps = [
    # --- WINDOW NAVIGATION (C-H, J, K, L) ---
    { mode = "n"; key = "<C-h>"; action = "<C-w>h"; }
    { mode = "n"; key = "<C-j>"; action = "<C-w>j"; }
    { mode = "n"; key = "<C-k>"; action = "<C-w>k"; }
    { mode = "n"; key = "<C-l>"; action = "<C-w>l"; }

    # --- UNDO TREE (<leader>u) ---
    { mode = "n"; key = "<leader>u"; action = "<cmd>UndotreeToggle<CR>"; }

    # --- OIL(-) ---
    { mode = "n"; key = "-"; action = "<cmd>Oil<CR>"; }

    # --- TELESCOPE / SEARCH (<leader>f and <leader>r) ---
    { mode = "n"; key = "<leader>f"; action = "<cmd>Telescope find_files<CR>"; }
    { mode = "n"; key = "<leader>r"; action = "<cmd>Telescope live_grep<CR>"; }

    # --- TAB MANAGEMENT ---
    { mode = "n"; key = "<leader>t"; action = "<cmd>tabnew<CR>"; }
    { mode = "n"; key = "<leader>c"; action = "<cmd>tabclose<CR>"; }
    { mode = "n"; key = "<leader>q"; action = "<cmd>tabprevious<CR>"; }
    { mode = "n"; key = "<leader>e"; action = "<cmd>tabnext<CR>"; }

    # --- Flash ---
    {
      mode = [ "n" "x" "o" ];
      key = "s"; 
      action = "<cmd>lua require('flash').jump()<cr>";
      options.desc = "Flash Jump";
    }
    {
      mode = [ "n" "x" "o" ];
      key = "S"; 
      action = "<cmd>lua require('flash').treesitter()<cr>";
      options.desc = "Flash Treesitter (Select blocks of code)";
    }
    # --- Touble diagnostics menu and for quicklists ---
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>lua require('trouble').toggle('diagnostics')<cr>";
      options = {
        silent = true;
        desc = "Toggle Trouble Diagnostics (Lazy)";
      };
    }
    # --- Remove the annoying highlighting in a search w/ ESC ---
    {
      mode = "n";
      key = "<ESC>";
      action = "<cmd>nohlsearch<CR><ESC>";
      options = {
        silent = true;
        desc = "Clear search highlights";
      };
    }
    # --- LazyGit GIT Integration (<leader>gg)---
    { 
      mode = "n"; 
      key = "<leader>gg"; 
      action = "<cmd>LazyGit<CR>"; 
      options.desc = "Git (Floating)";
    }
  ];
}

