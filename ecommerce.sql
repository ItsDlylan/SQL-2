CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  user_name VARCHAR(20),
  user_email VARCHAR(100)
);

CREATE TABLE products(
  product_id SERIAL PRIMARY KEY,
  product_name VARCHAR(40),
  product_description VARCHAR(560),
  product_image text,
  product_price NUMERIC(6,2),
  product_isDiscount BOOLEAN,
  product_discountedPrice NUMERIC(6,2)
);

CREATE TABLE cart(
  cart_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id),
  product_id INT NOT NULL REFERENCES products(product_id),
  cart_item_quantity INT
);


-- 3 Users
INSERT INTO users(user_name, user_email)
VALUES
('Dlylan', 'Dylansemail@gmail.com'), 
('Liv', 'livsEmail@yahoo.au'),
('Zack', 'ScottLovestoCode@gmail.com');

-- 3 Products

INSERT INTO products(product_name, product_description, product_image, product_price, product_isdiscount, product_discountedprice)
VALUES('Apple UPhoneY', 'Buy now phone works good yes yes', 'hostingsitethatislegit.com/src/images/uphoney.png', 4291.14, False, NULL),
('INVIDEO RTEX Tea90', 'Buy now graphics card big wow yes yes', 'hostingsitethatislegit.com/src/images/invideortextea90.png', 6700.63, False, NULL)
('BlackWhole Pods', 'Buy now music to the ears yes yes', 'hostingsitethatislegit.com/src/images/blackwholepods--black.png', 519.12, FALSE, NULL),
('Nintendo Pocket Dump', 'Buy now use once at a party and never again yes yes', 'hostingsitethatislegit.com/src/images/NintendoPocketDump--pikachu-edition.png', 769.42, FALSE, NULL),
('Ramazon Water Block', 'Buy now become pirate yes yes', 'hostingsitethatislegit.com/src/images/Ramazonwaterblock4kwithBrokenAI.png', 89.99, FALSE, 69.99)


-- USERS 2 Products

INSERT INTO cart(user_id,product_id, cart_item_quantity)
VALUES
(1, 1, 1), (1,5,3), (2,2,1), (2,3,1), (3,4,1), (3,3,1); 

-- QUERY TO GRAB ALL OF THE ITEMS IN THE CART BY USERS ID OF 1 Displaying Product ID 
SELECT c.product_id "Users Cart"
FROM cart c
WHERE product_id IN (
  SELECT product_id FROM products WHERE user_id = 1
);

-- QUERY TO GRAB ALL OF THE ITEMS IN THE CART BY USER ID DISPLAYING AS PRODUCT NAME AND PRODUCT ID 

SELECT product_name, p.product_id "Product ID FOR DEVS", user_name
FROM products p
JOIN cart
ON cart.product_id = p.product_id
JOIN users
ON users.user_id = cart.user_id
WHERE users.user_id = 3;


-- Get products in all carts with all the users’ information
SELECT p.product_name "Product" , c.cart_item_quantity "How many of the Product do you have", u.user_name "user", u.user_email "users Email" , u.user_id "User ID"
FROM products p
JOIN cart c
ON c.product_id = p.product_id
JOIN users u
ON u.user_id = c.user_id;


-- Get the total cost of an order (sum the price of all products on an cart).
SELECT SUM(p.product_price) "Total cost of your cart"
FROM products p
JOIN cart c
ON c.product_id = p.product_id
JOIN users u
ON u.user_id = c.user_id
WHERE u.user_id = 1;


-- Update the quantity of a product in a user’s cart where the user’s id is 2
UPDATE cart
SET cart_item_quantity = 2
WHERE user_id = 2 AND product_id = 1;

