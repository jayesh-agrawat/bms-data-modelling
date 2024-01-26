-- 
-- Connect to the PostgreSQL database
-- 
DROP DATABASE IF EXISTS bookmyshow;
CREATE DATABASE bookmyshow;

\c bookmyshow;

-- Create the tables
CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    password VARCHAR(255)
);

CREATE TABLE States (
    id SERIAL PRIMARY KEY,
    state_name VARCHAR(255)
);

CREATE TABLE Cities (
    id SERIAL PRIMARY KEY,
    city_name VARCHAR(255),
    state_id INT,
    city_code VARCHAR(10),
    FOREIGN KEY (state_id) REFERENCES States(id) ON DELETE CASCADE
);

CREATE TABLE Cinemas (
    id SERIAL PRIMARY KEY,
    cinema_name VARCHAR(255),
    city_id INT,
    address VARCHAR(255),
    pincode VARCHAR(10),
    screen_count INT,
    contact VARCHAR(20),
    FOREIGN KEY (city_id) REFERENCES Cities(id) ON DELETE CASCADE
);

CREATE TABLE Genres (
    id SERIAL PRIMARY KEY,
    genre_name VARCHAR(255)
);

CREATE TABLE Languages (
    id SERIAL PRIMARY KEY,
    language_name VARCHAR(255)
);

CREATE TABLE Movies (
    id SERIAL PRIMARY KEY,
    movie_name VARCHAR(255),
    language_id INT,
    genre_id INT,
    movie_duration INT,
    movie_release_date DATE,
    movie_certificate VARCHAR(10),
    movie_description TEXT,
    movie_format VARCHAR(255),
    FOREIGN KEY (language_id) REFERENCES Languages(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genres(id) ON DELETE CASCADE
);

CREATE TABLE Shows (
    id SERIAL PRIMARY KEY,
    movie_id INT,
    cinema_id INT,
    show_date DATE,
    show_time TIME,
    show_seat_count INT,
    show_seat_price DECIMAL(10, 2),
    show_seat_available INT,
    show_seat_booked INT,
    show_seat_blocked INT,
    show_seat_cancelled INT,
    show_seat_available_count INT,
    FOREIGN KEY (movie_id) REFERENCES Movies(id) ON DELETE CASCADE,
    FOREIGN KEY (cinema_id) REFERENCES Cinemas(id) ON DELETE CASCADE
);

CREATE TABLE Bookings (
    id SERIAL PRIMARY KEY,
    user_id INT,
    show_id INT,
    booking_date DATE,
    booking_time TIME,
    booking_seat_count INT,
    booking_seat_price DECIMAL(10, 2),
    booking_seat_number VARCHAR(255),
    booking_seat_status VARCHAR(20),
    booking_seat_cancelled BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (show_id) REFERENCES Shows(id) ON DELETE CASCADE
);

-- Insert sample data into States table
INSERT INTO States (state_name)
VALUES ('Maharashtra'),
       ('Delhi'),
       ('Karnataka'),
       ('Tamil Nadu'),
       ('West Bengal');

-- Insert sample data into Cities table
INSERT INTO Cities (city_name, state_id, city_code)
VALUES ('Mumbai', 1, 'MUM'),
       ('Delhi', 2, 'DEL'),
       ('Bangalore', 3, 'BLR'),
       ('Chennai', 4, 'CHE'),
       ('Kolkata', 5, 'KOL');

-- Insert sample data into Cinemas table
INSERT INTO Cinemas (cinema_name, city_id, address, pincode, screen_count, contact)
VALUES ('PVR Cinemas', 1, 'ABC Road, Mumbai', '400001', 5, '1234567890'),
       ('INOX Cinemas', 2, 'XYZ Road, Delhi', '110001', 4, '9876543210'),
       ('Cinepolis', 3, 'PQR Road, Bangalore', '560001', 6, '7890123456'),
       ('SPI Cinemas', 4, 'LMN Road, Chennai', '600001', 3, '0123456789'),
       ('Carnival Cinemas', 5, 'EFG Road, Kolkata', '700001', 4, '9876543210');

-- Insert sample data into Genres table
INSERT INTO Genres (genre_name)
VALUES ('Action'),
       ('Biography'),
       ('Drama'),
       ('Sport'),
       ('Musical'),
       ('Romance'),
       ('Music');

-- Insert sample data into Languages table
INSERT INTO Languages (language_name)
VALUES ('English'),
       ('Hindi'),
       ('Telugu'),
       ('Tamil');

-- Insert sample data into Movies table
INSERT INTO Movies (movie_name, language_id, genre_id, movie_duration, movie_release_date, movie_certificate, movie_description, movie_format)
VALUES ('Avengers: Endgame', 1, 1, 181, '2019-04-26', 'U/A', 'After the devastating events of Avengers: Infinity War, the universe is in ruins.', '2D'),
       ('Dangal', 2, 2, 161, '2016-12-23', 'U', 'Former wrestler Mahavir Singh Phogat and his two wrestler daughters struggle towards glory at the Commonwealth Games.', '2D'),
       ('Baahubali: The Beginning', 3, 1, 159, '2015-07-10', 'U/A', 'In the kingdom of Mahishmati, Shivudu falls in love with a fair maiden, Avanthika, while trying to rescue her from the evil king.', '2D'),
       ('Kabhi Khushi Kabhie Gham', 2, 3, 210, '2001-12-14', 'U', 'Yashvardhan Raichand lives a very wealthy lifestyle along with his wife, Nandini, and two sons, Rahul and Rohan.', '2D'),
       ('Gully Boy', 2, 4, 153, '2019-02-14', 'U/A', 'A coming-of-age story based on the lives of street rappers in Mumbai.', '2D');

-- Insert sample data into Shows table
INSERT INTO Shows (movie_id, cinema_id, show_date, show_time, show_seat_count, show_seat_price, show_seat_available, show_seat_booked, show_seat_blocked, show_seat_cancelled, show_seat_available_count)
VALUES (1, 1, '2022-01-01', '18:00:00', 100, 250.00, 100, 0, 0, 0, 100),
       (2, 2, '2022-01-02', '19:30:00', 80, 200.00, 80, 0, 0, 0, 80),
       (3, 3, '2022-01-03', '20:00:00', 120, 300.00, 120, 0, 0, 0, 120),
       (4, 4, '2022-01-04', '21:00:00', 70, 180.00, 70, 0, 0, 0, 70),
       (5, 5, '2022-01-05', '22:30:00', 90, 220.00, 90, 0, 0, 0, 90);

-- Insert sample data into Users table
INSERT INTO Users (name, email, phone, password)
VALUES ('Rahul', 'rahul@example.com', '9876543210', 'password123'),
       ('Dev', 'Dev@example.com', '1234567890', 'password456'),
       ('Bhupendra Jogi', 'bhupendrajogi@example.com', '9876543210', 'password789'),
       ('Mr Beast', 'mrbreast@example.com', '1234567890', 'passwordabc'),
       ('Michael Jackson', 'michael.jackson@example.com', '9876543210', 'passworddef');

-- Insert sample data into Bookings table
INSERT INTO Bookings (user_id, show_id, booking_date, booking_time, booking_seat_count, booking_seat_price, booking_seat_number, booking_seat_status, booking_seat_cancelled)
VALUES (1, 1, '2022-01-01', '18:00:00', 2, 500.00, 'A1,A2', 'Confirmed', false),
       (2, 2, '2022-01-02', '19:30:00', 3, 600.00, 'B1,B2,B3', 'Confirmed', false),
       (3, 3, '2022-01-03', '20:00:00', 1, 300.00, 'C1', 'Confirmed', false),
       (4, 4, '2022-01-04', '21:00:00', 4, 720.00, 'D1,D2,D3,D4', 'Confirmed', false),
       (5, 5, '2022-01-05', '22:30:00', 2, 440.00, 'E1,E2', 'Confirmed', false);
