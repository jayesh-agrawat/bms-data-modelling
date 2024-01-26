---
runme:
  id: 01HN38SMM4YF63ZC6BX07C6R9Y
  version: v2.2
---

   ## Introduction
    This repository contains SQL scripts for creating tables and inserting sample data for a BookMyShow-like application.


## Database Setup
    To set up the database, follow these steps:
    
    1. Connect to the PostgreSQL database.
    2. Create a new database named `bookmyshow`.
    3. Connect to the `bookmyshow` database.
    4. Create the necessary tables using the provided SQL scripts.
    5. Insert sample data into the tables.


## Table Structure

### Users
- `id` (SERIAL PRIMARY KEY): Unique identifier for each user.
- `name` (VARCHAR(255)): Name of the user.
- `email` (VARCHAR(255)): Email address of the user.
- `phone` (VARCHAR(20)): Phone number of the user.
- `password` (VARCHAR(255)): Password of the user.

### States
- `id` (SERIAL PRIMARY KEY): Unique identifier for each state.
- `state_name` (VARCHAR(255)): Name of the state.

### Cities
- `id` (SERIAL PRIMARY KEY): Unique identifier for each city.
- `city_name` (VARCHAR(255)): Name of the city.
- `state_id` (INT): Foreign key referencing the `id` column of the `States` table.
- `city_code` (VARCHAR(10)): Code for the city.

### Cinemas
- `id` (SERIAL PRIMARY KEY): Unique identifier for each cinema.
- `cinema_name` (VARCHAR(255)): Name of the cinema.
- `city_id` (INT): Foreign key referencing the `id` column of the `Cities` table.
- `address` (VARCHAR(255)): Address of the cinema.
- `pincode` (VARCHAR(10)): Pincode of the cinema.
- `screen_count` (INT): Number of screens in the cinema.
- `contact` (VARCHAR(20)): Contact number of the cinema.

### Genres
- `id` (SERIAL PRIMARY KEY): Unique identifier for each genre.
- `genre_name` (VARCHAR(255)): Name of the genre.

### Languages
- `id` (SERIAL PRIMARY KEY): Unique identifier for each language.
- `language_name` (VARCHAR(255)): Name of the language.

### Movies
- `id` (SERIAL PRIMARY KEY): Unique identifier for each movie.
- `movie_name` (VARCHAR(255)): Name of the movie.
- `language_id` (INT): Foreign key referencing the `id` column of the `Languages` table.
- `genre_id` (INT): Foreign key referencing the `id` column of the `Genres` table.
- `movie_duration` (INT): Duration of the movie in minutes.
- `movie_release_date` (DATE): Release date of the movie.
- `movie_certificate` (VARCHAR(10)): Certificate rating of the movie.
- `movie_description` (TEXT): Description of the movie.
- `movie_format` (VARCHAR(255)): Format of the movie.

### Shows
- `id` (SERIAL PRIMARY KEY): Unique identifier for each show.
- `movie_id` (INT): Foreign key referencing the `id` column of the `Movies` table.
- `cinema_id` (INT): Foreign key referencing the `id` column of the `Cinemas` table.
- `show_date` (DATE): Date of the show.
- `show_time` (TIME): Time of the show.
- `show_seat_count` (INT): Total number of seats in the show.
- `show_seat_price` (DECIMAL(10, 2)): Price of each seat.
- `show_seat_available` (INT): Number of available seats.
- `show_seat_booked` (INT): Number of booked seats.
- `show_seat_blocked` (INT): Number of blocked seats.
- `show_seat_reserved` (INT): Number of reserved seats.
- `show_seat_cancelled` (INT): Number of cancelled seats.
- `show_seat_available_count` (INT): Number of available seats for booking.
- `show_seat_booked_count` (INT): Number of booked seats.

### Bookings
- `id` (SERIAL PRIMARY KEY): Unique identifier for each booking.
- `user_id` (INT): Foreign key referencing the `id` column of the `Users` table.
- `show_id` (INT): Foreign key referencing the `id` column of the `Shows` table.
- `booking_date` (DATE): Date of the booking.
- `booking_time` (TIME): Time of the booking.
- `booking_seat_count` (INT): Number of seats booked.
- `booking_seat_price` (DECIMAL(10, 2)): Price of the booked seats.
- `booking_seat_number` (VARCHAR(255)): Seat numbers of the booked seats.
- `booking_seat_status` (VARCHAR(20)): Status of the booked seats.
- `booking_seat_cancelled` (BOOLEAN): Indicates whether the booking is cancelled or not.

## Sample Data
The following sample data has been inserted into the tables:

- States: Maharashtra, Delhi, Karnataka, Tamil Nadu, West Bengal
- Cities: Mumbai, Delhi, Bangalore, Chennai, Kolkata
- Cinemas: PVR Cinemas, INOX Cinemas, Cinepolis, SPI Cinemas, Carnival Cinemas
- Genres: Action, Biography, Drama, Sport, Musical, Romance, Music
- Languages: English, Hindi, Telugu, Tamil
- Movies: Avengers: Endgame, Dangal, Baahubali: The Beginning, Kabhi Khushi Kabhie Gham, Gully Boy
- Shows: Various shows for the above movies with seat availability and booking details
- Users: John Doe, Jane Smith, David Johnson, Emily Brown, Michael Wilson
- Bookings: Sample bookings made by the users

Please refer to the SQL script for the exact data.

## Conclusion
This repository provides the necessary SQL scripts and sample data for setting up a database for a BookMyShow-like application. Feel free to use and modify the scripts as per your requirements.
