# Week6 실습 — Drift & classic import
순서는 상위 README §4 참고.
```bash
cp example.tfvars terraform.tfvars
terraform init && terraform apply
# 콘솔에서 drift_demo 태그 수정 -> terraform plan (diff 확인)
# 콘솔에서 manual 버킷 생성 -> import
terraform import aws_s3_bucket.manual <project_name>-manual
terraform plan   # No changes 될 때까지 코드 보정
terraform destroy
```
