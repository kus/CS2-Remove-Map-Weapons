# CS2 Remove Map Weapons
  
A plugin for CS2 built on [CounterStrikeSharp](https://docs.cssharp.dev/) that removes the weapons from the map as `mp_weapons_allow_map_placed 0` does not work.

## Requirements

In order for the plugin to work, you must have [CounterStrikeSharp](https://docs.cssharp.dev/guides/getting-started/) installed.

## Why

I run an [open source modded multi-mod dedicated CS2 server](https://github.com/kus/cs2-modded-server) and needed to remove the weapons from custom maps that were placed on the ground so we could play game modes like deathmatch, wingman, GunGame and not pickup items off the ground.

`mp_weapons_allow_map_placed 0` should remove the weapons but it does not work, so this plugin removes all weapons at the start of every round from the ground and leaves players weapons in their hands.

## Installation

1) [Download](https://github.com/kus/CS2-Remove-Map-Weapons/releases/) and open the zip file.
2) Extract the `addons` folder into your server's `game/csgo/` directory (this file should now exist `game/csgo/addons/counterstrikesharp/plugins/CS2-Remove-Map-Weapons/CS2-Remove-Map-Weapons.dll`)
3) Restart your server or from the server console run `css_plugins load "plugins/CS2-Remove-Map-Weapons/CS2-Remove-Map-Weapons.dll"`

## Feedback or feature requests

For any bugs, issues or feature requests please [log an issue](https://github.com/kus/CS2-Remove-Map-Weapons/issues/).

## License

Distributed under the GPL-3.0 License. See `LICENSE` for more information.
