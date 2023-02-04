resource "aws_iam_role" "artifact" {
  name = "artifact"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "artifact" {
  name = "artifact"
  policy_arn = aws_iam_policy.artifact.arn
  roles = [aws_iam_role.artifact.name]
}

resource "aws_iam_policy" "artifact" {
  name = "artifact"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["ecr:*"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}