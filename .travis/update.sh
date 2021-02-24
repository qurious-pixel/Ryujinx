#!/bin/bash

unset LD_LIBRARY_PATH
if [ -f /usr/bin/zenity ]; then
	zenity --question --timeout=10 --title="Ryujinx updater" --text="New update available. Update now?" --icon-name=Ryujinx --window-icon=Ryujinx.png --height=80 --width=400
	answer=$?
else
	dialog --title Ryujinx --timeout 10 --yesno "New update available. Update now?" 0 0
	answer=$?
fi

echo "GAMEPATH '${GAMEPATH}'"

if [ "$answer" -eq 0 ]; then 
	$APPDIR/usr/bin/AppImageUpdate $PWD/Ryujinx-x86_64.AppImage && $PWD/Ryujinx-x86_64.AppImage ${GAMEPATH}
elif [ "$answer" -eq 1 ]; then
	$APPDIR/AppRun-patched ${GAMEPATH}
else 
	$APPDIR/AppRun-patched ${GAMEPATH}
fi
exit 0


