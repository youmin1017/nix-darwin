{
  description = "Home Manager configuration of youmin";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      flake-utils,
      ...
    }:
    let
      ourSystems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];
    in
    flake-utils.lib.eachSystem ourSystems (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          homeConfigurations."youmin" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            # Specify your home configuration modules here, for example,
            # the path to your home.nix.
            modules = [
              ./home.nix
              ./pkgs
            ];

            # Optionally use extraSpecialArgs
            # to pass through arguments to home.nix
            extraSpecialArgs = {
              inherit system;
            };
          };
        };
      }
    );

  # let
  #   system = "aarch64-darwin";
  #   pkgs = nixpkgs.legacyPackages.${system};
  # in
  # {
  #   homeConfigurations."youmin" = home-manager.lib.homeManagerConfiguration {
  #     inherit pkgs;
  #
  #     # Specify your home configuration modules here, for example,
  #     # the path to your home.nix.
  #     modules = [
  #       ./home.nix
  #       ./pkgs
  #     ];
  #
  #     # Optionally use extraSpecialArgs
  #     # to pass through arguments to home.nix
  #     extraSpecialArgs = {
  #       inherit system;
  #     };
  #   };
  # };
}
