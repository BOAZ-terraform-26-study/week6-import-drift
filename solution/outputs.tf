output "drift_bucket" {
  description = "코드가 만든 버킷의 이름"
  value       = aws_s3_bucket.drift_demo.id
}

output "manual_bucket" {
  description = "콘솔이 만들고 import 로 편입한 버킷의 이름"
  value       = aws_s3_bucket.manual.id
}
