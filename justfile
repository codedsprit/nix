_default:
	@just -l

nix-clean:
	@sudo nix-collect-garbage -d

nix-rebuild: 
	@sudo nixos-rebuild switch --flake .#laptop
