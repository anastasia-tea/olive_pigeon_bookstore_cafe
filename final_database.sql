
-- create tables
-- store
CREATE TABLE store (
  store_id INT NOT NULL,
  store_name VARCHAR(40) NOT NULL,
  PRIMARY KEY (store_id)
);

-- pastry
CREATE TABLE pastry (
  pastry_id INT NOT NULL,
  pastry_name VARCHAR(20) NOT NULL,
  pastry_desc TEXT,
  pastry_quantity INT,
  pastry_price DOUBLE,
  PRIMARY KEY (pastry_id)
);

-- beverage
CREATE TABLE beverage (
  beverage_id INT NOT NULL,
  beverage_name VARCHAR(20) NOT NULL,
  beverage_desc TEXT,
  beverage_price DOUBLE,
  beverage_size INT NOT NULL,
  PRIMARY KEY (beverage_id)
);

-- book
CREATE TABLE book (
  book_id INT NOT NULL,
  book_name VARCHAR(200) NOT NULL,
  book_quantity INT,
  book_price DOUBLE,
  book_isbn VARCHAR(15),
  book_pub_date DATE,
  PRIMARY KEY (book_id)
);

-- milk
CREATE TABLE milk (
  milk_id INT NOT NULL,
  milk_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (milk_id)
);

-- syrup
CREATE TABLE syrup (
  syrup_id INT NOT NULL,
  syrup_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (syrup_id)
);

-- author
CREATE TABLE author (
  author_id INT NOT NULL,
  author_lname VARCHAR(40) NOT NULL,
  author_initial VARCHAR(5),
  author_fname VARCHAR(40) NOT NULL,
  PRIMARY KEY (author_id)
);

-- genre
CREATE TABLE genre (
  genre_id INT NOT NULL,
  genre_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (genre_id)
);

-- publiser
CREATE TABLE publisher (
  publisher_id INT NOT NULL,
  publisher_name VARCHAR(40) NOT NULL,
  PRIMARY KEY (publisher_id)
);

-- book_author
CREATE TABLE book_author (
  fk_author_id INT NOT NULL,
  fk_book_id INT NOT NULL,
  PRIMARY KEY (fk_author_id, fk_book_id),
  FOREIGN KEY (fk_book_id)
      REFERENCES book(book_id),
  FOREIGN KEY (fk_author_id)
      REFERENCES author(author_id)
);

-- book_genre
CREATE TABLE book_genre (
  fk_genre_id INT NOT NULL,
  fk_book_id INT NOT NULL,
  PRIMARY KEY (fk_genre_id, fk_book_id),
  FOREIGN KEY (fk_book_id)
      REFERENCES `book`(book_id),
  FOREIGN KEY (fk_genre_id)
      REFERENCES genre(genre_id)
);

-- book_publisher
CREATE TABLE book_publisher (
  fk_publisher_id INT NOT NULL,
  fk_book_id INT NOT NULL,
  PRIMARY KEY (fk_publisher_id, fk_book_id),
  FOREIGN KEY (fk_book_id)
      REFERENCES book(book_id),
  FOREIGN KEY (fk_publisher_id)
      REFERENCES publisher(publisher_id)
);

-- staff
CREATE TABLE staff (
  staff_id INT NOT NULL,
  staff_lname VARCHAR(40) NOT NULL,
  staff_initial VARCHAR(5),
  staff_fname VARCHAR(40) NOT NULL,
  staff_email VARCHAR(40),
  staff_phone VARCHAR(20),
  staff_job_title VARCHAR(20),
  staff_hourly_wage DOUBLE,
  fk_store_id INT,
  PRIMARY KEY (staff_id),
  FOREIGN KEY (fk_store_id)
      REFERENCES store(store_id)
);

-- customer
CREATE TABLE customer (
  customer_id INT NOT NULL,
  customer_lname VARCHAR(40) NOT NULL,
  customer_initial VARCHAR(5),
  customer_fname VARCHAR(40) NOT NULL,
  customer_email VARCHAR(40),
  customer_phone VARCHAR(20),
  fk_store_id INT,
  PRIMARY KEY (customer_id),
  FOREIGN KEY (fk_store_id)
      REFERENCES store(store_id)
);

-- orders
CREATE TABLE orders (
  order_id INT NOT NULL,
  order_date DATETIME NOT NULL,
  order_total_price DOUBLE,
  fk_store_id INT,
  fk_staff_id INT,
  fk_customer_id INT,
  PRIMARY KEY (order_id),
  FOREIGN KEY (fk_customer_id)
      REFERENCES customer(customer_id),
  FOREIGN KEY (fk_staff_id)
      REFERENCES staff(staff_id),
  FOREIGN KEY (fk_store_id)
      REFERENCES store(store_id)
);

-- order_detail
CREATE TABLE order_detail (
  order_detail_id INT NOT NULL,
  fk_order_id INT,
  fk_book_id INT,
  fk_pastry_id INT,
  fk_beverage_id INT,
  quantity_ordered INT NOT NULL,
  detail_total_price DOUBLE,
  PRIMARY KEY (order_detail_id),
  FOREIGN KEY (fk_beverage_id)
      REFERENCES beverage(beverage_id),
  FOREIGN KEY (fk_pastry_id)
      REFERENCES pastry(pastry_id),
  FOREIGN KEY (fk_book_id)
      REFERENCES book(book_id),
  FOREIGN KEY (fk_order_id)
      REFERENCES orders(order_id)
);

-- payment
CREATE TABLE payment (
  payment_id INT NOT NULL,
  payment_date DATETIME NOT NULL,
  payment_amount DOUBLE NOT NULL,
  payment_type VARCHAR(10) NOT NULL,
  fk_order INT,
  fk_staff_id INT,
  fk_customer_id INT,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (fk_customer_id)
      REFERENCES customer(customer_id),
  FOREIGN KEY (fk_order)
      REFERENCES orders(order_id),
  FOREIGN KEY (fk_staff_id)
      REFERENCES staff(staff_id)
);

-- beverage_detail
CREATE TABLE beverage_detail (
  beverage_detail_id INT NOT NULL,
  fk_order_detail_id INT NOT NULL,
  fk_beverage_id INT NOT NULL,
  fk_milk_id INT,
  fk_syrup_id INT,
  quantity INT NOT NULL,
  PRIMARY KEY (beverage_detail_id),
  FOREIGN KEY (fk_syrup_id)
      REFERENCES syrup(syrup_id),
  FOREIGN KEY (fk_milk_id)
      REFERENCES milk(milk_id),
  FOREIGN KEY (fk_beverage_id)
      REFERENCES beverage(beverage_id),
  FOREIGN KEY (fk_order_detail_id)
      REFERENCES order_detail(order_detail_id)
);

-- insert data
-- store
INSERT INTO store (store_id, store_name) VALUES ('1', 'Olive Pigeon Bookstore Cafe');

-- staff
INSERT INTO staff (staff_id, staff_lname, staff_initial, staff_fname, staff_email, staff_phone, staff_job_title, staff_hourly_wage, fk_store_id) VALUES ('1', 'Pigeon', NULL, 'Olive', 'olive.pigeon@proton.me', '514-384-3846', 'Owner', '35', '1');
INSERT INTO staff (staff_id, staff_lname, staff_initial, staff_fname, staff_email, staff_phone, staff_job_title, staff_hourly_wage, fk_store_id) VALUES ('2', 'Roy', NULL, 'Adrian', 'adrian.roy@proton.me', '416-283-2038', 'Manager', '32', '1');
INSERT INTO staff (staff_id, staff_lname, staff_initial, staff_fname, staff_email, staff_phone, staff_job_title, staff_hourly_wage, fk_store_id) VALUES ('3', 'Sokolova', NULL, 'Alina', 'alina.sokolova@proton.me', '514-229-9276', 'Manager', '32', '1');
INSERT INTO staff (staff_id, staff_lname, staff_initial, staff_fname, staff_email, staff_phone, staff_job_title, staff_hourly_wage, fk_store_id) VALUES ('4', 'Lee', NULL, 'Lydia', 'lydia.lee@proton.me', NULL, 'Barista', '27', '1');
INSERT INTO staff (staff_id, staff_lname, staff_initial, staff_fname, staff_email, staff_phone, staff_job_title, staff_hourly_wage, fk_store_id) VALUES ('5', 'Azimi', NULL, 'Ali', 'ali.azimi@proton.me', '902-847-8475', 'Bookseller', '27', '1');

-- customer
INSERT INTO customer (customer_id, customer_lname, customer_initial, customer_fname, customer_email, customer_phone, fk_store_id) VALUES ('0', '0', NULL, '0', 'NULL', 'NULL', '1');
INSERT INTO customer (customer_id, customer_lname, customer_initial, customer_fname, customer_email, customer_phone, fk_store_id) VALUES ('1', 'L', NULL, 'Chloe', 'chloe165@gmail.com', '514-234-2839', '1');
INSERT INTO customer (customer_id, customer_lname, customer_initial, customer_fname, customer_email, customer_phone, fk_store_id) VALUES ('2', 'Leblanc', 'S', 'Amelia', 'amelia_leblanc45@gmail.com', NULL, '1');
INSERT INTO customer (customer_id, customer_lname, customer_initial, customer_fname, customer_email, customer_phone, fk_store_id) VALUES ('3', 'G', NULL, 'Zorawar', 'zlikesbooks@gmail.com', NULL, '1');
INSERT INTO customer (customer_id, customer_lname, customer_initial, customer_fname, customer_email, customer_phone, fk_store_id) VALUES ('4', 'S', 'L', 'Leo', 'leolion@gmail.com', '902-139-3846', '1');
INSERT INTO customer (customer_id, customer_lname, customer_initial, customer_fname, customer_email, customer_phone, fk_store_id) VALUES ('5', 'S', NULL, 'Mia', 'miamia@gmail.com', NULL, '1');
INSERT INTO customer (customer_id, customer_lname, customer_initial, customer_fname, customer_email, customer_phone, fk_store_id) VALUES ('6', 'Gallant', 'K', 'O', 'okgallant@hotmail.com', '416-726-8364', '1');
INSERT INTO customer (customer_id, customer_lname, customer_initial, customer_fname, customer_email, customer_phone, fk_store_id) VALUES ('7', 'T', 'F', 'Weston', 'eastweston@gmail.com', NULL, '1');

-- book
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('0', '0', NULL, NULL, NULL, NULL);
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('1', 'Martyr!', '8', '26.99', ' 9780593537619', '2024-01-23');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('2', 'The Adventures of Amina al-Sirafi', '4', '24.99', '  9780008381349', '2023-03-02');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('3', 'Welcome to the Hyunam-Dong Bookshop', '7', '25.99', '9781639732425', '2024-02-20');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('4', 'One Hundred Years of Solitude', '2', '17.99', '9780061120091', '2006-05-30');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('5', 'Honey Girl', '2', '16.99', ' 9780778311027', '2021-02-23');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('6', 'Days at the Morisaki Bookshop', '6', '22.99', '9780063278677', '2023-07-04');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('7', 'More Days at the Morisaki Bookshop', '10', '26.99', '9780063278714', '2024-07-02');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('8', 'This Is How You Lose the Time War', '3', '18.99', '9781534431010', '2019-07-16');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('9', 'Atacama', '1', '19.99', '9781773634777', '2021-09-21');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('10', 'Scarborough', '3', '23.99', '9781551526775', '2017-05-02');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('11', 'The Circus Train', '1', '22.99', '9781443465007', '2022-03-22');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('12', 'The Eternal Audience of One', '2', '21.99', '9781982164423', '2021-08-10');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('13', 'You Exist Too Much', '4', '23.99', '9781948226509', '2020-06-09');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('14', 'My Friends', '1', '25.99', '9780735247178', '2024-01-09');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('15', 'Hotline', '2', '23.99', '9781550655940', '2022-03-01');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('16', 'Labyrinths', '1', '16.99', '9780811200127', '2017-05-17');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('17', 'Selected Poems', '2', '19.99', '9780713992700', '1999-09-30');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('18', 'Invisible Cities', '4', '14.99', '9780156453806', '1978-05-03');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('19', 'Things and Thoughts', '2', '23.99', '9781646054039', '2025-11-04');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('20', 'Even the Stars Look Lonesome', '1', '18.99', '9780375500312', '1997-08-05');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('21', 'Letter to My Daughter', '2', '20.99', '9781400066124', '2008-09-23');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('22', 'Sister Outsider', '5', '22.99', '9781580911863', '2007-08-01');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('23', 'Gate of the Sun', '1', '20.99', '9780976395027', '2005-01-01');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('24', 'The Traveling Cat Chronicles', '5', '24.99', '9780451491336', '2018-10-23');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('25', 'All the Parts We Exile', '6', '25.99', '9781039007062', '2025-02-25');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('26', 'We Have Always Been Here', '2', '19.99', '9781529404869', '2019-09-05');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('27', 'Pilgrim Bell', '2', '17.99', '9781644450598', '2021-08-03');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('28', 'Things You May Find Hidden in My Ear', '7', '22.99', '9780872868601', '2022-04-12');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('29', 'The City of Brass', '5', '23.99', '9780062678102', '2017-11-14');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('30', 'The Kingdom of Copper', '3', '24.99', '9781987156683', '2019-01-22');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('31', 'The Empire of Gold', '2', '25.99', '9780062678164', '2020-06-30');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('32', 'My Mountain Country', '1', '21.99', '9780999261347', '2019-08-27');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('33', 'Grokking Algorithms', '2', '15.99', '9781617292231', '2016-05-30');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('34', 'The Immortal Game', '1', '17.99', '9780307387660', '2007-09-04');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('35', 'How to Play and Win at Chess', '1', '15.99', '9780754834557', '2021-06-08');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('36', 'Original Sisters', '2', '26.99', '9780593316146', '2021-11-09');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('37', 'The Mathematical Experience', '1', '15.99', '9780395929681', '1999-01-14');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('38', 'The Prince and the Dressmaker', '3', '18.99', '9781626723634', '2018-02-13');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('39', 'Thieves', '2', '19.99', '9781838741198', '2022-09-22');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('40', 'Land of Mirrors', '4', '23.99', '9781770467545', '2025-02-04');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('41', 'The Book of Change', '3', '24.99', '9781912836833', '2021-10-21');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('42', 'All Good Things', '2', '22.99', '9781912836000', '2019-12-03');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('43', 'The Little Frog''s Guide to Self-Care', '6', '14.99', '9781837991013', '2023-08-10');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('44', 'The Little Frog''s Guide to Life', '7', '16.99', '9781837994731', '2025-08-14');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('45', 'One Piece, Volume 1: Romance Dawn', '2', '12.99', '9781569319017', '2003-09-02');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('46', 'Please to the Table: The Russian Cookbook', '1', '15.99', '9780894807534', '1990-01-11');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('47', 'Frog and Toad Together', '2', '8.99', '9780694012985', '1999-03-06');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('48', 'Frog and Toad Are Friends', '2', '8.99', '9780064440202', '2003-02-18');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('49', 'Frogh and Toad All Year', '2', '8.99', '9780060239503', '1976-08-25');
INSERT INTO book (book_id, book_name, book_quantity, book_price, book_isbn, book_pub_date) VALUES ('50', 'Days with Frog and Toad', '4', '8.99', '9780064440585', '2004-02-03');

-- author
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('1', 'Akbar', NULL, 'Kaveh');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('2', 'Chakraborty', 'A', 'Shannon');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('3', 'Hwang', NULL, 'Bo-reum');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('4', 'Garcia Marquez', NULL, 'Gabriel');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('5', 'Rogers', NULL, 'Morgan');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('6', 'Yagisawa', NULL, 'Satori');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('7', 'El-Mohtar', NULL, 'Amal');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('8', 'Gladstone', NULL, 'Max');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('9', 'Rodriguez', NULL, 'Carmen');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('10', 'Hernandez', NULL, 'Catherine');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('11', 'Parikh', NULL, 'Amita');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('12', 'Ngamije', NULL, 'Remy');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('13', 'Arafat', NULL, 'Zaina');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('14', 'Matar', NULL, 'Hisham');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('15', 'Nasrallah', NULL, 'Dimitri');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('16', 'Luis Borges', NULL, 'Jorge');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('17', 'Calvino', NULL, 'Italo');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('19', 'Gorbunova', NULL, 'Alla');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('20', 'Angelou', NULL, 'Maya');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('21', 'Lorde', NULL, 'Audre');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('22', 'Khoury', NULL, 'Elias');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('23', 'Arikawa', NULL, 'Hiro');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('24', 'Nozari', NULL, 'Roza');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('25', 'Habib', NULL, 'Samra');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('26', 'Abu Toha', NULL, 'Mosab');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('27', 'Ye', NULL, 'Lijun');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('28', 'Bhargava', 'Y', 'Aditya');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('29', 'Shenk', NULL, 'David');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('30', 'Saunders', NULL, 'John');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('31', 'Kunz', NULL, 'Anita');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('32', 'Davis', 'J', 'Philip');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('33', 'Hersh', NULL, 'Reuben');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('34', 'Wang', NULL, 'Jen');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('35', 'Bryon', NULL, 'Lucie');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('36', 'Medem', NULL, 'Maria');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('37', 'Ellcock', NULL, 'Stephen');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('38', 'Eequay', NULL, 'Maybell');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('39', 'Oda', NULL, 'Eiichiro');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('40', 'von Bremzen', NULL, 'Anya');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('41', 'Welchman', 'C', 'John');
INSERT INTO author (author_id, author_lname, author_initial, author_fname) VALUES ('42', 'Lobel', NULL, 'Arnold');

-- genre
INSERT INTO genre (genre_id, genre_name) VALUES ('1', 'fiction');
INSERT INTO genre (genre_id, genre_name) VALUES ('2', 'nonfiction');
INSERT INTO genre (genre_id, genre_name) VALUES ('3', 'children''s');
INSERT INTO genre (genre_id, genre_name) VALUES ('4', 'poetry');
INSERT INTO genre (genre_id, genre_name) VALUES ('5', 'short stories');
INSERT INTO genre (genre_id, genre_name) VALUES ('6', 'literary');
INSERT INTO genre (genre_id, genre_name) VALUES ('7', 'memoir');
INSERT INTO genre (genre_id, genre_name) VALUES ('8', 'historical');
INSERT INTO genre (genre_id, genre_name) VALUES ('9', 'queer');
INSERT INTO genre (genre_id, genre_name) VALUES ('10', 'magical realism');
INSERT INTO genre (genre_id, genre_name) VALUES ('11', 'computer science');
INSERT INTO genre (genre_id, genre_name) VALUES ('12', 'chess');
INSERT INTO genre (genre_id, genre_name) VALUES ('13', 'biography');
INSERT INTO genre (genre_id, genre_name) VALUES ('14', 'mathematics');
INSERT INTO genre (genre_id, genre_name) VALUES ('15', 'graphic novel');
INSERT INTO genre (genre_id, genre_name) VALUES ('16', 'picture book');
INSERT INTO genre (genre_id, genre_name) VALUES ('17', 'manga');
INSERT INTO genre (genre_id, genre_name) VALUES ('18', 'cooking');
INSERT INTO genre (genre_id, genre_name) VALUES ('19', 'self-help');
INSERT INTO genre (genre_id, genre_name) VALUES ('20', 'essay');
INSERT INTO genre (genre_id, genre_name) VALUES ('21', 'fantasy');
INSERT INTO genre (genre_id, genre_name) VALUES ('22', 'art');

-- book_author
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('1', '1');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('2', '2');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('3', '3');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('4', '4');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('5', '5');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('6', '6');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('6', '7');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('7', '8');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('8', '8');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('9', '9');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('10', '10');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('11', '11');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('12', '12');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('13', '13');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('14', '14');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('15', '15');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('16', '16');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('16', '17');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('17', '18');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('19', '19');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('20', '20');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('20', '21');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('21', '22');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('22', '23');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('23', '24');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('24', '25');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('25', '26');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('1', '27');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('26', '28');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('2', '29');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('2', '30');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('2', '31');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('27', '32');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('28', '33');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('29', '34');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('30', '35');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('31', '36');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('32', '37');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('33', '37');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('34', '38');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('35', '39');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('36', '40');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('37', '41');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('37', '42');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('38', '43');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('38', '44');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('39', '45');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('40', '46');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('41', '46');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('42', '47');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('42', '48');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('42', '49');
INSERT INTO book_author (fk_author_id, fk_book_id) VALUES ('42', '50');

-- publisher
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('1', 'Knopf');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('2', 'Harper Voyager');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('3', 'Bloomsbury Publishing');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('4', 'Harper Perennial');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('5', 'Park Row Books');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('6', 'Saga Press');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('7', 'Fernwood Publishing');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('8', 'Arsenal Pulp Press');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('9', 'HarperCollins Publishers');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('10', 'Scout Press');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('11', 'Catapult');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('12', 'Hamish Hamilton');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('13', 'Vehicule Press');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('14', 'New Directions');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('15', 'Penguin Books');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('16', 'Mariner Books');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('17', 'Deep Vellum');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('18', 'Random House');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('19', 'Crossing Press');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('20', 'Archipelago');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('21', 'Berkley');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('22', 'riverrun');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('23', 'Graywolf Press');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('24', 'City Lights Publishers');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('25', 'World Poetry Books');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('26', 'Manning Publications');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('27', 'Lorenz Books');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('28', 'Pantheon');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('29', 'First Second');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('30', 'Nobrow');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('31', 'Drawn And Quarterly');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('32', 'September Publishing');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('33', 'Summersdale');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('34', 'VIZ Media');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('35', 'Workman Publishing');
INSERT INTO publisher (publisher_id, publisher_name) VALUES ('36', 'HarperFestival');

-- book_publisher
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('1', '1');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('2', '2');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('3', '3');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('4', '4');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('5', '5');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('4', '6');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('4', '7');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('6', '8');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('7', '9');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('8', '10');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('9', '11');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('10', '12');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('11', '13');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('12', '14');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('13', '15');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('14', '16');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('15', '17');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('16', '18');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('17', '19');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('18', '20');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('18', '21');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('19', '22');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('20', '23');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('21', '24');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('1', '25');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('22', '26');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('23', '27');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('24', '28');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('2', '29');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('9', '30');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('2', '31');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('25', '32');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('26', '33');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('18', '34');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('27', '35');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('28', '36');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('16', '37');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('29', '38');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('30', '39');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('31', '40');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('32', '41');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('32', '42');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('33', '43');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('33', '44');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('34', '45');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('35', '46');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('36', '47');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('9', '48');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('9', '49');
INSERT INTO book_publisher (fk_publisher_id, fk_book_id) VALUES ('9', '50');

-- book_genre
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '1');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '1');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('9', '1');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '2');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('8', '2');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('9', '2');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '3');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '3');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '4');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '4');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('10', '4');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '5');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('9', '5');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '6');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '6');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '7');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '7');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '8');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '8');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('9', '8');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '9');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '9');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('8', '9');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '10');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '10');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('9', '10');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '11');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('8', '11');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '12');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '12');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('8', '12');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '13');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '13');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('9', '13');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '14');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '14');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('8', '14');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '15');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '15');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('8', '15');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '16');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('5', '16');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '16');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '17');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('4', '17');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '17');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '18');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('4', '18');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '18');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('10', '18');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '19');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('5', '19');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '19');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '20');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('4', '20');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('7', '20');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('20', '20');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '21');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('4', '21');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('7', '21');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('20', '21');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '22');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('7', '22');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('9', '22');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('20', '22');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '23');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '23');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('8', '23');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '24');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('6', '24');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '25');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('7', '25');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('9', '25');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '26');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('7', '26');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('9', '26');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '27');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('4', '27');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('9', '27');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '28');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('4', '28');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('7', '28');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '29');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('8', '29');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('21', '29');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '30');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('8', '30');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('21', '30');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '31');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('8', '31');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('21', '31');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '32');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('4', '32');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('7', '32');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '33');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('11', '33');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '34');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('12', '34');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '35');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('12', '35');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '36');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('13', '36');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('22', '36');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '37');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('14', '37');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('22', '37');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '38');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('9', '38');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('15', '38');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '39');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('9', '39');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('15', '39');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '40');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('10', '40');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('15', '40');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '41');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('8', '41');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('22', '41');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '42');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('8', '42');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('22', '42');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '43');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('16', '43');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('19', '43');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '44');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('16', '44');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('19', '44');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '45');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('17', '45');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('2', '46');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('7', '46');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('18', '46');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '47');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('3', '47');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('16', '47');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '48');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('3', '48');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('16', '48');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '49');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('3', '49');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('16', '49');

INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('1', '50');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('3', '50');
INSERT INTO book_genre (fk_genre_id, fk_book_id) VALUES ('16', '50');

-- milk
INSERT INTO milk (milk_id, milk_name) VALUES ('0', '0');
INSERT INTO milk (milk_id, milk_name) VALUES ('1', 'whole');
INSERT INTO milk (milk_id, milk_name) VALUES ('2', 'oat');
INSERT INTO milk (milk_id, milk_name) VALUES ('3', 'soy');

-- syrup
INSERT INTO syrup (syrup_id, syrup_name) VALUES ('0', '0');
INSERT INTO syrup (syrup_id, syrup_name) VALUES ('1', 'vanilla');
INSERT INTO syrup (syrup_id, syrup_name) VALUES ('2', 'simple');
INSERT INTO syrup (syrup_id, syrup_name) VALUES ('3', 'chocolate');
INSERT INTO syrup (syrup_id, syrup_name) VALUES ('4', 'brown sugar');
INSERT INTO syrup (syrup_id, syrup_name) VALUES ('5', 'cinnamon');

-- beverage
INSERT INTO beverage (beverage_id, beverage_name, beverage_desc, beverage_price, beverage_size) VALUES ('0', '0', NULL, NULL, '0');
INSERT INTO beverage (beverage_id, beverage_name, beverage_desc, beverage_price, beverage_size) VALUES ('1', 'espresso', 'two shots of espresso', '2.99', '2');
INSERT INTO beverage (beverage_id, beverage_name, beverage_desc, beverage_price, beverage_size) VALUES ('2', 'cortado', 'two shots of espresso with equal parts milk', '3.99', '4');
INSERT INTO beverage (beverage_id, beverage_name, beverage_desc, beverage_price, beverage_size) VALUES ('3', 'cappuccino', 'two shots of espresso with milk foam', '3.99', '6');
INSERT INTO beverage (beverage_id, beverage_name, beverage_desc, beverage_price, beverage_size) VALUES ('4', 'latte', 'two shots of espresso with steamed milk', '4.49', '10');
INSERT INTO beverage (beverage_id, beverage_name, beverage_desc, beverage_price, beverage_size) VALUES ('5', 'latte', 'two shots of espresso with steamed milk', '4.99', '12');
INSERT INTO beverage (beverage_id, beverage_name, beverage_desc, beverage_price, beverage_size) VALUES ('6', 'filter coffee', 'classic filter coffee', '2.99', '12');
INSERT INTO beverage (beverage_id, beverage_name, beverage_desc, beverage_price, beverage_size) VALUES ('7', 'london fog', 'earl grey tea with vanilla syrup and steamed milk', '3.99', '12');
INSERT INTO beverage (beverage_id, beverage_name, beverage_desc, beverage_price, beverage_size) VALUES ('8', 'tea', 'earl grey, ceylon black tea, jasmine green, turmeric ginger, peppermint', '2.99', '12');
INSERT INTO beverage (beverage_id, beverage_name, beverage_desc, beverage_price, beverage_size) VALUES ('9', 'matcha latte', 'matcha powder with steamed milk', '4.99', '12');
INSERT INTO beverage (beverage_id, beverage_name, beverage_desc, beverage_price, beverage_size) VALUES ('10', 'cold brew', 'filter coffee steeped for 24 hours', '3.99', '12');

-- pasdtry
INSERT INTO pastry (pastry_id, pastry_name, pastry_desc, pastry_quantity, pastry_price) VALUES ('0', '0', NULL, NULL, NULL);
INSERT INTO pastry (pastry_id, pastry_name, pastry_desc, pastry_quantity, pastry_price) VALUES ('1', 'financier', 'almond flour cake with orange zest and cranberries', '16', '3.99');
INSERT INTO pastry (pastry_id, pastry_name, pastry_desc, pastry_quantity, pastry_price) VALUES ('2', 'chocolate cookie', 'classic chocolate chip cookie with dark chocolate chips', '24', '2.99');
INSERT INTO pastry (pastry_id, pastry_name, pastry_desc, pastry_quantity, pastry_price) VALUES ('3', 'gingerbread cookie', 'ginger cookie', '16', '2.99');
INSERT INTO pastry (pastry_id, pastry_name, pastry_desc, pastry_quantity, pastry_price) VALUES ('4', 'snickerdoodle', 'cookie with cinnamon and vanilla', '16', '2.99');
INSERT INTO pastry (pastry_id, pastry_name, pastry_desc, pastry_quantity, pastry_price) VALUES ('5', 'ealr grey muffin', 'muffin with earl grey tea leaves, lemon zest, blueberries', '12', '3.99');
INSERT INTO pastry (pastry_id, pastry_name, pastry_desc, pastry_quantity, pastry_price) VALUES ('6', 'feta scone', 'scone with feta, tomato, spinach', '12', '3.99');

-- orders
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('1', '2026-04-11', '18.99', '1', '1', '1');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('2', '2026-04-11', '7.98', '1', '1', '1');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('3', '2026-04-11', '7.98', '1', '1', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('4', '2026-04-11', '53.96', '1', '2', '2');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('5', '2026-04-11', '29.98', '1', '2', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('6', '2026-04-11', '104.95', '1', '2', '3');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('7', '2026-04-11', '35.96', '1', '2', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('8', '2026-04-11', '58.97', '1', '2', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('9', '2026-04-11', '50.98', '1', '2', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('10', '2026-04-11', '10.97', '1', '2', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('11', '2026-04-11', '25.99', '1', '2', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('12', '2026-04-11', '39.95', '1', '1', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('13', '2026-04-11', '2.99', '1', '4', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('14', '2026-04-11', '21.94', '1', '4', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('15', '2026-04-12', '9.48', '1', '4', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('16', '2026-04-12', '11.96', '1', '4', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('17', '2026-04-12', '15.96', '1', '4', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('18', '2026-04-12', '17.99', '1', '5', '4');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('19', '2026-04-12', '22.99', '1', '5', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('20', '2026-04-12', '142.94', '1', '5', '5');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('21', '2026-04-12', '48.98', '1', '5', '6');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('22', '2026-04-12', '43.98', '1', '5', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('23', '2026-04-12', '62.97', '1', '3', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('24', '2026-04-12', '23.99', '1', '3', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('25', '2026-04-12', '88.96', '1', '3', '2');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('26', '2026-04-12', '2.99', '1', '4', '1');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('27', '2026-04-12', '5.98', '1', '4', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('28', '2026-04-12', '65.96', '1', '3', '7');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('29', '2026-04-12', '51.97', '1', '3', '2');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('30', '2026-04-12', '28.97', '1', '4', '0');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('31', '2026-04-12', '8.48', '1', '4', '7');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('32', '2026-04-12', '171.93', '1', '5', '1');
INSERT INTO orders (order_id, order_date, order_total_price, fk_store_id, fk_staff_id, fk_customer_id) VALUES ('33', '2026-04-12', '32.94', '1', '4', '0');

-- order_detail
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('1', '1', '20', NULL, NULL, '1', '18.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('2', '2', NULL, '1', NULL, '2', '7.98');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('3', '3', NULL, '2', NULL, '1', '2.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('4', '3', NULL, NULL, '5', '1', '4.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('5', '4', '28', NULL, NULL, '2', '45.98');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('6', '4', NULL, NULL, '7', '2', '7.98');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('7', '5', '25', NULL, NULL, '1', '25.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('8', '5', NULL, NULL, '2', '1', '3.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('9', '6', '10', NULL, NULL, '1', '23.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('10', '6', '16', NULL, NULL, '1', '16.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('11', '6', '24', NULL, NULL, '1', '24.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('12', '6', '38', NULL, NULL, '1', '18.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('13', '6', '29', NULL, NULL, '1', '19.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('14', '7', '47', NULL, NULL, '1', '8.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('15', '7', '48', NULL, NULL, '1', '8.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('16', '7', '49', NULL, NULL, '1', '8.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('17', '7', '50', NULL, NULL, '1', '8.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('18', '8', '38', NULL, NULL, '2', '18.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('19', '8', '42', NULL, NULL, '1', '22.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('20', '8', '43', NULL, NULL, '2', '16.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('21', '9', '2', NULL, NULL, '1', '24.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('22', '9', '3', NULL, NULL, '1', '25.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('23', '10', NULL, '3', NULL, '2', '2.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('24', '10', NULL, '4', NULL, '3', '2.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('25', '10', NULL, NULL, '9', '1', '4.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('26', '11', '3', NULL, NULL, '1', '25.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('27', '12', '3', NULL, NULL, '1', '25.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('28', '12', NULL, '1', NULL, '2', '7.98');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('29', '12', NULL, NULL, '8', '2', '5.98');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('30', '13', NULL, NULL, '6', '1', '2.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('31', '14', NULL, '1', NULL, '1', '3.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('32', '14', NULL, '5', NULL, '1', '3.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('33', '14', NULL, NULL, '1', '2', '5.98');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('34', '14', NULL, NULL, '2', '1', '3.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('35', '14', NULL, NULL, '7', '1', '3.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('36', '15', NULL, NULL, '4', '1', '4.49');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('37', '15', NULL, NULL, '5', '1', '4.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('38', '16', NULL, '3', NULL, '2', '5.98');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('39', '16', NULL, NULL, '6', '2', '5.98');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('40', '17', NULL, NULL, '3', '1', '3.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('41', '17', NULL, NULL, '10', '3', '11.97');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('42', '18', '4', NULL, NULL, '1', '17.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('43', '19', '6', NULL, NULL, '2', '22.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('44', '20', '6', NULL, NULL, '2', '45.98');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('45', '20', '7', NULL, NULL, '2', '53.98');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('46', '20', '12', NULL, NULL, '1', '21.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('47', '20', '22', NULL, NULL, '1', '20.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('48', '21', '25', NULL, NULL, '1', '25.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('49', '21', '28', NULL, NULL, '1', '22.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('50', '22', '13', NULL, NULL, '1', '23.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('51', '22', '39', NULL, NULL, '1', '19.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('52', '23', '1', NULL, NULL, '1', '26.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('53', '23', '5', NULL, NULL, '1', '16.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('54', '23', '8', NULL, NULL, '1', '18.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('55', '24', '8', NULL, NULL, '1', '18.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('56', '24', NULL, NULL, '5', '1', '4.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('57', '25', '2', NULL, NULL, '1', '24.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('58', '25', '9', NULL, NULL, '1', '19.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('59', '25', '26', NULL, NULL, '1', '19.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('60', '25', '29', NULL, NULL, '1', '23.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('61', '26', NULL, NULL, '6', '2', '2.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('62', '27', NULL, NULL, '6', '1', '2.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('63', '27', NULL, NULL, '8', '1', '2.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('64', '28', '33', NULL, NULL, '1', '15.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('65', '28', '34', NULL, NULL, '1', '17.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('66', '28', '35', NULL, NULL, '2', '31.98');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('67', '29', '38', NULL, NULL, '1', '18.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('68', '29', '40', NULL, NULL, '2', '23.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('69', '29', '47', NULL, NULL, '2', '8.99');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('70', '30', '22', NULL, NULL, '1', '22.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('71', '30', NULL, '2', NULL, '2', '5.98');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('72', '31', NULL, '6', NULL, '1', '3.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('73', '31', NULL, NULL, '4', '1', '4.49');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('74', '32', '1', NULL, NULL, '2', '53.98');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('75', '32', '4', NULL, NULL, '1', '17.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('76', '32', '14', NULL, NULL, '1', '25.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('77', '32', '25', NULL, NULL, '1', '25.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('78', '32', '29', NULL, NULL, '2', '47.98');

INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('79', '33', '43', NULL, NULL, '1', '14.99');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('80', '33', NULL, '1', NULL, '2', '7.98');
INSERT INTO order_detail (order_detail_id, fk_order_id, fk_book_id, fk_pastry_id, fk_beverage_id, quantity_ordered, detail_total_price) VALUES ('81', '33', NULL, NULL, '5', '2', '9.98');

-- payment
INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('1', '2026-04-11', '18.99', 'card', '1', '1', '1');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('2', '2026-04-11', '7.98', 'card', '2', '1', '1');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('3', '2026-04-11', '7.98', 'card', '3', '1', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('4', '2026-04-11', '53.96', 'card', '4', '2', '2');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('5', '2026-04-11', '29.98', 'card', '5', '2', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('6', '2026-04-11', '104.95', 'card', '6', '2', '3');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('7', '2026-04-11', '35.96', 'card', '7', '2', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('8', '2026-04-11', '58.97', 'card', '8', '2', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('9', '2026-04-11', '50.98', 'card', '9', '2', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('10', '2026-04-11', '10.97', 'card', '10', '2', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('11', '2026-04-11', '10', 'cash', '11', '2', '0');
INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('12', '2026-04-11', '15.99', 'card', '11', '2', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('13', '2026-04-11', '39.95', 'card', '12', '1', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('14', '2026-04-11', '2.99', 'card', '13', '4', '1');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('15', '2026-04-11', '21.94', 'card', '14', '4', '1');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('16', '2026-04-12', '9.48', 'card', '15', '4', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('17', '2026-04-12', '11.96', 'card', '16', '4', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('18', '2026-04-12', '15.96', 'card', '17', '4', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('19', '2026-04-12', '17.99', 'card', '18', '5', '4');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('20', '2026-04-12', '22.99', 'card', '19', '5', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('21', '2026-04-12', '142.94', 'card', '20', '5', '5');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('22', '2026-04-12', '48.98', 'card', '21', '5', '6');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('23', '2026-04-12', '43.98', 'card', '22', '5', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('24', '2026-04-12', '62.97', 'card', '23', '3', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('25', '2026-04-12', '5', 'cash', '24', '3', '0');
INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('26', '2026-04-12', '18.99', 'card', '24', '3', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('27', '2026-04-12', '88.96', 'card', '25', '3', '2');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('28', '2026-04-12', '2.99', 'card', '26', '4', '1');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('29', '2026-04-12', '5.98', 'card', '27', '4', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('30', '2026-04-12', '65.96', 'card', '28', '3', '7');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('31', '2026-04-12', '51.97', 'card', '29', '3', '2');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('32', '2026-04-12', '28.97', 'card', '30', '4', '0');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('33', '2026-04-12', '8.48', 'card', '31', '4', '7');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('34', '2026-04-12', '171.93', 'card', '32', '5', '1');

INSERT INTO payment (payment_id, payment_date, payment_amount, payment_type, fk_order, fk_staff_id, fk_customer_id) VALUES ('35', '2026-04-12', '32.94', 'card', '33', '4', '0');

-- beverage_detail
INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('1', '4', '5', '1', '1', '1');

INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('2', '6', '7', '1', NULL, '2');

INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('3', '8', '2', '2', NULL, '1');

INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('4', '25', '9', '3', '2', '1');

INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('5', '29', '8', NULL, NULL, '2');

INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('6', '30', '6', NULL, '4', '1');

INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('7', '33', '1', NULL, NULL, '2');

INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('8', '34', '2', '1', NULL, '1');

INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('9', '35', '7', '3', NULL, '1');

INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('10', '36', '4', '2', '4', '1');

INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('11', '37', '5', '1', '1', '1');

INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('12', '39', '6', NULL, NULL, '2');

INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('13', '40', '3', '1', NULL, '1');

INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('14', '41', '10', NULL, NULL, '1');
INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('15', '41', '10', NULL, '1', '1');
INSERT INTO beverage_detail (beverage_detail_id, fk_order_detail_id, fk_beverage_id, fk_milk_id, fk_syrup_id, quantity) VALUES ('16', '41', '10', NULL, '2', '1');
