# Kubernetes on Ubuntu 18.04

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

* [Customize the docker0 bridge](https://docs.docker.com/v17.09/engine/userguide/networking/default_network/custom-docker0/)
* [Setting Up a Kubernetes Cluster on Ubuntu 18.04](https://mherman.org/blog/setting-up-a-kubernetes-cluster-on-ubuntu/)
* [How to Install and Configure Kubernetes and Docker on Ubuntu 18.04 LTS](https://www.howtoforge.com/tutorial/how-to-install-kubernetes-on-ubuntu/)
* [A Kubernetes quick start for people who know just enough about Docker to get by](https://blog.sourcerer.io/a-kubernetes-quick-start-for-people-who-know-just-enough-about-docker-to-get-by-71c5933b4633)
* [Kubernetes over Ubuntu on VirtualBox](https://itnext.io/kubernetes-on-ubuntu-on-virtualbox-60e8ce7c85ed)
* [Install and Configure Kubernetes (k8s) 1.13 on Ubuntu 18.04 LTS / Ubuntu 18.10](https://www.linuxtechi.com/install-configure-kubernetes-ubuntu-18-04-ubuntu-18-10/)
* [How To Install Kubernetes Cluster On Ubuntu 16.04](https://www.edureka.co/blog/install-kubernetes-on-ubuntu#KubernetesInstallationPreRequisites)
* [Installing kubeadm](https://kubernetes.io/docs/setup/independent/install-kubeadm/#configure-cgroup-driver-used-by-kubelet-on-master-node)
* [Install and Deploy Kubernetes on Ubuntu 18.04 LTS](https://vitux.com/install-and-deploy-kubernetes-on-ubuntu/)