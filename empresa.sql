-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/09/2025 às 15:57
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
-- Banco de dados: `empresa`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `CNPJ` varchar(50) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id`, `nome`, `CNPJ`, `telefone`, `cidade`) VALUES
(1, 'Kauã', '123.456.0001/34', '9999-8999', 'Votorantim'),
(2, 'Renan', '765.953.0001/43', '9996-5999', 'Sorocaba'),
(3, 'Juan', '654.987.0001/57', '9992-1999', 'São Paulo'),
(4, 'Oswaldo', '238.564.0001/89', '9994-9999', 'Itapetininga'),
(5, 'Cleber', '132.465.0001/15', '9997-3999', 'Jundiaí');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_compra`
--

CREATE TABLE `pedido_compra` (
  `id` int(11) NOT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `data_pedido` date DEFAULT NULL,
  `valor_total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido_compra`
--

INSERT INTO `pedido_compra` (`id`, `id_fornecedor`, `id_produto`, `data_pedido`, `valor_total`) VALUES
(1, 1, 3, '2025-09-16', 12000),
(2, 4, 2, '2025-08-05', 11997),
(3, 2, 4, '2025-02-26', 13999),
(4, 5, 1, '2025-04-30', 5444),
(5, 3, 5, '2025-01-20', 28995);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `preco_unitario` double(10,2) DEFAULT NULL,
  `quantidade_estoque` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id`, `nome`, `categoria`, `preco_unitario`, `quantidade_estoque`) VALUES
(1, 'Playstation 5', 'Console', 5444.00, 20),
(2, 'Geladeira Eletrolux 4 Portas', 'Eletrodoméstico', 3999.00, 15),
(3, 'Ar-Condicionado Eletrolux', 'Eletrodoméstico', 6000.00, 40),
(4, 'Iphone 17 PRO MAX', 'Celular', 13999.00, 10),
(5, 'Tv SAMSUMG 70° OLED', 'Eletrodoméstico', 5799.00, 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pedido_compra`
--
ALTER TABLE `pedido_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_fornecedor` (`id_fornecedor`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `pedido_compra`
--
ALTER TABLE `pedido_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pedido_compra`
--
ALTER TABLE `pedido_compra`
  ADD CONSTRAINT `pedido_compra_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`),
  ADD CONSTRAINT `pedido_compra_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
