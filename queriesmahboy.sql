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
insert into Person (PersonId) values (5);
insert into Person (personCode, firstName, lastName, personType, secId, street, city, state, country, zip) values 
				   ('312', 'Meh', 'moo', 'S', 'ma', '7420 Cooper Ave', 'ya mum', 'Africa', '69269');
    
#07. A query to get all the assets in a particular portfolio
select * from Assets a JOIN Portfolio p ON p.portfolioId = a.portfolioId
JOIN AssetsList L ON L.assetListId = a.assetListId;

#08. A query to get all the assets of a particular person

#09. A query to create a new asset record

#10. A query to create a new portfolio record

#11. A query to associate a particular asset with a particular portfolio

#12. A query to find the total number of portfolios owned by each person

#13. A query to find the total number of portfolios managed by each person

#14. A query to find the total value of all stocks in each portfolio(Hint: you can take the "aggregate of" mathematical expression).

#15. A query to detect an invalid distribution of private investment assets 
#   (that is, a query to add up the stake percentage of each such asset and return a list of investment whose percentage exceeds 100%)