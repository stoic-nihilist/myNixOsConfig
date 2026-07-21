{ pkgs, inputs, ... }:

{
	home-manager.users.kaiguaaaa = {
		imports = [
			inputs.caelestia.homeManagerModules.default
			];

		programs.caelestia = {
			enable = true;
			cli.enable = true;
			};
		};
}
