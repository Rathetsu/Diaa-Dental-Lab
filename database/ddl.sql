---------------------------------------------------------------------------------------
-- Create `users` table
---------------------------------------------------------------------------------------

DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    avatar VARCHAR(255) NOT NULL DEFAULT 'https://i.imgur.com/57GqXFP.png',
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Seed with primary users
INSERT INTO users (username, email, first_name, last_name, password) VALUES
('ezzat', 'ezzat@aldiaa.com', 'Ahmed', 'Ezzat', '$2b$10$pgGUA1nJLkNH8y9pKzB1IOijvpqgfmiVKZl9S8N506JHByA4tIw7.'),
('fatma', 'fatma@aldiaa.com', 'Fatma AlZahraa', 'Diaa', '$2b$10$jKi4jT81QmhpBU1.XBkzRekwzwagz3zRNeeqndLqn8Ve/4SI/i9Q.'),
('laila', 'laila@aldiaa.com', 'Laila', 'Diaa', '$2b$10$dO1VbMvAcU6DdDEA5LvWW.Lzyp0dHCOreI0dpxKXLNYFTQBXqaO4m');


-- SELECT * FROM users;

---------------------------------------------------------------------------------------

