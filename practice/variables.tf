variable "region" {
  type    = string
  default = "ap-northeast-2"
}

# S3 버킷 이름은 AWS 계정 전체가 아니라 전 세계에서 유일해야 합니다.
# 그래서 project_name 에 본인 github id 를 넣습니다. 예: boaz26-w6-kdh1834
variable "project_name" {
  type = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]{1,40}[a-z0-9]$", var.project_name))
    error_message = "S3 버킷 이름 규칙입니다. 소문자 · 숫자 · 하이픈만 쓸 수 있습니다."
  }
}
