resource "aws_iam_role" "glue_service_role" {
  name = "glue-service-test-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "glue.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "glue_policy" {
  name        = "glue-test-policy"
  description = "Policy for AWS Glue to access S3, Glue Catalog, and other necessary services"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
          "s3:ListBucketMultipartUploads"
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::your-s3-bucket",
          "arn:aws:s3:::your-s3-bucket/*"
        ]
      },
      {
        Action = [
          "glue:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = "logs:*"
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}


resource "aws_iam_role_policy_attachment" "glue_policy_attachment" {
  policy_arn = aws_iam_policy.glue_policy.arn
  role       = aws_iam_role.glue_service_role.name
}
