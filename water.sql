-- Create Regions table
CREATE TABLE Regions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    population INT,
    region_type VARCHAR(50)
);

-- Create Water_Usage table
CREATE TABLE Water_Usage (
    id SERIAL PRIMARY KEY,
    region_id INT REFERENCES Regions(id),
    date DATE,
    amount_used FLOAT
);

-- Create Water_Resources table
CREATE TABLE Water_Resources (
    id SERIAL PRIMARY KEY,
    region_id INT REFERENCES Regions(id),
    amount_available FLOAT
);

-- Create Water_Access table
CREATE TABLE Water_Access (
    id SERIAL PRIMARY KEY,
    region_id INT REFERENCES Regions(id),
    access_type VARCHAR(50)
);

-- Sample data insert
INSERT INTO Regions (name, population, region_type) VALUES
('Region A', 50000, 'Urban'),
('Region B', 20000, 'Rural');

INSERT INTO Water_Usage (region_id, date, amount_used) VALUES
(1, '2024-02-01', 1500.5),
(2, '2024-02-01', 700.3);

INSERT INTO Water_Resources (region_id, amount_available) VALUES
(1, 2000),
(2, 1000);

INSERT INTO Water_Access (region_id, access_type) VALUES
(1, 'Good'),
(2, 'Poor');
