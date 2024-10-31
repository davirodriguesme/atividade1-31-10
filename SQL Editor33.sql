create database seguradora
use seguradora 

create table tbl_usuarios
(
 cod_usu int primary key auto_increment,
 nome varchar(60),
 username varchar(45),
 senha varchar(45)
 );
 
 create table tbl_acidentes 
 (
  cod_aci int primary key auto_increment,
  aci_hora time,
  aci_dota date,
  aci_lacol varchar(60),
  aci_cod_usu int,
  FOREIGN KEY (aci_cod_usu) REFERENCES tbl_usuarios(cod_usu)
  );
  
 create table tbl_clientes
 (
  cod_cli int primary key auto_increment,
  cli_telefone varchar(20),
  cli_nome varchar(60),
  cli_endereço varchar(45),
  cli_cod_usu int,
  FOREIGN KEY (cli_cod_usu) REFERENCES tbl_usuarios(cod_usu)
 );
 
 create table tbl_carros
 (
  car_registro int primary key auto_increment,
  car_modelo varchar(45),
  car_cod_usu int,
  car_cod_aci int,
  FOREIGN KEY (car_cod_usu) REFERENCES tbl_usuarios(cod_usu),
  FOREIGN KEY (car_cod_aci) REFERENCES tbl_acidentes(cod_aci)
 );
 
 create table tbl_apolices
 (
  apo_numero int primary key auto_increment,
  apo_Valor decimal(10, 2),
  apo_Cliente_Numero int,
  apo_cod_usu int,
  apo_cod_cli int,
  FOREIGN KEY (apo_cod_cli) REFERENCES tbl_clientes(cod_cli),
  FOREIGN KEY (apo_cod_usu) REFERENCES tbl_usuarios(cod_usu)
 );
   
   
   
   INSERT INTO tbl_usuarios (nome, username, senha) 
VALUES 
('João Silva', 'joaosilva', 'senha123'),
('Maria Oliveira', 'maria_oliveira', 'senha456');


INSERT INTO tbl_acidentes (aci_hora, aci_dota, aci_lacol, aci_cod_usu) 
VALUES 
('14:30:00', '2024-10-15', 'Av. Central, 123', 1), 
('18:45:00', '2024-10-16', 'Rua das Flores, 567', 2);


INSERT INTO tbl_clientes (cli_telefone, cli_nome, cli_endereço, cli_cod_usu) 
VALUES 
('(11) 99999-1234', 'Carlos Pereira', 'Rua A, 45', 1),
('(21) 88888-5678', 'Ana Souza', 'Av. B, 789', 2);

INSERT INTO tbl_carros (car_modelo, car_cod_usu, car_cod_aci) 
VALUES 
('Toyota Corolla', 1, 1), 
('Honda Civic', 2, 2);

INSERT INTO tbl_apolices (apo_Valor, apo_Cliente_Numero, apo_cod_usu, apo_cod_cli) 
VALUES 
(1200.50, 101, 1, 1), 
(1500.75, 102, 2, 2);

  
  
 