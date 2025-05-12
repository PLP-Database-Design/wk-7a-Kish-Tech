-- Question 1 Achieving 1NF (First Normal Form) 🛠️

CREATE TABLE ProductDetail(
OrderID INT PRIMARY KEY AUTO_INCREMENT,
CustomerName VARCHAR(100),
Products VARCHAR (100)
);

INSERT INTO ProductDetail (`CustomerName`, `Products`) VALUES 
('John Doe', 'laptop'), 
('John Doe', 'Mouse'),
('Jane Smith', 'Tablet'),
('Jane Smith', 'Keyboard'),
('Jane Smith', 'Mouse'),
('Emily Clark', 'Phone');

-- Question 2 Achieving 2NF (Second Normal Form) 🧩

-- Creating orders table to remove partial dependancy. 
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Creating OrderDetails table 
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');


INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Outcome:
-- Now, CustomerName is only in the Orders table, depending fully on OrderID.
-- OrderDetails contains only attributes that depend fully on the composite key (OrderID, Product).
