#!/bin/sh
# src.html(래퍼 없는 원본)에 doctype/head/body를 씌워 index.html을 만든다
cd "$(dirname "$0")" || exit 1
{
  printf '<!doctype html>\n<html lang="ko">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  sed -n '1,/^<\/style>/p' src.html
  printf '</head>\n<body>\n'
  sed -n '/^<\/style>/,$p' src.html | tail -n +2
  printf '</body>\n</html>\n'
} > index.html
echo "index.html 생성 완료"
