# SQL Scripts

This repository contains SQL scripts for creating the database schema for the BookMyShow application.

## Users Table

Stores information about the users of the application.

| Column   | Data Type          | Description                    |
| -------- | ------------------ | ------------------------------ |
| id       | SERIAL PRIMARY KEY | Unique identifier for the user |
| name     | VARCHAR(255)       | Name of the user               |
| email    | VARCHAR(255)       | Email address of the user      |
| phone    | VARCHAR(20)        | Phone number of the user       |
| password | VARCHAR(255)       | Password for the user          |

## States Table

Stores information about the states.

| Column     | Data Type          | Description                     |
| ---------- | ------------------ | ------------------------------- |
| id         | SERIAL PRIMARY KEY | Unique identifier for the state |
| state_name | VARCHAR(255)       | Name of the state               |

## Cities Table

Stores information about the cities.

| Column    | Data Type          | Description                          |
| --------- | ------------------ | ------------------------------------ |
| id        | SERIAL PRIMARY KEY | Unique identifier for the city       |
| city_name | VARCHAR(255)       | Name of the city                     |
| state_id  | INT                | Foreign key referencing States table |
| city_code | VARCHAR(10)        | Code for the city                    |

## Cinemas Table

Stores information about the cinemas.

| Column       | Data Type          | Description                          |
| ------------ | ------------------ | ------------------------------------ |
| id           | SERIAL PRIMARY KEY | Unique identifier for the cinema     |
| cinema_name  | VARCHAR(255)       | Name of the cinema                   |
| city_id      | INT                | Foreign key referencing Cities table |
| address      | VARCHAR(255)       | Address of the cinema                |
| pincode      | VARCHAR(10)        | Pincode of the cinema                |
| screen_count | INT                | Number of screens in the cinema      |
| contact      | VARCHAR(20)        | Contact number of the cinema         |

## Genres Table

Stores information about the genres.

| Column     | Data Type          | Description                     |
| ---------- | ------------------ | ------------------------------- |
| id         | SERIAL PRIMARY KEY | Unique identifier for the genre |
| genre_name | VARCHAR(255)       | Name of the genre               |

## Languages Table

Stores information about the languages.

| Column        | Data Type          | Description                        |
| ------------- | ------------------ | ---------------------------------- |
| id            | SERIAL PRIMARY KEY | Unique identifier for the language |
| language_name | VARCHAR(255)       | Name of the language               |

## Movies Table

Stores information about the movies.

| Column             | Data Type          | Description                             |
| ------------------ | ------------------ | --------------------------------------- |
| id                 | SERIAL PRIMARY KEY | Unique identifier for the movie         |
| movie_name         | VARCHAR(255)       | Name of the movie                       |
| language_id        | INT                | Foreign key referencing Languages table |
| genre_id           | INT                | Foreign key referencing Genres table    |
| movie_duration     | INT                | Duration of the movie in minutes        |
| movie_release_date | DATE               | Release date of the movie               |
| movie_certificate  | VARCHAR(10)        | Certificate rating of the movie         |
| movie_description  | TEXT               | Description of the movie                |
| movie_format       | VARCHAR(255)       | Format of the movie                     |

## Shows Table

Stores information about the shows.

| Column                    | Data Type          | Description                           |
| ------------------------- | ------------------ | ------------------------------------- |
| id                        | SERIAL PRIMARY KEY | Unique identifier for the show        |
| movie_id                  | INT                | Foreign key referencing Movies table  |
| cinema_id                 | INT                | Foreign key referencing Cinemas table |
| show_date                 | DATE               | Date of the show                      |
| show_time                 | TIME               | Time of the show                      |
| show_seat_count           | INT                | Total number of seats in the show     |
| show_seat_price           | DECIMAL(10, 2)     | Price per seat in the show            |
| show_seat_available       | INT                | Number of available seats in the show |
| show_seat_booked          | INT                | Number of booked seats in the show    |
| show_seat_blocked         | INT                | Number of blocked seats in the show   |
| show_seat_cancelled       | INT                | Number of cancelled seats in the show |
| show_seat_available_count | INT                | Number of seats available for booking |

## Bookings Table

Stores information about the bookings.

| Column                 | Data Type          | Description                           |
| ---------------------- | ------------------ | ------------------------------------- |
| id                     | SERIAL PRIMARY KEY | Unique identifier for the booking     |
| user_id                | INT                | Foreign key referencing Users table   |
| show_id                | INT                | Foreign key referencing Shows table   |
| booking_date           | DATE               | Date of the booking                   |
| booking_time           | TIME               | Time of the booking                   |
| booking_seat_count     | INT                | Number of seats booked in the booking |
| booking_seat_price     | DECIMAL(10, 2)     | Price per seat in the booking         |
| booking_seat_number    | VARCHAR(255)       | Seat number(s) in the booking         |
| booking_seat_status    | VARCHAR(20)        | Status of the booking                 |
| booking_seat_cancelled | BOOLEAN            | Indicates if the booking is cancelled |

Please refer to the individual SQL scripts for more details on the table structure and relationships.
