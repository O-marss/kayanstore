# نظام الحضور والانصراف — Remote Attendance System

## الملفات

| الملف | الوظيفة |
|-------|---------|
| `index.html` | صفحة الموظف: تسجيل حضور / انصراف / غياب |
| `admin.html` | لوحة المدير: عرض السجل + تصدير CSV |
| `supabase-setup.sql` | كود إنشاء قاعدة البيانات |

---

## خطوات الإعداد (15 دقيقة)

### الخطوة 1 — أنشئ حساب Supabase

1. روح على **https://supabase.com** واعمل حساب مجاني
2. اضغط **"New Project"**
3. اختار اسم للمشروع (مثلاً: `attendance`) وكلمة سر قوية
4. استنى دقيقة لحد ما يتعمل المشروع

---

### الخطوة 2 — إنشاء قاعدة البيانات

1. في Supabase، روح على **SQL Editor** من القائمة الجانبية
2. افتح ملف `supabase-setup.sql` وانسخ المحتوى كله
3. الصقه في الـ SQL Editor واضغط **"Run"**
4. هتشوف رسالة: `Success. No rows returned`

---

### الخطوة 3 — الحصول على بيانات الاتصال

1. في Supabase، روح على **Project Settings** (أيقونة التروس)
2. اختار **API** من القائمة
3. هتلاقي:
   - **Project URL** — نسخه
   - **anon / public key** — نسخه

---

### الخطوة 4 — تحديث الملفات

افتح **`index.html`** و **`admin.html`** وغيّر السطرين دول في كل ملف:

```javascript
const SUPABASE_URL = 'YOUR_SUPABASE_URL';       // ← ضع الـ Project URL هنا
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY'; // ← ضع الـ anon key هنا
```

مثال:
```javascript
const SUPABASE_URL = 'https://xyzxyz.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
```

---

### الخطوة 5 — رفع على Vercel

#### الطريقة السريعة (بدون GitHub):

1. روح على **https://vercel.com** واعمل حساب مجاني
2. اضغط **"Add New → Project"**
3. اختار **"Deploy without connecting to Git"**
4. ارفع الملفات الـ 3: `index.html`, `admin.html`, `supabase-setup.sql`
5. اضغط **Deploy**
6. Vercel هيديك رابط مثل: `https://your-project.vercel.app`

#### أو عن طريق GitHub (أفضل للتحديثات):

1. ارفع الملفات على GitHub repository جديد
2. في Vercel، اربطه بالـ repository
3. كل تحديث بتعمله على GitHub بيتنشر تلقائياً

---

## كيفية الاستخدام

### للموظفين:
- ابعتلهم رابط `index.html` (مثلاً: `https://your-project.vercel.app`)
- يفتحوا الرابط من الموبايل أو الكمبيوتر
- يكتبوا الاسم ويضغطوا الزر

### للمدير:
- افتح `https://your-project.vercel.app/admin.html`
- السجل بيتحدث **تلقائياً في real-time** لما أي موظف يسجل
- تقدر تفلتر بالتاريخ والحالة
- زر **"تصدير CSV"** بيحمّل ملف Excel-compatible

---

## المميزات

- ✅ Real-time updates (لما موظف يسجل، المدير يشوفه فوراً)
- ✅ تصدير CSV متوافق مع Excel
- ✅ فلترة بالتاريخ والحالة
- ✅ سجل الغياب مع الأسباب
- ✅ يشتغل على الموبايل
- ✅ مجاني تماماً (Supabase free tier + Vercel free tier)

---

## تطوير مستقبلي ممكن

- إضافة نظام login للموظفين
- إشعارات على Slack/WhatsApp لما موظف يتأخر
- تقارير أسبوعية/شهرية تلقائية
- حساب ساعات العمل الفعلية
