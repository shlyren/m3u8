#!/usr/bin/env bash
# Linux platform bash file

echo -n "正在提交..."
git add .
git commit -m "update: "$(date +%F\ %T)
git push