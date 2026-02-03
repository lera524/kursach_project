DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema = 'public' AND table_name = 'operations' AND column_name = 'original_operation_id') THEN
    ALTER TABLE operations ADD COLUMN original_operation_id INTEGER REFERENCES operations(id_operation);
  END IF;
END $$;

CREATE INDEX IF NOT EXISTS idx_operations_original ON operations(original_operation_id);
