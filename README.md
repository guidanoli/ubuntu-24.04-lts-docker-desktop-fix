# Fix for running Docker Desktop in Ubuntu 24.04 LTS

According to the official Docker Desktop [installation page](https://docs.docker.com/desktop/install/ubuntu/) for Ubuntu...

> The latest Ubuntu 24.04 LTS is not yet supported. Docker Desktop will fail to start. Due to a change in how the latest Ubuntu release restricts the unprivileged namespaces, `sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0` needs to be run at least once. Refer to the [Ubuntu Blog](https://ubuntu.com/blog/ubuntu-23-10-restricted-unprivileged-user-namespaces) for more details.

So I decided to write a small service for doing just that.

## Requirements

- GNU Make
- GNU sed
- systemd

## Installation

Simply run:

- `sudo make install` for copying the service file to your `/etc/systemd/system` folder;
- and `sudo make enable` for enabling such service.
