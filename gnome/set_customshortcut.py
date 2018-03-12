#!/usr/bin/env python3
# Set shortcutkeys for GNOME.
# source: https://askubuntu.com/questions/597395/how-to-set-custom-keyboard-shortcuts-from-terminal
import sys
import subprocess

def set_customshortcut(name, command, keybind):
    # defining keys & strings to be used
    key = "org.gnome.settings-daemon.plugins.media-keys custom-keybindings"
    subkey1 = key.replace(" ", ".")[:-1]+":"
    item_s = "/"+key.replace(" ", "/").replace(".", "/")+"/"
    firstname = "custom"
    # get the current list of custom shortcuts
    get = lambda cmd: subprocess.check_output(["/bin/bash", "-c", cmd]).decode("utf-8")
    current = eval(get("gsettings get "+key))
    # make sure the additional keybinding mention is no duplicate
    n = 1
    while True:
        new = item_s+firstname+str(n)+"/"
        if new in current:
            n = n+1
        else:
            break
    # add the new keybinding to the list
    current.append(new)
    # create the shortcut, set the name, command and shortcut key
    cmd0 = 'gsettings set '+key+' "'+str(current)+'"'
    cmd1 = 'gsettings set '+subkey1+new+" name '"+name+"'"
    cmd2 = 'gsettings set '+subkey1+new+" command '"+command+"'"
    cmd3 = 'gsettings set '+subkey1+new+" binding '"+keybind+"'"
    for cmd in [cmd0, cmd1, cmd2, cmd3]:
        subprocess.call(["/bin/bash", "-c", cmd])

def main(args):
    # Ctrl+Return -> gnome-terminal 
    set_customshortcut(
        "Open gnome-terminal",
        "env VTE_CJK_WIDTH=1 gnome-terminal --disable-factory --hide-menubar --full-screen --command \"screen\"",
        "<Primary>Return")
    return 0

if __name__ == '__main__': sys.exit(main(sys.argv))
