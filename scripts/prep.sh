#!/bin/bash
apt-get update

echo
echo 1\) Install Docker
echo

apt-get install -y docker.io
cat <<EOF >/etc/docker/daemon.json
{
    "bip": "10.0.60.1/24",
    "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF
systemctl restart docker
systemctl enable docker
usermod support -aG docker

echo
echo 2\) Disable Swap
echo

swapoff -a

echo
echo 3\) Install kubeadm kubelet kubectl
echo

apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
