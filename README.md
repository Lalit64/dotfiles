# snowflake
<img src="https://github.com/lanjoni/snowflake/raw/main/img/darwin.png" width="250px" align="right"/> <img src="https://github.com/lanjoni/snowflake/raw/main/img/nix.png" width="200px" align="right"/>
*It's like magic. Let the snowflakes in. ❄️*

### Nothing more than a configuration using flakes, nix-darwin and home-manager.

These are my complete configurations for use in my daily life using macOS alongside [Nix](https://nixos.org/), which is more than my main package manager, being the most powerful tool alongside [home-manager](https://github.com/nix-community/home-manager) and [nix-darwin](https://github.com/LnL7/nix-darwin).

Maybe this is the time to try something new. If you want, start by checking out https://github.com/DeterminateSystems/nix-installer and installing nix.

## Screenshots
<img src="https://files.catbox.moe/1t1mgn.png" />
<img src="https://files.catbox.moe/vy5sni.png" />
<img src="https://files.catbox.moe/7c70og.png" />

## Installation

Once you have Nix properly installed on your machine, now is the time to clone this configuration to `~/.config/snowflake` and start having fun in the snow.

```bash
git clone https://github.com/lalit64/dotfiles.git ~/.config/snowflake
```

After cloning the repository we can build with `nix-darwin`:

```bash
# This will activate flakes to start the installation and build. Note that my machine name is "lalits-mbp".
nix --extra-experimental-features "nix-command flakes" build .#darwinConfigurations.lalits-mbp.system
```

Then just run:

```bash
# nix-darwin will perform a complete rebuild of the system.
./result/sw/bin/darwin-rebuild switch --flake ~/.config/snowflake/.#lalits-mbp
```

Done. Now, my entire workflow is in your hands for use. With [flakes](https://nixos.wiki/wiki/Flakes) I can guarantee that everything is in its specific version, validating inconsistencies and guaranteeing a perfect replica.

## Configuration

Now let's talk a little about the organizational structure here so we can analyze more carefully how everything works.

### Structure

Take a look:

```
 ~/.config/snowflake
├──  README.md
├──  flake.lock
├──  flake.nix
├── 󱂵 home
│   └──  lalit
│       ├──  lalits-mbp.nix
│       └──  modules
│           ├──  cava.nix
│           ├──  common.nix
│           ├──  home.nix
│           ├──  kitty.nix
│           ├──  nixvim.nix
│           ├──  simplebar.nix
│           ├──  stylix.nix
│           ├──  vscode.nix
│           ├──  zed.nix
│           └──  zsh.nix
├──  hosts
│   ├──  home-desk
│   │   ├──  default.nix
│   │   └──  yabai.nix
│   ├──  lalits-mbp
│   │   ├──  default.nix
│   │   └──  yabai.nix
│   └──  modules
│       ├──  borders.nix
│       ├──  common.nix
│       └──  homebrew.nix
└──  result -> /nix/store/somehash
```

The `home/modules/<program>.nix` is where you should place your program configuration files and make sure to import them in `home/modules/common.nix`
Services should be placed in `hosts/modules/<service>.nix` if they are common between systems, but if configurations are different between systems make sure to place them in their respective host directory such as `lalits-mbp` or `home-desk`.
While applications are managed by `home-manager`, services are managed directly by `nix-darwin` as they need permissions to bootstrap and control with `launchctl`

### Files

- `flake.nix`: Contains the base configuration of our flake, controlling the expected inputs and outputs, in addition to managing the external urls of `home-manager`, `nix-darwin`, `stylix`, and `nixvim`;

- `hosts/<host>/default.nix`: Contains the imports for the `hosts/modules/common.nix` and the hosts services such as `yabai.nix`;

- `hosts/<host>/modules/homebrew.nix`: Contains the [homebrew](https://brew.sh/) configuration, including casks, brews and taps;

- `hosts/modules/common.nix/`: Contains the entire system configuration, including appearance, dock management, I/O devices settings, and others;

- `home/<user>/<host>.nix`: Contains the `home-manager` configuration imports, packages and session variables for different hosts;

- `home/<user>/modules/<program>.nix`: Contains the `home-manager` config for each of the programs;

- `home/<user>/modules/common.nix`: Contains the imports for `home/<user>/modules/home.nix` (the home-manager configuration) and `home/<user>/modules/<program>.nix`;

- `home/<user>/dotfiles`: Directory for other dotfiles not writable in nix;

- `result`: A symlink which apoints to your build at `/nix/store`.

Note: if you want to install a simple package, go to `home/<user>/modules/home.nix` and add the package name to the `home.packages` list. But, if you want to strictly configure your package, then include a file in `home/<user>/modules/<program>.nix` with the name of your package and its settings following the template below:

```nix
# At home/<user>/modules/<package>.nix
{ pkgs, ... }: {
  programs.<package> = {
    # Your settings
  };
}
```

And don't forget to import it in `home/<user>/modules/common.nix`:

```nix
# ...
  imports = [
    ./stylix.nix # system colors and font
    ./zsh.nix # shell
    ./kitty.nix # terminal
  ];
# ...
```

Amazing! To search for packages you can use the [official search at nixos.org](https://search.nixos.org/packages).

## Documentation

To find more content about Nix, follow the links below:

- [NixOS Wiki](https://nixos.wiki/wiki/Main_Page) (Popular wiki to Nix and NixOS users)
- [NixOS Official Website](https://nixos.org/)
- [NixOS GitHub](https://github.com/NixOS)
- [NixOS at Mastodon](https://chaos.social/@nixos_org)
- [NixOS at Twitter](https://twitter.com/nixos_org)
- [NixOS at YouTube](https://www.youtube.com/channel/UC3vIimi9q4AT8EgxYp_dWIw)

Talks and presentations about Nix and NixOS:
- [What Nix Can Do - Matthew Croughan](https://youtu.be/6Le0IbPRzOE?si=eN7xDMgc6aQBui27)
- [A Gentle Introduction to Nix - Bryan Honof](https://youtu.be/gUjvnZ9ZwMs?si=CjBlLfz3yg_wCA1N)
- [Getting Started with Nix - OpenTechLab](https://youtu.be/xXlCcdPz6Vc?si=zs4A9fezu3DQddat)
- [Nix for Startups (full course) - @ecto](https://youtu.be/WJZgzwB3ziE?si=K8sZA7AFr4qmBcbh)
- [Build A Portable Development Environment With Nix Package Manager - Jake Wiesler](https://youtu.be/70YMTHAZyy4?si=lat2tzEG3gJruTu1)
- [Nix flakes explained - Vimjoyer](https://youtu.be/S3VBi6kHw5c?si=QOjRcZjQuBgsRXDz)

## Issues

Any problems with the workflow, documentation or code? Submit an [issue](https://github.com/lalit64/dotfiles/issues).
