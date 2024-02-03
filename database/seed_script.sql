INSERT INTO students (phone, year, section, attendance_frequency, created_at, updated_at)
VALUES
('011' || LPAD(FLOOR(RANDOM() * 99999999)::TEXT, 8, '0'), 4, 'A', 'weekly', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('012' || LPAD(FLOOR(RANDOM() * 99999999)::TEXT, 8, '0'), 5, 'B', 'biweekly', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('010' || LPAD(FLOOR(RANDOM() * 99999999)::TEXT, 8, '0'), 4, 'A', 'weekly', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('011' || LPAD(FLOOR(RANDOM() * 99999999)::TEXT, 8, '0'), 5, 'C', 'biweekly', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

---------------------------------------------------------------------------------------

INSERT INTO clinics (clinic_name, dentist_name, address, phone, created_at, updated_at)
VALUES
('Dental Care Center', 'Dr. Mohsen', '1234 Maple St, Anytown', '011' || LPAD(FLOOR(RANDOM() * 99999999)::TEXT, 8, '0'), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Smile Bright Clinic', 'Dr. Asfor', '5678 Oak Ave, Anytown', '012' || LPAD(FLOOR(RANDOM() * 99999999)::TEXT, 8, '0'), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

---------------------------------------------------------------------------------------

INSERT INTO student_orders (student_id, order_name, order_type, order_date, shelf, delivery_date, payment_amount, deposit, order_status, created_at, updated_at)
VALUES
(1, 'U/L BITE', 'Prosthesis', '2023-09-01', 'Shelf A', '2023-09-05', 200.00, 20.00, 'Delivered', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'SP TRAY U/L + U/L BITE', 'Crown', '2023-09-02', 'Shelf B', '2023-09-06', 300.00, 30.00, 'Pending', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'U/L TRY IN', 'Prosthesis', '2023-09-03', 'Shelf C', '2023-09-07', 250.00, 25.00, 'Delivered', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 'PFM', 'Crown', '2023-09-04', 'Shelf D', '2023-09-08', 400.00, 40.00, 'Pending', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


---------------------------------------------------------------------------------------

INSERT INTO clinic_orders (clinic_id, order_name, order_type, order_date, shelf, delivery_date, payment_amount, deposit, order_status, created_at, updated_at)
VALUES
(1, 'PZM', 'Prosthesis', '2023-09-01', 'Shelf E', '2023-09-10', 5000.00, 500.00, 'Pending', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, 'Zirconia Crown', 'Crown', '2023-09-02', 'Shelf F', '2023-09-11', 6000.00, 600.00, 'Delivered', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-----------------------------------------------------------------------------------------