-- =============================================
-- نظام الحضور والانصراف - Supabase Setup
-- شغّل الكود ده في Supabase SQL Editor
-- =============================================

-- جدول سجلات الحضور
CREATE TABLE attendance (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  employee_name TEXT NOT NULL,
  action TEXT NOT NULL CHECK (action IN ('حضور', 'انصراف', 'غياب')),
  note TEXT,
  recorded_at TIMESTAMPTZ DEFAULT now(),
  date DATE DEFAULT CURRENT_DATE
);

-- فعّل Row Level Security
ALTER TABLE attendance ENABLE ROW LEVEL SECURITY;

-- سماح للكل بالقراءة والكتابة (تقدر تقيّده بعدين)
CREATE POLICY "allow_all" ON attendance FOR ALL USING (true) WITH CHECK (true);

-- index عشان البحث بالتاريخ يكون سريع
CREATE INDEX idx_attendance_date ON attendance(date);
CREATE INDEX idx_attendance_name ON attendance(employee_name);

-- View مفيد للمدير: آخر حالة لكل موظف النهارده
CREATE VIEW today_summary AS
SELECT DISTINCT ON (employee_name)
  employee_name,
  action,
  note,
  recorded_at
FROM attendance
WHERE date = CURRENT_DATE
ORDER BY employee_name, recorded_at DESC;
