# Normal vs Abnormal results
SELECT t.test_name,
COUNT(*) AS total,
SUM(CASE 
    WHEN r.result_value < t.normal_min OR r.result_value > t.normal_max 
    THEN 1 ELSE 0 END) AS abnormal_count
FROM results r
JOIN tests t ON r.test_id = t.test_id
GROUP BY t.test_name;

# Average Result by Age Group
SELECT 
CASE 
    WHEN age < 40 THEN 'Below 40'
    ELSE 'Above 40'
END AS age_group,
AVG(result_value) AS avg_result
FROM results r
JOIN patients p ON r.patient_id = p.patient_id
GROUP BY age_group;

# Patients with High Cholesterol

SELECT p.name, t.test_name, r.result_value,
CASE 
    WHEN r.result_value < t.normal_min THEN 'Low'
    WHEN r.result_value > t.normal_max THEN 'High'
    ELSE 'Normal'
END AS status
FROM results r
JOIN patients p ON r.patient_id = p.patient_id
JOIN tests t ON r.test_id = t.test_id;

# Common test
SELECT p.name, r.result_value
FROM results r
JOIN patients p ON r.patient_id = p.patient_id
WHERE test_id = 102 AND result_value > 200;