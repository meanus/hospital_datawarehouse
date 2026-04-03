-- ===============================================================
-- Stored Procedure: Load Bronze Layer (Source -> Bronze)
-- PostgreSQL Version
-- ===============================================================

CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE
    start_time TIMESTAMP;
    end_time TIMESTAMP;
    batch_start_time TIMESTAMP;
    batch_end_time TIMESTAMP;
BEGIN

    batch_start_time := clock_timestamp();

    RAISE NOTICE '===============================================';
    RAISE NOTICE 'Loading Bronze Layer';
    RAISE NOTICE '===============================================';

    ------------------------------------------------
    -- Loading Tables
    ------------------------------------------------
    RAISE NOTICE 'Loading Tables';

	------------------------------------------------



	start_time := clock_timestamp();

    RAISE NOTICE 'Truncating Table: bronze_billing';
    TRUNCATE TABLE bronze_billing;

    RAISE NOTICE 'Inserting Data Into: bronze_billing';
    COPY bronze_billing
    FROM '/var/lib/postgresql/csv/billing.csv'
	DELIMITER ','
	CSV HEADER;

    end_time := clock_timestamp();
    RAISE NOTICE 'Load Duration: % seconds',
        EXTRACT(EPOCH FROM (end_time - start_time));


	
	------------------------------------------------

	start_time := clock_timestamp();

    RAISE NOTICE 'Truncating Table: bronze_treatments';
    TRUNCATE TABLE bronze_treatments;

    RAISE NOTICE 'Inserting Data Into: bronze_treatments';
    COPY bronze_treatments
    FROM '/var/lib/postgresql/csv/treatments.csv'
	DELIMITER ','
	CSV HEADER;

    end_time := clock_timestamp();
    RAISE NOTICE 'Load Duration: % seconds',
        EXTRACT(EPOCH FROM (end_time - start_time));

	------------------------------------------------
	
	start_time := clock_timestamp();

    RAISE NOTICE 'Truncating Table: bronze_appointments';
    TRUNCATE TABLE bronze_appointments;

    RAISE NOTICE 'Inserting Data Into: bronze_appointments';
    COPY bronze_appointments
    FROM '/var/lib/postgresql/csv/appointments.csv'
	DELIMITER ','
	CSV HEADER;

    end_time := clock_timestamp();
    RAISE NOTICE 'Load Duration: % seconds',
        EXTRACT(EPOCH FROM (end_time - start_time));

	------------------------------------------------
	
    start_time := clock_timestamp();

    RAISE NOTICE 'Truncating Table: bronze_patients';
    TRUNCATE TABLE bronze_patients;

	RAISE NOTICE 'Inserting Data Into: bronze_patients';
	COPY bronze_patients
	FROM '/var/lib/postgresql/csv/patients.csv'
	DELIMITER ','
	CSV HEADER;

    end_time := clock_timestamp();
    RAISE NOTICE 'Load Duration: % seconds',
        EXTRACT(EPOCH FROM (end_time - start_time));

    ------------------------------------------------
	
	start_time := clock_timestamp();

    RAISE NOTICE 'Truncating Table: bronze_doctors';
    TRUNCATE TABLE bronze_doctors;

    RAISE NOTICE 'Inserting Data Into: bronze_doctors';
    COPY bronze_doctors
    FROM '/var/lib/postgresql/csv/doctors.csv'
	DELIMITER ','
	CSV HEADER;

    end_time := clock_timestamp();
    RAISE NOTICE 'Load Duration: % seconds',
        EXTRACT(EPOCH FROM (end_time - start_time));






	
	
    RAISE NOTICE '===============================================';
    RAISE NOTICE 'Bronze Layer Loading Completed';
    RAISE NOTICE 'Total Duration: % seconds',
        EXTRACT(EPOCH FROM (batch_end_time - batch_start_time));
    RAISE NOTICE '===============================================';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'ERROR OCCURRED DURING BRONZE LOAD';
        RAISE NOTICE '%', SQLERRM;
	

end;
$$;

CALL bronze.load_bronze();



