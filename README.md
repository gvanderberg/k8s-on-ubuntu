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

* Pre-pull images

```
sudo kubeadm config images pull -v3
```

* For flannel to work correctly, you must pass ```--pod-network-cidr=10.244.0.0/24``` to kubeadm init.
* Set ```/proc/sys/net/bridge/bridge-nf-call-iptables``` to ```1``` by running ```sysctl net.bridge.bridge-nf-call-iptables=1``` to pass bridged IPv4 traffic to iptables’ chains. This is a requirement for some CNI plugins to work.

```
sudo kubeadm init --token-ttl=0 --pod-network-cidr=10.244.0.0/24
```

We pass in `--token-ttl=0` so that the token never expires - do not use this setting in production. The UX for `kubeadm` means it's currently very hard to get a join token later on after the initial token has expired. 

> Optionally also pass `--apiserver-advertise-address=192.168.8.200` with the IP of the Pi as found by typing `ifconfig`.

After the `init` is complete run the snippet given to you on the command-line:

```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

* Now save your join-token

Your join token is valid for 24 hours, so save it into a text file. Here's an example of mine:

```
sudo kubeadm join 192.168.8.200:6443 --token fr4eq0.5xys4i4rft5p95jd --discovery-token-ca-cert-hash sha256:4bd8f69e17af5643c5a1513ba8c74dbaa4dad1b40d7c63926424f6e647109574
```

### Setup networking with Flannel

* [Flannel CNI](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/#tabs-pod-install-4)

```
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```

On each node that joins including the master:

```
sudo sysctl net.bridge.bridge-nf-call-iptables=1
```

### Join other nodes

```
sudo kubeadm join 192.168.8.200:6443 --token fr4eq0.5xys4i4rft5p95jd --discovery-token-ca-cert-hash sha256:4bd8f69e17af5643c5a1513ba8c74dbaa4dad1b40d7c63926424f6e647109574
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
