resource "aws_iam_role" "eks_prod" {
  name = "eks-prod"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "prod-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_prod.name
}

resource "aws_iam_role_policy_attachment" "prod-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks_prod.name
}

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

data "aws_eks_cluster_auth" "prod" {
  name = "eks_prod"
}

provider "kubernetes" {
  host                   = aws_eks_cluster.prod.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.prod.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.prod.token
  load_config_file       = false
}
