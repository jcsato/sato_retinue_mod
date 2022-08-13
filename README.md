# NOTE

This mod has been superseded by my more general [balance mod](https://github.com/jcsato/sato_balance_mod) - go there for further updates.

# Sato's Retinue Mod

A mod for the game Battle Brothers ([Steam](https://store.steampowered.com/app/365360/Battle_Brothers/), [GOG](https://www.gog.com/game/battle_brothers), [Developer Site](http://battlebrothersgame.com/buy-battle-brothers/)).

## Table of contents

-   [Features](#features)
-   [Requirements](#requirements)
-   [Installation](#installation)
-   [Uninstallation](#uninstallation)
-   [Compatibility](#compatibility)
-   [Building](#building)

## Features

I'm pretty happy with where the retinue system is overall, but there are a few ways in which I think the balance and gameplay impact of certain retinue members could be improved. At present:

- **The Scout:** Renamed to "the Guide", because that's what he does. Instead of increasing your speed by 15% on all terrain, he now reduces the speed penalty of "rough terrain" (forests, swamps, etc. and not snow or desert) by 15%. To help explain this a bit more: the old ability made you move 7.5% faster on swamps, 9.75% faster on forests, and 15% faster on plains  - the new one is 15%, 15%, and 0%. In practice, this should make the Scout/Guide more relevant for difficult terrain, but make him less of an auto-pick for every map and point of the campaign.

## Requirements

1) The [Blazing Deserts DLC](http://battlebrothersgame.com/blazing-deserts-release/)
2) [Modding Script Hooks](https://www.nexusmods.com/battlebrothers/mods/42) (Preferably the latest version, but I'd recommend at least 19)

## Installation

1) Download the mod from the [releases page](https://github.com/jcsato/sato_retinue_mod/releases/latest)
2) Without extracting, put the relevant `sato_retinue_*.zip` file in your game's data directory
    1) For Steam installations, this is typically: `C:\Program Files (x86)\Steam\steamapps\common\Battle Brothers\data`
    2) For GOG installations, this is typically: `C:\Program Files (x86)\GOG Galaxy\Games\Battle Brothers\data`

## Uninstallation

1) Remove the relevant `sato_retinue_*.zip` file from your game's data directory

## Compatibility

This should be fully save game compatible, i.e. you can make a save with it active and remove it without corrupting that save.

This should be fairly compatible with other mods, except where obvious (e.g. mods that change the same thing).

Last I checked, 2021 builds of the Legends mod incorporate this by default, so no need to download anything here if you're using that.

### Building

To build, run the appropriate `build_*.bat` script. This will automatically compile and zip up the mod and put it in the `dist/` directory, as well as print out compile errors if there are any. The zip behavior requires Powershell / .NET to work - no reason you couldn't sub in 7-zip or another compression utility if you know how, though.

Note that the build script references the modkit directory, so you'll need to edit it to point to that before you can use it. In general, the modkit doesn't play super nicely with spaces in path names, and I'm anything but a batch expert - if you run into issues, try to run things from a directory that doesn't include spaces in its path.

After building, you can easily install the mod with the appropriate `install_*.bat` script. This will take any existing versions of the mod already in your data directory, append a timestamp to the filename, and move them to an `old_versions/` directory in the mod folder; then it will take the built `.zip` in `dist/` and move it to the data directory.

Note that the install script references your data directory, so you'll need to edit it to point to that before you can use it.
