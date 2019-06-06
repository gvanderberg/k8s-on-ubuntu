#!/bin/bash
apt-get update
apt-get install apt-transport-https -y

echo 1\) Install Docker

apt-get install docker.io -y

echo 2\) Disable Swap

swapoff -a