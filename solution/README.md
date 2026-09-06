# Week6 정답 코드

```bash
cp example.tfvars terraform.tfvars   # project_name 을 본인 값으로
terraform init
terraform apply                      # drift_demo 버킷 1개만 만들어집니다
```

`manual` 쪽 리소스 세 개는 apply 로 만드는 것이 아닙니다. 콘솔에서 버킷을 먼저 만든 뒤
아래처럼 하나씩 import 해서 state 에 편입시킵니다. import ID 는 셋 다 버킷 이름입니다.

```bash
terraform import aws_s3_bucket.manual                     boaz26-w6-kdh1834-manual
terraform import aws_s3_bucket_versioning.manual          boaz26-w6-kdh1834-manual
terraform import aws_s3_bucket_public_access_block.manual boaz26-w6-kdh1834-manual
terraform plan        # No changes.
terraform state list  # 4줄
terraform destroy     # 4 destroyed. import 한 버킷도 함께 지워집니다
```

`backend.tf` 의 `bucket` 과 `dynamodb_table` 은 예시 값입니다. week3 의 `bootstrap` 스택에서
`terraform output -raw backend_config` 로 나오는 본인 값으로 바꾸세요. `key` 는
`week06/app/terraform.tfstate` 이므로 건드리지 않습니다.

자격증명 없이 코드만 검토할 때는 backend 를 건너뜁니다.

```bash
D=$(mktemp -d); cp *.tf "$D/"; rm "$D/backend.tf"
cd "$D" && terraform init -backend=false && terraform validate
```
