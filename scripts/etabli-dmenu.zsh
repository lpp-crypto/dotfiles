#!/usr/bin/env sh

# !SECTION! Utils


select_workspace()
{
    echo "$1" | nc -U /tmp/etabli.sock -N | rofi -dmenu -config ~/.config/rofi/dmenu.rasi -markup-rows -no-show-icons -i -format p -p "$2"
}

# !SECTION! Main function (dispatch)

if [ $1 = "switch" ]; then
    echo "switch_to_workspace '$(select_workspace list_workspaces_with_prepare "go to workspace")'" | nc -U /tmp/etabli.sock -N
elif  [ $1 = "bring" ]; then
    echo "bring_to_workspace '$(select_workspace list_workspaces_without_prepare "bring container to workspace")'" | nc -U /tmp/etabli.sock -N
elif  [ $1 = "rename_current_workspace" ]; then
    level=$(echo "current_level" |  nc -U /tmp/etabli.sock -N)
    new_name=$(rofi -dmenu -config ~/.config/rofi/dmenu.rasi -markup-rows -no-show-icons -i -format p -p "new workspace name" -filter $level/)
    if [ new_name ]; then
        echo "rename_current_workspace '$new_name'" | nc -U /tmp/etabli.sock -N
    else
        echo "nope"
    fi
elif  [ $1 = "rename_current_level" ]; then
    new_name=$(rofi -dmenu -config ~/.config/rofi/dmenu.rasi -markup-rows -no-show-icons -i -format p -p "new level name")
    if [ new_name ]; then
        echo "rename_current_level '$new_name'" | nc -U /tmp/etabli.sock -N
    else
        echo "nope"
    fi
fi
