


/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
This script creates tables in the 'bronze' schema, dropping existing tables
if they already exist.
===============================================================================
*/

CREATE SCHEMA IF NOT EXISTS bronze;

DROP TABLE IF EXISTS bronze_billing CASCADE;
DROP TABLE IF EXISTS bronze_treatments CASCADE;
DROP TABLE IF EXISTS bronze_appointments CASCADE;
DROP TABLE IF EXISTS bronze_doctors CASCADE;
DROP TABLE IF EXISTS bronze_patients CASCADE;


CREATE TABLE bronze_patients (
    patient_id text PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    date_of_birth DATE,
    contact_number VARCHAR(20),
    address TEXT,
    registration_date DATE,
    insurance_provider VARCHAR(100),
    insurance_number VARCHAR(50),
    email VARCHAR(100)
);


CREATE TABLE bronze_doctors (
    doctor_id text PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100),
    phone_number VARCHAR(20),
    years_experience INT,
    hospital_branch VARCHAR(100),
    email VARCHAR(100)
);


CREATE TABLE bronze_appointments (
    appointment_id text PRIMARY KEY,
    patient_id text,
    doctor_id text,
    appointment_date DATE,
    appointment_time TIME,
    reason_for_visit TEXT,
    status VARCHAR(20)


);


CREATE TABLE bronze_treatments (
    treatment_id text PRIMARY KEY,
    appointment_id text,
    treatment_type VARCHAR(100),
    description TEXT,
    cost DECIMAL(10,2),
    treatment_date DATE

 
);


CREATE TABLE bronze_billing (
    bill_id text PRIMARY KEY,
    patient_id text,
    treatment_id text,
    bill_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    payment_status VARCHAR(20)

);
