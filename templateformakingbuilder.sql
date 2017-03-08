#Tyler Zinsmaster & Alex Chmelka

start transaction;



drop table if exists Emails;
drop table if exists Address;
drop table if exists Person;
drop table if exists Portfolio;
drop table if exists Assets;
drop table if exists PrivateInvestment;
drop table if exists Deposit;
drop table if exists Stock;


create table Emails (
  emailId int not null primary key auto_increment,
  personCode varchar(50),
  email varchar(200)
)engine=InnoDB,collate=latin1_general_cs;

create table Address (
  addressId int not null primary key auto_increment,
  personCode varchar(50),
  street varchar(200),
  city varchar(200),
  state varchar(200),
  country varchar(200),
  zip varchar(200)
)engine=InnoDB,collate=latin1_general_cs;

create table Person (
  personId int not null primary key auto_increment,
  personCode varchar(50),
  firstName varchar(50),
  lastName varchar(50),
  persontype varchar(50),
  secId int
)engine=InnoDB,collate=latin1_general_cs;

create table PrivateInvestment (
  privateInvestmentId int not null primary key auto_increment,
  assetCode varchar(50),
  assetType varchar(50),
  assetName varchar(50),
  quarterlyDividend double,
  baseRateOfReturn double,
  omegaMeasure double,
  totalValue double
  )engine=InnoDB,collate=latin1_general_cs;

create table Stock (
  stockId int not null primary key auto_increment,
  assetCode varchar(50),
  assetType varchar(50),
  assetName varchar(50),
  quarterlyDividend double,
  baseRateOfReturn double,
  betaMeasure double,
  stockSymbol varchar(50),
  sharePrice double
  )engine=InnoDB,collate=latin1_general_cs;

create table Deposit (
  depositId int not null primary key auto_increment,
  assetCode varchar(50),
  assetType varchar(50),
  assetName varchar(50),
  apr double
  )engine=InnoDB,collate=latin1_general_cs;
  
  
create table Assets (
  assetId int not null primary key auto_increment,
  portfolioCode varchar(50) not null,
  assetCode varchar(50),
  assetModifier varchar(50),
  risk double,
  annualReturn double,
  returnRate double
  )engine=InnoDB,collate=latin1_general_cs;
  
  create table Portfolio (
  portfolioId int not null primary key auto_increment,
  portfolioCode varchar(50) not null,
  ownerCode varchar(50) not null,
  managerCode varchar(50) not null,
  beneficiaryCode varchar(50),
  fees double,
  commissions double,
  totalValue double,
  sumOfAnnualReturns double,
  aggRisk double
  )engine=InnoDB,collate=latin1_general_cs;
  
 insert into Emails(emailId, personCode, email) values (1,'redman','killtheblus@gravelpit.co');
 insert into Emails(emailId, personCode, email) values (2,'bluman','blutarchmann@gannco.com');
 insert into Emails(emailId, personCode, email) values (3,'bluman','killthereds@gravelpit.co');
 insert into Emails(emailId, personCode, email) values (4,'grayman','owner@mannco.com');


 insert into Address(addressId, personCode, street, city, state, country, zipcode) values(1,'redman','7 Gravel Lane', 'Teufort','AZ','USA','10907');
 insert into Address(addressId, personCode, street, city, state, country, zipcode) values(2,'bluman','7 Gravel Lane', 'Teufort','AZ','USA','10907');
 insert into Address(addressId, personCode, street, city, state, country, zipcode) values(3,'grayman','Location Unknown','Teufort','AZ','USA','');

 insert into Person(personId, personCode, firstName, lastName, persontype, secId)values(1,'redman','Redmond','Mann','J','sec173');
 insert into Person(personId, personCode, firstName, lastName, persontype, secId)values(2,'bluman','Blutarch','Mann','','');
 insert into Person(personId, personCode, firstName, lastName, persontype, secId)values(3,'grayman','Gray','Mann','E','sec682');
 
 insert into PrivateInvestment(privateInvestmentId, assetCode, assetType, quarterlyDividend, baseRateOfReturn, omegaMeasure, totalValue, assetName) values(1, 'TWOSHORTS', 'P', 32000, 0.314, 0.25, 909010,'Shorts Eatery(Family Owned)');
 
 insert into Stock(stockId, assetCode, assetType, quarterlyDividend, baseRateOfReturn, betaMeasure, stockSymbol, sharePrice, assetName) values(1, 'GRAVEL', 'S', 0.001, 0.000039, 9.015, 'GRVL', 0.004,'GravelPit Gravel Pits');
 insert into Stock(stockId, assetCode, assetType, quarterlyDividend, baseRateOfReturn, betaMeasure, stockSymbol, sharePrice, assetName) values(2, 'MANNCO', 'S', 3.14, 0.081999999999, 8.35, 'MANN', 145.93,'MannCo');

 insert into Deposit(depositId, assetCode, assetType, apr, assetName) values(1, 'RIRA', 'D', 0.0924, 'Roth IRA');
 
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, returnRate) values(1,'PT001', 'TWOSHORTS', 12, 1.15, 18785.15, 17.22);
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, returnRate) values(2,'PT001', 'MANNCO', 100, 8.35, 2452.63, 14593.00, 16.81);
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, returnRate) values(3,'PT002', 'TWOSHORTS', 10, 1.15, 15654.29, 90901.00, 17.22);
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, returnRate) values(4,'PT002','MANNCO', 150, 8.35, 3678, 21889.5, 16.81);
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, returnRate) values(5,'PT003','GRAVEL', 10000, 9.02, 40, 40, 100);
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, returnRate) values(6,'PT004','GRAVEL', 10000, 9.02, 40, 40, 100);
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, returnRate) values(7,'PT005','MANNCO', 100000, 8.35, 2452626, 14593000, 16.81);
 insert into Assets(assetId, portfolioCode, assetCode, assetModifier, risk, annualReturn, returnRate) values(8,'PT005','RIRA', 1200000, 0, 116164.15, 1200000, 9.68);

 insert into Portfolio(portfolioId, portfolioCode, ownerCode, managerCode, beneficiaryCode, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(1,'PT001','redman','grayman','grayman',20,1061.89,123674.20,21237.78,1.9959);
 insert into Portfolio(portfolioId, portfolioCode, ownerCode, managerCode, beneficiaryCode, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(2,'PT002','bluman','grayman','grayman',20,966.66,112790.50,19333.23,2.5440);
 insert into Portfolio(portfolioId, portfolioCode, ownerCode, managerCode, beneficiaryCode, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(3,'PT003','redman','redman','',50, 0.80, 40, 40, 9.0150);
 insert into Portfolio(portfolioId, portfolioCode, ownerCode, managerCode, beneficiaryCode, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(4,'PT004','bluman','grayman','', 10, 2, 40, 40, 9.0150);
 insert into Portfolio(portfolioId, portfolioCode, ownerCode, managerCode, beneficiaryCode, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(5,'PT005','grayman','grayman','grayman',20,128439.51,1579300,568790.15,7.7155);
#MAYBE WE NEED SOME FOREIGN KEYS REFERENCING OR MAYBE CONSTRAINTS OR INDEXES
  ###
##

commit;