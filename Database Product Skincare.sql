
-- Nama = Angelin Minarto
-- NIM = 2301850550

CREATE DATABASE Product_Skincare
Use Product_Skincare

-- DDL
Create table ProductSkincare
(
	ProductSkincare_ID varchar(8) NOT NULL,
	ProductSkincare_Name varchar(80) NOT NULL,
	ProductSkincare_Price int NOT NULL,
	ProductSkincare_TotalItem int NOT NULL,
	Primary Key (ProductSkincare_ID)
)

Create table StaffAdmin
(
	StaffAdmin_ID varchar(12) NOT NULL,
	StaffAdmin_Name varchar(40) NOT NULL,
	StaffAdmin_PhoneNumber varchar (13) NOT NULL,
	Primary Key (StaffAdmin_ID)
)

Create table Customer
(
	Customer_ID varchar(12) NOT NULL,
	Customer_Name varchar(40) NOT NULL,
	Customer_Gender varchar(1) NOT NULL,
	Customer_Address varchar(200) NOT NULL,
	Customer_PhoneNumber varchar(13) NOT NULL,
	Primary Key (Customer_ID)
)

Create table OrderProduct
(
	OrderProduct_ID varchar(12) NOT NULL,
	Customer_ID varchar(12) NOT NULL,
	OrderProduct_Date date NOT NULL,
	StaffAdmin_ID varchar (12) NOT NULL,
	Primary Key(OrderProduct_ID),
	Foreign Key(Customer_ID) References Customer(Customer_ID),
	Foreign Key(StaffAdmin_ID) References StaffAdmin(StaffAdmin_ID)
)

Create table OrderProductDetail
(
	OrderProductDetail_ID varchar(12) NOT NULL,
	Customer_ID varchar(12) NOT NULL,
	ProductSkincare_ID varchar(8) NOT NULL,
	OrderProduct_ID varchar(12) NOT NULL,
	Primary Key(OrderProductDetail_ID),
	Foreign Key(Customer_ID) References Customer(Customer_ID),
	Foreign Key(ProductSkincare_ID) References ProductSkincare(ProductSkincare_ID),
	Foreign Key(OrderProduct_ID) References OrderProduct(OrderProduct_ID)
)

Create table PaymentOrder
(
	PaymentOrder_ID varchar (12) NOT NULL,
	OrderProduct_Date date NOT NULL,
	ProductSkincare_ID varchar (8) NOT NULL,
	OrderProduct_ID varchar (12) NOT NULL,
	StaffAdmin_ID varchar(12) NOT NULL,
	Primary Key (PaymentOrder_ID),
	Foreign Key(ProductSkincare_ID) References ProductSkincare(ProductSkincare_ID),
	Foreign Key(OrderProduct_ID) References OrderProduct(OrderProduct_ID),
	Foreign Key(StaffAdmin_ID) References StaffAdmin(StaffAdmin_ID)
)

Alter table Customer
Add Constraint Customer_Gender Check
(
	Customer_Gender = 'F' OR
	Customer_Gender = 'M'
)

-- DML
-- Insert Data ProductSkincare
Insert Into ProductSkincare
Values('HTLNRP25','Nuxe Rose Petals Gentle Toning Lotion',245000,24),('SNNVCS50','Novexpert The Vitamin C Serum',560000,56),('ESLWB550','Laneige Water Bank Essence EX',550000,55)
Select * From ProductSkincare

-- Insert Data StaffAdmin
Insert into StaffAdmin
Values('AM0026','Angelin Minarto','081284562589'),('YH0003','Yohanes Hermanto','087826052001')
INSERT INTO StaffAdmin
VALUES('JO0045','Jonathan Orlando','081789247634')
Select * From StaffAdmin

-- Insert Data Customer
Insert into Customer
Values('BEYO5647R','Benny Erlando','M','Jl. Tanah Seratus No.12, Ciledug, Tangerang, Banten','087709525572'),('MERD2460X','Merry Darmewan','F','Jl. Melati No. 66, Karang Tengah, Tangerang, Banten','082178456809')
INSERT INTO Customer
VALUES('KSJN1992A','Kim Seok Jin','M','Jl. Bandung','087325696578')
INSERT INTO Customer
VALUES('FLSD7689V','Veronika Angel','F','Jl. Makassar','087729067489')
Select * From Customer

-- Insert Data Order Product
Insert into OrderProduct
Values('HTLNRP251AM','BEYO5647R','2019/01/25','AM0026'),('SNNVCS506YH','MERD2460X','2020/06/05','YH0003')
Select * From OrderProduct

-- Insert Data Order Product Detail
Insert into OrderProductDetail
Values('RHTLNRP251AM','BEYO5647R','HTLNRP25','HTLNRP251AM'),('RSNNVCS506YH','MERD2460X','SNNVCS50','SNNVCS506YH')
Select * From OrderProductDetail

-- Insert Data Payment Order
Insert Into PaymentOrder
Values('SHTLNRP251AM','2019/01/25','HTLNRP25','HTLNRP251AM','AM0026'),('SSNNVCS506YH','2020/06/05','SNNVCS50','SNNVCS506YH','YH0003')
Select * From PaymentOrder

-- CATATAN !!!!!!!!
-- SELECT : Memilih data yg ingin ditampilkan
-- FROM : Dari tabel yg mana (dimana)
-- WHERE : Utk kondisi
-- AS : Alias *biasanya utk rename kolom*
-- AND : sebelum dan sesudah AND hrs benar, akan error jika salah satu atau keduanya salah
-- OR : salah satu hrs benar atau keduanya jg boleh, tapi jika keduanya salah maka akan error
-- NOT : biasa dipakai "NOT NULL"
-- LIKE : mencari spesifik pattern dan biasanya menggunakan wildcard //biasa dipakke utk varchar 
-- TOP : dipakai utk mengambil data teratas

-- TOP syntax
-- SELECT TOP 2 * // 2 = 2 data teratas yg ingin diambil
-- FROM Customer //mengambil 2 data teratas 

-- WILDCARD
-- SELECT Customer_Name AS 'Nama yg tiga huruf'
-- FROM Customer
-- WHERE Customer_Name '% %% %' // mengeluarkan data nama yg 3 kata

-- SELECT 'Nama yg tiga huruf' = Customer_Name
-- FROM Customer
-- WHERE Customer_Name '% %% %'

-- AGGREGATE // COUNT, SUM, AVG, MIN, MAX
-- Count
Select Count(ProductSkincare_Price) AS [Total Count]
From ProductSkincare

-- SUM
Select SUM(ProductSkincare_TotalItem) AS [Jumlah Item Dijual]
From ProductSkincare

-- Average
Select AVG(ProductSkincare_Price) AS [Rata-Rata Harga Penjualan]
From ProductSkincare

-- MIN
Select MIN(ProductSkincare_Price) AS [Harga Terendah]
From ProductSkincare

-- MAX
--SELECT * //optional
--FROM //optional
--WHERE //optional
--GROUP BY //optional
--ORDER BY //optional
--HAVING MAX (ProductSkincare_TotalItem) > 10 //optional

Select MAX(ProductSkincare_Price) AS [Harga Tertinggi]
From ProductSkincare

-- BETWEEN //mengecek rentan/range
Select * From ProductSkincare
Where ProductSkincare_Price Between 100000 AND 300000

-- IN //hanya utk mengecek
Select * From PaymentOrder
Where StaffAdmin_ID IN ('AM0026')

-- ORDER BY //mengurutkan
Select * From ProductSkincare
ORDER BY ProductSkincare_ID

-- GROUP BY //membuat sebuah grup
Select Count(ProductSkincare_Price) AS [Total Pembelian], ProductSkincare_Name
From ProductSkincare
Group By ProductSkincare_Name

-- HAVING //membuat membandingkan sebuah aggregate, tdk bisa menggunakan where
Select Sum(ProductSkincare_Price) AS [Harga], ProductSkincare_Name
From ProductSkincare
Group By ProductSkincare_Name
Having Sum(ProductSkincare_Price) < 560000 --kondisi (pengganti where di agreggate)

-- END
-- ANGELIN MINARTO_2301850550

-- START New Forum
-- ANGELIN MINARTO_2301850550

-- DML 2
--menghubungkan 3 tabel //JOIN
-- JOIN //LEFT, RIGHT, INNER JOIN, FULL OUTER, SIMPLE JOIN
-- JOIN harus di tabel itu menghubungkan di foreign key
SELECT Customer_Name, 
	   OrderProduct_Date, 
	   StaffAdmin_Name,
	   ProductSkincare_ID
FROM OrderProduct op
JOIN Customer c 
ON op.Customer_ID = c.Customer_ID
JOIN StaffAdmin sa
ON op.StaffAdmin_ID = sa.StaffAdmin_ID
JOIN OrderProductDetail od
ON od.OrderProduct_ID = op.OrderProduct_ID

-- INNER JOIN //ambil yg ada di 3 tabel atau 2 tabel yg digabungkan
SELECT StaffAdmin_Name,
	   OrderProduct_Date
FROM StaffAdmin sa
INNER JOIN PaymentOrder po
ON sa.StaffAdmin_ID = po.StaffAdmin_ID

-- LEFT JOIN //ambil semua yg ada di tabel 1 (nampilin semua yg di kiri) // kebalikkan dri right join data2nya
SELECT StaffAdmin_Name,
	   OrderProduct_Date
FROM StaffAdmin sa
LEFT JOIN PaymentOrder po
ON sa.StaffAdmin_ID = po.StaffAdmin_ID

-- RIGHT JOIN //nampilin semua yg di kanan (kebalikkan dri left join data2nya)
SELECT StaffAdmin_Name,
	   OrderProduct_Date
FROM StaffAdmin sa
RIGHT JOIN PaymentOrder po
ON po.StaffAdmin_ID = sa.StaffAdmin_ID

-- FULL OUTER JOIN //nampilin semua tabel tanpa terkecuali
SELECT StaffAdmin_Name,
	   OrderProduct_Date
FROM StaffAdmin sa
FULL OUTER JOIN PaymentOrder po
ON sa.StaffAdmin_ID = po.StaffAdmin_ID

-- Subquery with quality
-- contoh subqery dengan menggunakan JOIN
--SELECT Customer_ID,
--	   od.ProductSkincare_ID
--FROM OrderProductDetail od
--JOIN ProductSkincare ps
--ON od.ProductSkincare_ID = ps.ProductSkincare_ID
--WHERE ProductSkincare_Price = 245000

-- Subquery with equality // hanya membalikkan 1 value data, tidak boleh pakai > dan <, valuenya hrs spesifik
SELECT Customer_ID,
	   ProductSkincare_ID
FROM OrderProductDetail 
WHERE ProductSkincare_ID = 
(
		SELECT ProductSkincare_ID
		FROM ProductSkincare
		WHERE ProductSkincare_Price = 24500
)

-- Subquery with Aggregate
-- membandingkan dimana yg kurang dari rata-rata harga penjualan
SELECT Customer_ID,
	   od.ProductSkincare_ID
FROM OrderProductDetail od
JOIN ProductSkincare ps
ON od.ProductSkincare_ID = ps.ProductSkincare_ID
WHERE ps.ProductSkincare_Price <
(
	Select AVG(ProductSkincare_Price) AS [Rata-Rata Harga Penjualan]
	From ProductSkincare
)

-- SUBQUERY with Exist //Subquery akan return TRUE maka hasilnya TRUE jika UNTRUE maka hasilnya akan UNTRUE, jika salah tidak akan muncul
SELECT Customer_ID
FROM OrderProductDetail
WHERE EXISTS
(
	SELECT * FROM Customer
	WHERE Customer_Gender LIKE 'F'
)

-- Nested Subquery with IN and EXISTS
-- SUBQUERY with Syntax in //IN utk cek tabel yg hrs ada di dlm tabel tsb
--IN hrs ada di dlm tabel itu
SELECT * FROM OrderProductDetail
WHERE Customer_ID IN
(
	SELECT Customer_ID
	FROM OrderProductDetail
	WHERE EXISTS
	(
		SELECT * FROM Customer
		WHERE Customer_Name LIKE 'Benny Erlando'
	)
)

-- ANY dan ALL
-- ANY // sama seperti Equality, subquery bebas boleh banyak
-- ANY akan return TRUE jika salah satu atau lebih value yg ada di subquery memenuhi kondisi
-- ANY akan return FALSE jika hasil dari subquery kosong/FALSE
SELECT *FROM OrderProductDetail
WHERE Customer_ID = ANY
(
	SELECT Customer_ID
	FROM Customer
	WHERE Customer_Gender = 'F'
)

-- ALL (memenuhi jika values sama semua sesuai kondisi)
-- ALL akan return TRUE jika semua subquery memenuhi kondisi
-- ALL akan return TRUE jika hasil dari subquery kosong/FALSE (tdk ada di data)
-- Kebalikkan dari ANY
SELECT *FROM OrderProductDetail
WHERE Customer_ID = ALL
(
	SELECT Customer_ID
	FROM Customer
	WHERE Customer_Gender = 'F'
)

-- CREATE VIEW // bikin tabel baru yg hanya bisa dilihat oleh visitor
CREATE VIEW ViewOrder AS
SELECT *FROM OrderProductDetail
WHERE Customer_ID = ANY
(
	SELECT Customer_ID
	FROM Customer
	WHERE Customer_Gender = 'F'
)
SELECT * FROM ViewOrder

-- END
-- ANGELIN MINARTO_2301850550

-- START New Forum
-- ANGELIN MINARTO_2301850550

-- 1. STRING FUNCTION, DATE FUNCTION
-- 1. STRING FUNCTION (LEFT, RIGHT, REVERSE, REPLACE, SUBSTRING, CHARINDEX)
-- Ambil huruf depan nama customer
SELECT 'Huruf Depan' = LEFT(Customer_Name,1)
FROM Customer

SELECT 'Huruf Belakang' = RIGHT(Customer_Name,1)
FROM Customer

-- REVERSE (Membalikkan semua huruf/diputar)
SELECT 'Nama Kebalik' = REVERSE(Customer_Name)
FROM Customer

-- REPLACE (Mengubah yg ada menjadi yang baru)
SELECT Customer_Phone = REPLACE(Customer_PhoneNumber, '08', '+62')
FROM Customer

-- SUBSTRING (Cari sebuah kalimat di dlm sebuah kalimat atau string di dlm string)
-- syntax
-- Select 'nama tabel baru' = SUBSTRING(Nama Tabel yg diinginkan, mau di mulai index ke brp, panjang index)
-- FROM Tabel
SELECT 'Nama' = SUBSTRING(Customer_Name, 5, 3)
FROM Customer

SELECT * FROM Customer

-- CONTOH KONDISI SOAL
BENNY ERLANDO = YER
VERONIKA ANGEL = AAN
-- SYNTAXNYA
-- Jika ingin mengambil huruf sebelum spasi maka -1
SELECT 'Nama' = SUBSTRING(Customer_Name, CHARINDEX(' ', Customer_Name) - 1 ,1) --utk ambil 1 huruf sebelum spasi
FROM Customer
SELECT SUBSTRING(Customer_Name, CHARINDEX(' ', Customer_Name)+1, 2) --utk ambil 2 huruf setelah spasi
FROM Customer
--menggabungkan 2 syntax di atas (tinggal syntax 1 + syntax 2)
SELECT 'Nama' = SUBSTRING(Customer_Name, CHARINDEX(' ', Customer_Name) - 1 ,1) + SUBSTRING(Customer_Name, CHARINDEX(' ', Customer_Name)+1, 2)
FROM Customer
--mengubah huruf yg kecil jdi besar (UPPER)
SELECT UPPER (Customer_Name)
FROM Customer
--mengubah huruf besar yg besar jdi kecil
SELECT LOWER(Customer_Name)
FROM Customer
--mengubah 2 syntax menjadi huruf kecil semua
SELECT 'Nama' = LOWER(SUBSTRING(Customer_Name, CHARINDEX(' ', Customer_Name) - 1 ,1) + SUBSTRING(Customer_Name, CHARINDEX(' ', Customer_Name)+1, 2))
FROM Customer
--mengubah 2 syntax menjadi huruf besar semua
SELECT 'Nama' = UPPER(SUBSTRING(Customer_Name, CHARINDEX(' ', Customer_Name) - 1 ,1) + SUBSTRING(Customer_Name, CHARINDEX(' ', Customer_Name)+1, 2))
FROM Customer

-- CHARINDEX (mereturn posisi huruf yg ingin kita cari)
SELECT CHARINDEX('e', Customer_Name)
FROM Customer

-- Mencari nama depan yg hanya mempunyai spasi
SELECT 'Nama Depan' = SUBSTRING(Customer_Name, 1, CHARINDEX(' ', Customer_Name))
FROM Customer

-- LEN (mencari batas stringnya *ada di coding*)
-- syntaxnya
-- SELECT 'Nama Tabel baru' = SUBSTRING(nama kolom tabel, CHARINDEX(' ', nama kolom tabel)+1, LEN(nama kolom tabel))
-- FROM Customer
-- klo mulai baca dri spasi hrs selalu ditambah 1 jika tidak maka spasi di awal akan ikut
SELECT 'Nama Belakang' = SUBSTRING(Customer_Name, CHARINDEX(' ', Customer_Name) +1, LEN(Customer_Name))
FROM Customer

-- Mencari Nama Inisial dpn dan belakang
-- hanya boleh menambahkan tipe data yg sama
SELECT 'Initial' = LEFT(Customer_Name,1) + SUBSTRING(Customer_Name, CHARINDEX(' ', Customer_Name)+1, 1)
FROM Customer

-- 2. DATE FUNCTION (DATENAME, DATEDIFF, DATEPART)
-- DATENAME (tetap dlm DATE bkn int maupun varchar)
-- DATENAME (WEEKDAY *return harinya dlm huruf*, Day *return harinya dlm angka* , MONTH *return bulan dlm huruf, Year *mencari tahunnya dlm angka*)
SELECT 'Day' = DATENAME(DAY, OrderProduct_Date)
FROM OrderProduct

-- DATEDIFF (mencari perbedaan tgl dri data tabel dengan tgl dri data yg diinginkan)
SELECT 'Perbedaan Day' = DATEDIFF(DAY, OrderProduct_Date, '2020-10-24')
FROM OrderProduct

SELECT 'Perbedaan Bulan' = DATEDIFF(MONTH, OrderProduct_Date, '2020-10-24')
FROM OrderProduct

SELECT 'Perbedaan Tahun' = DATEDIFF(YEAR, OrderProduct_Date, '2020-10-24')
FROM OrderProduct

-- Menggabungkan DATEPART
-- SELECT 'Day' = DATENAME(DAY, OrderProduct_Date)
-- FROM OrderProduct
-- WHERE DATENAME(DAY, OrderProduct_Date) > *mengambil tgl yg diinginkan

-- DATEPART (return menjadi int) 
SELECT DATEPART(DAY, OrderProduct_Date)
FROM OrderProduct

SELECT DATEPART(MONTH, OrderProduct_Date)
FROM OrderProduct

SELECT DATEPART(YEAR, OrderProduct_Date)
FROM OrderProduct

-- SET OPERATION // UNION, UNION ALL, INTERSECT, EXCEPT
-- 2. UNION, INTERSECT, EXCEPT
-- 1. UNION (menggabungkan 2 tabel dg syarat : 1. jumlah kolom dri kolom itu hrs sama, 2. data type dri kolom itu hrs sama *int dg int, varchar dg varchar*), isinya tdk berpengaruh
SELECT ProductSkincare_ID
FROM ProductSkincare
UNION
SELECT ProductSkincare_ID
FROM OrderProductDetail

SELECT * FROM ProductSkincare
UNION
SELECT * FROM OrderProductDetail

SELECT ProductSkincare_Price
FROM ProductSkincare
WHERE ProductSkincare_TotalItem < 25
UNION
SELECT ProductSkincare_TotalItem
FROM ProductSkincare
WHERE ProductSkincare_Price < 30

SELECT ProductSkincare_Price
FROM ProductSkincare
WHERE ProductSkincare_TotalItem < 25
UNION
SELECT ProductSkincare_ID
FROM ProductSkincare
WHERE ProductSkincare_Price < 30

-- 2. INTERSECT (return value dri tabel 1 yg sama di tabel 2), (seperti irisan)
-- tabel 1
SELECT ProductSkincare_Price
FROM ProductSkincare
WHERE ProductSkincare_TotalItem < 25
INTERSECT
-- tabel 2
SELECT ProductSkincare_Price
FROM ProductSkincare
WHERE ProductSkincare_TotalItem < 50

-- INTERSECT tidak ada karena data tabel 1 tidak ada di tabel 2
-- tabel 1
SELECT ProductSkincare_Price
FROM ProductSkincare
WHERE ProductSkincare_TotalItem < 25
INTERSECT
-- tabel 2
SELECT ProductSkincare_Price
FROM ProductSkincare
WHERE ProductSkincare_TotalItem > 50

-- 3. EXCEPT (kebalikkan INTERSECT), (return data yg ada di tabel 1 tetapi tidak ada di tabel 2)
-- tabel 1
SELECT ProductSkincare_Price
FROM ProductSkincare
WHERE ProductSkincare_TotalItem < 25
EXCEPT
-- tabel 2
SELECT ProductSkincare_Price
FROM ProductSkincare
WHERE ProductSkincare_TotalItem > 50

-- EXCEPT tidak ada karena data di tabel 1 ada jg data di tabel 2)
-- tabel 1
SELECT ProductSkincare_Price
FROM ProductSkincare
WHERE ProductSkincare_TotalItem < 25
EXCEPT
-- tabel 2
SELECT ProductSkincare_Price
FROM ProductSkincare
WHERE ProductSkincare_TotalItem < 50

-- 3. INSERT, UPDATE, DELETE
-- 1. Insert
Insert Into ProductSkincare
Values('HTLNRP25','Nuxe Rose Petals Gentle Toning Lotion',245000,24),('SNNVCS50','Novexpert The Vitamin C Serum',560000,56),('ESLWB550','Laneige Water Bank Essence EX',550000,55)
Select * From ProductSkincare

-- 2. UPDATE
UPDATE ProductSkincare
SET ProductSkincare_Price = ProductSkincare_Price * 0.1

-- 3. DELETE (delete value bkn kolom)
DELETE 
FROM ProductSkincare
WHERE ProductSkincare_Price = 55000

-- DDL itu membuat tabel, menghapus dan menghilangkan tabel yg berhubungan dg tabel
-- DML itu berhubungan dg isi tabel

-- 4. buat sebuah view, dg ketentuan hrs melibatkan 2 tabel lalu tambahan function agregate
-- bisa AVG, MIN, MAX
-- CREATE VIEW membuat tabel yg hanya bisa dilihat org saja di tabel tertentu yg kita sediakan
-- CREATE VIEW (membuat sebuah tabel dri bagian yg diinginkan saja)
-- CREATE VIEW bisa dibuat dalam function apa saja
-- CREATE VIEW dri yg hanya select menampilkan bisa memasukkan view dri sebuah data ke dlm sebuah tabel
GO
CREATE VIEW getCustomerProductSkincare
AS
SELECT Customer_ID, -- 4 data yg ingin di tampilkan
	   od.ProductSkincare_ID,
	   ProductSkincare_Name,
	   ProductSkincare_Price
FROM OrderProductDetail od
JOIN ProductSkincare ps
ON od.ProductSkincare_ID = ps.ProductSkincare_ID
WHERE ps.ProductSkincare_Price < -- kondisi sesuai yg diinginkan
(
	Select MAX(ProductSkincare_Price) AS [Rata-Rata Harga Penjualan]
	From ProductSkincare
)
GO
SELECT * FROM getCustomerProductSkincare

-- 5. 
CREATE TABLE Employee
(
	EmployeeID INT PRIMARY KEY,
	EmployeeName VARCHAR(255),
	EmployeeEmail VARCHAR(255),
	EmployeePosition VARCHAR(255),
	StaffAdmin_ID VARCHAR(12)
	FOREIGN KEY (StaffAdmin_ID) REFERENCES StaffAdmin(StaffAdmin_ID)
)
--tidak bisa di execute krn tidak ada usernya
GRANT SELECT, INSERT, UPDATE ON Employee TO Supervisor -- memberikan sebuah akses select,insert,update dri user employee kepada supervisor
--GRANT (memberikan sebuah akses)
--GRANT ON ... TO ...
--Memberikan Akses dari tabel apa ke user apa

-- 6. Mencabut akses
REVOKE SELECT, INSERT, UPDATE ON Employee TO Supervisor -- mencabut sebuah akses select, insert, update dri uuser employee kpd supervisor
-- REVOKE (mencabut sebuah akses)

-- END
-- ANGELIN MINARTO_2301850550

-- START
-- ANGELIN MINARTO_2301850550

-- 2. FUNCTION (sebuah fungsi yg bisa return sesuatu), bisa pakai join

-- syntaxnya
-- BUAT FUNCTION
-- GO
-- CREATE FUNCTION dbo.SkincarePriceDiscount -- Nama Function, tdk hrs dbo
-- (
-- 	@id VARCHAR(10) -- liat ERD fk yg diinginkan di tabel
-- )
-- RETURNS INT -- returns data type hrs INTEGER
-- AS
--BEGIN
--	DECLARE @result INT -- bikin sebuah variabel baru

--	RETURN @result -- return sesuaikan dengan returns

--END
-- GO

-- PEMANGGILAN FUNCTION
-- SELECT dbo.SkincarePriceDiscount('HTLNRP25') 'Discount Product' // wajib menggunakan dbo

-- HAPUS FUNCTION
-- DROP FUNCTION SkincarePriceDiscount
-- GO

-- contoh mengubah menjadi 10%
GO --HARUS DIPAKE
CREATE FUNCTION dbo.SkincarePriceDiscount -- Nama Function , tdk apa-apa jika tidak menggunakan dbo
(
	@id VARCHAR(10)
)
RETURNS INT -- returns data type (sebuah table jg bisa termasuk data type)
AS
BEGIN --PROCEDURE, FUNCTION atau TRIGGER SETELAH AS HRS PAKE BEGIN DAN END wajib pake krn AS
	DECLARE @result INT -- bikin sebuah variabel baru

	SET @result = (SELECT ProductSkincare_Price - (ProductSkincare_Price * 0.1) -- harga diskon
					FROM ProductSkincare
					WHERE ProductSkincare_ID = @id) -- sesuai kondisi yg di input

	RETURN @result -- return sesuaikan dengan returns

END --wajib pake krn AS di FUNCTION, TRIGGER, PROCEDURE
GO --HARUS DIPAKE

-- PEMANGGILAN FUNCTION
SELECT dbo.SkincarePriceDiscount('HTLNRP25') 'Discount Product' -- wajib menggunakan dbo

-- HAPUS FUNCTION
DROP FUNCTION SkincarePriceDiscount

-- 1. STORE PROCEDURE (sama seperti FUNCTION. sebuah query yg bisa dipake lgi. disimpan sehingga bisa digunakan berulang-ulang)

-- CATATAN !
-- CREATE PROC //untuk membuat sebuah procedure pertama kali
-- ALTER PROC //mengubah sebuah procedure yg udh dibuat pertama kali

-- SYNTAX SIMPLE nya
-- GO
--CREATE PROC getSkincarePriceDiscount
--(
--	 @id VARCHAR(10)
--)
--AS
--BEGIN

--END
--GO

-- SYNTAX menggunakan IF
--GO
--CREATE PROC getSkincarePriceDiscount
--(
--	 @id VARCHAR(10)
--)
--AS
--BEGIN

--			IF @id = 'HTLNRP25'
--			BEGIN
--	PRINT @id + 'yang dicari'
--END
--	ELSE IF @id = 'HTLNRP26'
--	BEGIN
--	PRINT @id + 'yang dicari'
--END
--GO

-- SYNTAX yg lainnya
--GO
--CREATE PROC setProductSkincare / ALTER PROC setProductSkincare // ALTER untuk merubah tabel
--(
--	 @id VARCHAR(10)
-- 	 @nama VARCHAR(255),
--	 @price INT,
--	 @totalItem INT
--)
--AS
--BEGIN

--			INSERT INTO ProductSkincare
--			VALUES
--			(
--			@id,
--			@nama
--			@price
--			@totalItem
--			)
			
--			IF @totalItem < 20 //bisa pake IF
--			BEGIN //boleh pakai boleh tidak
--				PRINT 'Product terlalu sedikit'
--				ELSE
--				PRINT 'Product sudah pas'

--			PRINT @nama = ' ' + CAST(@price AS VARCHAR) + ' ditambahkan pada tanggal ' + CAST (GETDATE() AS VARCHAR) //GETDATE mengambil tgl skrg, CAST utk mengubah data type menjadi VARCHAR
--	PRINT selalu VARCHAR
--END
--GO

--MEMANGGIL PROCEDURE
-- EXEC setProductSkincare 'HTLNRP27', 'Whitening', 100000, 70 //sama seperti insert biasa
-- EXEC setProductSkincare 'HTLNRP33', 'Whitening 2', 100000, 70 //execute print seperti codingan

GO
CREATE PROC getSkincarePriceDiscount
(
	 @id VARCHAR(10) --PARAMETER YG KITA CARI
)
AS
BEGIN
-- mulai declare
	SELECT ProductSkincare_Price - (ProductSkincare_Price * 0.1) -- harga diskon
	FROM ProductSkincare
	WHERE ProductSkincare_ID = @id -- sesuai kondisi yg di input
-- selesai declare
END

-- PEMANGGILAN STORE PROCEDURE
EXEC getSkincarePriceDiscount 'HTLNRP25'

-- Penghapusan
DROP PROC getSkincarePriceDiscount

-- 3. TRIGGER (melakukan sesuatu setelah insert, update, delete)
-- (INSERT, UPDATE, DELETE)

-- INSERT MELALUKAN ACTION SETELAH KITA MENGINSERT VALUES KE TABLE YANG DIINGINKAN
GO
CREATE TRIGGER ProductSkincareInsert
	ON ProductSkincare
AFTER INSERT  --melakukan sesuatu setelah melakukan insert table ke table yg diinginkan
AS
BEGIN

		DECLARE @id VARCHAR(10)
		DECLARE @nama VARCHAR(255)

		SELECT @id = INSERTED.ProductSkincare_ID, --INSERTED = memberitahu dari table yg baru diinsert
			   @nama = INSERTED.ProductSkincare_Name --INSERTED = memberitahu dari table yg baru diinsert
		FROM INSERTED --table yg diinsert pd saat itu

		PRINT @id + 'dengan nama' + @nama + 'telah diinsert pada' + CAST (GETDATE() AS VARCHAR)

END
GO

INSERT INTO ProductSkincare
VALUES
(
	'HTLNRP48', 'WHITENING & GLOWING', 120000, 69
)

-- SYNTAX INSERT yg lainnya
--membuat table
CREATE TABLE ProductSkincareNew
(
	ID INT IDENTITY(1,1) PRIMARY KEY, -- IDENTITY (AUTO UNCREMAN) akan auto masuk 1 (ANGKA YG KELUAR, ANGKA NAMBAH YG DI DPN)
	ProductSkincare_ID VARCHAR(10),
	NAMA VARCHAR(255),
	Tanggal DATE,
	[Action] VARCHAR(255)
)

-- merubah table
ALTER TABLE ProductSkincareNew
ADD KualitasProduk VARCHAR(255) --menambah kolom

-- SYNTAX INSERT yg lainnya kedua
GO --biar menghilangkan garis merah
ALTER TRIGGER ProductSkincareInsert
	ON ProductSkincare
AFTER INSERT  --melakukan sesuatu setelah melakukan insert table ke table yg diinginkan
AS
BEGIN

		DECLARE @id VARCHAR(10) --utk penamaan
		DECLARE @nama VARCHAR(255) --utk penamaan
		DECLARE @KualitasProduk VARCHAR(255) --utk penamaan

		SELECT @id = INSERTED.ProductSkincare_ID,
			   @nama = INSERTED.ProductSkincare_Name
		FROM INSERTED

		IF @nama LIKE '%HYALURON%'
			INSERT INTO ProductSkincareNew
		VALUES
		(
			@id,
			@nama,
			GETDATE(), --tgl skrg
			'Diinsert', --utk actionnyaa
			'BAGUS' --utk kualitas produknya
		)
		ELSE IF @nama LIKE '%Cream%'
			INSERT INTO ProductSkincareNew
		VALUES
		(
			@id,
			@nama,
			GETDATE(),
			'Diinsert',
			'CUKUP'
		)
		ELSE
		INSERT INTO ProductSkincareNew
		VALUES
		(
			@id,
			@nama,
			GETDATE(),
			'Diinsert',
			'KURANG BAGUS'
		)

		PRINT @id + ' dengan nama ' + @nama + ' telah diinsert pada ' + CAST (GETDATE() AS VARCHAR)

END
GO
SELECT * FROM ProductSkincareNew

--utk test data
INSERT INTO ProductSkincare -- INSERT INTO ke data table yg di pakein TRIGGER
VALUES 
(
	'HTLNRP55', 'WHITENING PLUS', 2000000, 80
)

-- TIDAK PAKE LIKE DI SYNTAX ATAS
INSERT INTO ProductSkincare
VALUES
(
	'ASMNYS88', 'HYALURON ALL IN ONE', 225000, 22
)

--PAKE LIKE DI SYNTAX ATAS
INSERT INTO ProductSkincare
VALUES
(
	'ASMNYS90', 'HYALURON ALL IN ONE', 225000, 22
)
SELECT * FROM ProductSkincareNew

GO --biar menghilangkan garis merah
ALTER TRIGGER ProductSkincareInsert
	ON ProductSkincare
AFTER INSERT  --melakukan sesuatu setelah melakukan insert table ke table yg diinginkan
AS
BEGIN

		DECLARE @id VARCHAR(10)
		DECLARE @nama VARCHAR(255)

		SELECT @id = INSERTED.ProductSkincare_ID,
			   @nama = INSERTED.ProductSkincare_Name
		FROM INSERTED

		INSERT INTO ProductSkincareNew
		VALUES
		(
			@id,
			@nama,
			GETDATE(),
			'Diinsert'
		)

		PRINT @id + 'dengan nama' + @nama + 'telah diinsert pada' + CAST (GETDATE() AS VARCHAR)

END
GO
SELECT * FROM ProductSkincareNew

INSERT INTO ProductSkincare -- INSERT INTO ke data table yg di pakein TRIGGER
VALUES 
(
	'HTLNRP55', 'WHITENING PLUS', 2000000, 80
)
SELECT * FROM ProductSkincare

-- TRIGGER SETELAH UPDATE MELAKUKAN ACTION SETELAH KITA MENGUPDATE SEBUAH VALUES
GO --biar menghilangkan garis merah
ALTER TRIGGER ProductSkincareUpdate -- ALTER utk update/mengubah syntax
	ON ProductSkincare
AFTER UPDATE  --melakukan sesuatu setelah melakukan insert table ke table yg diinginkan
AS
BEGIN

		DECLARE @id VARCHAR(10)
		DECLARE @nama VARCHAR(255)

		SELECT @id = INSERTED.ProductSkincare_ID,
			   @nama = INSERTED.ProductSkincare_Name
		FROM INSERTED

		INSERT INTO ProductSkincareNew
		VALUES
		(
			@id,
			@nama,
			GETDATE(),
			'DiUpdate'
		)

		PRINT @id + ' dengan nama ' + @nama + ' telah diUpdate pada ' + CAST (GETDATE() AS VARCHAR)

END
GO

BEGIN TRAN -- hrs pakai, untuk menyimpan data dan digunakan utk di rollback, execute ini terlebih dahulu
UPDATE ProductSkincare
SET ProductSkincare_Name = 'WHITENING PLUS'
WHERE ProductSkincare_ID = 'HTLNRP55'

--SYNTAX UPDATE yg lainnya
GO --biar menghilangkan garis merah
ALTER TRIGGER ProductSkincareUpdate -- ALTER utk update/mengubah syntax
	ON ProductSkincare
AFTER UPDATE  --melakukan sesuatu setelah melakukan insert table ke table yg diinginkan
AS
BEGIN

		DECLARE @id VARCHAR(10)
		DECLARE @nama VARCHAR(255)

		SELECT @id = INSERTED.ProductSkincare_ID,
			   @nama = INSERTED.ProductSkincare_Name
		FROM INSERTED

		IF @nama LIKE '%HYALURON%'
			INSERT INTO ProductSkincareNew
			VALUES
			(
				@id,
				@nama,
				GETDATE(),
				'DiUpdate',
				'Bagus'
			)
		ELSE IF @nama LIKE '%Cream%'
				INSERT INTO ProductSkincareNew
			VALUES
			(
				@id,
				@nama,
				GETDATE(),
				'DiUpdate',
				'CUKUP'
			)
		ELSE
			INSERT INTO ProductSkincareNew
			VALUES
			(
				@id,
				@nama,
				GETDATE(),
				'DiUpdate',
				'KURANG BAGUS'
			)

		PRINT @id + ' dengan nama ' + @nama + ' telah diUpdate pada ' + CAST (GETDATE() AS VARCHAR)

END
GO

BEGIN TRAN -- hrs pakai
UPDATE ProductSkincare
SET ProductSkincare_Name = 'HYALURON'
WHERE ProductSkincare_ID = 'ASMNYS80'

SELECT * FROM ProductSkincareNew

-- TRIGGER DELETE MELAKUKAN ACTION SETELAH KITA MENGHAPUS SEBUAH VALUES DARI TABLE YG DIINGINKAN 
GO --biar menghilangkan garis merah
CREATE TRIGGER ProductSkincareDelete
	ON ProductSkincare
AFTER DELETE  --melakukan sesuatu setelah melakukan insert table ke table yg diinginkan
AS
BEGIN

		DECLARE @id VARCHAR(10)
		DECLARE @nama VARCHAR(255)

		SELECT @id = DELETED.ProductSkincare_ID,
			   @nama = DELETED.ProductSkincare_Name
		FROM deleted

		INSERT INTO ProductSkincareNew
		VALUES
		(
			@id,
			@nama,
			GETDATE(),
			'DiDelete'
		)

		PRINT @id + ' dengan nama ' + @nama + ' telah diDelete pada ' + CAST (GETDATE() AS VARCHAR)

END
GO

BEGIN TRAN -- hrs pakai (mengingat transaksinya)
DELETE ProductSkincare
WHERE ProductSkincare_ID = 'HTLNRP48' -- klo ga pake where table akan terhapus
SELECT * FROM ProductSkincareNew
SELECT * FROM ProductSkincare

ROLLBACK --(UNDO)

-- SYNTAX DELETE yg lainnya merubah trigger yg pertama
GO --biar menghilangkan garis merah
ALTER TRIGGER ProductSkincareDelete
	ON ProductSkincare
AFTER DELETE  --melakukan sesuatu setelah melakukan insert table ke table yg diinginkan
AS
BEGIN

		DECLARE @id VARCHAR(10)
		DECLARE @nama VARCHAR(255)

		SELECT @id = DELETED.ProductSkincare_ID,
			   @nama = DELETED.ProductSkincare_Name
		FROM deleted

		IF @nama LIKE '%HYALURON%'
		INSERT INTO ProductSkincareNew
		VALUES
		(
			@id,
			@nama,
			GETDATE(),
			'DiDelete',
			'Bagus'
		)
		ELSE IF @nama LIKE '%Cream%'
			INSERT INTO ProductSkincareNew
		VALUES
		(
			@id,
			@nama,
			GETDATE(),
			'DiDelete',
			'CUKUP'
		)
		ELSE
		INSERT INTO ProductSkincareNew
		VALUES
		(
			@id,
			@nama,
			GETDATE(),
			'DiDelete',
			'KURANG BAGUS'
		)

		PRINT @id + ' dengan nama ' + @nama + ' telah diDelete pada ' + CAST (GETDATE() AS VARCHAR)

END
GO

BEGIN TRAN -- hrs pakai (mengingat transaksinya)
DELETE ProductSkincare
WHERE ProductSkincare_ID = 'ASMNYS88' -- klo ga pake where table akan terhapus
SELECT * FROM ProductSkincareNew
SELECT * FROM ProductSkincare

--LEN (mengecek jumlah huruf dalam kalimat), return angka
SELECT LEN(ProductSkincare_Name)
FROM ProductSkincare
-- TOP '' LEN (TOP = utk mereturn values sesuai dengan jumlah yg kita inginkan, LEN = jumlah huruf dlm kalimat)
SELECT TOP 2 LEN(ProductSkincare_Name)
FROM ProductSkincare

COMMIT --udh pasti, tdk bisa di rollback, krn memakai begin tran