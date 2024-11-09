#! /bin/sh
echo "Compile code into publishable mod for the steam workshop";


# Move to godot root project folder
cd ../../


# Copy mod files to temp directory and remove unneccesary (project)files
mkdir mod-compilation
cp -r mods-unpacked mod-compilation

rm -r mod-compilation/mods-unpacked/Mooncake-MoreUI2/MORE_UI_*
rm -rf mod-compilation/Mooncake-MoreUI2/.git
rm mod-compilation/mods-unpacked/Mooncake-MoreUI2/README.md
rm mod-compilation/mods-unpacked/Mooncake-MoreUI2/compile_mod_steam_workshop.sh


# Move import files from global .import into mod .import folder
mkdir mod-compilation/.import
cp -r .import/moreui_* mod-compilation/.import/


# ZIP folder
cd mod-compilation
zip -r "../More UI 2.zip" ./.import ./mods-unpacked/
cd ../


# Remove temp directory
rm -rf mod-compilation


# Done
echo "ZIP-file saved in $PWD/More UI 2.zip"