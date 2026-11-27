-- V2: Add migration_status column to Phase 1 test table

ALTER TABLE public.poc_phase1_test
ADD COLUMN migration_status VARCHAR(20) NOT NULL DEFAULT 'pending';