create table ordemServico (
cliente bigint(10) default null,
equipamento bigint(255) default NULL,
id bigint(255) NOT NULL AUTO_INCREMENT,
problema char(255) default null,
dataSolicitacao date,
dataFinalizacao date,
primary key(id),
key `clientes` (`cliente`),
constraint `ordemServico_ibfk_1` foreign key (`cliente`) references `clientes`(`id`),
constraint `ordemServico_ibfk_2` foreign key (`equipamento`) references `equipamentos` (`id`)
);

CREATE TABLE `equipamentos` (
  `cliente` bigint(255) DEFAULT NULL,
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `nome` char(255) DEFAULT NULL,
  `marca` char(255) DEFAULT NULL,
  `modelo` char(255) DEFAULT NULL,
  `numeroSerie` char(255) DEFAULT NULL,
  `acessorios` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientes` (`cliente`),
  CONSTRAINT `equipamentos_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `clientes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(14) DEFAULT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `endereco` varchar(35) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

