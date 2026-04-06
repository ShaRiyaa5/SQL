CREATE DATABASE IF NOT EXISTS ecommerce_db_one;
USE ecommerce_db_one;


CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    age INT CHECK (age >= 18),
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);


CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(200) NOT NULL,
    category_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE SET NULL
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Order_Items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);



INSERT INTO Categories (category_name) VALUES 
('Electronics'), ('Fashion'), ('Home Decor'), ('Books');


INSERT INTO Users (user_name, email, age, city) VALUES 
('Arun Kumar', 'arun@gmail.com', 25, 'Chennai'),
('Priya Dharshini', 'priya@yahoo.com', 22, 'Madurai'),
('Sathish RT', 'sathish@gmail.com', 30, 'Coimbatore'),
('Vijay Joseph', 'vijay@outlook.com', 28, 'Trichy'),
('Deepa Lakshmi', 'deepa@gmail.com', 19, 'Chennai');

INSERT INTO Products (product_name, category_id, price, stock) VALUES 
('Smart Watch', 1, 2500.00, 50),
('Laptop Pro', 1, 75000.00, 10),
('Cotton T-Shirt', 2, 800.00, 100),
('Python Programming Book', 4, 450.00, 0),
('Wireless Mouse', 1, 1200.00, 25),
('Coffee Table', 3, 5000.00, 5);


INSERT INTO Orders (user_id, order_date, total_amount, status) VALUES 
(1, '2024-05-10', 3700.00, 'Delivered'),
(2, '2024-05-12', 75000.00, 'Shipped'),
(1, '2024-05-15', 1200.00, 'Pending'),
(3, CURDATE(), 450.00, 'Pending'); 



INSERT INTO Order_Items (order_id, product_id, quantity) VALUES 
(1, 1, 1), (1, 5, 1),
(2, 2, 1),
(3, 5, 1),
(4, 4, 1);

SELECT product_name, price FROM Products WHERE price > (SELECT AVG(price) FROM Products);

SELECT Users.user_name, count(*)
FROM Users 
INNER JOIN Orders ON Users.user_id = Orders.user_id
WHERE Users.city = 'Chennai'
GROUP BY Users.user_name;

SELECT * FROM Orders
WHERE order_date BETWEEN '2024-05-1' AND '2024-05-31' AND total_amount > 2000;

SELECT * FROM Users WHERE user_id NOT IN (SELECT user_id FROM Orders);

SELECT * FROM products 
WHERE stock > 0
ORDER BY price DESC
LIMIT 3;