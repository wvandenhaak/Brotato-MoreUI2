# Forked package
This package forked from https://github.com/JNBG/Brotato-MoreUI as it is not maintained anymore.

# More UI 2:
This mods adds an In-Wave UI to display your current Primary Stats as well as Trees

The UI is updated every 0.5 Seconds.

![example](https://github.com/wvandenhaak/Brotato-MoreUI2/blob/main/MORE_UI_example.jpg)


## Features 
Mod settings are available under Options on the main menu of the game.
- Enable "What's new Mode" to only show Stats that received an Update in the current wave.
- Enable "Show Stat difference from Wave-Start" to show how much your Stats have changed in a wave
- Enable "Align UI right" to move the UI to the right side of the Screen - Should be compatible with otDan's WaveTimer
- Enable "Living Trees and (min - max) of Possible Spawns" to display how many Trees are currenty on the Map and how many trees can spawn at least or at most.

The Mod is now compatible with Monos' Revamped Icons - Credit for the Icons goes to Mono and a big thanks for letting me use them in MoreUI. To use the Icons you have to subscribe to his Mod and enable the Icons in the Options of MoreUI

## Steam
This package is available in the [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3359801812).

### Publishing / Compilation
This mod follows the publishment steps for a ZIP-file mod from this [Steam Guide](https://steamcommunity.com/sharedfiles/filedetails/?id=2931079751).

One of the most important things is creating the required directory structure. 
```
yourmod.zip
├───.import
└───mods-unpacked
    └───Author-ModName
        ├───mod_main.gd
        └───manifest.json
```

Godot projects save a custom version of the assets in the root project directory in the `.import` directory. Also see [the ModLoader wiki](https://github.com/GodotModding/godot-mod-loader/wiki/Mod-Structure).
In order to create the required directory structure we have to copy our project files from this folder into our ZIP `.import` folder. This folder should only contain images from the mod.


If possible, run the mod compilation script `compile_mod_steam_workshop.sh` with a terminal (Linux). This script creates an uploadable ZIP file.
The script creates the required directory structure and removes some files which aren't neccesary for the upload to Steam.

