CREATE DATABASE IF NOT EXISTS airline_db;
USE airline_db;

-- Parent table storing base passenger details
CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    current_location VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    travel_date VARCHAR(50) NOT NULL
);

-- Child table storing class tier and tier-specific perks
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT NOT NULL,
    class_tier VARCHAR(20) NOT NULL,
    seat_preference VARCHAR(50) DEFAULT NULL,
    lounge_pass_code VARCHAR(50) DEFAULT NULL,
    suite_number VARCHAR(20) DEFAULT NULL,
    chauffeur_service BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
);