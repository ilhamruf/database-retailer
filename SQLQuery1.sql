CREATE DATABASE Retailer_DB
GO

USE Retailer_DB

CREATE TABLE users(
	uid INT NOT NULL IDENTITY(1,1),
	name VARCHAR(50) NOT NULL,
	username VARCHAR(50) NOT NULL,
	keypass VARCHAR(250) NOT NULL,
	status TINYINT NOT NULL DEFAULT 1,
	PRIMARY KEY (uid)

)
CREATE TABLE usersrule(
	uid INT NOT NULL IDENTITY(1,1),
	id_user INT NOT NULL,
	menu INT NOT NULL,
	access BIT DEFAULT 0,
	PRIMARY KEY (uid)
	)

	CREATE TABLE products(
	uid INT NOT NULL IDENTITY(1,1),
	name VARCHAR(50) NOT NULL,
	status TINYINT NOT NULL DEFAULT 1,
	PRIMARY KEY (uid)
)
CREATE TABLE inventories(
	uid INT NOT NULL IDENTITY(1,1),
	id_user INT NOT NULL,
	logdate DATE NOT NULL,
	description VARCHAR(250) DEFAULT 'Belum diisi',
	status TINYINT NOT NULL DEFAULT 1,
	PRIMARY KEY (uid)
	)

	CREATE TABLE inventorylogs(
	uid INT NOT NULL IDENTITY(1,1),
	id_inventory INT NOT NULL,
	id_product INT NOT NULL,
	qty INT DEFAULT 0,
	PRIMARY KEY (uid)
	)

	ALTER TABLE usersrule ADD
	FOREIGN KEY (id_user) REFERENCES users(uid)
	ON DELETE CASCADE ON UPDATE CASCADE
	GO
	ALTER TABLE inventories ADD
	FOREIGN KEY (id_user) REFERENCES users(uid)
	ON DELETE CASCADE ON UPDATE CASCADE
	GO
	ALTER TABLE inventorylogs ADD
	FOREIGN KEY (id_inventory) REFERENCES inventories(uid)
	ON DELETE CASCADE ON UPDATE CASCADE
	GO
	ALTER TABLE inventorylogs ADD
	FOREIGN KEY (id_product) REFERENCES products(uid)
	ON DELETE CASCADE ON UPDATE CASCADE
	GO

	INSERT INTO users VALUES('Guest', 'guest' ,'guest','1')
	INSERT INTO users VALUES('Super Admin', 'sa' ,'adminadmin','1')
	INSERT INTO users VALUES('Ilham Maruf', 'ilh' ,'ilh','1')

	INSERT INTO products VALUES('XYZ Sarden Extra Pedas 35gr','1')
	INSERT INTO products VALUES('XYZ Makarel Extra Pedas 150gr','1')
	INSERT INTO products VALUES('XYZ Kecap Manis 125ml','1')
	INSERT INTO products VALUES('XYZ Sirup Karamel 250ml','1')
	INSERT INTO products VALUES('XYZ Batrai AA (Pack isi 4)','1')

	UPDATE products SET name = 'XYZ Batrai AA (pack isi 4)' WHERE uid = 5

	DELETE FROM products WHERE uid = 5

	SELECT COUNT(uid) AS Total FROM users WHERE status = 1
	SELECT name FROM products WHERE name LIKE '%Extra%'
	SELECT uid, menu FROM usersrule ORDER BY uid DESC

	SELECT TOP 3 id_product FROM inventories
	WHERE expdate BETWEEN '2024-1-1' AND '2028-1-1'

	SELECT name AS Produk,
	CASE status WHEN 1 THEN 'aktif'
		ELSE 'tidak aktif'
		END AS Status FROM products

SELECT*FROM  inventorylogs