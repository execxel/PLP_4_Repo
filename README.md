# Airline Booking Database (SQL)

A relational database implementation translating an Object-Oriented passenger booking system into normalized SQL tables (`passengers` and `bookings`) with full CRUD and `JOIN` operations.

## Database Architecture
* **`passengers` (Parent Table):** Stores core passenger details (`passenger_id` [PK], `name`, `current_location`, `destination`, `travel_date`).
* **`bookings` (Child Table):** Stores ticket tiers and class-specific perks (`booking_id` [PK], `passenger_id` [FK], `class_tier`, `seat_preference`, `lounge_pass_code`, `suite_number`, `chauffeur_service`).

## Script Breakdown
All 6 database operations are consolidated into a single executable SQL script:
1. **Schema Setup (DDL):** Drops any existing `airline_db` instance, creates a fresh database, and defines `passengers` and `bookings` with Primary and Foreign Key constraints.
2. **Seed Data (DML):** Inserts 3 sample passengers covering **Economy**, **Business**, and **First Class**.
3. **Read / Extract:** Filters and retrieves passengers booked in **Business** or **First Class**.
4. **Join / Combine:** Executes an `INNER JOIN` between `passengers` and `bookings` to generate complete ticket receipts with tier-specific perks.
5. **Update:** Modifies `destination` and `seat_preference` for a specific passenger by ID (`passenger_id = 1`).
6. **Delete:** Safely removes a passenger's booking record from the child table (`bookings`) without violating Foreign Key constraints.

---

## How to Run Locally

### 1. Clone or Pull the Repository
If cloning for the first time:
```bash
git clone https://github.com/execxel/PLP_4_Repo.git
cd PLP_4_REPO
