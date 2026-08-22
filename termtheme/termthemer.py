import sys

presets_path = "/etc/nixos/bethany-base/termtheme/"

starship_tgt_path = "/home/snuppy/.config/starship.toml"
fish_tgt_path = "/home/snuppy/.config/fish/fish_variables"
kitty_tgt_path = "/home/snuppy/.config/kitty/current-theme.conf"


def write_configs(starship, fish, kitty):
    # print("Loaded starship:\n---\n" + starship + "---\n")
    # print("Loaded fish:\n---\n" + fish + "---\n")
    # print("Loaded kitty:\n---\n" + kitty + "---\n")
    # print(f"-was going to write starship to {starship_tgt_path}")
    # print(f"-was going to write fish to {fish_tgt_path}")
    # print(f"-was going to write kitty to {kitty_tgt_path}")
    starship_tgt = open(starship_tgt_path, "w").write(starship)
    # fish_tgt = open(fish_tgt_path, "w").write(fish)
    # kitty_tgt = open(kitty_tgt_path, "w").write(kitty)


def light():
    starship = open(presets_path + "starship__kelp_forest_shallow.toml", "r").read()
    fish = " "  # open(presets_path + "fish_variables__kelp_forest_shallow", "r").read()
    kitty = " "  # open(presets_path + "current-theme__everforest_light_hard.conf", "r").read()

    write_configs(starship, fish, kitty)


def dark():
    starship = open(presets_path + "starship__volcanic_shale_deep.toml", "r").read()
    fish = " "
    # open(presets_path + "fish_variables__tomorrow-night-bright", "r").read()
    kitty = " "  # open(presets_path + "current-theme__catppuccin_macchiato.conf", "r").read()

    write_configs(starship, fish, kitty)


if len(sys.argv) < 2:
    sys.exit("Too few args\nUsage: python termthemer.py light/dark")
elif sys.argv[1] == "light":
    light()
elif sys.argv[1] == "dark":
    dark()
else:
    sys.exit("Unknown problem.\nUsage: python termthemer.py light/dark")
