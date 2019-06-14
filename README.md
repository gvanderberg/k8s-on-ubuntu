# Kubernetes on Ubuntu 18.04

* [Single-Node Kubernetes on Raspberry Pi with MicroK8s and Ubuntu](https://blog.ubuntu.com/2019/02/27/single-node-kubernetes-on-raspberry-pi-microk8s-ubuntu)

```
curl -sLSf https://raw.githubusercontent.com/gvanderberg/k8s-on-ubuntu/master/scripts/prep.sh | sudo sh
```

Disable swap completely

```
sudo vim /etc/fstab
```

Comment out swap partition

```
#
```

### Initialize your master node

* kubeadm - used to create new clusters or join an existing one
* kubectl - the CLI administration tool for Kubernetes
 
* Pre-pull images

`kubeadm` now has a command to pre-pull the requisites Docker images needed to run a Kubernetes master, type in:

```
sudo kubeadm config images pull -v3
```

* Initialize your master node with a Pod network CIDR:

```
sudo kubeadm init --token-ttl=0 --pod-network-cidr=10.244.0.0/24
```

We pass in `--token-ttl=0` so that the token never expires - do not use this setting in production. The UX for `kubeadm` means it's currently very hard to get a join token later on after the initial token has expired. 

> Optionally also pass `--apiserver-advertise-address=192.168.0.27` with the IP of the Pi as found by typing `ifconfig`.

After the `init` is complete run the snippet given to you on the command-line:

```
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

* Now save your join-token

Your join token is valid for 24 hours, so save it into a text file. Here's an example of mine:

```
$ kubeadm join --token 9e700f.7dc97f5e3a45c9e5 192.168.0.27:6443 --discovery-token-ca-cert-hash sha256:95cbb9ee5536aa61ec0239d6edd8598af68758308d0a0425848ae1af28859bea
```

* [Customize the docker0 bridge](https://docs.docker.com/v17.09/engine/userguide/networking/default_network/custom-docker0/)
* [Setting Up a Kubernetes Cluster on Ubuntu 18.04](https://mherman.org/blog/setting-up-a-kubernetes-cluster-on-ubuntu/)
* [How to Install and Configure Kubernetes and Docker on Ubuntu 18.04 LTS](https://www.howtoforge.com/tutorial/how-to-install-kubernetes-on-ubuntu/)
* [A Kubernetes quick start for people who know just enough about Docker to get by](https://blog.sourcerer.io/a-kubernetes-quick-start-for-people-who-know-just-enough-about-docker-to-get-by-71c5933b4633)
* [Kubernetes over Ubuntu on VirtualBox](https://itnext.io/kubernetes-on-ubuntu-on-virtualbox-60e8ce7c85ed)
* [Install and Configure Kubernetes (k8s) 1.13 on Ubuntu 18.04 LTS / Ubuntu 18.10](https://www.linuxtechi.com/install-configure-kubernetes-ubuntu-18-04-ubuntu-18-10/)
* [How To Install Kubernetes Cluster On Ubuntu 16.04](https://www.edureka.co/blog/install-kubernetes-on-ubuntu#KubernetesInstallationPreRequisites)
* [Installing kubeadm](https://kubernetes.io/docs/setup/independent/install-kubeadm/#configure-cgroup-driver-used-by-kubelet-on-master-node)
* [Install and Deploy Kubernetes on Ubuntu 18.04 LTS](https://vitux.com/install-and-deploy-kubernetes-on-ubuntu/)
