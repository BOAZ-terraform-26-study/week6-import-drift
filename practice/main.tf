# ---------------------------------------------------------------------------
# main.tf : 이번 주에 다루는 버킷 두 개
#
# 오늘 만드는 것은 S3 버킷 둘뿐입니다. 빈 버킷은 요금이 붙지 않습니다.
# 그런데 둘이 생기는 방식이 정반대입니다.
#
#   drift_demo : 코드가 먼저 있고 Terraform 이 생성합니다. 그 뒤 콘솔에서 수정하여
#                코드 · state · 실물 셋이 어긋나게 만들어 봅니다.       (Block A)
#   manual     : 콘솔이 먼저 생성하고 Terraform 은 나중에 알게 됩니다.
#                import 로 state 에 편입시킵니다.                       (Block B)
#
# 실습워크북을 따라 TODO ②③④ 를 순서대로 작성하세요. 한 번에 모두 작성하지 마세요.
# ---------------------------------------------------------------------------

# TODO(A-3) ②: 드리프트 실습용 버킷을 생성하세요.
#
#   resource "aws_s3_bucket" "drift_demo" {
#     bucket = "${var.project_name}-drift"
#
#     tags = {
#       Name  = "${var.project_name}-drift"
#       Study = "boaz-terraform-26"
#       Env   = "study"       <- A-4 에서 콘솔로 이 값을 수정하여 드리프트를 만듭니다
#     }
#   }
#
#   Env 태그가 오늘의 실험 대상입니다. 태그는 무과금 속성이라 콘솔에서 수정해도
#   요금이 달라지지 않습니다. 인스턴스 타입 같은 과금 속성은 절대 콘솔에서 수정하지 마세요.


# TODO(B-2) ③: 콘솔에서 생성한 버킷을 받을 빈 블록을 작성하세요.
#
#   resource "aws_s3_bucket" "manual" {
#     bucket = "${var.project_name}-manual"
#   }
#
#   지금은 bucket 한 줄뿐입니다. 이 블록만 있으면 Terraform 은 "이 버킷을 새로 생성해야
#   한다"고 생각합니다. state 에 없기 때문입니다. 그래서 apply 하지 말고 import 합니다.
#     terraform import aws_s3_bucket.manual <버킷명>
#
#   import 는 state 만 채웁니다. HCL 은 생성하지 않습니다. 개념워크북 Part 3.


# TODO(B-4) ④: 콘솔에서 켠 설정을 코드로 가져오세요.
#
#   S3 는 버전 관리 · 퍼블릭 접근 차단 같은 설정이 버킷 리소스 안에 있지 않고
#   별도 리소스로 나뉘어 있습니다. 그래서 각각 따로 import 해야 합니다.
#
#   resource "aws_s3_bucket_versioning" "manual" {
#     bucket = aws_s3_bucket.manual.id
#     versioning_configuration {
#       status = "Enabled"
#     }
#   }
#
#   resource "aws_s3_bucket_public_access_block" "manual" {
#     bucket                  = aws_s3_bucket.manual.id
#     block_public_acls       = true
#     block_public_policy     = true
#     ignore_public_acls      = true
#     restrict_public_buckets = true
#   }
#
#   두 블록을 작성하고 plan 을 실행하면 2 to add 가 나옵니다. 실물은 이미 있는데도 그렇습니다.
#   여기서 apply 하지 말고 B-5 로 가서 각각 import 하세요.
