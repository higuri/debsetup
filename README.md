# debsetup
My setup scripts for Debian.

## Prerequisite
#### `sudo`
```shell
$ su root
# apt -y install sudo
# visudo
...
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
