resource "aws_eks_cluster" "prod" {
  name     = "prod"
  role_arn = "arn:aws:iam::125296811046:user/terraform"

  vpc_config {
    subnet_ids = ["subnet-004322718acabdb56", "subnet-03683734ad4f920f8", "subnet-0e5b7685321faadcd"]
  }
}

output "endpoint" {
  value = aws_eks_cluster.prod.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.prod.certificate_authority.0.data
}