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


* [Setting Up a Kubernetes Cluster on Ubuntu 18.04](https://mherman.org/blog/setting-up-a-kubernetes-cluster-on-ubuntu/)
* [How to Install and Configure Kubernetes and Docker on Ubuntu 18.04 LTS](https://www.howtoforge.com/tutorial/how-to-install-kubernetes-on-ubuntu/)
* [A Kubernetes quick start for people who know just enough about Docker to get by](https://blog.sourcerer.io/a-kubernetes-quick-start-for-people-who-know-just-enough-about-docker-to-get-by-71c5933b4633)
* [Kubernetes over Ubuntu on VirtualBox](https://itnext.io/kubernetes-on-ubuntu-on-virtualbox-60e8ce7c85ed)