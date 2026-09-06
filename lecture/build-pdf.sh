#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# build-pdf.sh: lecture/*.md 를 워크북 PDF 로 뽑습니다. (week1~week4 와 같은 방식)
#
#   markdown  --(python-markdown)-->  HTML + style.css  --(Headless Chrome)-->  PDF
#
# 필요한 것:
#   - python3 + `pip3 install markdown`
#   - Google Chrome (/Applications/Google Chrome.app)
#   - 폰트: Pretendard (본문) / Menlo (코드). 없으면 시스템 폰트로 대체됩니다.
#
# 사용법:
#   ./lecture/build-pdf.sh              # lecture/*.md 전부 (개념워크북 · 실습워크북)
#   ./lecture/build-pdf.sh 개념워크북    # 하나만
#
# ★ .md 를 고쳤으면 반드시 다시 돌려 PDF 를 맞춰주세요.
# ---------------------------------------------------------------------------
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
[ -x "$CHROME" ] || { echo "Google Chrome 을 찾을 수 없습니다: $CHROME"; exit 1; }
python3 -c "import markdown" 2>/dev/null || { echo "pip3 install markdown 이 필요합니다."; exit 1; }

TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# --- markdown -> html ------------------------------------------------------
cat > "$TMP/md2html.py" <<'PYEOF'
import re, sys, pathlib, unicodedata, html as html_mod, markdown

# GitHub alert 문법(> [!NOTE] 등)을 python-markdown 이 모르므로 미리 div 로 바꿉니다.
LABELS = {
    "NOTE":      ("note",      "📌 참고"),
    "TIP":       ("tip",       "💡 팁"),
    "IMPORTANT": ("important", "❗ 꼭 기억"),
    "WARNING":   ("warning",   "⚠️ 주의"),
    "CAUTION":   ("caution",   "🚫 절대 금지"),
}
ALERT_RE = re.compile(r"^>\s*\[!(NOTE|TIP|IMPORTANT|WARNING|CAUTION)\]\s*$")

def convert_alerts(text):
    out, lines, i = [], text.split("\n"), 0
    while i < len(lines):
        m = ALERT_RE.match(lines[i])
        if not m:
            out.append(lines[i]); i += 1; continue
        kind, label = LABELS[m.group(1)]
        i += 1
        body = []
        while i < len(lines) and (lines[i].startswith(">") or lines[i].strip() == ">"):
            body.append(re.sub(r"^>\s?", "", lines[i])); i += 1
        out += ['<div class="alert %s" markdown="1">' % kind,
                '<p class="alert-title">%s</p>' % label, ""]
        out += body
        out += ["", "</div>", ""]
    return "\n".join(out)

# 언어 태그가 없는 코드펜스(ASCII 다이어그램·CLI 출력)는 왼쪽에 보라색 띠를 줍니다.
def mark_plain_fences(html):
    return re.sub(r"<pre><code>(?!<)", '<pre class="plain"><code>', html)

# A4 본문 폭에 들어가는 고정폭 글자 수(style.css 의 pre 폰트 크기 기준).
FIT_COLS, BASE_PT = 96, 8.3

def dwidth(s):
    return sum(2 if unicodedata.east_asian_width(c) in "WF" else 1 for c in s)

# 폭이 넘치는 블록은 잘려나가므로(overflow:hidden) 그 블록만 폰트를 줄여 맞춥니다.
# 워크북을 고치다 긴 줄이 생겨도 조용히 잘리지 않게 막아줍니다.
def shrink_wide_blocks(html):
    def fix(m):
        head, code = m.group(1), m.group(2)
        plain = html_mod.unescape(re.sub(r"<[^>]+>", "", code))
        w = max((dwidth(l) for l in plain.split("\n")), default=0)
        if w <= FIT_COLS:
            return m.group(0)
        pt = round(BASE_PT * FIT_COLS / w, 2)
        sys.stderr.write(f"    · 넓은 블록({w}칸) -> {pt}pt 로 축소\n")
        return f'{head[:-1]} style="font-size:{pt}pt"><code>{code}</code></pre>'
    return re.sub(r"(<pre[^>]*>)<code[^>]*>(.*?)</code></pre>", fix, html, flags=re.S)

src = pathlib.Path(sys.argv[1]).read_text(encoding="utf-8")
title = next((l[2:].strip() for l in src.split("\n") if l.startswith("# ")), sys.argv[1])

body = markdown.markdown(
    convert_alerts(src),
    extensions=["tables", "fenced_code", "sane_lists", "attr_list", "md_in_html"],
)
body = mark_plain_fences(body)
body = shrink_wide_blocks(body)

css = pathlib.Path(sys.argv[3]).read_text(encoding="utf-8")
pathlib.Path(sys.argv[2]).write_text(
    "<!doctype html>\n<html lang=\"ko\"><head><meta charset=\"utf-8\">\n"
    f"<title>{title}</title>\n<style>\n{css}\n</style>\n</head>\n"
    f"<body><main>{body}</main></body></html>\n",
    encoding="utf-8",
)
PYEOF

TARGETS=()
if [ "$#" -gt 0 ]; then
  for n in "$@"; do TARGETS+=("$HERE/${n%.md}.md"); done
else
  for f in "$HERE"/*.md; do TARGETS+=("$f"); done
fi

for MD in "${TARGETS[@]}"; do
  [ -f "$MD" ] || { echo "건너뜀 (없음): $MD"; continue; }
  BASE="$(basename "$MD" .md)"
  HTML="$TMP/$BASE.html"
  PDF="$HERE/$BASE.pdf"

  python3 "$TMP/md2html.py" "$MD" "$HTML" "$HERE/style.css"

  "$CHROME" --headless --disable-gpu --no-sandbox \
    --no-pdf-header-footer \
    --virtual-time-budget=20000 \
    --print-to-pdf="$PDF" \
    "file://$HTML" >/dev/null 2>&1

  printf '  %-14s -> %s (%s)\n' "$BASE.md" "$(basename "$PDF")" \
    "$(du -h "$PDF" | cut -f1 | tr -d ' ')"
done

echo "완료."
