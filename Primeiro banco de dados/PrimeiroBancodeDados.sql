-- criação das tabelas do banco de dados do spotify

-- artista
create table artista (
	id integer primary key autoincrement not null,
	nome text,
	popularidade integer,
	seguidores integer
)

-- país
create table pais(
	id integer primary key autoincrement not null,
	nome text,
	sigla text
)

-- musica
create table musica(
	id integer primary key autoincrement not null,
	nome text,
	url text,
	id_artista integer,
	foreign key(id_artista) references artista(id)
)

-- genero
create table genero(
	id integer primary key autoincrement not null,
	nome text
)

-- genero_artista
create table genero_artista(
	id integer primary key autoincrement not null,
	id_genero integer,
	id_artista integer,
	foreign key(id_genero) references genero(id),
	foreign key(id_artista) references artista(id)
)

-- musica_país
create table musica_pais(
	id integer primary key autoincrement not null,
	id_musica integer,
	id_pais integer,
	posicao integer,
	streams integer,
	foreign key(id_pais) references pais(id),
	foreign key(id_musica) references musica(id)
)

alter table musica rename column nome to nome_musica;
alter table artista rename column nome to nome_artista;
alter table genero rename column nome to nome_genero;

alter table pais add column longitude text
alter table pais add column latitude text

alter table pais drop column longitude;
alter table pais drop column latitude;





----------------dml-------------------
--------------------------------------

--inserção de dados

insert into genero (nome_genero) values ('pop'), ('rock'), ('sertanejo'),  ('forró'), 
('blues'), ('jazz')

insert into genero (nome_genero) values ('funk'), ('folk'), ('country')

insert into genero (nome_genero) values ('rap');
insert into genero (nome_genero) values ('eletrônico');
insert into genero (nome_genero) values ('pagode');
insert into genero (nome_genero) values ('gospel')


insert into pais (nome, sigla) values ('Brasil', 'BR'),
('Estados Unidos', 'US'),
insert into pais (nome, sigla) values ('México', 'MX')

insert into artista (nome_artista, popularidade, seguidores) values 
('chitãozinho e xororó', 100, 800),
('coldplay', 100, 46565),
('falamansa', 80, 6546),
('anitta', 90, 65465)
  

insert into artista (nome_artista, popularidade) values ('marisa monte', 100)

insert into artista (nome_artista, seguidores) values ('jungle', 10000)

insert into musica (nome_musica, id_artista) values
('Portas', 5)

insert into musica (nome_musica, id_artista) values
('Yelow', 2)

pragma foreign_keys = ON;


--UPDATE 
update artista 
set seguidores = 95
WHERE id = 5

update artista 
set popularidade  = 95
WHERE id = 6






insert into genero_artista (id_genero, id_artista) values
(1,3),
(3,1)


select g.nome_genero,
	a.nome_artista 
from genero g 
inner join genero_artista ga on g.id = ga.id_genero 
inner JOIN artista a on a.id = ga.id_artista 





















































