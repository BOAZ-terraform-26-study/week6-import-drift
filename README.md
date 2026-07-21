# Week 6. State Drift & 기존 import (classic) `[대면]`

> 📘 **[이번 주 강의자료(핸즈온 워크북) PDF »](./lecture/강의자료.pdf)** — 실습은 이 문서를 위에서 아래로 따라가며 진행합니다.

> 이번 주가 끝나면: **콘솔 수동 변경을 `plan`으로 감지(Drift)하고, 코드 밖 리소스를 `terraform import`로 편입할 수 있다.**

## 0. 메타 정보
| 항목 | 내용 |
|------|------|
| 일시 | 2026-MM-DD · 60분 |
| 방식 | **대면** |
| 선행 | week5 완료 · 과제③ 제출 |
| 산출물 | 실습 PR + 워크북 (지난 과제 리뷰 O) |

## 1. 학습 목표 (측정 가능)
- [ ] Drift(실제 인프라 != state != code)를 `plan`으로 감지할 수 있다
- [ ] `plan`의 `~`(수정)/`+`(생성)/`-`(삭제)를 읽을 수 있다
- [ ] 콘솔에서 만든 리소스를 `terraform import`로 state에 편입할 수 있다
- [ ] classic import의 한계(코드를 사람이 먼저 써야 함)를 설명할 수 있다

## 2. 사전 예습 (필수)
- HashiCorp: [terraform import](https://developer.hashicorp.com/terraform/cli/import), [Manage resource drift](https://developer.hashicorp.com/terraform/tutorials/state/resource-drift) (15분)
- 예습 체크: `terraform apply -refresh-only`가 무엇을 하는지 안다

## 3. 진행 타임박스 (60분)
| 시간 | 구성 | 내용 |
|------|------|------|
| 0~10분 | 회고 | 랜덤 지목 |
| 10~15분 | 과제③ 리뷰 | 대표 PR 공유 |
| 15~58분 | 실습 45분 | (A) Drift 실습 → (B) classic import 실습 |
| 58~60분 | 마무리 | 7주차 예고 |

## 4. 실습 개요

### (A) Drift 실습 (10분)
1. week5 인프라를 apply (또는 `practice/` 사용)
2. **AWS 콘솔에서** EC2의 `Name` 태그를 손으로 바꾼다 (무과금 속성만! 인스턴스 타입 변경 금지 — 과금)
3. `terraform plan` → `~ tags` diff가 뜨는 것 확인 (Drift 감지)
4. `terraform apply` → 코드값으로 복원 / 또는 `apply -refresh-only`로 state만 동기화

### (B) classic import 실습 (25분)
1. **콘솔에서** S3 버킷 `boaz-tf-yourname-manual` 을 손으로 생성
2. 코드에 빈 리소스 블록 작성:
   ```hcl
   resource "aws_s3_bucket" "manual" {
     bucket = "boaz-tf-yourname-manual"
   }
   ```
3. `terraform import aws_s3_bucket.manual boaz-tf-yourname-manual`
4. `terraform plan` → diff가 없어질 때까지 속성을 코드로 채운다 (이 "노가다"가 핵심 체감 포인트 → 7주차 자동화의 동기)

```bash
cd practice
terraform init && terraform apply
terraform import aws_s3_bucket.manual boaz-tf-yourname-manual
terraform plan
terraform destroy   # manual 버킷 포함 전체 (반드시!)
```

## 5. 체크포인트 (DoD)
- [ ] 콘솔 수동 변경 후 `plan`에서 Drift 감지
- [ ] `import` 후 `state list`에 `aws_s3_bucket.manual` 존재
- [ ] `plan`이 "No changes"가 될 때까지 코드 보정
- [ ] **`destroy` 완료 (manual 버킷 포함) 확인**

## 6. 트러블슈팅 FAQ
| 증상 | 원인 | 해결 |
|------|------|------|
| import 후 계속 diff | 속성 미기재 | plan diff를 보고 코드에 하나씩 채움 |
| 콘솔 리소스 안 잡힘 | 리전 불일치 | 서울 리전 확인 |
| import ID 형식 헷갈림 | 리소스별 상이 | S3=버킷명, SG=sg-xxx, EC2=i-xxx |
| 이미 state에 있음 | 중복 import | `state rm` 후 재시도 |

## 7. 심화 도전과제 (Optional ⭐)
- L2: security group을 import 해서 rule까지 코드로 재현
- L3-⭐: `apply -refresh-only` vs `apply`의 state 차이를 워크북에 정리

## 8. 다음 주 예고 & 준비물
- Week7(대면): 최신 import(`import` block + `-generate-config-out`) & GitHub Actions · 회고
- 예습: `import` 블록 문법, GitHub Actions 기본

---
> ⚠️ **비용 주의**: Drift 실습은 **태그/SG 같은 무과금 속성만**. 인스턴스 타입 콘솔 변경 금지(과금). import 대상은 무과금(S3 빈 버킷). 종료 시 manual 포함 전체 `destroy`.
> **공통 규칙**: 자격증명/secret 커밋 금지 · `destroy` 확인 · 코드는 PR로
