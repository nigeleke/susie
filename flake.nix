{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    macro11pkg.url = "github:nigeleke/macro11";
  };

  outputs = { nixpkgs, macro11pkg, systems, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system}; 
      m11 = macro11pkg.packages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.vscode 
          m11.default
        ];
      };
    };
}
