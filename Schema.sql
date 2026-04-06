CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(50),
    gender VARCHAR(10),
    age INT
);

CREATE TABLE tests (
    test_id INT PRIMARY KEY,
    test_name VARCHAR(50),
    normal_min DECIMAL(5,2),
    normal_max DECIMAL(5,2)
);


CREATE TABLE results (
    result_id INT PRIMARY KEY,
    patient_id INT,
    test_id INT,
    result_value DECIMAL(5,2),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (test_id) REFERENCES tests(test_id)
);