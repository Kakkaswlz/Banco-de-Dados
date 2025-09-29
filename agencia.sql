-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/09/2025 às 13:28
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
-- Banco de dados: `agencia`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `campanha`
--

CREATE TABLE `campanha` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `orcamento` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `campanha`
--

INSERT INTO `campanha` (`id`, `nome`, `data_inicio`, `data_fim`, `orcamento`) VALUES
(1, 'Campanha Verão 2024', '2024-01-15', '2024-03-15', 50000.00),
(2, 'Lançamento Produto X', '2024-02-01', '2024-02-28', 30000.00),
(3, 'Black Friday', '2024-11-20', '2024-11-30', 75000.00),
(4, 'Natal Mágico', '2024-12-01', '2024-12-25', 60000.00),
(5, 'Dia dos Namorados', '2024-05-20', '2024-06-12', 25000.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `campanha_cliente`
--

CREATE TABLE `campanha_cliente` (
  `id_campanha` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `campanha_cliente`
--

INSERT INTO `campanha_cliente` (`id_campanha`, `id_cliente`) VALUES
(1, 2),
(2, 1),
(3, 5),
(4, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `campanha_midia`
--

CREATE TABLE `campanha_midia` (
  `id_campanha` int(11) DEFAULT NULL,
  `id_midia` int(11) DEFAULT NULL,
  `quantidade_uso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `campanha_midia`
--

INSERT INTO `campanha_midia` (`id_campanha`, `id_midia`, `quantidade_uso`) VALUES
(1, 1, 3),
(1, 3, 10),
(2, 2, 5),
(3, 4, 2),
(4, 5, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `segmento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `email`, `segmento`) VALUES
(1, 'João Silva', 'joao.silva@email.com', 'Varejo'),
(2, 'Maria Santos', 'maria.santos@email.com', 'Tecnologia'),
(3, 'Empresa ABC Ltda', 'contato@empresaabc.com', 'Indústria'),
(4, 'Carlos Oliveira', 'carlos.oliveira@email.com', 'Serviços'),
(5, 'Ana Costa', 'ana.costa@email.com', 'Educação');

-- --------------------------------------------------------

--
-- Estrutura para tabela `midia`
--

CREATE TABLE `midia` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `custo_unitario` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `midia`
--

INSERT INTO `midia` (`id`, `tipo`, `custo_unitario`) VALUES
(1, 'TV', 15000.00),
(2, 'Rádio', 5000.00),
(3, 'Internet', 8000.00),
(4, 'Outdoor', 12000.00),
(5, 'Revista', 7000.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `campanha`
--
ALTER TABLE `campanha`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `campanha_cliente`
--
ALTER TABLE `campanha_cliente`
  ADD KEY `id_campanha` (`id_campanha`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `campanha_midia`
--
ALTER TABLE `campanha_midia`
  ADD KEY `id_campanha` (`id_campanha`),
  ADD KEY `id_midia` (`id_midia`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `midia`
--
ALTER TABLE `midia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `campanha`
--
ALTER TABLE `campanha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `midia`
--
ALTER TABLE `midia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `campanha_cliente`
--
ALTER TABLE `campanha_cliente`
  ADD CONSTRAINT `campanha_cliente_ibfk_1` FOREIGN KEY (`id_campanha`) REFERENCES `campanha` (`id`),
  ADD CONSTRAINT `campanha_cliente_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`);

--
-- Restrições para tabelas `campanha_midia`
--
ALTER TABLE `campanha_midia`
  ADD CONSTRAINT `campanha_midia_ibfk_1` FOREIGN KEY (`id_campanha`) REFERENCES `campanha` (`id`),
  ADD CONSTRAINT `campanha_midia_ibfk_2` FOREIGN KEY (`id_midia`) REFERENCES `midia` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
