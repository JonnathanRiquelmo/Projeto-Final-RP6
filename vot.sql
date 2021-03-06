-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2018 at 03:14 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vot`
--

-- --------------------------------------------------------

--
-- Table structure for table `convites`
--

CREATE TABLE `convites` (
  `id_convite` int(11) NOT NULL,
  `id_membro_convidado` int(11) NOT NULL,
  `id_reuniao` int(11) NOT NULL,
  `compareceu` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `membros`
--

CREATE TABLE `membros` (
  `id_membro` int(11) NOT NULL,
  `nome` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `membros`
--

INSERT INTO `membros` (`id_membro`, `nome`) VALUES
(1, 'renaro'),
(2, 'marcus'),
(3, 'jonnathan'),
(4, 'rafael'),
(5, 'luiz');

-- --------------------------------------------------------

--
-- Table structure for table `pautas`
--

CREATE TABLE `pautas` (
  `id_pauta` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `id_reuniao` int(11) NOT NULL,
  `id_relator` int(11) NOT NULL,
  `is_ativa` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pautas`
--

INSERT INTO `pautas` (`id_pauta`, `titulo`, `descricao`, `id_reuniao`, `id_relator`, `is_ativa`) VALUES
(1, 'Solicitação de Horário Especial 2015/2 de Rodrigo Luiz Ludwig', 'Descrição do Item', 1, 1, 0),
(2, 'Modificação do Regimento do PPEng', 'Descrição do Item', 2, 1, 0),
(3, 'Alterações no PPC do curso de Engenharia Elétrica', 'Descrição do Item', 1, 2, 0),
(4, 'Criação de disciplinas do PPEng', 'Descrição do Item', 1, 1, 0),
(5, 'Perfis do concurso para professor substituto do Curso de Engenharia Agrícola', 'Descrição do Item', 3, 2, 0),
(6, 'Solicitação de Horário Especial 2019/1 para Bruno Oliveira', 'Descrição do Item', 6, 3, 0),
(7, 'Descredenciamento de Cristiano Ferreira do PPEng', 'Descrição do Item', 5, 4, 0),
(8, 'Alteração de Situação de CCCGs do PPC do Curso de Engenharia Civil', 'Descrição do Item', 4, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `relator`
--

CREATE TABLE `relator` (
  `id_relator` int(11) NOT NULL,
  `nome_relator` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `relator`
--

INSERT INTO `relator` (`id_relator`, `nome_relator`) VALUES
(1, 'João Pablo'),
(2, 'Cristiano Tolfo'),
(3, 'Jean Cheiran'),
(4, 'Relator 4');

-- --------------------------------------------------------

--
-- Table structure for table `reunioes`
--

CREATE TABLE `reunioes` (
  `id_reuniao` int(11) NOT NULL,
  `data_hora_inicio` datetime NOT NULL,
  `data_hora_fim` datetime NOT NULL,
  `tipo` enum('Extraordinária','Ordinária') NOT NULL,
  `comissao` varchar(50) NOT NULL,
  `sala` varchar(50) NOT NULL,
  `is_aberta` tinyint(4) NOT NULL DEFAULT '0',
  `id_moderador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reunioes`
--

INSERT INTO `reunioes` (`id_reuniao`, `data_hora_inicio`, `data_hora_fim`, `tipo`, `comissao`, `sala`, `is_aberta`, `id_moderador`) VALUES
(1, '2018-12-20 00:00:00', '2018-12-20 23:59:00', 'Extraordinária', 'PLANEJAMENTO E ORÇAMENTO', '100', 1, 1),
(2, '2018-12-20 00:00:00', '2018-12-20 23:59:00', 'Extraordinária', 'REGIMENTOS E NORMAS', '200', 0, 2),
(3, '2018-07-06 15:00:00', '2018-10-27 10:38:47', 'Extraordinária', 'RELAÇÕES UNIVERSIDADE-SOCIEDADE', '300', 0, 2),
(4, '2018-12-20 00:00:00', '2018-12-20 23:59:00', 'Extraordinária', 'ELEITORAL GERAL ', '400', 1, 1),
(5, '2018-12-13 00:00:00', '2018-12-13 23:58:47', 'Extraordinária', 'PROGRAMAS ESTUDANTIS', '110', 0, 1),
(6, '2018-10-06 15:00:00', '2018-12-27 10:38:47', 'Extraordinária', 'REESTRUTURAÇÃO DAS NORMAS DE CONCURSOS DOCENTES', '400', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `votos`
--

CREATE TABLE `votos` (
  `id_voto` int(11) NOT NULL,
  `id_pauta` int(11) NOT NULL,
  `opcao` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `voto_membro`
--

CREATE TABLE `voto_membro` (
  `id_voto_membro` int(11) NOT NULL,
  `id_voto_fk` int(11) NOT NULL,
  `id_membro_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `convites`
--
ALTER TABLE `convites`
  ADD PRIMARY KEY (`id_convite`),
  ADD KEY `id_membro_convidado` (`id_membro_convidado`),
  ADD KEY `id_reuniao` (`id_reuniao`);

--
-- Indexes for table `membros`
--
ALTER TABLE `membros`
  ADD PRIMARY KEY (`id_membro`);

--
-- Indexes for table `pautas`
--
ALTER TABLE `pautas`
  ADD PRIMARY KEY (`id_pauta`),
  ADD KEY `id_reuniao_pauta` (`id_reuniao`),
  ADD KEY `id_relator` (`id_relator`);

--
-- Indexes for table `relator`
--
ALTER TABLE `relator`
  ADD PRIMARY KEY (`id_relator`);

--
-- Indexes for table `reunioes`
--
ALTER TABLE `reunioes`
  ADD PRIMARY KEY (`id_reuniao`),
  ADD KEY `id_moderador` (`id_moderador`);

--
-- Indexes for table `votos`
--
ALTER TABLE `votos`
  ADD PRIMARY KEY (`id_voto`),
  ADD KEY `id_pauta_idx` (`id_pauta`);

--
-- Indexes for table `voto_membro`
--
ALTER TABLE `voto_membro`
  ADD PRIMARY KEY (`id_voto_membro`),
  ADD KEY `id_voto_fk` (`id_voto_fk`),
  ADD KEY `id_membro_fk` (`id_membro_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `convites`
--
ALTER TABLE `convites`
  MODIFY `id_convite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `membros`
--
ALTER TABLE `membros`
  MODIFY `id_membro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pautas`
--
ALTER TABLE `pautas`
  MODIFY `id_pauta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `relator`
--
ALTER TABLE `relator`
  MODIFY `id_relator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reunioes`
--
ALTER TABLE `reunioes`
  MODIFY `id_reuniao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `votos`
--
ALTER TABLE `votos`
  MODIFY `id_voto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `voto_membro`
--
ALTER TABLE `voto_membro`
  MODIFY `id_voto_membro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pautas`
--
ALTER TABLE `pautas`
  ADD CONSTRAINT `pautas_ibfk_1` FOREIGN KEY (`id_relator`) REFERENCES `relator` (`id_relator`);

--
-- Constraints for table `voto_membro`
--
ALTER TABLE `voto_membro`
  ADD CONSTRAINT `voto_membro_ibfk_1` FOREIGN KEY (`id_voto_fk`) REFERENCES `votos` (`id_voto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `voto_membro_ibfk_2` FOREIGN KEY (`id_membro_fk`) REFERENCES `membros` (`id_membro`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
