-- =====================================================
-- MEC Student Voice Platform - Supabase Setup
-- شغّل هذا الكود في Supabase > SQL Editor
-- =====================================================

-- 1. إنشاء جدول التقارير الرئيسي
CREATE TABLE mec_reports (
  id            TEXT PRIMARY KEY,
  college_id    TEXT NOT NULL,
  building_name TEXT NOT NULL,
  service       TEXT NOT NULL,
  root_cause    TEXT NOT NULL,
  details       TEXT NOT NULL,
  type          TEXT NOT NULL CHECK (type IN ('complaint', 'suggestion')),
  status        TEXT NOT NULL DEFAULT 'New' CHECK (status IN ('New', 'In Progress', 'Resolved')),
  priority      TEXT NOT NULL DEFAULT 'Low' CHECK (priority IN ('Low', 'Normal', 'Urgent')),
  employee      TEXT,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 2. إنشاء جدول اللوقات (سجل العمليات)
CREATE TABLE mec_logs (
  id         BIGSERIAL PRIMARY KEY,
  user_id    TEXT,
  action     TEXT NOT NULL,
  extra      TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 3. Row Level Security - السماح بالقراءة والكتابة للجميع (للطلاب)
ALTER TABLE mec_reports ENABLE ROW LEVEL SECURITY;
ALTER TABLE mec_logs    ENABLE ROW LEVEL SECURITY;

-- السماح لأي شخص بإضافة تقرير جديد (الطلاب)
CREATE POLICY "Students can insert reports"
  ON mec_reports FOR INSERT
  WITH CHECK (true);

-- السماح للجميع بقراءة التقارير (للداشبورد)
-- ملاحظة: في الإنتاج يمكن تقييد هذا للأدمن فقط
CREATE POLICY "Anyone can read reports"
  ON mec_reports FOR SELECT
  USING (true);

-- السماح بتحديث الحالة (للأدمن)
CREATE POLICY "Anyone can update status"
  ON mec_reports FOR UPDATE
  USING (true);

-- السماح بإضافة لوقات
CREATE POLICY "Allow insert logs"
  ON mec_logs FOR INSERT
  WITH CHECK (true);

-- 4. Index للأداء
CREATE INDEX idx_mec_reports_status     ON mec_reports (status);
CREATE INDEX idx_mec_reports_type       ON mec_reports (type);
CREATE INDEX idx_mec_reports_created_at ON mec_reports (created_at DESC);

-- =====================================================
-- تحقق: شوف الجداول
-- =====================================================
SELECT table_name FROM information_schema.tables
WHERE table_schema = 'public';
