#01. A query to retrieve the major fields for every person
	
    select * from Person p
  left join Emails e on p.personId = e.personId;
    
#02. A query to retrieve the email(s) of a given person
	Select e.emailId, e.email, e.personId,p.personCode,p.firstName, p.lastName from Emails e 
    join Person p ON e.personId = p.personId
    WHERE p.PersonCode = 'redman';
#03. A query to add an email to a specific person
select * from Emails where personId= 2;
insert into Emails (emailId, email, personId) values 
(5, 'This is not a real email', 2);
Select * From Emails e 
    join Person p ON e.personId = p.personId
    WHERE p.PersonCode = 'bluman';
#04. A query to change the emaill address of a given record
update Emails set email = 'meh' where emailId=5;
select * from Emails;
#05. A query (or series of queries) to remove a given person record
delete Emails from Emails where personId = 2;
delete from Person where personId = 2;
delete from Portfolio where personId = 2;
#06. A query to create a person record
select * from Person;
insert into Person (personId, personCode, firstName, lastName, personType, secId, street, city, state, country, zip) values 
				   (5,'312', 'Meh', 'moo', 'S', 'ma', '7420 Cooper Ave', 'ya dad', 'ya', 'Africa', '69269');
    
#07. A query to get all the assets in a particular portfolio
select p.portfolioCode, p.portfolioId, L.assetCode, L.assetName, L.assetType from Assets a JOIN Portfolio p ON p.portfolioId = a.portfolioId
JOIN AssetsList L ON L.assetListId = a.assetListId where p.portfolioCode='PT001';

#08. A query to get all the assets of a particular person
select q.firstName, q.lastName, q.personId, q.personCode, l.assetCode, l.assetName, l.assetType, p.portfolioCode, a.assetModifier as Amount from Assets a join Portfolio p on a.portfolioId=p.portfolioId join AssetsList l on l.assetListId=a.assetListId join Person q on q.personId=p.ownerId where p.ownerId=1;
 
#09. A query to create a new asset record
 insert into AssetsList(assetListId, assetCode, assetType, assetName) values(5,'TESTASSET','D','Test A Roo');

#10. A query to create a new portfolio record
 insert into Portfolio(portfolioId, portfolioCode, ownerId, managerId, beneficiaryId, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(6, 'PT006',1,2,3,30,90.3,1000000,320345,0.06);
#11. A query to associate a particular asset with a particular portfolio
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(1,5,6, 12, 1.15, 18785.15, 109081.20, 17.22);
#12. A query to find the total number of portfolios owned by each person
select q.firstName as FirstName, q.lastName as LastName, count(a.assetListId=l.assetListId) as AssetsOwned from Portfolio p  join Assets a on a.portfolioId=p.portfolioId join AssetsList l on l.assetListId=a.assetListId join Person q on q.personId=p.ownerId where p.ownerId=1;
select q.firstName as FirstName, q.lastName as LastName, count(a.assetListId=l.assetListId) as AssetsOwned from Portfolio p  join Assets a on a.portfolioId=p.portfolioId join AssetsList l on l.assetListId=a.assetListId join Person q on q.personId=p.ownerId where p.ownerId=2;
select q.firstName as FirstName, q.lastName as LastName, count(a.assetListId=l.assetListId) as AssetsOwned from Portfolio p  join Assets a on a.portfolioId=p.portfolioId join AssetsList l on l.assetListId=a.assetListId join Person q on q.personId=p.ownerId where p.ownerId=3;

#13. A query to find the total number of portfolios managed by each person
select q.firstName as FirstName, q.lastName as LastName, count(a.assetListId=l.assetListId) as AssetsManaged from Portfolio p  join Assets a on a.portfolioId=p.portfolioId join AssetsList l on l.assetListId=a.assetListId join Person q on q.personId=p.managerId where p.managerId=1;
select q.firstName as FirstName, q.lastName as LastName, count(a.assetListId=l.assetListId) as AssetsManaged from Portfolio p  join Assets a on a.portfolioId=p.portfolioId join AssetsList l on l.assetListId=a.assetListId join Person q on q.personId=p.managerId where p.managerId=2;
select q.firstName as FirstName, q.lastName as LastName, count(a.assetListId=l.assetListId) as AssetsManaged from Portfolio p  join Assets a on a.portfolioId=p.portfolioId join AssetsList l on l.assetListId=a.assetListId join Person q on q.personId=p.managerId where p.managerId=3;

#14. A query to find the total value of all stocks in each portfolio(Hint: you can take the "aggregate of" mathematical expression).

#15. A query to detect an invalid distribution of private investment assets 
#   (that is, a query to add up the stake percentage of each such asset and return a list of investment whose percentage exceeds 100%)