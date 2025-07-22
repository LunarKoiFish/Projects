-- All Hospital(registered with Medicare) General Information
select * from hospital_general_info;

-- Hospital General Information
Select facility_id, 
	facility_name, 
	address, 
	city_town as city, 
	state, 
	zip_code, 
	county_parish, 
	telephone_number 
from hospital_general_info;

-- Hospitals that have emergency services and meets criteria to be birthing friendly designation
select facility_name, birthing_friendly, emergency_services
from hospital_general_info
where hospital_general_info.birthing_friendly is TRUE and hospital_general_info.emergency_services is TRUE

-- Top 10 Hospitals registered with Medicare in the United States (Based on Rating and good performance in mortility, safety, and readmission)
SELECT facility_name, state, hospital_overall_rating, count_of_mort_measures_better, count_of_safety_measures_better, count_of_readm_measures_better
FROM hospital_general_info
WHERE hospital_overall_rating IS NOT NULL and count_of_mort_measures_better > 0 and count_of_safety_measures_better > 0 and count_of_readm_measures_better > 0
ORDER BY hospital_overall_rating DESC, count_of_mort_measures_better DESC, count_of_safety_measures_better DESC, count_of_readm_measures_better DESC
LIMIT 10; 

-- Bottom 10 Hospitals registered with Medicare in the United States (Based on Rating and poor performance in mortility, safety, and readmission)
SELECT facility_name, state, hospital_overall_rating, count_of_mort_measures_worse, count_of_safety_measures_worse, count_of_readm_measures_worse
FROM hospital_general_info
WHERE hospital_overall_rating IS NOT NULL and count_of_mort_measures_worse > 0 and count_of_safety_measures_worse > 0 and count_of_readm_measures_worse > 0
ORDER BY hospital_overall_rating ASC, count_of_mort_measures_worse DESC, count_of_safety_measures_worse DESC, count_of_readm_measures_worse DESC
LIMIT 100; 

-- Average rating of Hospitals by state (Including Washington DC and US Territories)
SELECT state, Round(AVG(hospital_overall_rating), 2) AS avg_rating
FROM hospital_general_info
GROUP BY state
HAVING AVG(hospital_overall_rating) IS NOT NULL
ORDER BY avg_rating DESC;

-- Number of Hospitals  by State (Including Washington DC and US Territories)
SELECT state, COUNT(*) AS num_hospitals
FROM hospital_general_info
GROUP BY state
ORDER BY num_hospitals DESC;

-- Percentage of Measures that are considered "Better" than the national average
SELECT facility_name,
       ROUND(count_of_mort_measures_better::decimal / NULLIF(count_of_facility_mort_measures, 0) * 100, 1) AS pct_mort_better,
       ROUND(count_of_readm_measures_better::decimal / NULLIF(count_of_facility_readm_measures, 0) * 100, 1) AS pct_readm_better,
       ROUND(count_of_safety_measures_better::decimal / NULLIF(count_of_facility_safety_measures, 0) * 100, 1) AS pct_safety_better
FROM hospital_general_info
WHERE count_of_facility_mort_measures > 0
ORDER BY pct_mort_better DESC, pct_readm_better DESC, pct_safety_better DESC
LIMIT 20;







