#Tyler Zinsmaster & Alex Chmelka
use tzinsmaster;
start transaction;

drop table if exists Emails;
drop table if exists PrivateInvestment;
drop table if exists Deposit;
drop table if exists Stock;
drop table if exists Assets;
drop table if exists AssetsList;
drop table if exists AssetsTypes;
drop table if exists Portfolio;
drop table if exists Person;


create table Person (
  personId integer not null primary key auto_increment,
  personCode varchar(10) not null unique,
  firstName varchar(10) not null,
  lastName varchar(50) not null,
  persontype varchar(50),
  secId varchar(15),
  street varchar(100),
  city varchar(70),
  state varchar(2),
  country varchar(50),
  zip varchar(10)
)engine=InnoDB,collate=latin1_general_cs;

create table Emails (
  emailId int not null primary key auto_increment,
  email varchar(100) not null unique,
  personId int not null,
  FOREIGN KEY (personId) REFERENCES Person(personId)
)engine=InnoDB,collate=latin1_general_cs;

  create table Portfolio (
  portfolioId integer not null primary key auto_increment,
  portfolioCode varchar(10) not null unique,
  ownerId int not null,
  managerId int not null, 
  beneficiaryId int,
  FOREIGN KEY (ownerId) REFERENCES Person(personId),
  FOREIGN KEY (managerId) REFERENCES Person(personId),
  FOREIGN KEY (beneficiaryId) REFERENCES Person(personId),
  fees double not null,
  commissions double not null,
  totalValue double not null,
  sumOfAnnualReturns double not null,
  aggRisk double not null
  )engine=InnoDB,collate=latin1_general_cs;
     
  
create table AssetsList (
  assetListId integer not null primary key auto_increment,
  assetCode varchar(15) not null unique,
  assetName varchar(50) not null,
  assetType varchar(1) not null 
  )engine=InnoDB,collate=latin1_general_cs;

create table Assets (
  assetId integer not null primary key auto_increment,
  assetListId int not null,
  FOREIGN KEY (assetListId) REFERENCES AssetsList(assetListId),
  portfolioId int not null,
  FOREIGN KEY (portfolioId) REFERENCES Portfolio(portfolioId),
  assetModifier double not null,
  risk double not null,
  annualReturn double not null,
  assetValue double not null,
  returnRate double not null
  )engine=InnoDB,collate=latin1_general_cs;



create table PrivateInvestment (
  privateInvestmentId int not null primary key auto_increment,
  assetListId int not null,
  FOREIGN KEY (assetListId) REFERENCES AssetsList(assetListId),
  quarterlyDividend double not null,
  baseRateOfReturn double not null,
  omegaMeasure double not null,
  pValue double not null
  )engine=InnoDB,collate=latin1_general_cs;

create table Stock (
  stockId int not null primary key auto_increment,
  assetListId int not null,
  FOREIGN KEY (assetListId) REFERENCES AssetsList(assetListId),
  quarterlyDividend double not null,
  baseRateOfReturn double not null,
  betaMeasure double not null,
  stockSymbol varchar(10) not null,
  sharePrice double not null
  )engine=InnoDB,collate=latin1_general_cs;

create table Deposit (
  depositId int not null primary key auto_increment,
  assetListId int not null,
  FOREIGN KEY (assetListId) REFERENCES AssetsList(assetListId),
  apr double not null
  )engine=InnoDB,collate=latin1_general_cs;
  
  


 insert into Person(personId, personCode, firstName, lastName, persontype, secId, street, city, state, country, zip) values(1, 'redman','Redmond','Mann','J','sec173','7 Gravel Lane', 'Teufort','AZ','USA','10907');
 insert into Person(personId, personCode, firstName, lastName, persontype, secId, street, city, state, country, zip) values(2, 'bluman','Blutarch','Mann','','','7 Gravel Lane', 'Teufort','AZ','USA','10907');
 insert into Person(personId, personCode, firstName, lastName, persontype, secId, street, city, state, country, zip) values(3, 'grayman','Gray','Mann','E','sec682','Location Unknown','Teufort','AZ','USA','');
 insert into Person(personId, personCode, firstName, lastName, persontype, secId, street, city, state, country, zip) values(4, '','none','','','','','','','','');

 insert into Emails(emailId, personId, email) values (1,1,'killtheblus@gravelpit.co');
 insert into Emails(emailId, personId, email) values (2,2,'blutarchmann@gannco.com');
 insert into Emails(emailId, personId, email) values (3,2,'killthereds@gravelpit.co');
 insert into Emails(emailId, personId, email) values (4,3,'owner@mannco.com');
  
 insert into Portfolio(portfolioId, portfolioCode, ownerId, managerId, beneficiaryId, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(1, 'PT001',1,3,3,20,1061.89,123674.20,21237.78,1.9959);
 insert into Portfolio(portfolioId, portfolioCode, ownerId, managerId, beneficiaryId, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(2, 'PT002',2,3,3,20,966.66,112790.50,19333.23,2.5440);
 insert into Portfolio(portfolioId, portfolioCode, ownerId, managerId, beneficiaryId, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(3, 'PT003',1,1,4,50, 0.80, 40, 40, 9.0150);
 insert into Portfolio(portfolioId, portfolioCode, ownerId, managerId, beneficiaryId, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(4, 'PT004',2,3,4, 10, 2, 40, 40, 9.0150);
 insert into Portfolio(portfolioId, portfolioCode, ownerId, managerId, beneficiaryId, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(5, 'PT005',3,3,3,20,128439.51,1579300,568790.15,7.7155);

 insert into AssetsList(assetListId, assetCode, assetType, assetName) values(1,'GRAVEL','S','GravelPit Gravel Pits');
 insert into AssetsList(assetListId, assetCode, assetType, assetName) values(2,'TWOSHORTS','P','Shorts Eatery(Family Owned)');
 insert into AssetsList(assetListId, assetCode, assetType, assetName) values(3,'RIRA','D', 'Roth IRA');
 insert into AssetsList(assetListId, assetCode, assetType, assetName) values(4,'MANNCO','S','MannCo');

 
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(1,2,1, 12, 1.15, 18785.15, 109081.20, 17.22);
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(2,4,1, 100, 8.35, 2452.63, 14593.00, 16.81);
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(3,2,2, 8, 1.15, 15654.29, 90901.00, 17.22);
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(4,4,2, 150, 8.35, 3678, 21889.5, 16.81);
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(5,1,3, 10000, 9.02, 40, 40, 100);
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(6,1,4, 10000, 9.02, 40, 40, 100);
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(7,4,5, 100000, 8.35, 2452626, 14593000, 16.81);
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(8,3,5, 1200000, 0, 116164.15, 1200000, 9.68);
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(9,1,5, 10, 1.15, 15654.29, 90901.00, 17.22);

 insert into PrivateInvestment(privateInvestmentId, assetListId, quarterlyDividend, baseRateOfReturn, omegaMeasure, pValue) values(1, 2, 32000, 0.314, 0.25, 909010);
 
 insert into Stock(stockId, assetListId, quarterlyDividend, baseRateOfReturn, betaMeasure, stockSymbol, sharePrice) values(1, 1, 0.001, 0.000039, 9.015, 'GRVL', 0.004);
 insert into Stock(stockId, assetListId, quarterlyDividend, baseRateOfReturn, betaMeasure, stockSymbol, sharePrice) values(2, 4, 3.14, 0.081999999999, 8.35, 'MANN', 145.93);

 insert into Deposit(depositId, assetListId, apr) values(1, 3, 0.0924);
 


#MAYBE WE NEED SOME FOREIGN KEYS REFERENCING OR MAYBE CONSTRAINTS OR INDEXES
  ###
##
select * from Portfolio;
select * from Person;
select * from AssetsList;
select * from Assets;
select * from PrivateInvestment;
select * from Stock;
select * from Deposit;
select * from Emails;

#select * from Deposit d join AssetsList l on d.assetCode= l.assetCode;
#select * from PrivateInvestment p join AssetsList l on p.assetCode= l.assetCode;
#select * from Stock s join AssetsList l on s.assetCode= l.assetCode;
#select * from Assets a join AssetsList l on a.assetCode= l.assetCode join Deposit d on d.assetType=l.assetType; 
#select * from Assets a join Portfolio p on a.portfolioCode=p.portfolioCode where p.ownerCode='redman';
#12
select q.firstName as FirstName, q.lastName as LastName, count(a.assetListId=l.assetListId) as AssetsOwned from Portfolio p  join Assets a on a.portfolioId=p.portfolioId join AssetsList l on l.assetListId=a.assetListId join Person q on q.personId=p.ownerId group by p.ownerId;

#13
select q.firstName as FirstName, q.lastName as LastName, count(a.assetListId=l.assetListId) as AssetsManaged from Portfolio p  join Assets a on a.portfolioId=p.portfolioId join AssetsList l on l.assetListId=a.assetListId join Person q on q.personId=p.managerId group by p.managerId;


#14
select p.portfolioCode as portfolio, sum(a.assetValue) as TotalStockValues from Portfolio p join Assets a on p.portfolioId=a.portfolioId join AssetsList l on l.assetListId=a.assetListId join Stock s on s.assetListId=l.assetListId group by p.portfolioCode;
commit;

#15
 insert into AssetsList(assetListId, assetCode, assetType, assetName) values(5,'HOME','P','Homeboy Hoagies');
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(10,5,1, 92, 1.15, 18785.15, 109081.20, 17.22);
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(11,5,2, 92, 1.15, 18785.15, 109081.20, 17.22);
 select p.portfolioCode as portfolio, sum(if(a.assetlistId=l.assetlistId and l.assetType='P',a.assetModifier,0)) as PercentStake, q.personCode as OwnerCode from Portfolio p join Assets a on p.portfolioId=a.portfolioId join AssetsList l on l.assetListId join Person q on q.personId=p.ownerId where l.assetType='P' group by p.portfolioCode having sum(if(a.assetlistId=l.assetlistId and l.assetType='P',a.assetModifier,0))>100;