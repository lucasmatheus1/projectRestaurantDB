-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Dez-2019 às 21:28
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd - restaurante`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `CPF` varchar(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Endereco` varchar(100) NOT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`CPF`, `Nome`, `Endereco`, `Email`) VALUES
('65267287418', 'Lucas', 'Campina', 'lucas@gmail.com'),
('70209222651', 'Messias', 'Campina', 'messias@gmail.com'),
('80498424217', 'Marcelo', 'Orobo', 'marcelo@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clienteprato`
--

CREATE TABLE `clienteprato` (
  `CPF` varchar(11) NOT NULL,
  `Codprato` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clienteprato`
--

INSERT INTO `clienteprato` (`CPF`, `Codprato`, `Quantidade`) VALUES
('65267287418', 1, 1),
('65267287418', 3, 1),
('65267287418', 7, 2),
('70209222651', 1, 2),
('70209222651', 4, 2),
('70209222651', 5, 2),
('80498424217', 2, 3),
('80498424217', 4, 2),
('80498424217', 5, 1),
('80498424217', 6, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `CPF` varchar(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Salario` double NOT NULL,
  `Turno` varchar(50) NOT NULL,
  `Endereco` varchar(100) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Datanasc` date DEFAULT NULL,
  `Entregas` double DEFAULT NULL,
  `Gorjeta` double DEFAULT NULL,
  `Cargo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`CPF`, `Nome`, `Salario`, `Turno`, `Endereco`, `Email`, `Datanasc`, `Entregas`, `Gorjeta`, `Cargo`) VALUES
('22185108117', 'Gabigol', 2000, 'matutino', 'brasil', 'gols@gmail.com', '1996-08-30', NULL, NULL, 'Entregador'),
('62844425161', 'Cristiano Ronaldo', 1200, 'noturno', 'italia', 'cr7@gmail.com', '1985-02-05', NULL, NULL, 'Entregador'),
('83634372643', 'Lionel Messi', 1800, 'vespertino', 'espanha', 'et@gmail.com', '1987-06-24', NULL, NULL, 'Garçom');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `Codigo` int(11) NOT NULL,
  `Valor_Total` int(11) NOT NULL,
  `Tipo` varchar(5) NOT NULL,
  `Descartaveis` varchar(5) DEFAULT NULL,
  `Gorjeta` double DEFAULT NULL,
  `CPF_func` varchar(11) NOT NULL,
  `CPF_clien` varchar(11) NOT NULL,
  `Data` date DEFAULT NULL,
  `Hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`Codigo`, `Valor_Total`, `Tipo`, `Descartaveis`, `Gorjeta`, `CPF_func`, `CPF_clien`, `Data`, `Hora`) VALUES
(1, 30, 'P', 'N', 0, '83634372643', '70209222651', '2019-11-27', '08:35:44'),
(2, 40, 'D', 'S', 5, '62844425161', '80498424217', '2019-11-27', '12:04:32'),
(3, 10, 'D', 'S', 0, '22185108117', '65267287418', '2019-11-27', '19:56:23'),
(4, 10, 'P', 'N', 0, '83634372643', '70209222651', '2019-11-28', '12:43:23'),
(5, 40, 'P', 'N', 5, '83634372643', '80498424217', '2019-11-28', '21:05:13'),
(6, 20, 'D', 'N', 0, '62844425161', '65267287418', '2019-11-28', '08:26:56'),
(7, 35, 'P', 'N', 0, '83634372643', '70209222651', '2019-11-28', '20:42:54'),
(8, 25, 'D', 'S', 0, '22185108117', '80498424217', '2019-11-28', '13:02:12'),
(9, 15, 'D', 'S', 0, '22185108117', '65267287418', '2019-11-29', '09:52:21'),
(10, 20, 'P', 'N', 5, '83634372643', '80498424217', '2019-11-29', '19:56:23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prato`
--

CREATE TABLE `prato` (
  `Codigo` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `HoraServIni` time NOT NULL,
  `HoraServFim` time NOT NULL,
  `Valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `prato`
--

INSERT INTO `prato` (`Codigo`, `Nome`, `HoraServIni`, `HoraServFim`, `Valor`) VALUES
(1, 'Cuscuz Recheado', '07:00:00', '10:00:00', 15),
(2, 'Prato Feito', '11:00:00', '14:00:00', 20),
(3, 'Sopa', '19:00:00', '23:00:00', 10),
(4, 'Suco', '07:00:00', '23:00:00', 5),
(5, 'Lasanha', '19:00:00', '23:00:00', 15),
(6, 'Pizza', '19:00:00', '23:00:00', 35),
(7, 'Sanduíche Natural', '07:00:00', '10:00:00', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pratopedido`
--

CREATE TABLE `pratopedido` (
  `Codprato` int(11) NOT NULL,
  `Codpedido` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pratopedido`
--

INSERT INTO `pratopedido` (`Codprato`, `Codpedido`, `Quantidade`) VALUES
(1, 1, 2),
(1, 9, 1),
(2, 2, 2),
(2, 8, 1),
(3, 3, 1),
(4, 4, 2),
(4, 8, 1),
(4, 10, 1),
(5, 7, 2),
(5, 10, 1),
(6, 5, 1),
(7, 6, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefoneclien`
--

CREATE TABLE `telefoneclien` (
  `CPF` varchar(11) NOT NULL,
  `Telefone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `telefoneclien`
--

INSERT INTO `telefoneclien` (`CPF`, `Telefone`) VALUES
('65267287418', '83921334323'),
('70209222651', '83996285544'),
('80498424217', '83992348372');

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefonefunc`
--

CREATE TABLE `telefonefunc` (
  `CPF` varchar(11) NOT NULL,
  `Telefone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `telefonefunc`
--

INSERT INTO `telefonefunc` (`CPF`, `Telefone`) VALUES
('22185108117', '05002019200'),
('62844425161', '22940028922'),
('83634372643', '84933106000');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CPF`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices para tabela `clienteprato`
--
ALTER TABLE `clienteprato`
  ADD PRIMARY KEY (`CPF`,`Codprato`),
  ADD KEY `Codprato` (`Codprato`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`CPF`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `Codigo` (`Codigo`);

--
-- Índices para tabela `prato`
--
ALTER TABLE `prato`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `Codigo` (`Codigo`);

--
-- Índices para tabela `pratopedido`
--
ALTER TABLE `pratopedido`
  ADD PRIMARY KEY (`Codprato`,`Codpedido`),
  ADD KEY `Codpedido` (`Codpedido`);

--
-- Índices para tabela `telefoneclien`
--
ALTER TABLE `telefoneclien`
  ADD PRIMARY KEY (`CPF`,`Telefone`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices para tabela `telefonefunc`
--
ALTER TABLE `telefonefunc`
  ADD PRIMARY KEY (`CPF`,`Telefone`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `clienteprato`
--
ALTER TABLE `clienteprato`
  ADD CONSTRAINT `clienteprato_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `cliente` (`CPF`),
  ADD CONSTRAINT `clienteprato_ibfk_2` FOREIGN KEY (`Codprato`) REFERENCES `prato` (`Codigo`);

--
-- Limitadores para a tabela `pratopedido`
--
ALTER TABLE `pratopedido`
  ADD CONSTRAINT `pratopedido_ibfk_1` FOREIGN KEY (`Codprato`) REFERENCES `prato` (`Codigo`),
  ADD CONSTRAINT `pratopedido_ibfk_2` FOREIGN KEY (`Codpedido`) REFERENCES `pedido` (`Codigo`);

--
-- Limitadores para a tabela `telefoneclien`
--
ALTER TABLE `telefoneclien`
  ADD CONSTRAINT `telefoneclien_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `cliente` (`CPF`);

--
-- Limitadores para a tabela `telefonefunc`
--
ALTER TABLE `telefonefunc`
  ADD CONSTRAINT `telefonefunc_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `funcionario` (`CPF`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
