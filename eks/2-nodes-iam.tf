resource "aws_iam_role" "nodes" {
  name = "${var.env}-${var.eks_name}-eks-nodes"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "nodes" {
  for_each = var.node_iam_policies

  policy_arn = each.value
  role       = aws_iam_role.nodes.name
}

resource "aws_iam_policy" "eks_policy" {
  name   = "${var.env}-${var.eks_name}-ebs-policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:CreateVolume",
          "ec2:DeleteVolume",
          "ec2:AttachVolume",
          "ec2:DetachVolume",
          "ec2:DescribeVolumes",
          "ec2:DescribeVolumeStatus",
          "ec2:CreateSnapshot",
          "ec2:DeleteSnapshot",
          "ec2:DescribeSnapshots",
          "ec2:ModifyVolume"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_policy_attachment" {
  role       = aws_iam_role.nodes.name
  policy_arn = aws_iam_policy.eks_policy.arn
}