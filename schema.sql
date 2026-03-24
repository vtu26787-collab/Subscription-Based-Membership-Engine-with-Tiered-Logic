CREATE DATABASE subscription_engine;

USE subscription_engine;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE plans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    features TEXT
);

CREATE TABLE subscriptions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    plan_id INT,
    start_date DATE,
    expiry_date DATE,
    status ENUM('active', 'expired', 'cancelled') DEFAULT 'active',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (plan_id) REFERENCES plans(id)
);

CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    plan_id INT,
    amount DECIMAL(10,2),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (plan_id) REFERENCES plans(id)
);

CREATE TABLE content (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    type ENUM('article', 'abstract', 'movie', 'music', 'trailer', 'podcast') NOT NULL,
    content_url VARCHAR(500) NOT NULL,
    required_plan VARCHAR(255) NOT NULL,
    description TEXT,
    full_text LONGTEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert plans
INSERT INTO plans (plan_name, price, features) VALUES
('Free', 0.00, 'Access to trailers, Limited songs, Ads enabled'),
('Basic', 9.00, 'Standard videos, Music streaming, No ads'),
('Premium', 19.00, 'HD movies, Full music library, Download feature'),
('Enterprise', 49.00, '4K videos, All music, Multi-device login, Advanced analytics');

-- Insert demo content
INSERT INTO content (title, type, content_url, required_plan, description, full_text) VALUES
('Tech Revolution', 'article', 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4', 'Premium', 'A thrilling paper about technological advancements.', '## Introduction\nThis paper explores the rapid evolution of technology in the 21st century.\n\n## Methodology\nWe conducted a comprehensive analysis of global tech trends.\n\n## Conclusion\nThe future of tech is brighter than ever.'),
('Future Cities', 'article', 'https://samplelib.com/lib/preview/mp4/sample-10s.mp4', 'Premium', 'Explore futuristic urban landscapes through research.', '## Abstract\nUrban landscapes are shifting towards a more sustainable future.\n\n## Analysis\nKey drivers include renewable energy and smart infrastructure.'),
('Startup Story', 'article', 'https://samplelib.com/lib/preview/mp4/sample-15s.mp4', 'Enterprise', 'The inspiring journey of a startup documented.', '## Background\nEvery startup begins with a vision to solve a problem.\n\n## Challenges\nNavigating market volatility and scaling were the main hurdles.'),
('AI World Trailer', 'trailer', 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4', 'Free', 'Trailer for AI World.', NULL),
('Space Future Trailer', 'trailer', 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4', 'Free', 'Trailer for Space Future.', NULL),
('Chill Beats', 'music', 'https://samplelib.com/lib/preview/mp3/sample-3s.mp3', 'Basic', 'Relaxing music tracks.', NULL),
('Coding Music', 'music', 'https://samplelib.com/lib/preview/mp3/sample-6s.mp3', 'Basic', 'Music for coding sessions.', NULL),
('Premium Focus', 'music', 'https://samplelib.com/lib/preview/mp3/sample-12s.mp3', 'Premium', 'High-quality focus music.', NULL),
('Tech Podcast Episode 1', 'podcast', 'https://samplelib.com/lib/preview/mp3/sample-3s.mp3', 'Enterprise', 'Episode 1 of Tech Podcast.', NULL),
-- Additional content
('Ocean Adventure', 'article', 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4', 'Premium', 'An underwater exploration study.', '## Summary\nThe depths of the ocean remain largely unexplored.\n\n## Findings\nOur recent expedition revealed new species of marine life.'),
('Mountain Climb', 'article', 'https://samplelib.com/lib/preview/mp4/sample-10s.mp4', 'Premium', 'A documentary analysis on mountain climbing.', '## Overview\nClimbing the world\'s highest peaks is an ultimate test of human endurance.'),
('Cyber Security', 'article', 'https://samplelib.com/lib/preview/mp4/sample-15s.mp4', 'Enterprise', 'Learn about cyber threats and countermeasures.', '## Introduction\nCybersecurity is a critical concern in the digital age.'),
('Robot Trailer', 'trailer', 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4', 'Free', 'Trailer for Robot Revolution.', NULL),
('Virtual Reality Trailer', 'trailer', 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4', 'Free', 'Trailer for VR World.', NULL),
('Jazz Vibes', 'music', 'https://samplelib.com/lib/preview/mp3/sample-3s.mp3', 'Basic', 'Smooth jazz music.', NULL),
('Rock Anthem', 'music', 'https://samplelib.com/lib/preview/mp3/sample-6s.mp3', 'Basic', 'Energetic rock tracks.', NULL),
('Classical Symphony', 'music', 'https://samplelib.com/lib/preview/mp3/sample-12s.mp3', 'Premium', 'Timeless classical pieces.', NULL),
('Business Podcast Episode 2', 'podcast', 'https://samplelib.com/lib/preview/mp3/sample-3s.mp3', 'Enterprise', 'Episode 2 of Business Insights.', NULL);

-- Insert admin user (password: admin123, hashed with bcrypt)
INSERT INTO users (name, email, password, role) VALUES
('Admin', 'admin@admin.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin');

-- Insert test user (password: user123, hashed with bcrypt)
INSERT INTO users (name, email, password, role) VALUES
('Test User', 'user@test.com', '$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'user');