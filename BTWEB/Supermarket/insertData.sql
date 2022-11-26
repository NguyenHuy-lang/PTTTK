-- bảng member
INSERT INTO tblmember values(1, 'Nguyenhuy-lang', '123456', 'Nguyen Quang Huy', 'male',
                             '0327894689', 'So nha 18A, Ngo 58, Van phuc, Ha Dong, Ha Noi');
INSERT INTO tblmember values(2, 'vanthang-lang', '123456', 'Duong Van Thang', 'male', '0324569125',
                             'So nha 21A, duong Quang Trung, Ha Dong, Ha Noi');
INSERT INTO tblmember values(3, 'Kieu Trinh', '123456', 'Nguyen Kieu Trình', 'Female', '0324128964',
                             'So nha 21B, duong Quang Trung, Ha Dong, Ha Noi');
INSERT INTO tblmember values(4, 'Kieu Linh', '123456', 'Nguyen Kieu Trình', 'Female', '0324128964',
                             'So nha 21C, duong Quang Trung, Ha Dong, Ha Noi');
INSERT INTO tblmember values(5, 'Kieu Trang', '123456', 'Nguyen Kieu Trang', 'Female', '0321452147',
                             'So nha 21D, duong Quang Trung, Ha Dong, Ha Noi');
-- bảng customer
INSERT INTO tblcustomer values('KH2', 2);
INSERT INTO tblcustomer values('KH3', 3);
INSERT INTO tblcustomer values('KH4', 4);

-- bảng staff delivery

INSERT INTO tblstaffdelivery values('delivery', 1);
INSERT INTO tblstaffdelivery values('delivery', 5);


-- bảng category of product
INSERT INTO tblcategoryproduct values(1, 'Snack');
INSERT INTO tblcategoryproduct values(2, 'Drink');
INSERT INTO tblcategoryproduct values(3, 'Meat');
INSERT INTO tblcategoryproduct values(4, 'vegetable');
INSERT INTO tblcategoryproduct values(5, 'Fruit');

-- bảng product
INSERT INTO tblproduct values(1, 'Bim Bim osi', 10000, '', '', 1);
INSERT INTO tblproduct values(2, 'Bim Bim osta', 12000, '', '', 1);
INSERT INTO tblproduct values(3, 'Bim Bim potato', 15000, '', '', 1);
INSERT INTO tblproduct values(4, 'Thit ba chỉ lợn 1g', 20000, '', '', 3);
INSERT INTO tblproduct values(5, 'Thit ba chỉ bò mỹ 1g', 35000, '', '', 3);
INSERT INTO tblproduct values(6, 'Nước ep cam 150ml', 15000, '', '', 2);
INSERT INTO tblproduct values(7, 'Nước chanh muối 150ml', 20000, '', '', 2);
INSERT INTO tblproduct values(8, '1 lon Bia Hà Nội', 20000, '', '', 2);
INSERT INTO tblproduct values(9, '200g rau cải ngọt', 20000, '', '', 4);
INSERT INTO tblproduct values(10, '150g rau cần', 250000, '', '', 4);
INSERT INTO tblproduct values(11, '1kg Nho Ninh Thuận', 150000, '', '', 5);
INSERT INTO tblproduct values(12, '1 quả dưa hấu 1.5kg', 70000, '', '', 5);


-- bảng payment online
INSERT INTO tblinforpaymentonline values(1, '0221000065436', 'Nguyen Quang Huy', '2019-5-6', 'Vietcombank', null);
INSERT INTO tblinforpaymentonline values(2, '0221000065435', 'Nguyen Kieu Trinh','2019-5-7', 'Tpbank', null);
INSERT INTO tblinforpaymentonline values(3, '0221000065434', 'Nguyen Kieu Linh', '2019-5-8', 'Agribank', null);
INSERT INTO tblinforpaymentonline values(4, '0221000065433', 'Duong Van Thang', '2019-5-9', 'MBbank', null);
INSERT INTO tblinforpaymentonline values(5, '0221000065432', 'Nguyen Kieu Trang', '2019-5-10', 'Vietcombank', null);



-- bảng voucher
INSERT INTO tblvoucher values(1, '', '', 10);
INSERT INTO tblvoucher values(2, '', '', 15);
INSERT INTO tblvoucher values(3, '', '', 20);
INSERT INTO tblvoucher values(4, '', '', 25);
INSERT INTO tblvoucher values(5, '', '', 30);


-- bảng order
INSERT INTO tblorder values (1, 'picking', '2022-01-01', '2022-01-02', 15000, 1, 1, 2, 1);
INSERT INTO tblorder values (2, 'picking', '2022-01-01', '2022-01-02', 20000, 2, 1, 2, 2);
INSERT INTO tblorder values (3, 'picking', '2022-01-01', '2022-01-02', 15000, 3, 1, 3, 3);

INSERT INTO tblorder values (4, 'delivering', '2022-01-03', '2022-01-04', 10000, 4, 1, 3, 4);
INSERT INTO tblorder values (5, 'delivering', '2022-01-03', '2022-01-04', 35000, 5, 1, 4, 5);
INSERT INTO tblorder values (6, 'delivering', '2022-01-03', '2022-01-04', 30000, 1, 1, 4, 1);

INSERT INTO tblorder values (7, 'unsuccess1', '2022-01-05', '2022-01-06', 25000, 2, 1, 2, 2);
INSERT INTO tblorder values (8, 'unsuccess2', '2022-01-07', '2022-01-08', 30000, 3, 1, 2, 3);
INSERT INTO tblorder values (9, 'success', '2022-01-09', '2022-01-10', 25000, 4, 1, 3, 4);
INSERT INTO tblorder values (10, 'cancel', '2022-01-11', '2022-01-12', 10000, 5, 1, 3, 5);
INSERT INTO tblorder values (11, 'cancel', '2022-02-01', '2022-02-02', 15000, 1, 1, 4, 1);

-- bảng detail Order

INSERT INTO tbldetailinorder values(1, 10000, 2, 1, 1);
INSERT INTO tbldetailinorder values(2, 150000, 2, 1, 11);
INSERT INTO tbldetailinorder values(3, 20000, 1, 1, 3);


INSERT INTO tbldetailinorder values(4, 10000, 2, 2, 1);
INSERT INTO tbldetailinorder values(5, 150000, 2, 2, 11);
INSERT INTO tbldetailinorder values(6, 20000, 1, 2, 4);

INSERT INTO tbldetailinorder values(7, 70000, 2, 3, 12);
INSERT INTO tbldetailinorder values(8, 150000, 2, 3, 11);
INSERT INTO tbldetailinorder values(9, 20000, 1, 3, 4);

INSERT INTO tbldetailinorder values(10, 70000, 2, 4, 12);
INSERT INTO tbldetailinorder values(11, 150000, 2, 4, 11);
INSERT INTO tbldetailinorder values(12, 20000, 1, 4, 4);

INSERT INTO tbldetailinorder values(13, 70000, 2, 5, 12);
INSERT INTO tbldetailinorder values(14, 150000, 2, 5, 11);
INSERT INTO tbldetailinorder values(15, 20000, 1, 5, 4);

INSERT INTO tbldetailinorder values(16, 70000, 2, 6, 12);
INSERT INTO tbldetailinorder values(17, 150000, 2, 6, 11);
INSERT INTO tbldetailinorder values(18, 20000, 1, 6, 4);

INSERT INTO tbldetailinorder values(19, 70000, 2, 7, 12);
INSERT INTO tbldetailinorder values(20, 150000, 2, 7, 11);
INSERT INTO tbldetailinorder values(21, 20000, 1, 7, 4);

INSERT INTO tbldetailinorder values(22, 70000, 2, 8, 12);
INSERT INTO tbldetailinorder values(23, 150000, 2, 8, 11);
INSERT INTO tbldetailinorder values(24, 20000, 1, 8, 4);

INSERT INTO tbldetailinorder values(25, 70000, 2, 9, 12);
INSERT INTO tbldetailinorder values(26, 150000, 2, 9, 11);
INSERT INTO tbldetailinorder values(27, 20000, 1, 9, 4);

INSERT INTO tbldetailinorder values(28, 70000, 2, 10, 12);
INSERT INTO tbldetailinorder values(29, 150000, 2, 10, 11);
INSERT INTO tbldetailinorder values(30, 20000, 1, 10, 4);

INSERT INTO tbldetailinorder values(31, 70000, 2, 11, 12);
INSERT INTO tbldetailinorder values(32, 150000, 2, 11, 11);
INSERT INTO tbldetailinorder values(33, 20000, 1, 11, 4);


