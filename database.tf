resource "aws_iam_role" "database" {
  name = "database"

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

resource "aws_iam_policy_attachment" "database" {
  name = "database"
  policy_arn = "arn:aws:iam::aws:policy/job-function/DatabaseAdministrator"
  roles = [aws_iam_role.artifact.name]
}