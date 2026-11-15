CREATE DATABASE airline_db;
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


INSERT INTO passengers (passenger_id, name, current_location, destination, travel_date) VALUES
(1, 'Farah Ibrahim', 'Kigali', 'Nairobi', '2026-12-01'),
(2, 'Ntwali O. Axel', 'Kigali', 'London', '2026-12-05'),
(3, 'Yvan Mugisha', 'Kigali', 'Dubai', '2026-12-10'),
(4, 'Rwanda Bruno', 'Kigali', 'New York', '2026-12-15');


INSERT INTO bookings (booking_id, passenger_id, class_tier, seat_preference, lounge_pass_code, suite_number, chauffeur_service) VALUES
(101, 1, 'Economy', 'Window', 'EC-001', NULL, FALSE),
(102, 2, 'Business', 'Aisle', 'VIP-9942', NULL, FALSE),
(103, 3, 'First', NULL, NULL, '1A', TRUE),
(105, 4, 'Economy', 'Aisle', 'EC-002', NULL, FALSE);

-- Bruno Rwanda
SELECT 
    p.name AS Passenger_Name,
    p.destination AS Destination,
    b.class_tier AS Tier,
    b.seat_preference AS Seat_Preference,
    b.lounge_pass_code AS Lounge_Pass,
    b.suite_number AS Suite_Number,
    b.chauffeur_service AS Chauffeur_Service
FROM passengers p
INNER JOIN bookings b ON p.passenger_id = b.passenger_id;

-- Update destination in the passengers table
UPDATE passengers
SET destination = 'Entebbe'
WHERE passenger_id = 1;

-- Update seat_preference in the bookings table
UPDATE bookings
SET seat_preference = 'Aisle'
WHERE passenger_id = 1;



-- Delete from child table first to respect FOREIGN KEY (passenger_id)
DELETE FROM bookings
WHERE passenger_id = 1;
