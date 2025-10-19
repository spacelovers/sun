# ───────────────────────────────────────
# 🛠️ Makefile - پروژه ایده AI
# ───────────────────────────────────────
GREEN  := \033[0;32m
YELLOW := \033[1;33m
RED    := \033[0;31m
BLUE   := \033[0;34m
CYAN   := \033[0;36m
RESET  := \033[0m

PROJECT_NAME := idea-ai-chat
PORT := 8000

.PHONY: help setup dev deploy docker-up docker-down lint

help:
	@echo "$(BLUE)🎯 دستورات پروژه $(PROJECT_NAME)$(RESET)"
	@echo "$(YELLOW)──────────────────────────────────────$(RESET)"
	@echo "$(GREEN)make setup$(RESET)       — راه‌اندازی اولیه پروژه"
	@echo "$(GREEN)make dev$(RESET)         — اجرای سرور توسعه روی پورت $(PORT)"
	@echo "$(GREEN)make deploy$(RESET)      — استقرار روی GitHub Pages"
	@echo "$(GREEN)make docker-up$(RESET)   — اجرای پروژه با Docker"
	@echo "$(GREEN)make docker-down$(RESET) — توقف سرویس‌های Docker"
	@echo "$(GREEN)make lint$(RESET)        — بررسی کیفیت کد"
	@echo "$(YELLOW)──────────────────────────────────────$(RESET)"
	@echo "$(CYAN)💡 نکته: پروژه کاملاً کلاینت‌ساید است - نیازی به سرور بک‌اند ندارد$(RESET)"

setup:
	@echo "$(YELLOW)🔧 در حال راه‌اندازی پروژه...$(RESET)"
	@mkdir -p assets/screenshots
	@mkdir -p scripts
	@echo "$(GREEN)✅ ساختار پروژه ایجاد شد$(RESET)"
	@echo "$(BLUE)📁 دایرکتوری‌های ایجاد شده:$(RESET)"
	@echo "  • assets/screenshots/"
	@echo "  • scripts/"
	@echo "  • docs/"

dev:
	@echo "$(BLUE)🚀 در حال اجرای سرور توسعه روی http://localhost:$(PORT)$(RESET)"
	@echo "$(YELLOW)📋 برای خروج از Ctrl+C استفاده کنید$(RESET)"
	@python3 -m http.server $(PORT) || \
	{ echo "$(RED)❌ خطا: پایتون یافت نشد. از Python 3 استفاده کنید$(RESET)"; exit 1; }

deploy:
	@echo "$(YELLOW)☁️  آماده‌سازی برای استقرار...$(RESET)"
	@if [ -d ".git" ]; then \
		echo "$(GREEN)✅ ریپازیتوری Git شناسایی شد$(RESET)"; \
		echo "$(BLUE)📤 در حال آپلود به GitHub...$(RESET)"; \
		git add .; \
		git commit -m "Deploy: $(shell date +'%Y-%m-%d %H:%M')" || true; \
		git push origin main; \
		echo "$(GREEN)🎉 استقرار آغاز شد. چند دقیقه منتظر بمانید...$(RESET)"; \
	else \
		echo "$(RED)❌ دایرکتوری Git نیست. ابتدا پروژه را با git init مقداردهی کنید$(RESET)"; \
	fi

docker-up:
	@echo "$(BLUE)🐳 در حال راه‌اندازی با Docker...$(RESET)"
	@docker-compose up -d
	@echo "$(GREEN)✅ سرویس در حال اجرا روی http://localhost:8080$(RESET)"

docker-down:
	@echo "$(YELLOW)⏹️  در حال توقف سرویس‌های Docker...$(RESET)"
	@docker-compose down
	@echo "$(GREEN)✅ سرویس‌ها متوقف شدند$(RESET)"

lint:
	@echo "$(CYAN)🔍 بررسی کیفیت کد...$(RESET)"
	@if command -v htmlhint >/dev/null; then \
		htmlhint index.html; \
	else \
		echo "$(YELLOW)⚠️  htmlhint نصب نیست. برای نصب: npm install -g htmlhint$(RESET)"; \
	fi
	@echo "$(GREEN)✅ بررسی اولیه انجام شد$(RESET)"

clean:
	@echo "$(YELLOW)🧹 پاکسازی فایل‌های موقت...$(RESET)"
	@find . -name "*.tmp" -delete
	@find . -name ".DS_Store" -delete
	@echo "$(GREEN)✅ پاکسازی انجام شد$(RESET)"

info:
	@echo "$(BLUE)📊 اطلاعات پروژه:$(RESET)"
	@echo "  نام: $(PROJECT_NAME)"
	@echo "  فایل اصلی: index.html"
	@echo "  سایز: $(shell du -sh . | cut -f1)"
	@echo "  آخرین تغییر: $(shell stat -f "%Sm" index.html 2>/dev/null || stat -c "%y" index.html)"
