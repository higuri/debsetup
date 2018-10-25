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
### How to initialize pass for su (Ubuntu)
```shell
$ sudo su -
# passwd
# ...
# exit
```

## Usage
~~~shell
$ mkdir debsetup
$ wget -O - https://github.com/higuri/debsetup/tarball/master | tar xz -C debsetup --strip-components=1
$ pushd debsetup
$ ./install.sh
$ popd
$ rm -rf debsetup
```
