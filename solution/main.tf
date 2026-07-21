resource "aws_s3_bucket" "drift_demo" {
  bucket = "${var.project_name}-drift"
  tags = {
    Name = "original-name"
  }
}

# classic import 완성본 (import 후 plan "No changes" 되도록 최소 속성 기재)
resource "aws_s3_bucket" "manual" {
  bucket = "${var.project_name}-manual"
}

resource "aws_s3_bucket_public_access_block" "manual" {
  bucket                  = aws_s3_bucket.manual.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
