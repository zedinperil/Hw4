#01. A query to retrieve the major fields for every person
#all persons, with all their fields, including emails	
    select * from Person p
    join Emails e on p.personId = e.personId;
    
#02. A query to retrieve the email(s) of a given person
#we see all the emails of blutarch mann
	Select e.emailId, e.email, e.personId,p.personCode,p.firstName, p.lastName from Emails e 
    join Person p ON e.personId = p.personId
    where p.personCode='bluman';
#03. A query to add an email to a specific person
 #Here, we do the unthinkable, and add an email to the noemailman
 select * from Emails where personId= 4;
 insert into Emails (emailId, email, personId) values 
 (5, 'This is not a real email', 4);
 Select * From Emails e 
    join Person p ON e.personId = p.personId
    WHERE p.personCode = 'noemailman';
#04. A query to change the email address of a given record
#noemailman was unhappy with his email. we will change it for him. 
 update Emails set email = 'meh' where emailId=5;
 select * from Emails;
#05. A query (or series of queries) to remove a given person record
#NOTE: We delete from the most outward table inward so that we do not run into any foreign key errors. Here, we delete everything having to do
#with our favorite person, noemailman, because he just couldn't stand having an email and decided to leave our service.
 delete a from Assets a join Portfolio p on p.portfolioId=a.portfolioId join Person q on q.personId=p.ownerId where q.personId=4; 
 delete a from Assets a join Portfolio p on p.portfolioId=a.portfolioId join Person q on q.personId=p.managerId where q.personId=4; 
 delete a from Assets a join Portfolio p on p.portfolioId=a.portfolioId join Person q on q.personId=p.beneficiaryId where q.personId=4; 

delete p from Portfolio p join Person q on q.personId=p.ownerId where q.personId=4;
delete p from Portfolio p join Person q on q.personId=p.managerId where q.personId=4;
delete p from Portfolio p join Person q on q.personId=p.beneficiaryId where q.personId=4;

delete e from Emails e join Person p on p.personId=e.personId where p.personId=4;

delete from Person where personId=4;

select * from Person;
select * from Portfolio;
select * from Assets;
select * from Emails;
#06. A query to create a person record
#however, Bean Wakali has decided to join us :D
select * from Person;
insert into Person (personId, personCode, firstName, lastName, personType, secId, street, city, state, country, zip) values 
				   (5,'BEAN', 'Bean', 'Wakali', '', '', '7420 Cooper Ave', 'BIGSCITY', 'ZE', 'Africa', '69269');
select * from Person;

#07. A query to get all the assets in a particular portfolio
#Here we see all of the assets in the portfolio PT001, owned by Redmond Mann
select p.portfolioCode, p.portfolioId, L.assetCode, L.assetName, L.assetType from Assets a JOIN Portfolio p ON p.portfolioId = a.portfolioId
JOIN AssetsList L ON L.assetListId = a.assetListId where p.portfolioCode='PT001';

#08. A query to get all the assets of a particular person
#Let us see all of the assets owned by Redmond Mann
 select q.firstName, q.lastName, q.personId, q.personCode, l.assetCode, l.assetName, l.assetType, p.portfolioCode, a.assetModifier as Amount
 from Assets a join Portfolio p on a.portfolioId=p.portfolioId
 join AssetsList l on l.assetListId=a.assetListId
 join Person q on q.personId=p.ownerId
 where p.ownerId=1;
 
#09. A query to create a new asset record
#Test asset will be made.
 insert into AssetsList(assetListId, assetCode, assetType, assetName) values(5,'TESTASSET','D','Test A Roo');
 select * from AssetsList;

#10. A query to create a new portfolio record
#A new portfolio for Redmond
 insert into Portfolio(portfolioId, portfolioCode, ownerId, managerId, beneficiaryId, fees, commissions, totalValue, sumOfAnnualReturns, aggRisk) values(7, 'PT007',1,2,3,0,0,0,0,0);
 select * from Portfolio;
#11. A query to associate a particular asset with a particular portfolio
#yo, just added an asset, and checked to show that its in that new portfolio we just made. It isn't worth anything though.
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(12,5,7, 12, 0, 0, 0, 0);
 select p.portfolioCode, l.assetCode, l.assetName from Portfolio p join Assets a on p.portfolioId=a.portfolioId join AssetsList l on a.assetListId=l.assetListId where p.portfolioCode='PT007';

#12. A query to find the total number of portfolios owned by each person
#self explanatory, just some joins and a grouping
 select q.firstName as FirstName, q.lastName as LastName, count(q.personId=p.ownerId) as PortfoliosOwned
 from Portfolio p  join Person q on q.personId=p.ownerId
 group by p.ownerId;

#13. A query to find the total number of portfolios managed by each person
 #self explanatory, same as above
 select q.firstName as FirstName, q.lastName as LastName, count(q.personId=p.managerId) as PortfoliosManaged
 from Portfolio p join Person q on q.personId=p.managerId
 group by p.managerId;

#14. A query to find the total value of all stocks in each portfolio(Hint: you can take the "aggregate of" mathematical expression).
#take the sums of all occurrances where the asset occurance within a portfolio has an asset in the assetlist that has it's type being "s", for stock. grouped so that all portfolios are listed.
 select p.portfolioCode as portfolio, sum(if(a.assetlistId=l.assetlistId and l.assetType='S',a.assetValue,0)) as TotalStockValues
 from Portfolio p join Assets a on p.portfolioId=a.portfolioId
 join AssetsList l on l.assetListId=a.assetListId
 group by p.portfolioCode;

#15. A query to detect an invalid distribution of private investment assets 
#   (that is, a query to add up the stake percentage of each such asset and return a list of investment whose percentage exceeds 100%)
# we create a new asset in the assetlist
# we add two occurrances of this asset into the assets table, one which we know will bring to more than 100 percentage stake, for redmond mann's PT001, and one which will equal 100 exactly, in blutarch mann's PT002
# then, we look for the sum of all asset occurances within each portfolio, and check the type of the asset occurrance within the asset list. If the type is 'p', then we add the asset modifier value of the asset occurrance to the sum.
# this should return only one result, where redmond mann's PT001 has 104 percentage stake. 
 insert into AssetsList(assetListId, assetCode, assetType, assetName) values(6,'HOME','P','Homeboy Hoagies');
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(13,6,1, 92, 1.15, 18785.15, 109081.20, 17.22);
 insert into Assets(assetId, assetListId, portfolioId, assetModifier, risk, annualReturn, assetValue, returnRate) values(14,6,2, 92, 1.15, 18785.15, 109081.20, 17.22);
 select p.portfolioCode as portfolio, sum(if(a.assetlistId=l.assetlistId and l.assetType='P',a.assetModifier,0)) as PercentStake, q.personCode as OwnerCode
 from Portfolio p
 join Assets a on p.portfolioId=a.portfolioId
 join AssetsList l on l.assetListId
 join Person q on q.personId=p.ownerId
 group by p.portfolioCode
 having sum(if(a.assetlistId=l.assetlistId and l.assetType='P',a.assetModifier,0))>100;
 
 
 select count(*) from Assets;
 
 select p.portfolioCode, p.portfolioId, p.ownerId, q.lastName as OwnerLastName, q.firstName as OwnerFirstName, m.lastName as ManagerLastName, m.firstName as ManagerFirstName, m.persontype, b.lastName as BeneficiaryLastName, b.firstName as BeneficiaryFirstName, p.managerId, p.beneficiaryId, p.fees, p.commissions, p.totalValue, p.sumOfAnnualReturns, p.aggRisk, L.assetCode, L.assetName, L.assetType, a.assetValue, a.returnRate, a.annualReturn, a.risk, a.assetModifier from Assets a JOIN Portfolio p ON p.portfolioId = a.portfolioId
JOIN AssetsList L ON L.assetListId = a.assetListId Join Person q on q.personId=p.ownerId join Person m on m.personId=p.managerId join Person b on b.personId=p.beneficiaryId;