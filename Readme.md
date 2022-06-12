# CTF Debian

A simple debian container loaded with useful ctf tools and some nice visual improvements. Mostly
catered towards pwn and re challenges.

## Usage

The built image is hosted on [docker
hub](https://hub.docker.com/repository/docker/stackotter/ctf-debian).

`build.sh` and `run.sh` can be used to easily build the image yourself and subsequently run it.

## Included software

- python2.7
- python3.9
- gdb (with gef)
- radare2
- pwntools
- netcat
- ropper
