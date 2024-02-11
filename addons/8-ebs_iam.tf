resource "aws_iam_policy" "ebs_csi_driver_policy" {
  name        = "${var.env}-${var.eks_name}-ebs-csi-driver-policy"
  description = "Policy allowing EKS worker nodes to manage EBS volumes for CSI driver"

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

resource "aws_iam_role_policy_attachment" "ebs_csi_driver_policy_attachment" {
  policy_arn = aws_iam_policy.ebs_csi_driver_policy.arn
  role       = aws_iam_role.nodes.name
}
