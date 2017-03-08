#Tyler Zinsmaster & Alex Chmelka

start transaction;



drop table if exists Emails;
drop table if exists Address;
drop table if exists Person;
drop table if exists Owners;
drop table if exists Manager;
drop table if exists Beneficiary;
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

create table Owners (
  ownerId int not null primary key auto_increment,
  personCode varchar(50),
  firstName varchar(50),
  lastName varchar(50)
  )engine=InnoDB,collate=latin1_general_cs;

create table Manager (
  managerId int not null primary key auto_increment,
  personCode varchar(50),
  firstName varchar(50),
  lastName varchar(50),
  persontype varchar(50),
  secId int
  )engine=InnoDB,collate=latin1_general_cs;

create table Beneficiary (
  beneficiaryId int not null primary key auto_increment,
  personCode varchar(50),
  firstName varchar(50),
  lastName varchar(50)
  )engine=InnoDB,collate=latin1_general_cs;

create table PrivateInvestment (
  assetId int not null primary key auto_increment,
  assetCode varchar(50),
  assetType varchar(50),
  quarterlyDividend double,
  baseRateOfReturn double,
  omegaMeasure double,
  totalValue double
  )engine=InnoDB,collate=latin1_general_cs;

create table Stock (
  assetId int not null primary key auto_increment,
  assetCode varchar(50),
  assetType varchar(50),
  quarterlyDividend double,
  baseRateOfReturn double,
  betaMeasure double,
  stockSymbol varchar(50),
  sharePrice double
  )engine=InnoDB,collate=latin1_general_cs;

create table Deposit (
  assetId int not null primary key auto_increment,
  assetCode varchar(50),
  assetType varchar(50),
  apr double
  )engine=InnoDB,collate=latin1_general_cs;
  
  
create table Assets (
  assetId int not null primary key auto_increment,
  portfolioId int not null,
  assetCode varchar(50),
  assetType varchar(50),
  assetName varchar(50),
  assetCode varchar(50),
  assetModifier varchar(50),
  risk double,
  annualReturn double,
  returnRate double
  )engine=InnoDB,collate=latin1_general_cs;
  
  create table Portfolio (
  portfolioId int not null primary key auto_increment,
  ownerId int not null,
  managerId int not null,
  beneficiaryId int,
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


  
  ###
create table BandMember (
  bandMemberId int not null primary key auto_increment,
  musicianId int not null,
  bandId int not null,
  yearJoined int,
  foreign key (musicianId) references Musician(musicianId),
  foreign key (bandId) references Band(bandId),
  #prevent duplicate entries
  constraint uniquePair unique index(musicianId,bandId)
)engine=InnoDB,collate=latin1_general_cs;

create table Album (
  albumId int not null primary key auto_increment,
  title varchar(100) not null,
  year int not null,
  number int not null,
  bandId int not null,
  foreign key (bandId) references Band(bandId)
)engine=InnoDB,collate=latin1_general_cs;

create table Song (
  songId int not null primary key auto_increment,
  title varchar(255) not null
)engine=InnoDB,collate=latin1_general_cs;

create table AlbumSong (
  albumSongId int not null primary key auto_increment,
  trackNumber int not null,
  trackLength int not null,
  albumId int not null,
  songId int not null,
  foreign key (albumId) references Album(albumId),
  foreign key (songId) references Song(songId),
  #prevent duplicate entries
  constraint uniquePair unique index(albumId,songId)
)engine=InnoDB,collate=latin1_general_cs;

##

commit;