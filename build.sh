#!/bin/bash

# CounterStrikeSharp Plugin build & release script
# Version: v1.0.0
# Author: Kus (https://steamcommunity.com/id/kus/)

# chmod +x build.sh

# Path to the C# file
FILE_PATH="CS2-Remove-Map-Weapons/CS2-Remove-Map-Weapons.cs"

# Extract the version number
VERSION=$(grep 'public override string ModuleVersion' $FILE_PATH | awk -F'"' '{print $2}')

# Print the version
echo "Version: $VERSION"

dotnet publish -c Release /p:Version=$VERSION
