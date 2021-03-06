#!/bin/bash
apt-get update

echo
echo 1\) Install Docker
echo

# curl -sSL https://get.docker.com | bash
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
echo 3\) Install dependencies
echo

apt-get install -y apt-transport-https openssh-server
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list

apt-get update
apt-get install -y kubeadm kubelet kubectl kubernetes-cni
apt-mark hold kubeadm kubelet kubectl kubernetes-cni

# echo
# echo 4\) Adding " cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory" to /boot/firmware/cmdline.txt
# echo

# sudo cp /boot/firmware/nobtcmd.txt /boot/firmware/nobtcmd_backup.txt
# orig="$(head -n1 /boot/firmware/nobtcmd.txt) cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory"
# echo $orig | tee /boot/firmware/nobtcmd.txt
