let

#######################
# Configuration       #
#######################

nodejs = pkgs.nodejs-8_x;

buildInfo = {
	packages = [
  ];
  # Ensure that any pkgs called / referenced in 'config' are specifically declared in the packages for layered-image to keep last layer minimal
  config = {
		Env = [ "PATH=${pkgs.coreutils}/bin/:${nodejs}/bin/:${pkgs.bash}/bin/"
						"NODE_PATH=/lib/${nodeModules.modulePath}/${nodeModules.basicName}" ];
    # Cmd must be specified as Nix strips any prior definition out to ensure clean execution
		Cmd = [
			"npm start"
		];
		WorkingDir = "/lib/${nodeModules.modulePath}/${nodeModules.basicName}";
  };
  name = "layered-on-top";
  tag = "latest";
};

imagePackages			= [ pkgs.coreutils pkgs.tini pkgs.bash ];
imagePackagesDev	= [];

#######################
# Build Image Code    #
#######################

pkgs = import <nixpkgs> {
  overlays = [ (self: super: {
    # Allow unstable libraries if newer versions are of software are needed
    unstable = import (
      fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz
      ) { config = { allowUnfree = true; }; };
    }
  ) ];
};

nodeModules = (import ./default.nix ({ inherit (pkgs); inherit (nodejs); }));
in
	rec {
		prod = let
			transient-layers = pkgs.unstable.dockerTools.buildLayeredImage {
				name = ("transient-layers-" + buildInfo.name);
				tag = buildInfo.tag;
				contents = imagePackages ++ buildInfo.packages ++ [ nodeModules ];
			};
			in
				pkgs.unstable.dockerTools.buildImage {
					name = buildInfo.name;
					tag = buildInfo.tag;
					fromImage = transient-layers;
					# Nix is building the container in a workspace, links should always be ./ which will result in / in the final container
					extraCommands = ''
						#readlink ./lib/node_modules/cloud-native-internal/node_modules
						# Examples
						# mkdir -p ./var/lib/mysql
						# ln -s "${pkgs.bash}/bin/bash"  ./bash
					'';
					config = ({
						Entrypoint = [ "${pkgs.tini}/bin/tini" "--" ];
					} // buildInfo.config );
				};
		dev = let
			transient-layers = pkgs.unstable.dockerTools.buildLayeredImage {
				name = ("transient-layers-" + buildInfo.name + "-dev");
				tag = buildInfo.tag;
				# Development container image is broken, 'env' is chaining up into nodeModules causing nodeModules to run after and erase the 'env' setting.
				contents = imagePackages ++ imagePackagesDev ++ buildInfo.packages ++ [ nodeModules.env ];
			};
			in
				pkgs.unstable.dockerTools.buildImage {
					name = buildInfo.name + "-dev";
					tag = buildInfo.tag;
					fromImage = transient-layers;
					# Nix is building the container in a workspace, links should always be ./ which will result in / in the final container
					extraCommands = ''
						# Examples
						# mkdir -p ./var/lib/mysql
						# ln -s "${pkgs.bash}/bin/bash"  ./bash
					'';
					config = ({
						Entrypoint = [ "${pkgs.tini}/bin/tini" "--" ];
					} // buildInfo.config );
				};
}
