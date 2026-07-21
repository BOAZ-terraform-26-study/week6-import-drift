# (A) Drift 실습용 최소 리소스: 태그가 있는 S3 버킷 하나
resource "aws_s3_bucket" "drift_demo" {
  bucket = "${var.project_name}-drift"
  tags = {
    Name = "original-name" # 콘솔에서 이 태그를 바꿔 Drift를 만들어 보세요
  }
}

# (B) classic import 대상: 콘솔에서 먼저 만든 버킷을 여기로 import
# 1) 콘솔에서 "${var.project_name}-manual" 버킷 생성
# 2) 아래 블록 작성 후:
#    terraform import aws_s3_bucket.manual ${var.project_name}-manual
# TODO(L1): import 대상 리소스 블록
# resource "aws_s3_bucket" "manual" {
#   bucket = "${var.project_name}-manual"
# }
