-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/09/2025 às 12:45
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tech`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cep` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `departamento`
--

INSERT INTO `departamento` (`id`, `nome`, `cep`) VALUES
(1, 'TI', 'São Paulo'),
(2, 'RH', 'Rio de Janeiro'),
(3, 'Financeiro', 'Belo Horizonte'),
(4, 'Marketing', 'Curitiba'),
(5, 'Vendas', 'Salvador');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `data_admissao` date DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`id`, `id_departamento`, `nome`, `cpf`, `data_admissao`, `cargo`) VALUES
(1, 1, 'João Silva', '123.456.789-00', '2020-03-15', 'Analista de Sistemas'),
(2, 2, 'Maria Santos', '987.654.321-00', '2019-07-22', 'Gerente de RH'),
(3, 3, 'Pedro Oliveira', '456.789.123-00', '2021-01-10', 'Contador'),
(4, 4, 'Ana Costa', '321.654.987-00', '2022-05-30', 'Designer'),
(5, 5, 'Carlos Lima', '654.321.987-00', '2020-11-05', 'Vendedor');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario_treinamento`
--

CREATE TABLE `funcionario_treinamento` (
  `id_funcionario` int(11) DEFAULT NULL,
  `id_treinamento` int(11) DEFAULT NULL,
  `data_participacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionario_treinamento`
--

INSERT INTO `funcionario_treinamento` (`id_funcionario`, `id_treinamento`, `data_participacao`) VALUES
(1, 2, '2024-02-15'),
(2, 3, '2024-03-10'),
(3, 1, '2024-01-20'),
(4, 4, '2024-04-05'),
(5, 3, '2024-02-28');

-- --------------------------------------------------------

--
-- Estrutura para tabela `treinamento`
--

CREATE TABLE `treinamento` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `data_treinamento` date DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `treinamento`
--

INSERT INTO `treinamento` (`id`, `titulo`, `data_treinamento`, `carga_horaria`) VALUES
(1, 'Introdução ao Python', '2024-02-15', 8),
(2, 'Gestão de Pessoas', '2024-03-10', 16),
(3, 'Excel Avançado', '2024-01-20', 12),
(4, 'Marketing Digital', '2024-04-05', 20),
(5, 'Vendas Consultivas', '2024-02-28', 10);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Índices de tabela `funcionario_treinamento`
--
ALTER TABLE `funcionario_treinamento`
  ADD KEY `id_funcionario` (`id_funcionario`),
  ADD KEY `id_treinamento` (`id_treinamento`);

--
-- Índices de tabela `treinamento`
--
ALTER TABLE `treinamento`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `treinamento`
--
ALTER TABLE `treinamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`);

--
-- Restrições para tabelas `funcionario_treinamento`
--
ALTER TABLE `funcionario_treinamento`
  ADD CONSTRAINT `funcionario_treinamento_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`),
  ADD CONSTRAINT `funcionario_treinamento_ibfk_2` FOREIGN KEY (`id_treinamento`) REFERENCES `treinamento` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
