create schema dio;

create table cliente(
id_cliente int primary key auto_increment not null,
nome_cliente varchar(40) not null,
tel_cliente varchar(30) );

create table veiculo(
chassi_veiculo varchar(50) primary key not null,
modelo_veiculo varchar(30) not null,
ano_veiculo date,
placa_veiculo varchar(20),
id_cliente int not null,
foreign key(id_cliente) references cliente(id_cliente));

create table funcionario(
codigo int primary key not null,
nome_funcionario varchar(80),
endereco_funcionario varchar(80),
especialidade varchar(50));

CREATE TABLE equipe_servico (
  id_equipe INT PRIMARY KEY NOT NULL,
  descricao_equipe VARCHAR(80)
);

CREATE TABLE equipe_funcionario (
  id_equipe INT NOT NULL,
  codigo_funcionario INT NOT NULL,
  PRIMARY KEY(id_equipe, codigo_funcionario),
  FOREIGN KEY (id_equipe) REFERENCES equipe_servico(id_equipe),
  FOREIGN KEY (codigo_funcionario) REFERENCES funcionario(codigo)
);
create table servico(
id_servico int primary key auto_increment not null,
tipo_servico varchar(40) not null,
chassi_veiculo varchar(50) not null,
id_equipe int not null,
foreign key (chassi_veiculo) references veiculo(chassi_veiulo),
foreign key (id_equipe) references equipe_servico (id_equipe));

CREATE TABLE peca (
  id_peca INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome_peca VARCHAR(50) NOT NULL,
  preco_peca DECIMAL(10, 2) NOT NULL
);

CREATE TABLE ordem_servico_peca (
  id_ordem_servico INT,
  id_peca int primary key not null,
  quantidade INT,
  valor DECIMAL(10, 2),
  FOREIGN KEY (id_ordem_servico) REFERENCES ordem_servico(id_ordem_servico),
  FOREIGN KEY (id_peca) REFERENCES peca(id_peca),
  PRIMARY KEY (id_ordem_servico, id_peca)
);


create table ordem_servico(
id_ordem_servico int primary key auto_increment not null,
data_emissao date not null,
valor DECIMAL(10, 2) not null,
status_servico varchar(30),
data_conclusao date,
id_servico_prestado int,
foreign key(id_servico_prestado) references servico(id_servico),
foreign key (id_peca_usada) references ordem_servico_peca(id_peca) );


