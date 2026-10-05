CREATE DATABASE IF NOT EXISTS stayease_hotel CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE stayease_hotel;
CREATE TABLE IF NOT EXISTS users(
 id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100) NOT NULL,email VARCHAR(150) UNIQUE NOT NULL,password VARCHAR(255) NOT NULL,phone VARCHAR(30) DEFAULT '',created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS rooms(
 id INT AUTO_INCREMENT PRIMARY KEY,type VARCHAR(100) NOT NULL,price DECIMAL(10,2) NOT NULL,quantity INT NOT NULL,capacity INT NOT NULL,amenities VARCHAR(500) NOT NULL,icon VARCHAR(10) DEFAULT '🛏️'
);
CREATE TABLE IF NOT EXISTS bookings(
 id INT AUTO_INCREMENT PRIMARY KEY,user_id INT NULL,room_id INT NOT NULL,name VARCHAR(100),email VARCHAR(150),phone VARCHAR(30),check_in DATE,check_out DATE,guests INT,total DECIMAL(10,2),status VARCHAR(30) DEFAULT 'Confirmed',created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE SET NULL,FOREIGN KEY(room_id) REFERENCES rooms(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS site_content(
 id INT PRIMARY KEY DEFAULT 1,about_title VARCHAR(200),about_text TEXT,phone VARCHAR(50),email VARCHAR(150),address TEXT,faq TEXT,travel TEXT,privacy TEXT
);
INSERT INTO rooms(type,price,quantity,capacity,amenities,icon) SELECT * FROM (
SELECT 'Deluxe Room',3200,8,2,'Wi-Fi,Breakfast,AC','🛏️' UNION ALL
SELECT 'Executive Room',4500,6,3,'Wi-Fi,Breakfast,Work Desk','🛋️' UNION ALL
SELECT 'Family Suite',6500,4,4,'Wi-Fi,Breakfast,2 Beds','🏨' UNION ALL
SELECT 'Premium Suite',9000,2,5,'Wi-Fi,Breakfast,Living Room','✨'
) x WHERE NOT EXISTS(SELECT 1 FROM rooms);
INSERT INTO site_content(id,about_title,about_text,phone,email,address,faq,travel,privacy) SELECT 1,'StayEase Hotel','A comfortable modern hotel designed for business and leisure travelers. Enjoy clean rooms, friendly service and convenient amenities.','+91 98765 43210','support@stayease.example','City Centre, India','What is the cancellation policy? | Bookings can be cancelled up to 3 days before arrival.\nCan I modify my booking? | Yes, up to 3 days before arrival, subject to availability.\nIs payment secure? | Payments are processed through the payment provider.','Ask our front desk for local attractions, restaurants, transport options and sightseeing routes.','We collect only information required to provide hotel booking services. Payment details are processed by the payment provider and are not stored by this application.' WHERE NOT EXISTS(SELECT 1 FROM site_content WHERE id=1);
