#!/bin/bash
apt-get update

echo 1\) Install Docker

apt-get install -y docker.io
cat <<EOF >/etc/docker/daemon.json
{
    "bip": "10.0.60.1/24"
}
EOF
systemctl start docker
systemctl enable docker
usermod support -aG docker

echo 2\) Disable Swap

swapoff -a

echo 3\) Install kubeadm kubelet kubectl

apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

apt-get update
#apt-get install -y kubeadm kubelet kubectl