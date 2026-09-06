# Week6 실습: Drift 와 고전 import

작업 폴더는 여기입니다. 순서는 `lecture/실습워크북.md` 를 위에서 아래로 따라가세요.
막히면 `solution/` 에 정답이 있습니다.

## TODO 다섯 개

| TODO | 파일 | 스텝 | 내용 |
|------|------|------|------|
| ① | `backend.tf` | A-2 | `CHANGE-ME` 두 곳을 week3 버킷과 테이블 이름으로 |
| ② | `main.tf` | A-3 | `aws_s3_bucket.drift_demo` |
| ③ | `main.tf` | B-2 | `aws_s3_bucket.manual` 빈 껍데기 |
| ④ | `main.tf` | B-4 | `aws_s3_bucket_versioning.manual` · `aws_s3_bucket_public_access_block.manual` |
| ⑤ | `outputs.tf` | B-6 | `manual_bucket` output |

## 명령 흐름

```bash
cp example.tfvars terraform.tfvars     # project_name 을 본인 값으로
terraform init
terraform plan                          # Plan: 1 to add   <- 다르면 멈춤
terraform apply

#   콘솔에서 drift 버킷의 Env 태그를 HACKED 로 수정
terraform state show aws_s3_bucket.drift_demo   # state 는 아직 study
terraform plan                                   # Plan: 0 to add, 1 to change, 0 to destroy.
terraform apply -refresh-only                    # state 만 실물에 맞춥니다
terraform apply                                  # 실물을 코드에 맞춥니다

#   콘솔에서 manual 버킷 생성 (버전 관리 Enable)
terraform import aws_s3_bucket.manual <project_name>-manual
terraform plan                                   # No changes. 그런데 버전 관리는 코드에 없습니다
#   TODO ④ 를 적고
terraform plan                                   # Plan: 2 to add  <- apply 하지 말 것
terraform import aws_s3_bucket_versioning.manual <project_name>-manual
terraform import aws_s3_bucket_public_access_block.manual <project_name>-manual
terraform plan                                   # No changes.
terraform state list                             # 4줄

terraform destroy                                # 4 destroyed. manual 버킷도 지워집니다
```

`terraform.tfvars` 와 `terraform.tfstate` 는 커밋하지 마세요.
