{ ... }:

{
  files = {
    # Nix
    "ftplugin/nix.lua".opts = {
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
    };

    # Rust
    "ftplugin/rust.lua".opts = {
      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;
    };

    # Python
    "ftplugin/python.lua".opts = {
      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;
    };
    
    # C
    "ftplugin/c.lua".opts = {
      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;
      expandtab = true;
    };

    # C++
    "ftplugin/cpp.lua".opts = {
      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;
    };

    # Fortran
    "ftplugin/fortran.lua".opts = {
      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;
      # Fixed-form Fortran sometimes prefers no expansion, 
      # but for modern F90+, expandtab is usually best.
      expandtab = true; 
    };

    # ftplugin/make.lua
    "ftplugin/make.lua".opts = {
      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;
      expandtab = false; # CRITICAL: Makefiles need real tabs
    };

    # ftplugin/sh.lua
    "ftplugin/sh.lua".opts = {
      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;
      expandtab = true;
    };
  };
}

