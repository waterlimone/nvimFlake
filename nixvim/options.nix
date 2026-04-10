{ ... }:

{
  opts = {
    # 1. Expand tabs to spaces
    expandtab = true;
    shiftwidth = 2;
    tabstop = 2;
    softtabstop = 2;
    smartindent = true;
    updatetime = 300;

    # --- SEARCH & MATCHING ---
    showmatch = true;      # Jump to matching bracket
    ignorecase = true;     # Case insensitive search
    smartcase = true;      # ...unless search contains a capital letter
    hlsearch = true;       # Highlight all matches
    incsearch = true;      # Search as you type

    # --- UI CONFIG ---
    number = true;         # Show line numbers
    relativenumber = true; # Show relative line numbers (your 'rnu')
    colorcolumn = "80";    # Vertical bar at 80 chars
    splitbelow = true;     # Horizontal splits open below
    splitright = true;     # Vertical splits open to the right
    termguicolors = true;  # True color support
    cursorline = true;     # Highlight the current line
    scrolloff = 8;         # Keep at least 8 lines above/below cursor
  };
}
