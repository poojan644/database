DO $$
BEGIN

    -- Verify that the migration created the table
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_schema = 'public'
          AND table_name = 'poc_phase1_test'
    ) THEN
        RAISE EXCEPTION 'Migration test failed: table not found';
    END IF;

    -- Verify test_name exists and is NOT NULL
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'public'
          AND table_name = 'poc_phase1_test'
          AND column_name = 'test_name'
          AND is_nullable = 'NO'
    ) THEN
        RAISE EXCEPTION 'Migration test failed: test_name column missing or nullable';
    END IF;

    -- Verify id column exists
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'public'
          AND table_name = 'poc_phase1_test'
          AND column_name = 'id'
    ) THEN
        RAISE EXCEPTION 'Migration test failed: id column missing';
    END IF;

    -- Verify migration_status exists and is NOT NULL
    IF NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_schema = 'public'
          AND table_name = 'poc_phase1_test'
          AND column_name = 'migration_status'
          AND is_nullable = 'NO'
    ) THEN
        RAISE EXCEPTION 'Migration test failed: migration_status column missing or nullable';
    END IF;

    RAISE NOTICE 'Phase 1 migration tests passed!';

END $$;
