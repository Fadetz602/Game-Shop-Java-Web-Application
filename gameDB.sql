-- Step 1: Create the database
CREATE DATABASE gameDEMO;

GO

USE gameDEMO;

GO

-- Step 2: Create the Role table
CREATE TABLE Role (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL
);

-- Step 3: Create the Account table
CREATE TABLE Account (
    id INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id INT,
    name VARCHAR(100) NOT NULL,
    amount DECIMAL(10, 2),
    FOREIGN KEY (role_id) REFERENCES Role(id)
);

-- Step 4: Create the Category table
CREATE TABLE Category (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL
);

-- Step 5: Create the Products table
CREATE TABLE Products (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    publisher VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    releaseDate DATE,
    img VARCHAR(255),
    category VARCHAR(100),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

-- Step 6: Create the Order table
CREATE TABLE [Order] (
    id INT PRIMARY KEY IDENTITY(1,1),
    order_date DATE NOT NULL,
    total_money DECIMAL(10, 2) NOT NULL,
    accID INT,
    FOREIGN KEY (accID) REFERENCES Account(id)
);

-- Step 7: Create the OrderDetail table
CREATE TABLE OrderDetail (
    order_id INT,
    product_id INT,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES [Order](id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

GO

-- Step 8: Insert categories into the Category table
INSERT INTO Category (name) VALUES 
('Horror'), 
('MOBA'), 
('FPS'), 
('Platformer'), 
('Survival'),
('Sandbox'), 
('RPG'), 
('Action-Adventure'), 
('Adventure'),
('Battle Royale'), 
('Rogue-like');

-- Step 9: Insert roles into the Role table
INSERT INTO Role (name) VALUES 
('Admin'), 
('Customer'), 
('Guest');

-- Step 10: Insert products into the Products table
INSERT INTO Products (name, publisher, description, price, releaseDate, img, category_id) VALUES
('Outlast', 'Red Barrels', 'Investigative journalist Miles Upshur navigates a psychiatric hospital.', 10.00, '2013-09-04', 'img/outlast.png', 1),
('League of Legends', 'Riot Games', 'MOBA game with champions battling against teams.', 0.00, '2009-10-27', 'img/league_of_legends.png', 2),
('Valorant', 'Riot Games', 'Tactical shooter set in the near future.', 0.00, '2020-06-02', 'img/valorant.png', 3),
('Only Up', 'Indie Studio', 'Challenging platformer game navigating complex environments.', 15.00, '2023-05-01', 'img/only_up.png', 4),
('Subnautica', 'Unknown Worlds Entertainment', 'Survival game exploring an alien ocean planet.', 29.99, '2018-01-23', 'img/subnautica.png', 5),
('Minecraft', 'Mojang Studios', 'Sandbox game building and exploring worlds made of blocks.', 26.95, '2011-11-18', 'img/minecraft.png', 6),
('The Witcher 3: Wild Hunt', 'CD Projekt', 'RPG game controlling Geralt of Rivia, a monster hunter.', 39.99, '2015-05-19', 'img/witcher3.png', 7),
('Grand Theft Auto V', 'Rockstar Games', 'Action-adventure game involving heists and criminal life.', 29.99, '2013-09-17', 'img/gta5.png', 8),
('Cyberpunk 2077', 'CD Projekt', 'Open-world, action-adventure story set in Night City.', 59.99, '2020-12-10', 'img/cyberpunk2077.png', 7),
('Red Dead Redemption 2', 'Rockstar Games', 'Epic tale of life in America’s heartland.', 59.99, '2018-10-26', 'img/rdr2.png', 8),
('The Legend of Zelda: Breath of the Wild', 'Nintendo', 'Adventure game controlling Link to save Hyrule.', 59.99, '2017-03-03', 'img/zelda_botw.png', 9),
('PUBG', 'PUBG Corporation', 'An online multiplayer battle royale game where players fight to be the last person standing.', 29.99, '2017-12-20', 'img/pubg.png', 3),
('Counter-Strike: Global Offensive', 'Valve', 'A multiplayer first-person shooter game that pits two teams against each other: the Terrorists and the Counter-Terrorists.', 0.00, '2012-08-21', 'img/csgo.png', 3),
('Fortnite', 'Epic Games', 'A battle royale game where players fight to be the last one standing on an ever-shrinking map.', 0.00, '2017-07-25', 'img/fortnite.png', 10),
('Overwatch', 'Blizzard Entertainment', 'A team-based multiplayer first-person shooter set in a futuristic world.', 39.99, '2016-05-24', 'img/overwatch.png', 3),
('Apex Legends', 'Respawn Entertainment', 'A free-to-play battle royale game where players select from unique characters and fight to be the last team standing.', 0.00, '2019-02-04', 'img/apex_legends.png', 10),
('Call of Duty: Warzone', 'Activision', 'A free-to-play battle royale game where players engage in large-scale combat.', 0.00, '2020-03-10', 'img/warzone.png', 10),
('Dota 2', 'Valve', 'A multiplayer online battle arena game where two teams of five players compete to destroy the opposing team', 0.00, '2013-07-09', 'img/dota2.png', 2),
('Rainbow Six Siege', 'Ubisoft', 'A tactical shooter game where players assume control of operators from the Rainbow team and engage in various missions.', 19.99, '2015-12-01', 'img/rainbow_six_siege.png', 3),
('Hades', 'Supergiant Games', 'A rogue-like dungeon crawler where players control Zagreus, the son of Hades, as he attempts to escape the Underworld.', 24.99, '2020-09-17', 'img/hades.png', 11);

GO
