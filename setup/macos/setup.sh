#!/bin/bash
#/ Usage: bin/strap.sh [--debug]
#/ Setup macOS for personal preferences

PREVIOUS_WD="$(pwd -P)"
if [ -L "$0" ]
then
  SCRIPTSETUP="$(readlink "$0")"
else
  SCRIPTSETUP="$0"
fi

SETUPDIRREL=$(dirname "$SCRIPTSETUP")
cd "$SETUPDIRREL/" || exit


# Enable authorizing sudo using TouchID
./touchid-enable-pam-sudo


cd "$PREVIOUS_WD" || exit
