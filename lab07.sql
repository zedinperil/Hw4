use tzinsmaster;

select * from Album;

select * from Album
order by year desc;

select * from Band
where name like 'The%';

select * from Song
order by title;

select albumId from Album
where title like '%Nevermind%';

select count(*) as NumbMusicians
from Musician;

select * from Album
where year= (select min(year) from Album) ;

select sum(trackLength) as length
from AlbumSong a where
a.albumId = (select albumId from Album where title like '%Rain Dogs%');

select a.title as Title, a.year as Year, b.name as Name from Album a
join Band b on a.bandId=b.bandId;

select * from Band b left join Album a on
a.bandId=b.bandId left join AlbumSong alsong on a.albumId= alsong.albumId left join
Song s on alsong.songId=s.songId
where b.bandId=(select bandId from Band where name like 'Nirvana');

select * from Band b left join Album a on
b.bandId= a.bandId;

select b.name as bandname,
count(a.albumId) as albums
from Album a
right join Band b on
b.bandId=a.bandId
group by bandname
order by albums;

select a.title as Title,
count(s.songId) as NumberOfSongs
from Album a left join AlbumSong als on a.albumId=als.albumId left join
Song s on als.songId=s.songId
group by a.title;

select a.title as Title,
count(s.songId) as NumberOfSongs
from Album a left join AlbumSong als on a.albumId=als.albumId left join
Song s on als.songId=s.songId
group by a.title
having count(s.songId)>11;

select * from Musician m left join BandMember b
on b.musicianId=m.musicianId left join Band on b.bandId=Band.bandId
where Band.bandId =null;

select *,
count(m.musicianId) as NumberOfBands
from Musician m left join BandMember b on m.musician=b.musicianId
group by m.musicianId
having count(m.musicianId) >1;