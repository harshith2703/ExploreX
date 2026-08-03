-- Seed data for ExploreX Tourist Information System
USE explorex_db;

-- 1. Insert Roles
INSERT INTO roles (id, name) VALUES (1, 'ROLE_USER') ON DUPLICATE KEY UPDATE name=name;
INSERT INTO roles (id, name) VALUES (2, 'ROLE_ADMIN') ON DUPLICATE KEY UPDATE name=name;

-- 2. Insert Users (Passwords: Admin@123 and User@123)
-- Admin account
INSERT INTO users (id, username, email, password, first_name, last_name, phone_number, profile_picture, created_at, updated_at) 
VALUES (1, 'admin', 'admin@explorex.com', '$2a$10$c7Jskc/9eA7w8hV7n3Qehe0dO1o2b2r1uC9TfQjZc1N1r7x/K.Kpq', 'ExploreX', 'Administrator', '9998887770', 'https://api.dicebear.com/7.x/bottts/svg?seed=admin', NOW(), NOW())
ON DUPLICATE KEY UPDATE username=username;

-- User account
INSERT INTO users (id, username, email, password, first_name, last_name, phone_number, profile_picture, created_at, updated_at) 
VALUES (2, 'user', 'user@explorex.com', '$2a$10$sX8JpW7Q2b6M5n9d3uH5me0dO1o2b2r1uC9TfQjZc1N1r7x/K.Kpq', 'John', 'Doe', '9876543210', 'https://api.dicebear.com/7.x/adventurer/svg?seed=user', NOW(), NOW())
ON DUPLICATE KEY UPDATE username=username;

-- 3. Assign User Roles
INSERT INTO user_roles (user_id, role_id) VALUES (1, 1) ON DUPLICATE KEY UPDATE user_id=user_id;
INSERT INTO user_roles (user_id, role_id) VALUES (1, 2) ON DUPLICATE KEY UPDATE user_id=user_id;
INSERT INTO user_roles (user_id, role_id) VALUES (2, 1) ON DUPLICATE KEY UPDATE user_id=user_id;

-- 4. Insert Categories
INSERT INTO categories (id, name, description, created_at, updated_at) 
VALUES (1, 'Beaches', 'Sun-kissed coastlines, sandy shores, and vibrant water activities.', NOW(), NOW())
ON DUPLICATE KEY UPDATE name=name;

INSERT INTO categories (id, name, description, created_at, updated_at) 
VALUES (2, 'Mountains', 'Breathtaking hill stations, mist-clad peaks, and tea gardens.', NOW(), NOW())
ON DUPLICATE KEY UPDATE name=name;

INSERT INTO categories (id, name, description, created_at, updated_at) 
VALUES (3, 'Heritage', 'Ancient palaces, historic forts, monuments, and archaeological marvels.', NOW(), NOW())
ON DUPLICATE KEY UPDATE name=name;

INSERT INTO categories (id, name, description, created_at, updated_at) 
VALUES (4, 'Wildlife', 'Lush national parks, bio-diverse reserves, and safaris.', NOW(), NOW())
ON DUPLICATE KEY UPDATE name=name;

-- 5. Insert Tourist Places
-- Vagator Beach (Beaches category id: 1)
INSERT INTO tourist_places (id, name, description, location, state, district, average_rating, latitude, longitude, category_id, created_at, updated_at) 
VALUES (1, 'Vagator Beach', 'Vagator Beach is one of the most beautiful beaches in North Goa. Famous for its red cliffs, dramatic sunsets, and peaceful atmosphere compared to other crowded shores. Its rocky outcrops provide a scenic landscape popular for photography.', 'Vagator', 'Goa', 'North Goa', 4.5, 15.6030, 73.7348, 1, NOW(), NOW())
ON DUPLICATE KEY UPDATE name=name;

-- Munnar Hills (Mountains category id: 2)
INSERT INTO tourist_places (id, name, description, location, state, district, average_rating, latitude, longitude, category_id, created_at, updated_at) 
VALUES (2, 'Munnar Hill Station', 'Munnar is a town and hill station located in the Idukki district of the southwestern Indian state of Kerala. Munnar is situated at around 1,600 metres above mean sea level, in the Western Ghats mountain range. Famous for tea plantations and hiking trails.', 'Munnar', 'Kerala', 'Idukki', 4.8, 10.0889, 77.0595, 2, NOW(), NOW())
ON DUPLICATE KEY UPDATE name=name;

-- Taj Mahal (Heritage category id: 3)
INSERT INTO tourist_places (id, name, description, location, state, district, average_rating, latitude, longitude, category_id, created_at, updated_at) 
VALUES (3, 'Taj Mahal', 'An immense mausoleum of white marble, built in Agra between 1631 and 1648 by order of the Mughal emperor Shah Jahan in memory of his favorite wife. The Taj Mahal is the jewel of Muslim art in India and one of the universally admired masterpieces of the world heritage.', 'Agra', 'Uttar Pradesh', 'Agra', 5.0, 27.1751, 78.0421, 3, NOW(), NOW())
ON DUPLICATE KEY UPDATE name=name;

-- Jim Corbett (Wildlife category id: 4)
INSERT INTO tourist_places (id, name, description, location, state, district, average_rating, latitude, longitude, category_id, created_at, updated_at) 
VALUES (4, 'Jim Corbett National Park', 'Jim Corbett National Park is a forested wildlife sanctuary in northern India’s Uttarakhand State. Rich in flora and fauna, it’s known for its Bengal tigers. Wild elephants, leopards and tigers roam the park, which is crossed by the Ramganga River.', 'Ramnagar', 'Uttarakhand', 'Nainital', 4.2, 29.5300, 78.7747, 4, NOW(), NOW())
ON DUPLICATE KEY UPDATE name=name;

-- 6. Insert Images (DIC Image URLs)
-- Vagator Beach images
INSERT INTO images (id, image_url, tourist_place_id, created_at) 
VALUES (1, 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800', 1, NOW())
ON DUPLICATE KEY UPDATE image_url=image_url;
INSERT INTO images (id, image_url, tourist_place_id, created_at) 
VALUES (2, 'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=800', 1, NOW())
ON DUPLICATE KEY UPDATE image_url=image_url;

-- Munnar Hill Station images
INSERT INTO images (id, image_url, tourist_place_id, created_at) 
VALUES (3, 'https://images.unsplash.com/photo-1593693397690-362cb9666fc2?w=800', 2, NOW())
ON DUPLICATE KEY UPDATE image_url=image_url;
INSERT INTO images (id, image_url, tourist_place_id, created_at) 
VALUES (4, 'https://images.unsplash.com/photo-1542856391-010fb87dcfed?w=800', 2, NOW())
ON DUPLICATE KEY UPDATE image_url=image_url;

-- Taj Mahal images
INSERT INTO images (id, image_url, tourist_place_id, created_at) 
VALUES (5, 'https://images.unsplash.com/photo-1564507592333-c60657eea523?w=800', 3, NOW())
ON DUPLICATE KEY UPDATE image_url=image_url;
INSERT INTO images (id, image_url, tourist_place_id, created_at) 
VALUES (6, 'https://images.unsplash.com/photo-1585135497273-1a86b09fe707?w=800', 3, NOW())
ON DUPLICATE KEY UPDATE image_url=image_url;

-- Jim Corbett National Park images
INSERT INTO images (id, image_url, tourist_place_id, created_at) 
VALUES (7, 'https://images.unsplash.com/photo-1615959189255-75e11ad9fb5c?w=800', 4, NOW())
ON DUPLICATE KEY UPDATE image_url=image_url;

-- 7. Insert Reviews
INSERT INTO reviews (id, rating, comment, user_id, tourist_place_id, created_at) 
VALUES (1, 5, 'Absolutely spectacular views! Sunset at Vagator is a must-see.', 2, 1, NOW())
ON DUPLICATE KEY UPDATE comment=comment;

INSERT INTO reviews (id, rating, comment, user_id, tourist_place_id, created_at) 
VALUES (2, 5, 'The symbol of love. Pure white marble is jaw-dropping.', 2, 3, NOW())
ON DUPLICATE KEY UPDATE comment=comment;

-- 8. Insert Favorites
INSERT INTO favorites (id, user_id, tourist_place_id, created_at) 
VALUES (1, 2, 2, NOW())
ON DUPLICATE KEY UPDATE user_id=user_id;

-- 9. Insert Bookings
INSERT INTO bookings (id, user_id, tourist_place_id, booking_date, number_of_people, status, special_requests, created_at, updated_at) 
VALUES (1, 2, 2, '2026-10-15 09:00:00', 2, 'APPROVED', 'Need a local English-speaking guide.', NOW(), NOW())
ON DUPLICATE KEY UPDATE user_id=user_id;

-- 10. Insert Contact Messages
INSERT INTO contact_messages (id, name, email, subject, message, replied, created_at) 
VALUES (1, 'Jane Guest', 'jane@test.com', 'Tour Package Inquiry', 'Hello, do you offer customized student tour discounts for group packages?', FALSE, NOW())
ON DUPLICATE KEY UPDATE name=name;
