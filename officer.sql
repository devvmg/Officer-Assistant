-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Maio-2021 às 02:55
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `officer`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE `agenda` (
  `id_agenda` int(10) UNSIGNED NOT NULL,
  `consultor_id_consultor` int(10) UNSIGNED NOT NULL,
  `cliente_id_cliente` int(10) UNSIGNED NOT NULL,
  `dia_agenda` int(15) DEFAULT NULL,
  `hora_agenda` varchar(255) DEFAULT NULL,
  `mes_agenda` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `agenda`
--

INSERT INTO `agenda` (`id_agenda`, `consultor_id_consultor`, `cliente_id_cliente`, `dia_agenda`, `hora_agenda`, `mes_agenda`) VALUES
(1, 1, 1, 16, '2400', '06'),
(4, 4, 0, 23, '16h00', '05'),
(5, 4, 0, 24, '23h00', '09'),
(6, 4, 0, 15, '23h00', '09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(10) UNSIGNED NOT NULL,
  `usuario_cliente` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_has_questionario`
--

CREATE TABLE `cliente_has_questionario` (
  `cliente_id_cliente` int(10) UNSIGNED NOT NULL,
  `questionario_id_questionario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE `consulta` (
  `id_consulta` int(10) UNSIGNED NOT NULL,
  `agenda_cliente_id_cliente` int(10) UNSIGNED NOT NULL,
  `agenda_consultor_id_consultor` int(10) UNSIGNED NOT NULL,
  `agenda_id_agenda` int(10) UNSIGNED NOT NULL,
  `assunto_consulta` varchar(255) DEFAULT NULL,
  `hora_consulta` varchar(45) DEFAULT NULL,
  `dia_consulta` varchar(45) DEFAULT NULL,
  `mes_consulta` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `consultor`
--

CREATE TABLE `consultor` (
  `id_consultor` int(10) UNSIGNED NOT NULL,
  `nome_consultor` varchar(255) DEFAULT NULL,
  `cpf_consultor` varchar(15) DEFAULT NULL,
  `rg_consultor` varchar(15) DEFAULT NULL,
  `endereco_consultor` varchar(255) DEFAULT NULL,
  `email_consultor` varchar(255) DEFAULT NULL,
  `telefone_consultor` int(15) DEFAULT NULL,
  `usuario_consultor` varchar(255) DEFAULT NULL,
  `senha_consultor` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formulario`
--

CREATE TABLE `formulario` (
  `id_formulario` int(10) UNSIGNED NOT NULL,
  `cliente_id_cliente` int(10) UNSIGNED NOT NULL,
  `nome_formulario` varchar(255) DEFAULT NULL,
  `cpf_formulario` varchar(15) DEFAULT NULL,
  `data_nasc_formulario` varchar(45) DEFAULT NULL,
  `genero_formulario` char(1) DEFAULT NULL,
  `email_formulario` varchar(255) DEFAULT NULL,
  `telefone_formulario` varchar(15) DEFAULT NULL,
  `endereco_formulario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `questionario`
--

CREATE TABLE `questionario` (
  `id_questionario` int(10) UNSIGNED NOT NULL,
  `tema_questionario` varchar(255) DEFAULT NULL,
  `n_questoes_questionario` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `senha` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_agenda`,`consultor_id_consultor`,`cliente_id_cliente`),
  ADD KEY `agenda_FKIndex1` (`consultor_id_consultor`),
  ADD KEY `agenda_FKIndex2` (`cliente_id_cliente`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `cliente_has_questionario`
--
ALTER TABLE `cliente_has_questionario`
  ADD PRIMARY KEY (`cliente_id_cliente`,`questionario_id_questionario`),
  ADD KEY `cliente_has_questionario_FKIndex1` (`cliente_id_cliente`),
  ADD KEY `cliente_has_questionario_FKIndex2` (`questionario_id_questionario`);

--
-- Índices para tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`,`agenda_cliente_id_cliente`,`agenda_consultor_id_consultor`,`agenda_id_agenda`),
  ADD KEY `consulta_FKIndex1` (`agenda_id_agenda`,`agenda_consultor_id_consultor`,`agenda_cliente_id_cliente`);

--
-- Índices para tabela `consultor`
--
ALTER TABLE `consultor`
  ADD PRIMARY KEY (`id_consultor`);

--
-- Índices para tabela `formulario`
--
ALTER TABLE `formulario`
  ADD PRIMARY KEY (`id_formulario`,`cliente_id_cliente`),
  ADD KEY `formulario_FKIndex1` (`cliente_id_cliente`);

--
-- Índices para tabela `questionario`
--
ALTER TABLE `questionario`
  ADD PRIMARY KEY (`id_questionario`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id_agenda` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cliente_has_questionario`
--
ALTER TABLE `cliente_has_questionario`
  MODIFY `cliente_id_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `consultor`
--
ALTER TABLE `consultor`
  MODIFY `id_consultor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `formulario`
--
ALTER TABLE `formulario`
  MODIFY `id_formulario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `questionario`
--
ALTER TABLE `questionario`
  MODIFY `id_questionario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
