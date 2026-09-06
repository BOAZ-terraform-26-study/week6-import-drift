# ---------------------------------------------------------------------------
# main.tf : 버킷 두 개. 생기는 방식이 정반대입니다.
#
#   drift_demo : 코드가 먼저. Terraform 이 만듭니다.       (Block A)
#   manual     : 콘솔이 먼저. import 로 편입합니다.        (Block B)
#
# manual 쪽 리소스 세 개는 전부 콘솔에 이미 존재하는 것이라 apply 로 만들지 않고
# terraform import 로 state 에 넣습니다. 각각 따로 import 해야 합니다.
#
#   terraform import aws_s3_bucket.manual                    <버킷명>
#   terraform import aws_s3_bucket_versioning.manual         <버킷명>
#   terraform import aws_s3_bucket_public_access_block.manual <버킷명>
# ---------------------------------------------------------------------------

resource "aws_s3_bucket" "drift_demo" {
  bucket = "${var.project_name}-drift"

  tags = {
    Name  = "${var.project_name}-drift"
    Study = "boaz-terraform-26"
    Env   = "study"
  }
}

resource "aws_s3_bucket" "manual" {
  bucket = "${var.project_name}-manual"
}

# 콘솔에서 켠 버전 관리입니다. 버킷 리소스 안에 있지 않고 따로입니다.
resource "aws_s3_bucket_versioning" "manual" {
  bucket = aws_s3_bucket.manual.id

  versioning_configuration {
    status = "Enabled"
  }
}

# 콘솔에서 버킷을 기본값으로 만들면 네 값이 모두 true 로 설정됩니다.
resource "aws_s3_bucket_public_access_block" "manual" {
  bucket                  = aws_s3_bucket.manual.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
