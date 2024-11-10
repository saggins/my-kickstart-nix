{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    saggstuff.url = "github:saggins/my-kickstart-nix/main";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, saggstuff, flake-utils}: 
    flake-utils.lib.eachDefaultSystem (system : 
      let pkgs = nixpkgs.legacyPackages.${system}; in
    {
        devShells.default = pkgs.mkShell {
          buildInputs = [ saggstuff.packages.${system}.nvim];
        };
    });
    
}
