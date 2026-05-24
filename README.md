# MEC Student Voice Platform

موقع منصة شكاوى ومقترحات طلاب Middle East College.

---

## الملفات

```
mec-student-voice/
├── index.html          ← الموقع الكامل
├── supabase_setup.sql  ← كود إنشاء قاعدة البيانات
└── README.md
```

---

## خطوات الإعداد

### 1. إنشاء مشروع Supabase

1. روح على [supabase.com](https://supabase.com) وسجّل
2. اضغط **New Project**
3. اختر اسم واختر كلمة سر قوية
4. انتظر دقيقة للإنشاء

### 2. إنشاء قاعدة البيانات

1. من القائمة اليسار اختر **SQL Editor**
2. انسخ كل محتوى `supabase_setup.sql`
3. الصقه واضغط **Run**

### 3. الحصول على مفاتيح API

1. من القائمة اختر **Project Settings > API**
2. انسخ:
   - **Project URL** → مثال: `https://xxxx.supabase.co`
   - **anon public key** → مفتاح طويل يبدأ بـ `eyJ...`

### 4. إضافة المفاتيح للموقع

افتح `index.html` وابحث عن هذين السطرين وعدّلهم:

```javascript
const SUPABASE_URL = 'YOUR_SUPABASE_URL';       // ← ضع رابط مشروعك
const SUPABASE_KEY = 'YOUR_SUPABASE_ANON_KEY';  // ← ضع مفتاح anon
```

### 5. رفع على GitHub

```bash
git init
git add .
git commit -m "MEC Student Voice Platform"
git remote add origin https://github.com/USERNAME/REPO_NAME.git
git push -u origin main
```

### 6. تفعيل GitHub Pages

1. **Settings** → **Pages**
2. Source: **main branch**
3. الموقع يصبح متاح على: `https://USERNAME.github.io/REPO_NAME`

---

## بيانات الأدمن الافتراضية

| Student ID | PIN  |
|------------|------|
| 23f24545   | 1111 |
| 23f24343   | 2222 |
| 23f24557   | 3333 |
| 23f24261   | 4444 |
| 12a34567   | 5555 |

---

## التقنيات المستخدمة

- **Frontend**: HTML, CSS, JavaScript
- **Database**: Supabase (PostgreSQL)
- **Hosting**: GitHub Pages
