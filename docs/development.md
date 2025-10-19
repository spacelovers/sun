# مستندات توسعه - ایده AI

## 🏗️ ساختار پروژه

```
idea-ai-chat/
├── index.html          # رابط اصلی کاربری
├── README.md           # مستندات پروژه
├── Makefile            # اتوماسیون وظایف
├── package.json        # پیکربندی npm
├── docker-compose.yml  # کانتینری‌سازی
├── scripts/            # اسکریپت‌های کمکی
└── docs/               # مستندات فنی
```

## 🎨 معماری رابط کاربری

### تم‌های رنگی
- `theme-dark` - تم تیره پیش‌فرض
- `theme-light` - تم روشن
- `theme-colorful-blue` - تم آبی
- `theme-colorful-green` - تم سبز
- `theme-colorful-purple` - تم بنفش

### کامپوننت‌های اصلی
1. **Header** - لوگو، انتخاب مدل، تنظیمات تم
2. **Side Panel** - تاریخچه چت، مخاطبین، تنظیمات
3. **Chat Area** - نمایش پیام‌ها
4. **Input Area** - ورود پیام، فایل، ایموجی
5. **Training Modal** - آموزش مدل AI

## 🔧 توسعه و گسترش

### افزودن مدل جدید
```javascript
// اضافه کردن به AI_SELECTOR در index.html
const newModel = {
    id: 'new-model',
    name: 'مدل جدید',
    description: 'توضیحات مدل'
};
```

### افزودن تم جدید
```css
[data-theme="new-theme"] {
    --primary-color: #your-color;
    --bg-primary: #your-bg-color;
}
```

## 📱 Responsive Design

- **دسکتاپ**: > 768px - پنل کناری نمایش داده می‌شود
- **موبایل**: < 768px - پنل کناری به صورت مدال نمایش داده می‌شود
