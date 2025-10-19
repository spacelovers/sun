#!/bin/bash

# اسکریپت استقرار خودکار برای ایده AI
set -e

echo "🚀 شروع فرآیند استقرار ایده AI"

# بررسی وجود فایل اصلی
if [ ! -f "index.html" ]; then
    echo "❌ فایل index.html یافت نشد"
    exit 1
fi

# بررسی وجود git
if [ ! -d ".git" ]; then
    echo "❌ دایرکتوری Git یافت نشد. ابتدا با git init مقداردهی کنید"
    exit 1
fi

# افزودن تغییرات
git add .

# Commit تغییرات
git commit -m "Deploy: $(date +'%Y-%m-%d %H:%M:%S')" || true

# Push به ریپازیتوری
git push origin main

echo "✅ استقرار با موفقیت انجام شد"
echo "🌐 چند دقیقه دیگر در GitHub Pages قابل دسترسی خواهد بود"
