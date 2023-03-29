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
id_usuario integer,
id_pedido integer,
data_compra data,
foreign key (id_usuario) references usuario (id_usuario),
foreign key (id_pedido) references pedido (id_pedido)
)

CREATE TABLE pedido (
id_pedido integer primary key autoincrement not null,
id_produto1 integer,
qtd_produto1 integer,
id_produto2 integer,
qtd_produto2 integer,
foreign key (id_produto1) references produto (id_produto),
foreign key (id_produto2) references produto (id_produto)
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
('aspirador', 'Ultra-potente', 18, "09/12/2020", '569,00',2,5)

insert into categoria (nome,descricao) values
('eletronico','produto eletrodomestico'),
('movel','artigo domestico nao eletronico')


-- pedidos

insert into pedido (id_produto1,qtd_produto1) values
('1','1'),
('5','2')

insert into pedido (id_produto1,qtd_produto1,id_produto2,qtd_produto2) values
('3','1','4','2'),
('4','3','3','2'),
('2','4','5','3')

insert into pedido (id_produto1,qtd_produto1) values
('1','1'),
('5','10')


-- oficializar compras

insert into compra (id_pedido,id_usuario,data_compra) values
('3','2','25/12/2022'),
('1','1','01/04/2022'),
('4','5','03/02/2023'),
('2','3','17/02/2023'),
('5','4','27/09/2022')

--update estoque 

update produto 
set quantidade_estoque = 87
where id_produto = 3

update produto 
set quantidade_estoque = 100
where id_produto = 4

update produto 
set quantidade_estoque = 53
where id_produto = 1

update produto 
set quantidade_estoque = 97
where id_produto = 4

update produto 
set quantidade_estoque = 85
where id_produto = 3

update produto 
set quantidade_estoque = 48
where id_produto = 5

update produto 
set quantidade_estoque = 23
where id_produto = 2

update produto 
set quantidade_estoque = 47
where id_produto = 5

-- consultas 

select p.nome, c.nome, c.descricao 
from produto p , categoria c 
where p.id_categoria = c.id_categoria and p.id_produto  like '1'

select p.nome, c.nome, c.descricao 
from produto p , categoria c 
where p.id_categoria = c.id_categoria and p.id_produto  like '5'

select nome , count(*)
from produto p
where p.id_categoria like '1%'
group by p.nome 

select u.nome, p.nome 
from produto p, usuario u 
where p.id_usuario = u.id_usuario 

--notas fiscais

--primeira compra--
select u.cpf, p.nome,p2.qtd_produto1, p.valor_unitario,  p4.nome, p3.qtd_produto2, p4.valor_unitario , c.data_compra 
from usuario u 
inner join compra c 
on c.id_usuario = u.id_usuario and c.id_compra like '1'
inner join produto p, pedido p2 
on p.id_produto = p2.id_produto1 and p2.id_pedido like '3'
inner join produto p4, pedido p3 
on p4.id_produto = p3.id_produto2 and p3.id_pedido like '3'

-- segunda compra--
select u.cpf, p.nome,p2.qtd_produto1, p.valor_unitario, c.data_compra 
from usuario u 
inner join compra c 
on c.id_usuario = u.id_usuario and c.id_compra like '2'
inner join produto p, pedido p2 
on p.id_produto = p2.id_produto1 and p2.id_pedido like '1'

-- terceira compra--
select u.cpf, p.nome,p2.qtd_produto1, p.valor_unitario,  p4.nome, p3.qtd_produto2, p4.valor_unitario , c.data_compra 
from usuario u 
inner join compra c 
on c.id_usuario = u.id_usuario and c.id_compra like '3'
inner join produto p, pedido p2 
on p.id_produto = p2.id_produto1 and p2.id_pedido like '4'
inner join produto p4, pedido p3 
on p4.id_produto = p3.id_produto2 and p3.id_pedido like '4'

--quarta compra--
select u.cpf, p.nome,p2.qtd_produto1, p.valor_unitario, c.data_compra 
from usuario u 
inner join compra c 
on c.id_usuario = u.id_usuario and c.id_compra like '4'
inner join produto p, pedido p2 
on p.id_produto = p2.id_produto1 and p2.id_pedido like '2'

--quinta compra--
select u.cpf, p.nome,p2.qtd_produto1, p.valor_unitario,  p4.nome, p3.qtd_produto2, p4.valor_unitario , c.data_compra 
from usuario u 
inner join compra c 
on c.id_usuario = u.id_usuario and c.id_compra like '5'
inner join produto p, pedido p2 
on p.id_produto = p2.id_produto1 and p2.id_pedido like '5'
inner join produto p4, pedido p3 
on p4.id_produto = p3.id_produto2 and p3.id_pedido like '5'


