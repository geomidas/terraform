resource "aws_iam_role_policy_attachment" "prod-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_prod.name
}

resource "aws_iam_role_policy_attachment" "prod-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_prod.name
}

resource "aws_iam_role_policy_attachment" "prod-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_prod.name
}

resource "aws_eks_node_group" "prod" {
  cluster_name    = aws_eks_cluster.prod.name
  node_group_name = "eks_prod"
  node_role_arn   = aws_iam_role.eks_prod.arn
  subnet_ids      = ["subnet-004322718acabdb56", "subnet-03683734ad4f920f8", "subnet-0e5b7685321faadcd"]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }

  depends_on = [
    aws_iam_role_policy_attachment.prod-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.prod-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.prod-AmazonEC2ContainerRegistryReadOnly,
  ]
}