# debsetup
My setup scripts for Debian and Ubuntu (including Ubuntu on WSL). 

## Prerequisites
* `sudo`
```shell
$ su root
# apt -y install sudo
# add user ${username} sudo
# exit
```

## Usage
```shell
$ mkdir debsetup
$ wget -O - https://github.com/higuri/debsetup/tarball/master | tar xz -C debsetup --strip-components=1
$ pushd debsetup
$ ./install.sh
$ popd
$ rm -rf debsetup
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
