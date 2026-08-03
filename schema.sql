-- MySQL 8.x Database Schema for ExploreX Tourist Information System
-- Create database if not exists
CREATE DATABASE IF NOT EXISTS explorex_db;
USE explorex_db;

-- 1. Roles table
CREATE TABLE IF NOT EXISTS roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);

-- 2. Users table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    phone_number VARCHAR(20),
    profile_picture VARCHAR(255),
    created_at DATETIME NOT NULL,
    updated_at DATETIME
);

-- 3. User Roles join table
CREATE TABLE IF NOT EXISTS user_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

-- 4. Categories table
CREATE TABLE IF NOT EXISTS categories (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    created_at DATETIME NOT NULL,
    updated_at DATETIME
);

-- 5. Tourist Places table
CREATE TABLE IF NOT EXISTS tourist_places (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    district VARCHAR(50) NOT NULL,
    average_rating DOUBLE DEFAULT 0.0,
    latitude DOUBLE,
    longitude DOUBLE,
    category_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE RESTRICT
);

-- 6. Images table (Destination Photo Galleries)
CREATE TABLE IF NOT EXISTS images (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    tourist_place_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (tourist_place_id) REFERENCES tourist_places(id) ON DELETE CASCADE
);

-- 7. Reviews table
CREATE TABLE IF NOT EXISTS reviews (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT NOT NULL,
    user_id BIGINT NOT NULL,
    tourist_place_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (tourist_place_id) REFERENCES tourist_places(id) ON DELETE CASCADE,
    CONSTRAINT unique_user_review UNIQUE (user_id, tourist_place_id)
);

-- 8. Favorites table
CREATE TABLE IF NOT EXISTS favorites (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    tourist_place_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (tourist_place_id) REFERENCES tourist_places(id) ON DELETE CASCADE,
    CONSTRAINT unique_user_favorite UNIQUE (user_id, tourist_place_id)
);

-- 9. Bookings table
CREATE TABLE IF NOT EXISTS bookings (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    tourist_place_id BIGINT NOT NULL,
    booking_date DATETIME NOT NULL,
    number_of_people INT NOT NULL CHECK (number_of_people >= 1),
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    special_requests TEXT,
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (tourist_place_id) REFERENCES tourist_places(id) ON DELETE CASCADE
);

-- 10. Contact Support Messages table
CREATE TABLE IF NOT EXISTS contact_messages (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    subject VARCHAR(150),
    message TEXT NOT NULL,
    replied BOOLEAN NOT NULL DEFAULT FALSE,
    created_at DATETIME NOT NULL
);
