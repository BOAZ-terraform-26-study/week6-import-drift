# 스터디 워크북 작성 규칙

BOAZ 테라폼 스터디 강의자료(`lecture/개념워크북.md`, `lecture/실습워크북.md`)를 쓰거나 고칠 때 지키는 규칙입니다.
1~12절과 16절은 주차가 바뀌어도 같습니다. 13~15절과 17절은 이 주차(week6 드리프트와 고전 import)의 사실을 담고 있으니, 새 주차 리포를 만들면 그 네 절만 갈아 끼우세요.

---

## 1. 문체
존댓말로 씁니다. `~합니다` / `~됩니다` / `~하세요`. 개조식(`~함`, `~할 것`)은 쓰지 않습니다.
예외는 두 군데입니다. 표 안의 셀과 `[관찰 ✍️]`의 빈칸 문항은 명사형으로 끝내도 됩니다.

학습자에게 직접 말을 겁니다. "설정한다"보다 "설정해보세요", "확인할 수 있다"보다 "확인할 수 있습니다".

1인칭 "저는"은 강사가 실제로 한 행동을 가리킬 때만 씁니다. 예를 들어 "저는 이 배열을 적은 적이 없습니다"처럼 학습자가 스스로 확인할 수 있는 사실을 짚을 때입니다. 습관적으로 붙이지 않습니다.

---

---

## 2. 문장부호
**em dash(`—`)와 en dash(`–`)는 쓰지 않습니다.** 한국어 자판으로는 거의 치지 않는 문자라, 문서 전체에서 기계가 쓴 티가 가장 크게 나는 지점입니다. 상황별로 이렇게 바꿉니다.

| 쓰고 싶은 자리 | 대신 |
|--------------|------|
| 제목의 부제 | `:` (`## 오늘의 지도: 의존성 지도`) |
| 문장 중간 부연 | 문장을 끊고 `.` 또는 쉼표 |
| 목록 항목의 설명 앞 | 공백만 두거나 마침표로 끊기 |
| 표에서 "해당 없음" | `-` |
| 용어 정의 | `> **용어 · CIDR:** 정의` |

곧은 따옴표 `"`만 씁니다. 곱슬따옴표 `“ ”`는 쓰지 않습니다.
나열할 때 가운뎃점 `·`는 한국어에서 자연스러우니 그대로 씁니다(`VPC · 서브넷 · IGW`).

---

---

## 3. 강조
볼드는 한 문단에 한두 곳까지입니다. 문장 전체를 볼드로 감싸지 않습니다. 다 강조하면 아무것도 강조되지 않습니다.

볼드를 쓸 자리는 셋입니다. 안 지키면 사고가 나는 한 줄, 표의 첫 열, 학습자가 대조해야 하는 숫자.

"가장 중요한", "오늘의 핵심", "하이라이트" 같은 최상급 표현은 **문서 전체에서 한 번만** 씁니다. 여러 번 나오면 전부 무게를 잃습니다.

이모지는 기능 표기에만 씁니다. ⭐는 난이도, ✍️는 기록해야 하는 곳. 제목 장식으로는 쓰지 않습니다.

---

---

## 4. 쓰지 않는 글쓰기 습관
아래 패턴은 내용이 맞더라도 다시 씁니다.

| 하지 말 것 | 왜 | 대신 |
|-----------|-----|------|
| 모든 섹션을 같은 틀로 시작 (`**한 줄 요약: ...**`) | 반복되는 순간 기계가 찍어낸 티가 납니다 | 요약을 첫 문단에 녹여서 씁니다 |
| 수사 의문문 뒤 자문자답 ("왜 그럴까요? 바로 ~때문입니다") | 설명을 늘리기만 합니다 | 그냥 서술합니다 |
| `~가 아니라 ~다` 부정 대구의 반복 | 한 문서에 서너 번 나오면 상투구가 됩니다 | 문서당 한두 번까지 |
| 억지로 세 개 맞추기 | 두 개면 두 개, 네 개면 네 개로 씁니다 | 실제 개수대로 |
| `**① 제목.**` 인라인 헤더 목록 | 목록이 아니라 문단으로 읽히는 내용입니다 | "첫째, ~입니다" 서술형 |
| 제목 바로 밑에 제목을 되풀이하는 한 줄 | 자리만 차지합니다 | 바로 본문으로 |
| 문장 끝에 붙이는 짧은 부정구 ("추측 없이", "군더더기 없이") | 문장이 아니라 표어입니다 | 온전한 절로 씁니다 |

학습자가 실제로 품을 법한 질문 한두 개를 던지는 건 괜찮습니다. 금지하는 건 답을 이미 아는 척하는 연출용 질문입니다.

---

---

## 5. 문서 구조
강의자료는 두 파일로 나눕니다. 섞으면 실습 중에 찾기가 어렵습니다.

- `lecture/개념워크북.md` : 설명. 라이브에서 짚는 분량과 나머지를 구분해서 표시합니다.
- `lecture/실습워크북.md` : 손으로 치는 것. 위에서 아래로 그대로 따라가면 끝나야 합니다.

문단 앞에 붙이는 태그는 고정입니다.

| 태그 | 뜻 |
|------|-----|
| `[개념]` | 설명 |
| `[실습]` | 직접 손으로 칩니다 |
| `[확인]` | 화면에 나온 것과 문서를 대조합니다 |
| `[함정]` | 미리 알고 피해 갑니다 |
| `[관찰 ✍️]` | 빈칸을 채웁니다. 제출물이 됩니다 |
| `(심화 ⭐)` | 먼저 끝낸 사람만. 안 해도 목표는 달성 |

개념워크북은 `Part N`, 실습워크북은 `Block A / B / C`로 묶습니다.
개념워크북의 **Part 0은 항상 용어 사전**입니다. 그 주차에 처음 나오는 클라우드 용어를 실습 전에 다 풀어둡니다.
실습워크북은 Block A 워크스루(강사와 함께), Block B 각자 진행, Block C 정리(`destroy`와 잔존 점검) 순서입니다.

---

---

## 6. GitHub alert 사용 기준
용도를 섞으면 학습자가 어느 박스를 읽어야 할지 판단하지 못합니다.

| 종류 | 쓰는 경우 |
|------|----------|
| `[!NOTE]` | 배경지식, 용어 정의, 몰라도 되는 곁가지 |
| `[!TIP]` | 안 해도 되지만 알면 편한 것 |
| `[!IMPORTANT]` | 안 하면 다음 단계가 막히는 것, 체크포인트 |
| `[!WARNING]` | 하면 시간을 날리는 것 |
| `[!CAUTION]` | 하면 돈이 나가거나 비밀이 새는 것 |

한 섹션에 alert가 넷을 넘으면 본문으로 내립니다. 박스가 많아지면 본문이 안 읽힙니다.

---

---

## 7. 처음 배우는 사람 기준으로 쓰기
**본문은 실제 기술 용어로 씁니다.** 독자는 IT 전공 스터디원이라 리소스, 참조, 간선, state, 서브넷 같은 말을 그대로 소화합니다. 쉽게 쓴다고 새 낱말을 지어내면(부품, 화살표, 장부) 오히려 어색해지고, 나중에 공식 문서를 볼 때 다시 번역해야 합니다.

| 지어낸 말 | 본문에서 쓸 말 |
|----------|--------------|
| 부품 | 리소스 |
| 화살표 | 참조 (그래프를 말할 때는 간선) |
| 화살표 지도 | 의존성 지도 |
| 장부 | state |
| 잎사귀 | 리프 노드(leaf) |
| 부지 · 구역 · 정문 · 이정표 · 경비원 | VPC · 서브넷 · IGW · 라우트 테이블 · 시큐리티 그룹 |

비유는 버리지 않되 **자리를 제한합니다.** 용어를 처음 소개하는 표의 "비유" 열, 도입부 도식의 라벨, 용어 정의 박스 안까지입니다. 그 밖의 본문에서 비유어를 실제 이름 대신 쓰지 않습니다. 비유를 쓸 때는 하나의 세계관으로 통일하고 중간에 갈아타지 않습니다.

용어를 일괄 치환할 때는 **`.tf` 주석, `scripts/*.sh`, `README.md`, PR 템플릿까지 같이 바꿉니다.** 워크북만 고치면 인용한 코드와 어긋납니다. 그리고 치환 뒤에는 조사를 반드시 눈으로 확인하세요. `⑦을 긋고`를 기계적으로 바꾸면 `⑦ 를 잇고`처럼 조사가 틀어집니다.

- 용어는 첫 등장에서 정의합니다. `> **용어 · CIDR (Classless Inter-Domain Routing):** IP 주소 범위를 적는 방법.`
- 명령마다 **기대 출력을 그대로 붙여둡니다.** 학습자가 자기 화면과 대조할 수 있어야 합니다.
- 문서 앞쪽에 **그날 나와야 하는 숫자를 못 박는 표**를 둡니다(`Plan: 5 to add`, `state list` 7줄 같은 것). 다르면 멈추라고 씁니다.
- 실습 스텝은 "지금 하는 일은 ~입니다" 한 줄로 시작합니다.
- ASCII 다이어그램을 쓸 때는 한글을 2칸으로 계산해서 정렬을 맞춥니다.

---

---

## 8. 사실과 검증
숫자, 리소스 ID, 비용, 에러 메시지는 **실제로 조회하거나 재현한 값만** 씁니다. 그럴듯하게 지어내지 않습니다.
문서 끝에 검증 환경을 각주로 남깁니다.

> 이 문서의 plan 출력, AMI ID, AZ, 비용은 서울 리전, AWS provider 6.57.1, Terraform 1.15.8 에서 실제로 조회·검증한 값입니다.

확인하지 못한 것은 아예 쓰지 않습니다. "아마", "일반적으로"로 덮지 않습니다.

---

---

## 9. 실습 자료의 안전 규칙
과금되는 리소스를 만드는 주차라면 아래가 빠지면 안 됩니다.

- 시간당 비용 표와 "지우지 않고 한 달 두면 얼마" 비교
- `destroy` 블록. 실습의 마지막이 아니라 **독립된 필수 블록**으로 둡니다
- state가 빈 것과 계정이 빈 것을 따로 확인시키기
- 올리면 안 되는 값 명시. 공인 IP, 계정번호 12자리, `terraform.tfvars`, `terraform.tfstate`, `state.json`
- 제출물에 넣기 전 마스킹 명령을 문서에 직접 적어두기

---

---

## 10. 주차 사이 연결
- 문서 앞에서 **지난 주차가 "다음에 설명하겠다"고 넘긴 것을 회수하는 표**를 만듭니다.
- 문서 끝에 **다음 주차 예고 표**를 둡니다. 왼쪽에 오늘 본 것, 오른쪽에 그것이 다음 주에 만드는 문제.
- 이전 주차에서 이미 설명한 것은 다시 설명하지 않고 위치만 가리킵니다.

---

---

## 11. 코드와 파일
- `practice/`는 `# TODO` 빈칸 스켈레톤, `solution/`은 정답. 둘 다 유지합니다.
- 워크북이 인용하는 코드 조각은 실제 `.tf` 파일과 한 글자도 다르면 안 됩니다. 한쪽을 고치면 다른 쪽도 고칩니다.
- `.tf` 주석과 `scripts/*.sh` 주석에도 위 문장부호 규칙을 그대로 적용합니다.
- 제출은 `submissions/{github-id}/`. `practice/`를 직접 고쳐 올리게 하지 않습니다. 머지되는 순간 다음 사람의 빈칸이 사라집니다.

---

---

## 12. PDF 배포본
`.md`가 원본이고 PDF는 배포본입니다. PDF만 고치는 일은 없습니다.

`.md`를 HTML로 바꾼 뒤 headless Chrome 인쇄로 뽑습니다. 인쇄 CSS에서 지킬 것이 셋입니다.

- **페이지 하단에 빈 공백을 만들지 않습니다.** `h1`에 `page-break-before: always`를 걸지 않고, 표·코드블록·alert에 `page-break-inside: avoid`를 걸지 않습니다. 큰 블록이 통째로 다음 장으로 밀리면서 앞 장이 비어버립니다.
- 표는 쪼개지되 행 중간에서는 자르지 않습니다. `tr { page-break-inside: avoid }`, `thead { display: table-header-group }`.
- 코드블록 안 한글은 모노스페이스 2칸 폭에 맞춥니다. 한글을 별도 `@font-face`로 잡고 `size-adjust: 120.4%`를 줍니다. 안 그러면 ASCII 다이어그램의 세로선이 어긋납니다.

`.md`를 고쳤으면 PDF도 같이 다시 만듭니다.

---

> PDF 빌드 도구는 [workbook-pdf](https://github.com/BOAZ-terraform-26-study/workbook-pdf) 레포로 옮겼습니다. `.md` 를 고쳤으면 그 레포를 받아 `./workbook-pdf/build-pdf.sh lecture` 를 돌려 PDF 를 다시 뽑으세요. 하나만 뽑으려면 `./workbook-pdf/build-pdf.sh lecture/개념워크북.md` 처럼 파일을 줍니다.

---

## 13. 리포 구조: 한 곳을 고치면 같이 고쳐야 하는 파일
하나의 주차가 여러 산출물로 흩어져 있습니다. 사실 하나를 바꾸면 그것을 인용한 곳을 모두 따라 고쳐야 합니다.

| 파일 | 역할 | 무엇을 인용하고 있는지 |
|------|------|--------------------|
| `README.md` | 세션 진행표. 타임박스와 DoD | plan 숫자 · state 줄 수 · 워크북 링크 |
| `lecture/개념워크북.md` | 설명. Part 0~7 | `.tf` 코드 조각 · import ID 형식. 명령과 화면은 싣지 않습니다 |
| `lecture/실습워크북.md` | 손으로 치는 절차. Block A/B/C | TODO 번호 · 기대 출력 · 마스킹 명령 |
| `practice/*.tf` | `# TODO` 빈칸 스켈레톤 | 주석이 실습워크북 스텝 번호를 가리킵니다 |
| `solution/*.tf` | 정답 | `practice/`와 TODO를 채운 것만 달라야 합니다 |
| `practice/README.md` · `solution/README.md` | 폴더별 요약 | TODO 번호 · plan 숫자 · state 줄 수 |
| `assignment/ASSIGNMENT.md` | 과제④ 출제 | 제출은 `assignments` 리포의 `round4-week6/{github-id}/` |
| `.github/pull_request_template.md` | DoD 체크리스트 | destroy 확인 |

이 주차부터 **두 문서의 분업을 더 세게 갈랐습니다.** 개념워크북에는 명령 예시 · CLI 출력 · "오늘 나와야 하는 숫자" 표를 넣지 않습니다. 그 셋은 실습워크북에만 둡니다. 개념워크북은 그 화면이 왜 그렇게 나오는지만 설명하고, 실제 화면이 필요한 자리에서는 "실습워크북 A-5에서 봅니다"처럼 가리킵니다.

이렇게 가른 이유는 두 문서를 나란히 뽑았을 때 같은 출력이 두 번 실리는 것이 눈에 거슬렸기 때문입니다. week5까지는 오류 메시지와 숫자 표가 양쪽에 있었습니다. 새 주차를 만들 때도 이 분업을 지키세요. 개념워크북에 코드펜스를 넣어도 되는 것은 ASCII 다이어그램과 HCL 조각까지입니다.

7절의 "명령마다 기대 출력을 그대로 붙여둡니다"는 실습워크북에 적용됩니다.

TODO 번호는 `practice/`와 실습워크북이 공유하는 유일한 약속입니다. 한쪽만 바꾸면 대응이 끊어집니다. 번호는 실습 순서대로 답니다.

| TODO | 파일 | 스텝 | 내용 |
|------|------|------|------|
| ① | `practice/backend.tf` | A-2 | `CHANGE-ME` 두 곳을 week3 버킷과 테이블 이름으로 |
| ② | `practice/main.tf` | A-3 | `aws_s3_bucket.drift_demo`. `Env = "study"` 태그가 실험 대상입니다 |
| ③ | `practice/main.tf` | B-2 | `aws_s3_bucket.manual` 빈 껍데기. `bucket` 한 줄뿐입니다 |
| ④ | `practice/main.tf` | B-4 | `aws_s3_bucket_versioning.manual` · `aws_s3_bucket_public_access_block.manual` |
| ⑤ | `practice/outputs.tf` | B-6 | `manual_bucket` output |

TODO ③ 과 ④ 는 apply 로 만드는 것이 아니라 `terraform import` 로 편입하는 리소스입니다. 워크북에서 이 둘 뒤에 apply 를 붙이지 마세요. 실물이 이미 있는데 apply 를 하면 학습 순서가 무너집니다.

이 리포에는 `scripts/check-leftover.sh` 와 `lecture/강사스크립트.md` 가 없습니다. 잔존 점검은 실습워크북 C-2 의 `aws` CLI 명령이 대신합니다.

---

## 14. 자주 쓰는 명령
워크북이 인용한 코드가 실제 `.tf` 와 어긋나지 않았는지 확인합니다. 11절을 지키는 방법입니다.

```bash
diff -u practice/main.tf solution/main.tf | grep -v '^[-+]#'
grep -n 'terraform import\|-refresh-only\|state show' lecture/실습워크북.md
```

문장부호 규칙(2절)과 강조 규칙(3절)은 기계로 셉니다.

```bash
grep -rn '—\|–\|“\|”' lecture/*.md README.md practice/ solution/     # 아무것도 안 나와야 합니다
grep -c '오늘의 핵심\|가장 중요한\|하이라이트' lecture/개념워크북.md    # 문서당 1 이하
```

AWS 자격증명 없이 정답 코드를 검증합니다. 과금이 없습니다.

```bash
D=$(mktemp -d); cp solution/*.tf "$D/"; rm "$D/backend.tf"
cd "$D" && terraform init -backend=false && terraform validate
```

이 주차의 오류 메시지 네 종류는 자격증명 없이 재현됩니다. 8절을 지키는 방법입니다.

```bash
# 설정에 없는 주소로 import
terraform import aws_s3_bucket.nosuch some-bucket
# 이미 state 에 있는 주소로 중복 import (state 파일을 손으로 만들어 재현)
terraform import aws_s3_bucket.manual <버킷명>
# 선언되지 않은 리소스를 output 이 가리킬 때
terraform validate
# 변수 규칙 위반
echo 'project_name = "BOAZ26"' > terraform.tfvars && terraform validate
```

포맷은 리포 루트에서 재귀로 돌립니다.

```bash
terraform fmt -recursive
terraform fmt -check -recursive
```

`terraform apply` · `terraform destroy` · `terraform import` 처럼 실제 인프라나 원격 state 를 바꾸는 명령은 사용자가 직접 실행하도록 안내하고, 임의로 수행하지 않습니다.

---

## 15. 이 주차에 못 박아둔 값
문서에 흩어져 있는 숫자입니다. 하나를 바꾸면 13절 표의 인용처를 전부 따라 고칩니다.

| 항목 | 값 | 어디에 걸려 있는지 |
|------|-----|-----------------|
| 검증 환경 | Terraform 1.15.8 · AWS provider `~> 6.0` · `ap-northeast-2` · `darwin_arm64` | 워크북 두 편의 끝 각주 |
| `required_version` | `>= 1.9.0` | `practice/versions.tf` · `solution/versions.tf` |
| backend key | `week06/app/terraform.tfstate` | week05 의 `week05/prod/...` 를 두면 지난 주 state 를 인수합니다 |
| state 저장소 | week3 의 `boaz26-w3-{id}-tfstate` · `boaz26-w3-{id}-tflock` | 7주차까지 남깁니다. 새로 만들지 않습니다 |
| A-3 첫 `plan` | `Plan: 1 to add, 0 to change, 0 to destroy.` | README · 실습워크북 A-3 · `practice/README.md` |
| 드리프트 감지 `plan` | `Plan: 0 to add, 1 to change, 0 to destroy.` | 개념워크북 Part 2 · 실습워크북 A-5 |
| 부속 리소스 추가 후 `plan` | `Plan: 2 to add, 0 to change, 0 to destroy.` | 개념워크북 Part 4 · 실습워크북 B-4 |
| 전부 import 한 뒤 `plan` | `No changes. Your infrastructure matches the configuration.` | 실습워크북 B-5 |
| 최종 `state list` | **4줄** | README · 실습워크북 B-5 · `practice/README.md` |
| `destroy` | `Destroy complete! Resources: 4 destroyed.` | 같은 세 곳 |
| 버킷 이름 | `{project_name}-drift` · `{project_name}-manual` | `main.tf` 양쪽 · 워크북 전체 |
| 드리프트 대상 태그 | `Env` 를 `study` 에서 `HACKED` 로 | 실습워크북 A-4 |
| 비용 | 빈 S3 버킷 2개는 사실상 $0. 이번 주는 EC2 가 없습니다 | 개념워크북 Part 6 · 실습워크북 도입 |

Terraform 안내 문구(`Note: Objects have changed outside of Terraform` · `Import successful!` · `-refresh-only` 승인 프롬프트 · `Destroy complete! Resources:` 등)는 `strings $(which terraform)` 으로 바이너리의 메시지 목록에서 원문을 대조했습니다. 새 주차에서 안내 문구를 인용할 때도 이 방법을 쓰면 apply 없이 원문을 확인할 수 있습니다.

자격증명 없이 실행해서 얻은 것은 `validate` 의 성공과 오류 메시지 네 종류(`resource address ... does not exist in the configuration` · `Resource already managed by Terraform` · `Reference to undeclared resource` · `Invalid value for variable`), 그리고 `state list` · `state show` 의 출력 모양입니다. `plan` 의 숫자와 `import` 성공 출력, `apply -refresh-only` 의 화면은 코드에서 도출한 값이고 워크북 각주에 그렇게 적혀 있습니다. 8절 규칙대로 이 구분을 지우지 마세요.

---
## 16. 배포하지 않는 파일
`.gitignore` 가 막고 있는 것 중에 착각하기 쉬운 것들입니다.

| 파일 | 왜 커밋하지 않는지 |
|------|-----------------|
| `*.tfvars` (`example.tfvars` 만 예외) | 공인 IP 가 들어갑니다 |
| `*.tfstate` · `*.tfstate.*` | state 는 평문 JSON 이고 공인 IP 가 그대로 들어 있습니다 |
| `**/.terraform/` | 프로바이더 바이너리와 모듈 캐시입니다 |
| `*.tfplan` | 계획 파일에도 값이 들어갑니다 |

`.terraform.lock.hcl` 은 무시 목록에 넣지 않습니다. 다만 이 리포에는 아직 커밋된 lock 파일이 없습니다. 넣기로 한다면 `practice/envs/prod` 와 `solution/envs/prod` 양쪽에 함께 넣어야 합니다. 한쪽에만 있으면 두 폴더가 서로 다른 provider 버전으로 돌게 됩니다.

week4 리포의 `.gitignore` 에 있던 `backend.hcl` · `*.pem` · `state.json` · `lecture/*.html` · `lecture/fonts/` 는 이 리포에도 모두 들어 있습니다. `lecture/*.pdf` 는 배포본이라 무시하지 않고 커밋합니다.

---


## 17. 이 주차의 실습 설계: 바꾸면 안 되는 구조
이번 주는 리소스를 많이 만드는 주차가 아닙니다. **같은 S3 버킷 두 개로 정반대의 상황을 하나씩 겪게 하는 것**이 설계의 전부입니다.

```
practice/ (루트 모듈 하나. 모듈로 나누지 않습니다)
 ├─ aws_s3_bucket.drift_demo                    코드가 먼저 -> 콘솔이 나중에 손을 댐  (Block A)
 ├─ aws_s3_bucket.manual                        콘솔이 먼저 -> 코드가 나중에 따라감    (Block B)
 ├─ aws_s3_bucket_versioning.manual             콘솔에서 켠 설정. 따로 import
 └─ aws_s3_bucket_public_access_block.manual    콘솔 기본값. 따로 import
```

아래 규칙들은 수업의 학습 목표와 직접 연결되므로 바꾸면 안 됩니다.

- **모듈로 나누지 않습니다.** week5 에서 모듈을 배웠지만 이번 주에 다시 모듈을 쓰면 `module.` 접두사 때문에 import 주소가 길어져서 초점이 흐려집니다. 모듈 안 리소스의 import 주소는 개념워크북에서 개념으로만 다루고 실습은 심화로 내립니다.
- **드리프트는 무과금 속성으로만 만듭니다.** 태그가 실험 대상입니다. 인스턴스 타입이나 볼륨 크기 같은 과금 속성을 콘솔에서 바꾸게 하는 실습은 넣지 않습니다.
- **`apply -refresh-only` 와 `apply` 를 반드시 둘 다 실행시킵니다.** 이 둘의 차이가 "코드 · state · 실물" 셋을 가르는 유일한 체감 지점입니다. 하나만 하면 state 와 실물이 별개라는 것이 드러나지 않습니다.
- **import 대상 리소스는 apply 로 만들지 않습니다.** TODO ③④ 를 적은 뒤 `plan` 이 `2 to add` 인 것을 보고 멈춘 다음 import 합니다. 여기서 apply 하면 "이미 있는 것을 코드로 편입한다"는 경험 자체가 사라집니다.
- **S3 부속 리소스를 최소 하나는 남겨둡니다.** `aws_s3_bucket` 하나만 import 하면 `plan` 이 곧바로 `No changes` 가 되어서, 고전 import 의 한계가 드러나지 않습니다. 버전 관리와 퍼블릭 접근 차단 두 개가 그 역할을 합니다.
- **`import` 블록과 `-generate-config-out` 은 7주차 것입니다.** 6주차에서는 존재만 알리고 실습하지 않습니다. 이번 주의 "손으로 옮겨 적는 노가다"가 7주차 자동화의 동기라서, 미리 보여주면 동기가 약해집니다.
- **destroy 를 반드시 시킵니다.** 빈 버킷은 요금이 없지만, 콘솔에서 만든 버킷도 import 하고 나면 Terraform 이 지운다는 것을 겪는 것이 이번 주 마무리입니다.

의도적으로 남겨둔 것이 하나 있습니다. `aws_s3_bucket.manual` 을 import 한 직후의 `plan` 이 `No changes` 로 나오는 것입니다. 학습자는 여기서 "다 됐다"고 착각하는데, 콘솔에서 켠 버전 관리는 코드 어디에도 없습니다. `No changes` 가 "코드가 실물을 다 담았다"는 뜻이 아니라는 것을 이 자리에서 짚습니다. 개념워크북 Part 3 과 실습워크북 B-3 이 이것을 다루므로, 코드를 고치려면 그 두 곳을 함께 고쳐야 합니다.

`practice/` 와 `solution/` 이 내용까지 다른 파일은 넷입니다. `main.tf` · `outputs.tf` · `backend.tf`(`CHANGE-ME` 대 예시 값) · `README.md`. `versions.tf` · `providers.tf` · `variables.tf` · `example.tfvars` 는 양쪽이 같아야 합니다.
