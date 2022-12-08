output "endpoint" {
  value = aws_eks_cluster.eks_anjar.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks_anjar.certificate_authority[0].data
}