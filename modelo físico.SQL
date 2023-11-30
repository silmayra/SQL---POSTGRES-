
/* Criando o Banco de Dados */

CREATE DATABASE "AconchegoLiterario";


/* Criação das Tabelas */


CREATE TABLE Editora(
	id_editora serial primary key,
	cnpj_editora varchar(20) not null,
	nome_editora varchar(50) not null
); 

CREATE TABLE Livraria(
	id_livraria serial primary key,
	cnpj_livraria bigint not null,
	nome_livraria varchar(50) not null
);

CREATE TABLE LivrariaEndereco(
	id_livraria serial primary key,
	rua varchar(50) not null,
	bairro varchar(30) not null,
	cep integer not null,
	Constraint FK_LivrariaEndereco_Livraria Foreign Key (id_livraria) References Livraria(id_livraria)
);

CREATE TABLE Livros(
	id_livro serial primary key,
	nome_livro varchar(50) not null,
	id_editora int null,
	valor numeric(10,2) not null,
	Constraint FK_Livros_Editora Foreign Key (id_editora) References Editora(id_editora)
);

CREATE TABLE Ebook(
	id_ebook serial primary key,
	id_livro int not null,
	formato varchar(30) null,
	Constraint FK_Ebook_Livros Foreign Key (id_livro) References Livros(id_livro)
	
);

CREATE TABLE LivroFisico(
	id_livro_fisico serial primary key,
	id_livro int not null,
	isbn int not null,
	edicao varchar(30) null,
	Constraint FK_LivroFisico_Livros Foreign Key (id_livro) References Livros(id_livro)
	
);

CREATE TABLE Funcionario(
	id_funcionario serial primary key,
	cpf_funcionario int not null,	
	id_livraria int not null,
	Constraint FK_Funcionario_Livraria Foreign Key (id_livraria) References Livraria(id_livraria)
);

CREATE TABLE Gerente(
	id_gerente serial primary key,
	nome_gerente varchar(80) not null,
	id_funcionario int not null,
	Constraint FK_Gerente_Funcionario Foreign Key (id_funcionario) References Funcionario(id_funcionario)
);

CREATE TABLE Vendedor(
	id_vendedor serial primary key,
	nome_vendedor varchar(80) not null,
	id_funcionario int not null,
	Constraint FK_Vendedor_Funcionario Foreign Key (id_funcionario) References Funcionario(id_funcionario)
);

CREATE TABLE Cliente(
	id_cliente serial primary key,
	cpf_cliente bigint not null,
	nome_cliente varchar(80) not null,
	email varchar(60) null
);
CREATE TABLE Compra (
    id_compra INT PRIMARY KEY,
    id_cliente INT,
    CONSTRAINT FK_Cliente_Compra FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-----------------------------------INSERTS----------------------------------------------------

INSERT INTO Editora (cnpj_editora, nome_editora) VALUES ('12345678901234', 'Grifindor Editora'), ('98765432109876', 'Livraria Aventura Editora');

INSERT INTO Livraria (cnpj_livraria, nome_livraria) VALUES ('432109876543210', 'Livraria Aconchego Literário 1'), ('654321098765432', 'Livraria Aconchego literario 2');

INSERT INTO LivrariaEndereco (id_livraria, rua, bairro, cep) VALUES (1, 'Rua Aconchego', 'Jardim das Palmeiras', '00000000'), (2, 'Avenida Aventura', 'Parque das Árvores', '11111111');

INSERT INTO Livros (nome_livro, id_editora, valor) VALUES ('As vantagens de ser invisivel', 1, 100.00), ('Ana Kariênina', 2, 150.00);

INSERT INTO Ebook (id_livro, formato) VALUES (1, 'PDF'), (2, 'EPUB');

INSERT INTO LivroFisico (id_livro, isbn, edicao) VALUES (1, '1234567890123', '1ª Edição'), (2, '98765432109876', '1ª Edição');

INSERT INTO Funcionario (cpf_funcionario, id_livraria) VALUES ('11122233344', 1), ('99988877766', 2);

INSERT INTO Gerente (nome_gerente, id_funcionario) VALUES ('Marcelo Abreu', 1), ('  Lucas araújo', 2);

INSERT INTO Vendedor (nome_vendedor, id_funcionario) VALUES ('Joao Marcelo', 3),
('Henrique', 4)



