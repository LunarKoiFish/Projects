DO $$ 
DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') LOOP
        EXECUTE 'DROP TABLE IF EXISTS public.' || quote_ident(r.tablename) || ' CASCADE';
    END LOOP;
END $$;

Create table Hospital_General_Info (
	facility_id TEXT,
    facility_name TEXT,
    address TEXT,
    city_town TEXT,
    state TEXT,
    zip_code INTEGER,
    county_parish TEXT,
    telephone_number TEXT,
    hospital_type TEXT,
    hospital_ownership TEXT,
    emergency_services BOOLEAN,
    birthing_friendly BOOLEAN,
    hospital_overall_rating INTEGER,
    count_of_facility_mort_measures INTEGER,
    count_of_mort_measures_better INTEGER,
    count_of_mort_measures_no_different INTEGER,
    count_of_mort_measures_worse INTEGER,
    count_of_facility_safety_measures INTEGER,
    count_of_safety_measures_better INTEGER,
    count_of_safety_measures_no_different INTEGER,
    count_of_safety_measures_worse INTEGER,
    count_of_facility_readm_measures INTEGER,
    count_of_readm_measures_better INTEGER,
    count_of_readm_measures_no_different INTEGER,
    count_of_readm_measures_worse INTEGER,
    count_of_facility_pt_exp_measures INTEGER,
    count_of_facility_te_measures INTEGER
);