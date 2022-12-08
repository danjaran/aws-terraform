#!/bin/bash
#### debug or check progress in /var/log/messages (centos7)
sudo yum -y update && sudo yum -y upgrade
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

echo "install docker ..."
sudo yum install docker-ce-18.09.1 docker-ce-cli-18.09.1 containerd.io docker-compose-plugin -y
sudo systemctl start docker
sudo usermod -aG docker centos
echo "install containerd ..."
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y containerd.io
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
systemctl restart containerd

# #install kube
echo "install kubernetes ..."
sudo tee /etc/yum.repos.d/kubernetes.repo<<EOF
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF


sudo yum install -y kubelet-1.20 kubeadm-1.20 kubectl-1.20
systemctl enable kubelet
systemctl start kubelet


sudo tee <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

sudo sed -i '/swap/d' /etc/fstab
sudo swapoff -a

sudo hostnamectl set-hostname master-node


# sudo kubeadm init --pod-network-cidr=10.244.0.0/16
# mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# sudo chown $(id -u):$(id -g) $HOME/.kube/config
#kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml

# /run/flannel/subnet.env
# FLANNEL_NETWORK=10.244.0.0/16
# FLANNEL_SUBNET=10.244.0.1/24
# FLANNEL_MTU=1450
# FLANNEL_IPMASQ=true

# kubectl taint nodes --all node-role.kubernetes.io/control-plane- node-role.kubernetes.io/master-
