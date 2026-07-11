# Ghostty

Config and custom shader for the [Ghostty](https://ghostty.org) terminal.

## Usage

Symlink into place:

```sh
ln -s "$(pwd)/config" ~/.config/ghostty/config
mkdir -p ~/.config/ghostty/shaders
ln -s "$(pwd)/shaders/custom-glitchy.glsl" ~/.config/ghostty/shaders/custom-glitchy.glsl
```

Reload Ghostty (or open a new window) to pick up changes.
