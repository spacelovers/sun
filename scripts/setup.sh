#!/bin/bash

# اسکریپت راه‌اندازی پروژه ایده AI
set -e

echo "🔧 راه‌اندازی پروژه ایده AI"

# ایجاد دایرکتوری‌های لازم
mkdir -p assets/screenshots
mkdir -p scripts
mkdir -p docs

# دادن مجوز اجرا به اسکریپت‌ها
chmod +x scripts/*.sh 2>/dev/null || true

echo "✅ راه‌اندازی با موفقیت انجام شد"
echo "📁 ساختار ایجاد شده:"
echo "  ├── assets/screenshots/"
echo "  ├── scripts/"
echo "  └── docs/"
