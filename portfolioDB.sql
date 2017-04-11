#Tyler Zinsmaster & Alex Chmelka
use tzinsmaster;
start transaction;
select p.portfolioCode, p.portfolioId, q.personCode as OwnerCode, m.personCode as ManagerCode, b.personCode as BeneficiaryCode, q.lastName as OwnerLastName, q.firstName as OwnerFirstName,
				 m.lastName as ManagerLastName, m.firstName as ManagerFirstName, m.persontype as ManagerType, b.lastName as BeneficiaryLastName, b.firstName as BeneficiaryFirstName,
				 p.fees, p.aggRisk, p.commissions, p.totalValue, p.sumOfAnnualReturns from Portfolio p
				 join Person q on q.personId=p.ownerId join Person m on m.personId=p.managerId join Person b on b.personId=p.beneficiaryId;


select p.portfolioCode, L.assetCode, L.assetName, L.assetType, a.assetValue, a.returnRate, a.annualReturn, a.risk, a.assetModifier
       from Assets a JOIN Portfolio p ON p.portfolioId = a.portfolioId JOIN AssetsList L ON L.assetListId = a.assetListId;
#List for dropping tables, useful for testing puroses and reseting tables from querries
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
  #primary key is auto incremented, the work is done for us and gurantees no repeats
  #basic data, personCode must be unique and everyone must have names
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
);

create table Emails (
	#Having an emails table will be useful for querries for testing
    #emailId is not a necessary primary key, but it's useful for potential future tables and it must be unique
  emailId int not null primary key auto_increment,
  email varchar(100) not null unique,
  personId int not null,
  #foreign key from the person table
  FOREIGN KEY (personId) REFERENCES Person(personId)
);

  create table Portfolio (
  #portfolio's primary key which is auto-incremented, needed for references to assets
  portfolioId integer not null primary key auto_increment,
  #lots of data from calculations, the owner, manager, and beneficiary id all reference the personId from the person Table
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
  );
     
  
create table AssetsList (
	#the assets list is a list of all the assets in the data.  It is very important to have these here so they may be referenced correctly, as portfolios 
    #references many different assets
    
    #primary key is the id of a specfic asset.  It is auto_incremented so no asset will have the same id.
  assetListId integer not null primary key auto_increment,
	#assetCode which is given to it
  assetCode varchar(15) not null unique,
	#name of the asset
  assetName varchar(50) not null,
   #the type of the asset
  assetType varchar(1) not null 
  );

create table Assets (
	#the asset table takes a specific asset and breaks it down into further values.  It is admittedly a bit strange to get more specfic when going in deeper into 
    #a data structure, but it works well and makes sense.
    
    #the assetId is mostly for potential future code, it is not used
  assetId integer not null primary key auto_increment,
  assetListId int not null,
  #The foreign keys that place an asset in a portfolio and gets the specifc asset itself
  FOREIGN KEY (assetListId) REFERENCES AssetsList(assetListId),
  portfolioId int not null,
  FOREIGN KEY (portfolioId) REFERENCES Portfolio(portfolioId),
  #general data that can be used for querrys
  assetModifier double not null,
  risk double not null,
  annualReturn double not null,
  assetValue double not null,
  returnRate double not null
  );


#BIG NOTE: These tables are mostly legacy code. We have left them in for potential future expansion, as it would give us more data to work with.
#We had a hard time finding use for the data in these tables, so we omitted them from use in our testing querries.  
create table PrivateInvestment (
  privateInvestmentId int not null primary key auto_increment,
  assetListId int not null,
  FOREIGN KEY (assetListId) REFERENCES AssetsList(assetListId),
  quarterlyDividend double not null,
  baseRateOfReturn double not null,
  omegaMeasure double not null,
  pValue double not null
  );

create table Stock (
  stockId int not null primary key auto_increment,
  assetListId int not null,
  FOREIGN KEY (assetListId) REFERENCES AssetsList(assetListId),
  quarterlyDividend double not null,
  baseRateOfReturn double not null,
  betaMeasure double not null,
  stockSymbol varchar(10) not null,
  sharePrice double not null
  );

create table Deposit (
  depositId int not null primary key auto_increment,
  assetListId int not null,
  FOREIGN KEY (assetListId) REFERENCES AssetsList(assetListId),
  apr double not null
  );
  
  

 #general data insertion. We made our own test cases from the popular game Team Fortress 2.
 insert into Person(personId, personCode, firstName, lastName, persontype, secId, street, city, state, country, zip) values(1, 'redman','Redmond','Mann','J','sec173','7 Gravel Lane', 'Teufort','AZ','USA','10907');
 insert into Person(personId, personCode, firstName, lastName, persontype, secId, street, city, state, country, zip) values(2, 'bluman','Blutarch','Mann','','','7 Gravel Lane', 'Teufort','AZ','USA','10907');
 insert into Person(personId, personCode, firstName, lastName, persontype, secId, street, city, state, country, zip) values(3, 'grayman','Gray','Mann','E','sec682','Location Unknown','Teufort','AZ','USA','');
 insert into Person(personId, personCode, firstName, lastName, persontype, secId, street, city, state, country, zip) values(4, 'noemailman','Guywith','Noemails','','','Street of mystery','Lincoln','NE','USA','68510');


 insert into Emails(emailId, personId, email) values (1,1,'killtheblus@gravelpit.co');
 insert into Emails(emailId, personId, email) values (2,2,'blutarchmann@gannco.com');
 insert into Emails(emailId, personId, email) values (3,2,'killthereds@gravelpit.co');
 insert into Emails(emailId, personId, email) values (4,3,'owner@mannco.com');
  
 insert into Portfolio(portfolioId, portfolioCode, ownerId, managerId, beneficiaryId, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(1, 'PT001',1,3,3,20,1061.89,123674.20,21237.78,1.9959);
 insert into Portfolio(portfolioId, portfolioCode, ownerId, managerId, beneficiaryId, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(2, 'PT002',2,3,3,20,966.66,112790.50,19333.23,2.5440);
 insert into Portfolio(portfolioId, portfolioCode, ownerId, managerId, beneficiaryId, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(3, 'PT003',1,1,null,50, 0.80, 40, 40, 9.0150);
 insert into Portfolio(portfolioId, portfolioCode, ownerId, managerId, beneficiaryId, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(4, 'PT004',2,3,null, 10, 2, 40, 40, 9.0150);
 insert into Portfolio(portfolioId, portfolioCode, ownerId, managerId, beneficiaryId, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(5, 'PT005',3,3,3,20,128439.51,1579300,568790.15,7.7155);
 insert into Portfolio(portfolioId, portfolioCode, ownerId, managerId, beneficiaryId, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(6, 'PT006',4,4,4,10,100,1000,140,1);
 
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
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(11,1,6, 10, 1.15, 15654.29, 90901.00, 17.22);


insert into PrivateInvestment(privateInvestmentId, assetListId, quarterlyDividend, baseRateOfReturn, omegaMeasure, pValue) values(1, 2, 32000, 0.314, 0.25, 909010);
 
insert into Stock(stockId, assetListId, quarterlyDividend, baseRateOfReturn, betaMeasure, stockSymbol, sharePrice) values(1, 1, 0.001, 0.000039, 9.015, 'GRVL', 0.004);
insert into Stock(stockId, assetListId, quarterlyDividend, baseRateOfReturn, betaMeasure, stockSymbol, sharePrice) values(2, 4, 3.14, 0.081999999999, 8.35, 'MANN', 145.93);

insert into Deposit(depositId, assetListId, apr) values(1, 3, 0.0924);

select p.portfolioCode, p.portfolioId, q.personCode as OwnerCode, m.personCode as ManagerCode, b.personCode as BeneficiaryCode, q.lastName as OwnerLastName, q.firstName as OwnerFirstName,
				 m.lastName as ManagerLastName, m.firstName as ManagerFirstName, m.persontype as ManagerType, b.lastName as BeneficiaryLastName, b.firstName as BeneficiaryFirstName,
				 p.fees, p.aggRisk, p.commissions, p.totalValue, p.sumOfAnnualReturns from Portfolio p
				 join Person q on q.personId=p.ownerId join Person m on m.personId=p.managerId join Person b on b.personId=p.beneficiaryId;


commit;