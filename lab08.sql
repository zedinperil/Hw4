use tzinsmaster;
#Tyler Zinsmaster
#Jacob Moe

#1	
insert into Band(bandId,name) values(9004, 'Arctic Monkeys');
insert into Album(albumId,title,year,number,bandId) values (42863,'Favorite Worst Nightmare',2007,2, 9004);
insert into Song(songId, title) values(10000, 'BrianStorm');
insert into Song(songId, title) values(10001, 'Teddy Picker');
insert into AlbumSong (trackNumber, trackLength, albumId,songId) values(1, 170,42863,10000);
insert into AlbumSong (trackNumber, trackLength, albumId,songId) values(2, 163,42863,10001);

#2
update Musician SET firstName='Pete'
where musicianId=1005;
select * from Musician;

#3
DELETE from BandMember
where musicianId=1005 AND bandId=2001;
select * from BandMember 
where bandId=2001;

#4
DELETE from Song
where title like 'Big in Japan';
select * from Song;
DELETE from AlbumSong
where albumId=6;
DELETE from Album
where albumId=6;
select * from Album;

#Part 2-3

create table ConcertHall(
hallId int not null primary key auto_increment,
name varchar(255),
seats int not null
)engine=InnoDB,collate=latin1_general_cs;

#drop table ConcertHall;

create table Concert(
concertId int not null primary key auto_increment,
date varchar(255),
hallId int not null,
bandId int not null,
ticketsSold int,
foreign key(hallId) references ConcertHall(hallId),
foreign key(bandId) references Band(bandId)
)engine=InnoDB,collate=latin1_general_cs;

#drop table Concert;

create table ConcertSong(
concertSongId int not null primary key auto_increment,
songId int not null,
concertId int not null,
foreign key(songId) references Song(songId),
foreign key(concertId) references Concert(concertId),
constraint uniquePair unique index(songid,concertId)
)engine=InnoDB,collate=latin1_general_cs;

#drop table ConcertSong;

#Part 4
#1
insert into ConcertHall(hallId, seats, name) values(1, 200, 'Barry Hall');
insert into ConcertHall(hallId, seats, name) values(2, 859, 'Tadeusz Szeliogowski Poznan Philharmonic');

insert into Concert(concertId, date, hallId,bandId,ticketsSold) values(1, '3/2/2017', 1, 9004,199);
insert into Concert(concertId, date, hallId,bandId,ticketsSold) values(2, '2/20/2020', 2, 6751,243);
insert into ConcertSong(songId,concertId) values(21,1);
insert into ConcertSong(songId,concertId) values(25,1);
insert into ConcertSong(songId,concertId) values(31,1);
insert into ConcertSong(songId,concertId) values(41,1);
insert into ConcertSong(songId,concertId) values(303,2);
insert into ConcertSong(songId,concertId) values(181,2);
insert into ConcertSong(songId,concertId) values(445,2);
select * from ConcertSong;

select c.date,h.name, s.songId, a.albumId, c.bandId, b.name from ConcertHall h
JOIN Concert c on c.hallId=h.hallId
JOIN ConcertSong s on s.concertId=c.concertId
JOIN Song g on g.songId=s.songId  
JOIN AlbumSong a on a.songId=g.songId
JOIN Band b on b.bandId=c.bandId; 	



