# Fix for running Docker Desktop in Ubuntu 24.04 LTS

According to the official Docker Desktop [installation page](https://docs.docker.com/desktop/install/ubuntu/) for Ubuntu...

> The latest Ubuntu 24.04 LTS is not yet supported. Docker Desktop will fail to start. Due to a change in how the latest Ubuntu release restricts the unprivileged namespaces, `sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0` needs to be run at least once. Refer to the [Ubuntu Blog](https://ubuntu.com/blog/ubuntu-23-10-restricted-unprivileged-user-namespaces) for more details.

So I decided to write a small service for doing just that. Here are the installation steps:

```sh
git clone https://github.com/guidanoli/ubuntu-24.04-lts-docker-desktop-fix
sudo cp fix-docker-desktop /usr/libexec
sudo cp fix-docker-desktop.service /etc/systemd/system
sudo systemctl enable fix-docker-desktop.service
```
