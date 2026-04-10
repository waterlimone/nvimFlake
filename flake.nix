{
  description = "NixVim Standalone Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    nixvim.url = "github:nix-community/nixvim/nixos-25.11";
  };
  outputs = { nixpkgs, nixvim, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      
      mkNvim = { systemInputs ? inputs }: nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = import ./main.nix;
        extraSpecialArgs = { inputs = systemInputs; }; 
      };
    in {
      packages.${system}.default = mkNvim { };

      lib.makeNvim = mkNvim;
    };
}
