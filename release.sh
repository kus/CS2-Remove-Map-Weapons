#!/bin/bash

# CounterStrikeSharp Plugin build & release script
# Version: v1.0.0
# Author: Kus (https://steamcommunity.com/id/kus/)

# chmod +x release.sh

# Path to the C# file
FILE_PATH="CS2-Remove-Map-Weapons/CS2-Remove-Map-Weapons.cs"

# Extract the version number
VERSION=$(grep 'public override string ModuleVersion' $FILE_PATH | awk -F'"' '{print $2}')

# Print the version
echo "Version: $VERSION"

# Completely remove our previously generated "dist" folder
rm -rf dist/

# Create our base "dist" folder
mkdir -p dist

# Create our folder for storing the files and directories we want zipped
mkdir -p dist/addons/counterstrikesharp/plugins/CS2-Remove-Map-Weapons

# Add files
cp -r CS2-Remove-Map-Weapons/bin/Release/net7.0/publish/CS2-Remove-Map-Weapons.dll dist/addons/counterstrikesharp/plugins/CS2-Remove-Map-Weapons/CS2-Remove-Map-Weapons.dll
cp -r CS2-Remove-Map-Weapons/bin/Release/net7.0/publish/CS2-Remove-Map-Weapons.pdb dist/addons/counterstrikesharp/plugins/CS2-Remove-Map-Weapons/CS2-Remove-Map-Weapons.pdb
cp -r CS2-Remove-Map-Weapons/bin/Release/net7.0/publish/CS2-Remove-Map-Weapons.deps.json dist/addons/counterstrikesharp/plugins/CS2-Remove-Map-Weapons/CS2-Remove-Map-Weapons.deps.json

# Create our zip file from the folder "dist" and name it "CS2-Remove-Map-Weapons-version.zip"
(cd dist && zip -r ../CS2-Remove-Map-Weapons-$VERSION.zip .)

# Show some info about file
ls -l CS2-Remove-Map-Weapons-$VERSION.zip

# Completely remove our previously generated "dist" folder
rm -rf dist/

# v1.0.0
versionLabel=v$VERSION
 
# create tag for master
git tag $versionLabel
