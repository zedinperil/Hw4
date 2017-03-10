#Tyler Zinsmaster & Alex Chmelka
use tzinsmaster;
start transaction;

drop table if exists Emails;
drop table if exists Address;
drop table if exists PrivateInvestment;
drop table if exists Deposit;
drop table if exists Stock;
drop table if exists Assets;
drop table if exists AssetsList;
drop table if exists AssetsTypes;
drop table if exists Portfolio;
drop table if exists Person;


create table Person (
  personCode varchar(50) primary key,
  firstName varchar(50),
  lastName varchar(50),
  persontype varchar(50),
  secId varchar(50)
)engine=InnoDB,collate=latin1_general_cs;

create table Emails (
  emailId int not null primary key auto_increment,
  email varchar(100),
  personCode varchar(50) not null,
  FOREIGN KEY personCode(personCode) REFERENCES Person(personCode)
)engine=InnoDB,collate=latin1_general_cs;

create table Address (
  addressId int not null primary key auto_increment,
  personCode varchar(50) not null,
  FOREIGN KEY personCode(personCode) REFERENCES Person(personCode),
  street varchar(200),
  city varchar(200),
  state varchar(200),
  country varchar(200),
  zip varchar(200)
)engine=InnoDB,collate=latin1_general_cs;

	
  create table Portfolio ( 
  portfolioCode varchar(50) not null primary key,
  ownerCode varchar(50) not null,
  managerCode varchar(50) not null, 
  beneficiaryCode varchar(50),

  FOREIGN KEY ownerCode(ownerCode) REFERENCES Person(personCode),
  FOREIGN KEY managerCode(managerCode) REFERENCES Person(personCode),
  FOREIGN KEY beneficiaryCode(beneficiaryCode) REFERENCES Person(personCode),
  fees double,
  commissions double,
  totalValue double,
  sumOfAnnualReturns double,
  aggRisk double
  )engine=InnoDB,collate=latin1_general_cs;
     
create table AssetsTypes (
  assetType varchar(50) not null primary key
  )engine=InnoDB,collate=latin1_general_cs;
     
create table AssetsList (
  assetCode varchar(50) not null primary key,
  assetType varchar(50) not null,
  FOREIGN KEY assetType(assetType) REFERENCES AssetsTypes(assetType)
  )engine=InnoDB,collate=latin1_general_cs;

create table Assets (
  assetId integer not null primary key auto_increment,
  assetCode varchar(50) not null,
  FOREIGN KEY assetCode(assetCode) REFERENCES AssetsList(assetCode),
  portfolioCode varchar(50) not null,
  FOREIGN KEY portfolioCode(portfolioCode) REFERENCES Portfolio(portfolioCode),
  assetModifier varchar(50),
  risk double,
  annualReturn double,
  assetValue double,
  returnRate double
  )engine=InnoDB,collate=latin1_general_cs;



create table PrivateInvestment (
  privateInvestmentId int not null primary key auto_increment,
  assetCode varchar(50) not null,
  FOREIGN KEY assetCode(assetCode) REFERENCES AssetsList(assetCode),
  assetType varchar(50) not null,
  FOREIGN KEY assetType(assetType) REFERENCES AssetsTypes(assetType),
  assetName varchar(50),
  quarterlyDividend double,
  baseRateOfReturn double,
  omegaMeasure double,
  totalValue double
  )engine=InnoDB,collate=latin1_general_cs;

create table Stock (
  stockId int not null primary key auto_increment,
  assetCode varchar(50) not null,
  FOREIGN KEY assetCode(assetCode) REFERENCES AssetsList(assetCode),
  assetType varchar(50) not null,
  FOREIGN KEY assetType(assetType) REFERENCES AssetsTypes(assetType),
  assetName varchar(50),
  quarterlyDividend double,
  baseRateOfReturn double,
  betaMeasure double,
  stockSymbol varchar(50),
  sharePrice double
  )engine=InnoDB,collate=latin1_general_cs;

create table Deposit (
  depositId int not null primary key auto_increment,
  assetCode varchar(50) not null,
  FOREIGN KEY assetCode(assetCode) REFERENCES AssetsList(assetCode),
  assetType varchar(50) not null,
  FOREIGN KEY assetType(assetType) REFERENCES AssetsTypes(assetType),
  assetName varchar(50),
  apr double
  )engine=InnoDB,collate=latin1_general_cs;
  
  


 insert into Person(personCode, firstName, lastName, persontype, secId) values('redman','Redmond','Mann','J','sec173');
 insert into Person(personCode, firstName, lastName, persontype, secId) values('bluman','Blutarch','Mann','','');
 insert into Person(personCode, firstName, lastName, persontype, secId) values('grayman','Gray','Mann','E','sec682');
 insert into Person(personCode, firstName, lastName, persontype, secId) values('','none','','','');

 insert into Emails(emailId, personCode, email) values (1,'redman','killtheblus@gravelpit.co');
 insert into Emails(emailId, personCode, email) values (2,'bluman','blutarchmann@gannco.com');
 insert into Emails(emailId, personCode, email) values (3,'bluman','killthereds@gravelpit.co');
 insert into Emails(emailId, personCode, email) values (4,'grayman','owner@mannco.com');
  
 insert into Address(addressId, personCode, street, city, state, country, zip) values(1,'redman','7 Gravel Lane', 'Teufort','AZ','USA','10907');
 insert into Address(addressId, personCode, street, city, state, country, zip) values(2,'bluman','7 Gravel Lane', 'Teufort','AZ','USA','10907');
 insert into Address(addressId, personCode, street, city, state, country, zip) values(3,'grayman','Location Unknown','Teufort','AZ','USA','');

  
 insert into Portfolio(portfolioCode, ownerCode, managerCode, beneficiaryCode, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values('PT001','redman','grayman','grayman',20,1061.89,123674.20,21237.78,1.9959);
 insert into Portfolio(portfolioCode, ownerCode, managerCode, beneficiaryCode, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values('PT002','bluman','grayman','grayman',20,966.66,112790.50,19333.23,2.5440);
 insert into Portfolio(portfolioCode, ownerCode, managerCode, beneficiaryCode, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values('PT003','redman','redman','',50, 0.80, 40, 40, 9.0150);
 insert into Portfolio(portfolioCode, ownerCode, managerCode, beneficiaryCode, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values('PT004','bluman','grayman','', 10, 2, 40, 40, 9.0150);
 insert into Portfolio(portfolioCode, ownerCode, managerCode, beneficiaryCode, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values('PT005','grayman','grayman','grayman',20,128439.51,1579300,568790.15,7.7155);
 
 insert into AssetsTypes(assetType) values('P');
 insert into AssetsTypes(assetType) values('S');
 insert into AssetsTypes(assetType) values('D');
 
 insert into AssetsList(assetCode, assetType) values('GRAVEL','S');
 insert into AssetsList(assetCode, assetType) values('TWOSHORTS','P');
 insert into AssetsList(assetCode, assetType) values('RIRA','D');
 insert into AssetsList(assetCode, assetType) values('MANNCO','S');

 
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, assetValue, returnRate) values(1,'PT001', 'TWOSHORTS', 12, 1.15, 18785.15, 109081.20, 17.22);
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, assetValue, returnRate) values(2,'PT001', 'MANNCO', 100, 8.35, 2452.63, 14593.00, 16.81);
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, assetValue, returnRate) values(3,'PT002', 'TWOSHORTS', 10, 1.15, 15654.29, 90901.00, 17.22);
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, assetValue, returnRate) values(4,'PT002','MANNCO', 150, 8.35, 3678, 21889.5, 16.81);
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, assetValue, returnRate) values(5,'PT003','GRAVEL', 10000, 9.02, 40, 40, 100);
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, assetValue, returnRate) values(6,'PT004','GRAVEL', 10000, 9.02, 40, 40, 100);
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, assetValue, returnRate) values(7,'PT005','MANNCO', 100000, 8.35, 2452626, 14593000, 16.81);
 insert into Assets(portfolioCode, assetCode, assetModifier, risk, annualReturn, assetValue, returnRate) values('PT005','RIRA', 1200000, 0, 116164.15, 1200000, 9.68);

 insert into PrivateInvestment(privateInvestmentId, assetCode, assetType, quarterlyDividend, baseRateOfReturn, omegaMeasure, totalValue, assetName) values(1, 'TWOSHORTS', 'P', 32000, 0.314, 0.25, 909010,'Shorts Eatery(Family Owned)');
 
 insert into Stock(stockId, assetCode, assetType, quarterlyDividend, baseRateOfReturn, betaMeasure, stockSymbol, sharePrice, assetName) values(1, 'GRAVEL', 'S', 0.001, 0.000039, 9.015, 'GRVL', 0.004,'GravelPit Gravel Pits');
 insert into Stock(stockId, assetCode, assetType, quarterlyDividend, baseRateOfReturn, betaMeasure, stockSymbol, sharePrice, assetName) values(2, 'MANNCO', 'S', 3.14, 0.081999999999, 8.35, 'MANN', 145.93,'MannCo');

 insert into Deposit(depositId, assetCode, assetType, apr, assetName) values(1, 'RIRA', 'D', 0.0924, 'Roth IRA');
 


#MAYBE WE NEED SOME FOREIGN KEYS REFERENCING OR MAYBE CONSTRAINTS OR INDEXES
  ###
##
select * from Portfolio;
select * from Person;
select * from AssetsTypes;
select * from AssetsList;
select * from Assets;
select * from PrivateInvestment;
select * from Stock;
select * from Deposit;
select * from Address;
select * from Emails;

commit;