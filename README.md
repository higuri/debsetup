# debsetup
My setup scripts for Debian and Ubuntu (including Ubuntu on WSL). 

## Prerequisites
#### `sudo`
```shell
$ su root
# apt -y install sudo
# add user ${username} sudo
# exit
```

## Usage
```shell
$ cd ~
$ wget -O debsetup.sh https://raw.githubusercontent.com/higuri/debsetup/master/setup.sh
$ chmod +x debsetup.sh
$ ./debsetup.sh
$ rm debsetup.sh
```
And reboot.

## Memo
### How to initialize pass for su (Ubuntu)
```shell
$ sudo su -
# passwd
# ...
# exit
```

### How to configure Xserver for Windows (WSL)
1. install VcXsrv (on Windows)
2. start "$(PROGRAMFILES)\VcXsrv\vcxsrv.exe" :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl -dpi auto
3. start ubuntu.exe
