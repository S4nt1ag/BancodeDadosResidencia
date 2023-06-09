--Criacao de tabelas

CREATE TABLE usuario (
id_usuario integer primary key autoincrement not null,
nome text,
telefone integer,
nome_de_usuario integer,
email text,
cpf integer,
data_nascimento data,
rua text,
cidade text,
estado text,
pais text,
cep integer
)

CREATE TABLE categoria (
 id_categoria integer primary key autoincrement not null,
 nome text unique,
 descricao text
)

CREATE TABLE produto (
id_produto integer primary key autoincrement not null,
nome text unique,
descricao text,
quantidade_estoque integer,
valor_unitario real,
id_usuario integer,
id_categoria integer,
data_fabricação data,
foreign key (id_usuario) references usuario (id_usuario),
foreign key (id_categoria) references categoria (id_categoria),
check (quantidade_estoque>=0),
check (valor_unitario>0)
)


CREATE TABLE compra (
id_compra integer primary key autoincrement not null,
id_pedido integer,
id_produto integer,
data_compra data,
foreign key (id_produto) references produto (id_produto),
foreign key (id_pedido) references pedido (id_pedido)
)

CREATE TABLE pedido (
id_pedido integer primary key autoincrement not null,
id_usuario integer,
foreign key (id_usuario) references usuario (id_usuario)
)

-- inserção 

insert into usuario (nome,telefone,nome_de_usuario,email,cpf,data_nascimento,rua,cidade,estado,pais,cep) values 
('Roberta Medeiros','92827-2772', 'roberta.medeiros.1', 'robertamedeiros@gmail.com','082.018.362-43','21/05/2003','Rua José Nicodemos','Petrópolis','RJ','Brasil','25640-073'),
('Caio Botelho','98119-7783','caiorb','caiorbotelho@gmail.com','002.210.263-98','27/09/1996','Andre Tesch','petrópolis','RJ','Brasil','25655-266'),
('Gabriel Santiago','99205-3234','Santiago08','gabrielsantiagoneves2@gmail.com','206.064.136-31','17/02/2005','Moyses ribeiro Teixeira','Petrópolis','RJ','Brasil','25725-580'),
('Joice Pitzer  Lisboa Oliveira','98834-1190','joicepitzer.lisboa','joicepitzerlisboa@gmail.com','157.666.997-19','17/10/1995','Estrada União e Indústria','Petrópolis','RJ','Brasil','25720-111'),
('Caio José','99205-3233','caioJ','noobmaster69@gmail.com','506.630.155-31','15/03/1998','Valparaiso','Petrópolis','RJ','Brasil','25725-885')

insert into produto (nome,descricao,quantidade_estoque, data_fabricação, valor_unitario,id_categoria, id_usuario) values
('geladeira', 'Top Freezer 431L Platinum', 54,'21/05/2021', '4.099,00',1,2),
('armario', '6 portas 2 gavetas Select Demobile', 27,'17/02/2021', '547,26',2,3 ),
('fogao', '5 bocas Cooktop', 88, '17/10/2022', '970,65',1,4),
('televisão', 'smart tv led 50 4k Hq Conversor Digital Externo 3 HDMI 2 Usb Wi-Fi Android 11', 102, '04/01/2022', '1.899,00',1,1),
('cama', 'Cama King Boreal Flutuante', 50, '08/09/2022', '2.001,05',2,5),
('aspirador', 'Ultra-potente', 18, '09/12/2020', '569,00',2,5)

insert into categoria (nome,descricao) values
('eletronico','produto eletrodomestico'),
('movel','artigo domestico nao eletronico'),
('ferramentas','utensilios de de modificação e reparação de bens'),
('higiene', 'itens basicos de higiene'),
('decoração', 'itens para deixar sua casa aconchegante')


-- pedidos

insert into pedido (id_usuario) values
('1'),
('5'),
('2'),
('4'),
('3')


-- oficializar compras

-- compra caio botelho
insert into compra (id_pedido,id_produto, data_compra) values
('3','2','25/12/2022'),
('3','3','25/12/2022'),
('3','4','25/12/2022'),
('3','4','25/12/2022'),
('3','2','25/12/2022')

--compra gabriel
insert into compra (id_pedido,id_produto, data_compra) values
('5','1','17/02/2022'),
('5','1','17/02/2022'),
('5','3','17/02/2022'),
('5','4','17/02/2022'),
('5','4','17/02/2022')

--compras joyce
insert into compra (id_pedido,id_produto, data_compra) values
('4','5','17/10/2023'),
('4','5','17/10/2023'),
('4','1','17/10/2023')

--compras caio jose
insert into compra (id_pedido,id_produto, data_compra) values
('2','4','04/01/2023'),
('2','4','04/01/2023'),
('2','2','04/01/2023'),
('2','3','04/01/2023')

--compras roberta
insert into compra (id_pedido,id_produto, data_compra) values
('1','1','25/12/2022'),
('1','1','25/12/2022'),
('1','1','25/12/2022'),
('1','3','25/12/2022'),
('1','3','25/12/2022'),
('1','5','25/12/2022'),
('1','5','25/12/2022'),
('1','5','25/12/2022'),
('1','2','25/12/2022')


--update estoque 

--compra caio B--
update produto 
set quantidade_estoque = 25
where id_produto = 2

update produto 
set quantidade_estoque = 100
where id_produto = 4

update produto 
set quantidade_estoque = 87
where id_produto = 3

--compra gabriel--
update produto 
set quantidade_estoque = 86
where id_produto = 3

update produto 
set quantidade_estoque = 52
where id_produto = 1

update produto 
set quantidade_estoque = 98
where id_produto = 4

--compra joyce--
update produto 
set quantidade_estoque = 48
where id_produto = 5

update produto 
set quantidade_estoque = 51
where id_produto = 1

--compra caio J--
update produto 
set quantidade_estoque = 24
where id_produto = 2

update produto 
set quantidade_estoque = 85
where id_produto = 3

update produto 
set quantidade_estoque = 96
where id_produto = 4

--compra roberta--
update produto 
set quantidade_estoque = 23
where id_produto = 2

update produto 
set quantidade_estoque = 45
where id_produto = 5

update produto 
set quantidade_estoque = 83
where id_produto = 3

update produto 
set quantidade_estoque = 48
where id_produto = 1

--exclusão

DELETE FROM
        produto
        WHERE
        nome = 'aspirador'

-- consultas 

select p.nome, c.nome, c.descricao 
from produto p , categoria c 
where p.id_categoria = c.id_categoria and p.id_produto  like '1'

select p.nome, c.nome, c.descricao 
from produto p , categoria c 
where p.id_categoria = c.id_categoria and p.id_produto  like '5'

select nome, count(*) 
from produto p
where p.id_categoria like '1%'
group by p.nome 

select u.nome, p.nome 
from produto p, usuario u 
where p.id_usuario = u.id_usuario 

--notas fiscais

--nota pedido caio botelho
select u.nome, u.cpf  , p2.nome, p2.valor_unitario, count(c.id_produto), c.data_compra  
from compra c 
inner join usuario u, pedido p  
on u.id_usuario = p.id_usuario  and p.id_pedido like '3'
inner join produto p2 
on p2.id_produto = c.id_produto and c.id_pedido like '3'
group by p2.nome 
order by p2.nome 

--nota pedido gabriel
select u.nome, u.cpf  , p2.nome, p2.valor_unitario, count(c.id_produto), c.data_compra  
from compra c 
inner join usuario u, pedido p  
on u.id_usuario = p.id_usuario  and p.id_pedido like '5'
inner join produto p2 
on p2.id_produto = c.id_produto and c.id_pedido like '5'
group by p2.nome 
order by p2.nome 

--nota pedido joyce
select u.nome, u.cpf  , p2.nome, p2.valor_unitario, count(c.id_produto), c.data_compra  
from compra c 
inner join usuario u, pedido p  
on u.id_usuario = p.id_usuario  and p.id_pedido like '4'
inner join produto p2 
on p2.id_produto = c.id_produto and c.id_pedido like '4'
group by p2.nome 
order by p2.nome 

--nota caio jose
select u.nome, u.cpf  , p2.nome, p2.valor_unitario, count(c.id_produto), c.data_compra  
from compra c 
inner join usuario u, pedido p  
on u.id_usuario = p.id_usuario  and p.id_pedido like '2'
inner join produto p2 
on p2.id_produto = c.id_produto and c.id_pedido like '2'
group by p2.nome 
order by p2.nome 

--nota Roberta
select u.nome, u.cpf  , p2.nome, p2.valor_unitario, count(c.id_produto), c.data_compra  
from compra c 
inner join usuario u, pedido p  
on u.id_usuario = p.id_usuario  and p.id_pedido like '1'
inner join produto p2 
on p2.id_produto = c.id_produto and c.id_pedido like '1'
group by p2.nome 
order by p2.nome 
