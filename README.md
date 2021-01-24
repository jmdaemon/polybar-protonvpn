# Protonvpn module for polybar
## Dependencies
* [nerdfont](https://github.com/ryanoasis/nerd-fonts) (for lock emoji)
* [protonvpn](https://github.com/ProtonVPN/linux-cli)

## Usage

Create a custom module in your polybar config file:
```
[module/protonvpn]
type = custom/script
exec = ~/path/to/polybar-protonvpn.sh
interval = 5
```

