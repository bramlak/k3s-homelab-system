# k3s Homelab System

[![Terraform](https://img.shields.io/badge/Terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![k3s](https://img.shields.io/badge/k3s-FFC61E?style=for-the-badge&logo=k3s&logoColor=black)](https://k3s.io/)
[![Codecool](https://img.shields.io/badge/-Codecool-black.svg?logo=data:image/svg%2Bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzMy42IDMzLjYxIj48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6IzAwMWRmZjt9PC9zdHlsZT48L2RlZnM+PGcgaWQ9IkxheWVyXzIiIGRhdGEtbmFtZT0iTGF5ZXIgMiI+PGcgaWQ9IkxheWVyXzEtMiIgZGF0YS1uYW1lPSJMYXllciAxIj48cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik03LjI3LDkuNzJhNy41MSw3LjUxLDAsMCwxLC44LTMuNDIsNS42Nyw1LjY3LDAsMCwxLDEtMS4zOSw0NC4wOSw0NC4wOSwwLDAsMSwzLjUzLTMuNDRBNi41OSw2LjU5LDAsMCwxLDE3LjI4LDBhNi44Miw2LjgyLDAsMCwxLDMuODEsMS41M2MuMTYuMTQuMzMuMjguNDguNDRMMjUuMyw1LjcybDAsMHMwLDAsMCwwLDAsMCwwLDBoMGE3LjY3LDcuNjcsMCwwLDAtNCwwLDcuNTgsNy41OCwwLDAsMC0zLjQ0LDJsLTcuNzIsNy43MS0xLTFBNi43OCw2Ljc4LDAsMCwxLDcuMjcsOS43MloiLz48cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yMy44OCw3LjMxYTcuMzgsNy4zOCwwLDAsMSwzLjQyLjgsNS42Nyw1LjY3LDAsMCwxLDEuMzksMSw0NC4wOSw0NC4wOSwwLDAsMSwzLjQ0LDMuNTMsNi41OSw2LjU5LDAsMCwxLDEuNDUsNC42OSw2LjgyLDYuODIsMCwwLDEtMS41MywzLjgxYy0uMTQuMTYtLjI4LjMyLS40NC40OGwtMy43MywzLjczLDAsMGgwczAsMCwwLDAsMCwwLDAsMGE3Ljc4LDcuNzgsMCwwLDAsMC00LDcuODgsNy44OCwwLDAsMC0yLTMuNDRsLTcuNzItNy43MSwxLTEuMDVhNi43OCw2Ljc4LDAsMCwxLDQuNzktMS43OVoiLz48cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0yNi4zMywyMy44OWE3LjQxLDcuNDEsMCwwLDEtLjgsMy40Miw1LjQ0LDUuNDQsMCwwLDEtMSwxLjM4QTQyLjU2LDQyLjU2LDAsMCwxLDIxLDMyLjE0YTYuNjMsNi42MywwLDAsMS00LjY5LDEuNDUsNi44Miw2LjgyLDAsMCwxLTMuODEtMS41M2MtLjE2LS4xNC0uMzMtLjI4LS40OC0uNDRMOC4zLDI3Ljg5czAsMCwwLDAsMCwwLDAsMGwwLDBoMGE3LjcyLDcuNzIsMCwwLDAsNy40Mi0ybDcuNzEtNy43MiwxLjA1LDEuMDVhNi43OCw2Ljc4LDAsMCwxLDEuNzksNC43OVoiLz48cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik05LjcyLDI2LjI5QTcuMzcsNy4zNywwLDAsMSw2LjMsMjUuNWE1LjY3LDUuNjcsMCwwLDEtMS4zOS0xQTQ0LjA5LDQ0LjA5LDAsMCwxLDEuNDcsMjEsNi41OSw2LjU5LDAsMCwxLDAsMTYuMjlhNi44Miw2LjgyLDAsMCwxLDEuNTMtMy44MWMuMTQtLjE2LjI4LS4zMy40NC0uNDhMNS43Miw4LjI3bDAsMGgwczAsMCwwLDBhMCwwLDAsMCwxLDAsMCw3Ljc1LDcuNzUsMCwwLDAsMiw3LjQybDcuNzEsNy43Mi0xLDEuMDVhNi43Miw2LjcyLDAsMCwxLTQuNzksMS43OFoiLz48L2c+PC9nPjwvc3ZnPg==)](https://www.codecool.com/)

A Terraform configuration for a k3s-based homelab.

[Explore the docs >](#about-the-project)

[Tech Stack](#tech-stack) · [Installation](#installation) · [Usage](#usage) · [Future Plans](#future-plans)

## Table of Contents

1. [About the Project](#about-the-project)
2. [Tech Stack](#tech-stack)
3. [Prerequisites](#prerequisites)
4. [Installation](#installation)
5. [VPN Setup](#vpn-setup)
6. [Usage](#usage)
7. [Modules](#modules)
8. [Future Plans](#future-plans)
9. [Contributing](#contributing)

## About the Project

This project sets up a lightweight Kubernetes cluster using k3s. It runs on ARM64 hardware. The example uses a Raspberry Pi 4B. Terraform deploys services like Vaultwarden, Syncthing, Grafana, and NGINX Ingress. The setup includes a single-node cluster. It focuses on home use.

## Tech Stack

| Category | Technologies |
|----------|--------------|
| Infrastructure | [![Terraform](https://img.shields.io/badge/Terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/) [![k3s](https://img.shields.io/badge/k3s-FFC61E?style=for-the-badge&logo=k3s&logoColor=black)](https://k3s.io/) |
| Services | Vaultwarden, Syncthing, Grafana, NGINX Ingress |
| VPN | [![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/) [![WireGuard](https://img.shields.io/badge/WireGuard-88171A?style=for-the-badge&logo=wireguard&logoColor=white)](https://www.wireguard.com/) |

## Tech Stack

| Category | Technologies |
|----------|--------------|
| Infrastructure | <a href="https://www.terraform.io/"><img src="https://www.datocms-assets.com/2885/1731373310-terraform_white.svg" alt="Terraform" width="100"></a> <a href="https://k3s.io/"><img src="https://k3s.io/img/k3s-logo-light.svg" alt="k3s" width="100"></a> |
| Services | <a href="https://github.com/dani-garcia/vaultwarden"><img src="https://raw.githubusercontent.com/dani-garcia/vaultwarden/main/resources/vaultwarden-logo-auto.svg" alt="Vaultwarden" width="100"></a> <a href="https://syncthing.net/"><img src="https://raw.githubusercontent.com/syncthing/syncthing/main/assets/logo-horizontal.svg" alt="Syncthing" width="100"></a> <a href="https://grafana.com/"><img src="https://raw.githubusercontent.com/grafana/grafana/main/docs/logo-horizontal.png" alt="Grafana" width="100"></a> <a href="https://github.com/kubernetes/ingress-nginx"><img src="https://nginx.org/img/nginx_logo_dark.svg" alt="NGINX Ingress" width="100"></a> |
| VPN | <a href="https://www.wireguard.com/"><img src="https://www.wireguard.com/img/wireguard.svg" alt="WireGuard" width="100"></a>

## Prerequisites

Install these on your local machine:

- [Terraform](https://www.terraform.io/downloads).
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/).
- SSH client.

For the server hardware:

- ARM64 device, such as `Raspberry Pi 4B`.
- SD card (e.g., 16GB).

## Installation

### Ssh key generation

From local machine, generate SSH key:

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

Copy `.pub` file content in the next step.

### OS Setup

Flash the image to the SD card with [Raspberry Pi Imager](https://www.raspberrypi.com/software/).

Choose `Raspberry Pi OS Lite (64-bit)`
This example uses the headless version.

In the imager, go to `Edit settings > General`.
Set hostname (e.g., `cirrus.local`)
Set username and password (e.g., username: `ibis`)
Go to `> Services` tab.
Set `Allow public-key authentication only`.
Set authorized_keys via `Add Key`.
Paste `.pub` file's content here.

Feel free to set other settings.

Insert the SD card. Connect to network. Power on the device.

Now you can ssh into the device via:

```
ssh -i ~/.ssh/ibis-cirrus ibis@cirrus
```

Update the system:

```
sudo apt update -y && sudo apt upgrade -y
```

Set hostname (e.g., `cirrus`):

```
sudo hostnamectl set-hostname cirrus
```

Reboot:

```
sudo reboot now
```

### Local Machine Hostname Setup

For now, manual name resolution is needed.
Get the device's ip address. (e.g., `192.168.1.13`)
Add the following to `/etc/hosts`:

```
192.168.1.13 cirrus
192.168.1.13 vaultwarden.cirrus
192.168.1.13 syncthing.cirrus
192.168.1.13 grafana.cirrus
```

### k3s Setup

On the device, enable kernel parameters:

```
sudo sed -i 's/$/ cgroup_memory=1 cgroup_enable=memory/' /boot/firmware/cmdline.txt
sudo reboot now
```

Install iptables:

```
sudo apt install iptables -y
```

Install k3s. Disable Traefik:

```
curl -sfL https://get.k3s.io | sh -s - --disable traefik
```

Verify:

```
sudo kubectl get nodes
```


### kubectl Access

On local machine, copy kubeconfig:

```
ssh -i ~/.ssh/ibis-cirrus ibis@cirrus  "sudo cat /etc/rancher/k3s/k3s.yaml" > ~/.kube/config
```

Update server URL:

```
sed -i 's|server: https://127.0.0.1:6443|server: https://cirrus:6443|g' ~/.kube/config
```


### Vaultwarden

#### Certificate

Generate self-signed certificate on server:

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=cirrus"
```

Use in `.tfvars` file.

#### Admin Token

Generate random token:

```
openssl rand -base64 48
```

Use in `.tfvars` file.


### Grafana Storage

K3s' Persistent Volume managed directory would not have the correct permissions. The best solution is to create directory on server manually:

```
sudo mkdir -p /mnt/grafana-data
sudo chmod 777 /mnt/grafana-data
```

### Terraform Setup

Clone repository:

```
git clone https://github.com/bramlak/k3s-homelab-system.git
cd k3s-homelab-system/k3s
```

Copy variables file:

```
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars`. Set values like admin token.

Initialize:

```
terraform init
```

## VPN Setup

Install Docker on server:

```
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker
```

Enable IP forwarding:

```
sudo sysctl -w net.ipv4.ip_forward=1
```

Make permanent. Edit `/etc/sysctl.conf`. Uncomment `net.ipv4.ip_forward=1`. Apply:

```
sudo sysctl -p
```

Use `wireguard-docker-compose.yml` from repository.

Get `puid` and `pgid` values:

```
id -u
id -g
```

Tailor `wireguard-docker-compose.yml` via changing `puid` and `pgid`.

Allow ipv4 packet forwarding via editing `/etc/sysctl.conf`:
uncomment: `net.ipv4.ip_forward=1`

```
sudo sysctl -p
```

Start WireGuard:

```
docker compose -f wireguard-docker-compose.yml up -d
```

### DDNS Setup

Register domain at [ydns.eu](https://ydns.eu/) (e.g., `ibis.ydns.eu`).

Clone updater:

```
git clone https://github.com/ydns/bash-updater.git
```

Edit `updater.sh`. Add credentials.

Set crontab:

```
crontab -e
```

Add:

```
*/5 * * * * ~/bash-updater/updater.sh >> ~/bash-updater/updater.log 2>&1
```

### Port Forwarding

Configure router. Example for ZTE F660RV1:

Go to Application > Port Forwarding.

Add rule:

- Name: cirrus-wg
- Protocol: UDP
- WAN Ports: 51820
- LAN IP: Server IP
- LAN Ports: 51820

### WireGuard Client

Copy client config from server: `~/wireguard/config/peer1/peer1.conf`.

Add to client device.

## Usage

Deploy:

```
terraform apply
```

Check pods:

```
kubectl get pods --all-namespaces
```

Destroy:

```
terraform destroy
```

## Modules

- NGINX Ingress: Custom ingress controller.
- Vaultwarden: Password manager. Needs admin token.
- Syncthing: File syncronisation solution.
- Grafana: Monitoring dashboard.

## Future Plans
- streamline install process.
- Automate storage permissions.
- Add more services.
- Add primary VPN into Terraform. Keeping docker-compose wireguard for secondary emergency VPN server.
- Solve DNS resolutions. 

## Contributing

Fork the repository. Create a branch. Commit changes. Push. Open pull request.

### Top contributors:

<a href="https://github.com/bramlak/k3s-homelab-system/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=bramlak/k3s-homelab-system" />
</a>
