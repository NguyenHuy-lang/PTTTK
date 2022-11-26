CREATE TABLE tblmember (
                           ID int NOT NULL auto_increment,
                           username varchar(50) NOT NULL UNIQUE,
                           pass varchar(50) NOT NULL,
                           fullname varchar(50) NOT NULL,
                           gender varchar(50) NOT NULL,
                           phonenumber varchar(50) NOT NULL,
                           address varchar(50) NOT NULL,
                           PRIMARY KEY (ID)
);
CREATE TABLE tblCustomer (
                             customerCode varchar(10) NOT NULL,
                             tblmemberID int NOT NULL,
                             primary key(tblmemberID),
                             foreign key(tblmemberID) references tblmember(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

create TABLE tblStaffDelivery (
                                  roles varchar(50) NOT NULL,
                                  tblmemberID int NOT NULL,
                                  primary key(tblmemberID),
                                  foreign key(tblmemberID) references tblmember(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tblInforPaymentonline (
                                       ID INT NOT NULL auto_increment,
                                       numCard varchar(50),
                                       ownerNameCard varchar(50),
                                       dateRelease date,
                                       typeCard varchar(255),
                                       otp int,
                                       primary key(ID)
);

CREATE TABLE tblVoucher (
                            ID INT NOT NULL auto_increment,
                            nameVoucher VARCHAR(255),
                            descriptions varchar(255),
                            discountRate int not null,
                            primary key(ID)
);

create TABLE tblOrder(
                         ID int NOT NULL auto_increment,
                         statusOrder varchar(255) NOT NULL,
                         orderDate date NOT NULL,
                         receiveDate date ,
                         costShip int NOT NULL,
                         tblInforPaymentonlineID int ,
                         tblStaffDeliverytblmemberID int,
                         tblCustomertblmemberID int NOT NULL,
                         tblVoucherID int,
                         primary key(ID) ,
                         foreign key(tblInforPaymentonlineID) references tblInforpaymentonline(ID),
                         foreign key(tblStaffDeliverytblmemberID) references tblStaffDelivery(tblmemberID),
                         foreign key(tblCustomertblmemberID) references tblCustomer(tblmemberID) ON UPDATE CASCADE ON DELETE CASCADE,
                         foreign key(tblVoucherID) references tblVoucher(ID)
);

CREATE TABLE tblCategoryProduct(
                                   ID INT NOT NULL auto_increment,
                                   nameCategory varchar(255),
                                   primary key(ID)
);

CREATE TABLE tblProduct (
                            ID INT NOT NULL auto_increment,
                            nameProduct varchar(50) NOT NULL,
                            cost int NOT NULL,
                            descriptions varchar(255),
                            imgPath varchar(255),
                            tblCategoryProductID int NOT NULL,
                            primary key(ID),
                            foreign key(tblCategoryProductID) references tblCategoryProduct(ID)
);



CREATE TABLE tblDetailInOrder (
                                  ID INT NOT NULL auto_increment,
                                  unitPrice INT NOT NULL,
                                  quanity INT NOT NULL,
                                  tblOrderID INT NOT NULL,
                                  tblProductID INT NOT NULL,
                                  primary key(ID),
                                  foreign key(tblOrderID) references tblOrder(ID) ON UPDATE CASCADE ON DELETE CASCADE,
                                  foreign key(tblProductID) references tblProduct(ID) ON UPDATE CASCADE ON DELETE CASCADE
);





