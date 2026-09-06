# Week 6. State Drift & 고전 terraform import `[대면]`

> 📘 **[개념 워크북 »](./lecture/개념워크북.md)** · **[실습 워크북 »](./lecture/실습워크북.md)**
> 개념 워크북은 예습용입니다. 실습은 실습 워크북을 위에서 아래로 따라가며 진행합니다.

> 이번 주가 끝나면 코드·state·실물 셋이 어긋난 상태를 `plan`으로 감지하고, 콘솔에서 만든 리소스를 `terraform import`로 state에 편입할 수 있습니다.

## 0. 메타 정보
| 항목 | 내용 |
|------|------|
| 일시 | 2026-09-02 · 60분 |
| 방식 | **대면** |
| 선행 | week4·week5 완료 및 과제③ 제출 |
| 산출물 | 실습 PR + 워크북 · 과제③ 리뷰 · **과제④ 출제** |

## 1. 학습 목표 (측정 가능)
- [ ] 코드·state·실물 셋이 어긋난 상태를 `plan`으로 감지할 수 있다
- [ ] `plan`의 `~`(수정)/`+`(생성)/`-`(삭제)/`-/+`(재생성)를 읽을 수 있다
- [ ] 콘솔에서 만든 리소스를 `terraform import`로 state에 편입할 수 있다
- [ ] 고전 import가 state만 채우고 HCL은 채우지 않는다는 한계를 설명할 수 있다

## 2. 사전 예습 (필수)
- HashiCorp: [terraform import](https://developer.hashicorp.com/terraform/cli/import), [Manage resource drift](https://developer.hashicorp.com/terraform/tutorials/state/resource-drift) (15분)
- 예습 체크: `terraform apply -refresh-only`가 무엇을 하는지 안다

## 3. 진행 타임박스 (60분)
| 시간 | 구성 | 내용 |
|------|------|------|
| 0~10분 | 회고 | 랜덤 지목 |
| 10~15분 | 과제③ 리뷰 | 대표 PR 공유 |
| 15~58분 | 실습 45분 | Block A 드리프트 18분 · Block B 고전 import 20분 · Block C 정리 7분. 개념 설명은 따로 떼지 않고 Block A 워크스루 안에서 함께 짚습니다 |
| 58~60분 | 마무리 | 7주차 예고 |

## 4. 실습 개요: 폴더 구조
```
practice/
 ├─ main.tf         # TODO ② 드리프트 실습용 aws_s3_bucket.drift_demo
 │                  # TODO ③ 고전 import 대상 aws_s3_bucket.manual (빈 껍데기)
 │                  # TODO ④ 부속 리소스 versioning · public_access_block
 ├─ variables.tf
 ├─ outputs.tf      # TODO ⑤
 ├─ providers.tf
 ├─ versions.tf
 └─ backend.tf      # TODO ① key = week06/app/terraform.tfstate. 버킷·잠금 테이블은 week3 것을 그대로 씁니다
```
실습 리소스는 S3 버킷 두 개뿐입니다. `{project_name}-drift`는 코드로 만들고, `{project_name}-manual`은 콘솔에서 손으로 만든 뒤 import로 편입합니다. 이번 주에는 EC2를 만들지 않고, 모듈도 쓰지 않습니다.

```bash
cd practice
cp example.tfvars terraform.tfvars   # project_name 채우기. 커밋 금지
#   backend.tf 의 CHANGE-ME 두 곳을 week3 값으로. key 는 이미 채워져 있습니다

# Block A. 콘솔이 나중에 끼어듭니다
terraform init
terraform plan                       # Plan: 1 to add   <- 다르면 apply 하지 말고 멈춤
terraform apply
#   콘솔에서 drift 버킷의 Env 태그를 study -> HACKED 로 수정
terraform state show aws_s3_bucket.drift_demo   # state 는 아직 study
terraform plan                       # Plan: 0 to add, 1 to change, 0 to destroy.  <- 드리프트 감지
terraform apply -refresh-only        # state 만 실물에 맞춥니다. 실물은 그대로
terraform plan                       # 여전히 1 to change. 코드가 그대로이기 때문입니다
terraform apply                      # 실물을 코드에 맞춥니다 -> No changes.

# Block B. 콘솔이 먼저 만들어 놓습니다
#   콘솔에서 "{project_name}-manual" 버킷 생성 (버전 관리 Enable, 태그 없음)
#   TODO ③ aws_s3_bucket.manual 빈 껍데기 작성
terraform import aws_s3_bucket.manual {project_name}-manual
terraform plan                       # No changes.  <- 그런데 버전 관리는 코드 어디에도 없습니다
#   TODO ④ 부속 리소스 두 개 작성
terraform plan                       # Plan: 2 to add   <- 실물은 이미 있습니다. apply 하지 말 것
terraform import aws_s3_bucket_versioning.manual          {project_name}-manual
terraform import aws_s3_bucket_public_access_block.manual {project_name}-manual
terraform plan                       # No changes.
terraform state list                 # 4줄

# Block C. 정리
terraform destroy                    # Destroy complete! Resources: 4 destroyed.
```

`plan` 숫자를 확인하는 것이 이번 주의 안전 게이트입니다. 지난 주차들과 달리 숫자가 실습 도중에 여러 번 바뀝니다. `1 to add` 로 시작해서 `1 to change` 가 되었다가 `No changes` 를 지나 `2 to add` 가 되고 다시 `No changes` 로 끝납니다. 숫자 하나를 외우지 말고 지금 어느 스텝에 있는지와 함께 보세요. 특히 첫 `plan` 이 `1 to add` 가 아니면 `backend.tf` 의 `key` 가 지난주 값일 수 있으니 apply 하지 말고 멈춥니다.

## 5. 체크포인트 (DoD)
- [ ] 첫 `apply` 전 `plan`이 `Plan: 1 to add, 0 to change, 0 to destroy.`
- [ ] 콘솔에서 태그를 바꾼 뒤 `state show`에는 아직 옛날 값이 남아 있는 것을 확인
- [ ] `plan`이 `Plan: 0 to add, 1 to change, 0 to destroy.` (드리프트 감지)
- [ ] `apply -refresh-only` 후 state가 실물과 같아졌고, 그래도 `plan`은 여전히 `1 to change`
- [ ] `apply` 후 `No changes.` 이고 콘솔에서 태그가 복원됨
- [ ] `import` 이후 `plan`이 `No changes.` 인데도 콘솔에서 켠 설정이 코드에 없다는 것을 확인
- [ ] 부속 리소스 코드를 작성한 뒤 `plan`이 `Plan: 2 to add, 0 to change, 0 to destroy.` (apply 하지 않음)
- [ ] 부속 리소스를 각각 `import` 한 뒤 `plan`이 `No changes.`
- [ ] `terraform state list`가 4줄
- [ ] **`destroy` 완료 확인** (`Destroy complete! Resources: 4 destroyed.`) 및 콘솔에서 만든 버킷도 지워진 것 확인
- [ ] week3의 S3 버킷과 DynamoDB 테이블은 지우지 않았음 (7주차까지 유지)

## 6. 트러블슈팅 FAQ
| 증상 | 원인 | 해결 |
|------|------|------|
| import 후에도 diff가 남음 | 코드에 속성이 다 채워지지 않음 | `plan` diff에 나온 속성을 하나씩 리소스 블록에 채워 재실행 |
| 존재하지 않는 버킷 import | 이름 오타 또는 콘솔 생성 전 시도 | `aws s3api head-bucket --bucket <이름>`으로 존재부터 확인 |
| 이미 state에 있는 주소로 중복 import | 같은 리소스를 두 번 import | `terraform state list`로 먼저 확인, 있으면 import 생략 |
| 리전 불일치 | provider의 `region`과 콘솔에서 만든 리전이 다름 | `providers.tf`의 `region`과 콘솔 화면 우측 상단 리전(서울) 대조 |
| S3 버킷 이름 전역 중복 | 버킷 이름은 계정이 아니라 전역으로 유일해야 함 | `project_name`에 본인 식별자를 더해 이름 재선정 |
| import ID 형식이 리소스마다 다름 | S3는 버킷명, EC2는 `i-...`처럼 리소스마다 규칙이 다름 | HashiCorp import 문서의 리소스별 Import 섹션 확인 |
| `state show`와 `plan`이 다르게 보임 | state가 실물보다 오래됨(refresh 전) | `terraform apply -refresh-only`로 state를 먼저 동기화 |
| destroy가 BucketNotEmpty로 실패 | 콘솔에서 버킷 안에 객체를 넣어둠 | 콘솔 또는 `aws s3 rm s3://<버킷> --recursive`로 객체 삭제 후 재시도 |
| import 직후 `plan`에 태그를 지우겠다는 diff | 콘솔에서 버킷에 태그를 붙였는데 코드에는 `tags`가 없음 | 콘솔 태그를 지우거나 같은 태그를 코드에 적기. 실습워크북 B-1 |
| 코드에 블록을 안 적고 `import` 실행 | `import`는 주소가 코드에 이미 있어야 함 | `resource` 블록을 먼저 적고 다시 실행. 오류 메시지가 예시를 알려줍니다 |
| `-refresh-only` 후에도 `plan`이 `1 to change` | state는 실물에 맞췄지만 코드가 그대로 | 정상입니다. 코드를 고치거나 `apply`. 개념워크북 8번 |

## 7. 심화 도전과제 (Optional ⭐)
- L2: 시큐리티 그룹이나 VPC를 import해서 규칙까지 코드로 재현
- L3-⭐: 모듈 안 주소(`module.network.aws_vpc.this`)로 import하기와 `terraform apply -refresh-only`·`terraform apply`가 state에 남기는 차이를 워크북에 정리

## 8. 다음 주 예고 & 준비물
- Week7(대면): 최신 import(`import` 블록 + `-generate-config-out`)와 GitHub Actions, 회고
- 예습: `import` 블록 문법, GitHub Actions 기본

---
> ⚠️ **비용 주의**: 빈 S3 버킷은 사실상 $0입니다. 이번 주는 EC2가 없어서 지난 주들과 달리 시간당 요금이 붙지 않습니다. 다만 import한 버킷도 destroy 대상이 된다는 것을 체감하는 것이 이번 주 마무리의 핵심이라 destroy는 반드시 진행합니다. week3의 state 저장소(S3 + DynamoDB)는 한 달 $0.01 미만이고 지우지 않습니다.
> **공통 규칙**: 자격증명/secret 커밋 금지 · destroy 확인 · 코드는 PR로
