# ---------------------------------------------------------------------------
# outputs.tf : terraform output 으로 꺼내 볼 값
#
# 실습워크북 B-6 을 따라 TODO ⑤ 를 채우세요.
# ---------------------------------------------------------------------------

output "drift_bucket" {
  description = "코드가 만든 버킷의 이름"
  value       = aws_s3_bucket.drift_demo.id
}

# TODO(B-6) ⑤: import 로 편입한 버킷도 output 으로 내세요.
#
#   output "manual_bucket" {
#     description = "콘솔이 만들고 import 로 편입한 버킷의 이름"
#     value       = aws_s3_bucket.manual.id
#   }
#
#   TODO ③ 을 채우기 전에 이것을 먼저 적으면 아직 없는 리소스를 가리켜서
#   validate 가 실패합니다. 순서대로 하세요.
