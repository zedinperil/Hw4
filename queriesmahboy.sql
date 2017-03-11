#01. A query to retrieve the major fields for every person
	
    Select * FROM Person;
    
#02. A query to retrieve the email(s) of a given person
	Select * From Emails e 
    join Person p ON e.personId = p.personId
    WHERE p.PersonCode = 'redman';
#03. A query to add an email to a specific person
select * from Emails where personId= 2;
insert into Emails (emailId, email, personId) values 
(5, 'This is not a real email', 
(select personId from Person where personId = 2));
select * from Person;  
#04. A query to change the emaill address of a given record
select * from Person;
update Emails set EMAILaddress = 'meh' where PersonId = 2;
#05. A query (or series of queries) to remove a given person record
delete from Emails where personId = 2;
delete from Person where personId = 2;
#06. A query to create a person record
select * from Person;
insert into Person (name) values ('Ubisoft');
insert into game (name, publisherId) values ('Assassin\'s Creed', 
  (select publisherId from publisher where name = 'Ubisoft'));
select * from game;  
#07. A query to get all the assets in a particular portfolio

#08. A query to get all the assets of a particular person

#09. A query to create a new asset record

#10. A query to create a new portfolio record

#11. A query to associate a particular asset with a particular portfolio

#12. A query to find the total number of portfolios owned by each person
	select * from Assets a join Portfolio p on a.portfolioCode=p.portfolioCode where p.ownerCode='redman';

#13. A query to find the total number of portfolios managed by each person

#14. A query to find the total value of all stocks in each portfolio(Hint: you can take the "aggregate of" mathematical expression).

#15. A query to detect an invalid distribution of private investment assets 
#   (that is, a query to add up the stake percentage of each such asset and return a list of investment whose percentage exceeds 100%)