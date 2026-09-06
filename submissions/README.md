# 제출 폴더

본인 GitHub ID 로 폴더를 만들어 그 안에만 파일을 두세요. `practice/` 를 직접 고쳐서
올리면 머지되는 순간 다음 사람이 풀 `# TODO` 가 사라집니다.

```
submissions/
 └─ {github-id}/
     ├─ main.tf · outputs.tf · backend.tf · variables.tf · versions.tf · providers.tf
     ├─ example.tfvars          (값은 채우지 않은 상태)
     ├─ state-list.txt          (마스킹 완료)
     ├─ plan-drift.txt          (드리프트 감지 plan diff. 마스킹 완료)
     └─ observations.md         (관찰 기록 답안)
```

넣지 말 것은 `terraform.tfvars` · `*.tfstate` · `.terraform/` · `.pem` 파일과
계정번호 12자리 · 공인 IP 입니다. 마스킹 명령은 실습워크북 C-3 에 있습니다.
