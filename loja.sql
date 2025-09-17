-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/09/2025 às 15:07
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
-- Banco de dados: `loja`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `email`, `senha`, `cpf`, `endereco`, `cidade`, `estado`, `cep`, `data_cadastro`) VALUES
(1, 'João Silva', 'joao.silva@email.com', 'senha123', '12345678901', 'Rua das Flores, 123', 'São Paulo', 'SP', '01234-56', '2024-01-15 00:00:00'),
(2, 'Maria Santos', 'maria.santos@email.com', 'mari456', '98765432109', 'Avenida Brasil, 456', 'Rio de Janeiro', 'RJ', '22000-00', '2024-01-16 00:00:00'),
(3, 'Pedro Oliveira', 'pedro.oliveira@email.com', 'pedro789', '45678912345', 'Rua XV de Novembro, 789', 'Curitiba', 'PR', '80000-00', '2024-01-17 00:00:00'),
(4, 'Ana Costa', 'ana.costa@email.com', 'ana1011', '32165498732', 'Avenida Paulista, 1011', 'São Paulo', 'SP', '01311-00', '2024-01-18 00:00:00'),
(5, 'Carlos Pereira', 'carlos.pereira@email.com', 'carlos1213', '65498732165', 'Rua da Praia, 1213', 'Florianópolis', 'SC', '88000-00', '2024-01-19 00:00:00'),
(6, 'Juliana Rodrigues', 'juliana.rodrigues@email.com', 'juli1415', '78912345678', 'Alameda Santos, 1415', 'São Paulo', 'SP', '01419-00', '2024-01-20 00:00:00'),
(7, 'Fernando Alves', 'fernando.alves@email.com', 'fer1617', '15975348620', 'Rua das Palmeiras, 1617', 'Belo Horizonte', 'MG', '30000-00', '2024-01-21 00:00:00'),
(8, 'Patrícia Lima', 'patricia.lima@email.com', 'pat1819', '35795148263', 'Avenida Beira Mar, 1819', 'Salvador', 'BA', '40000-00', '2024-01-22 00:00:00'),
(9, 'Ricardo Souza', 'ricardo.souza@email.com', 'ric2021', '25896314785', 'Rua do Comércio, 2021', 'Porto Alegre', 'RS', '90000-00', '2024-01-23 00:00:00'),
(10, 'Amanda Ferreira', 'amanda.ferreira@email.com', 'aman2223', '14725836914', 'Praça da Sé, 2223', 'São Paulo', 'SP', '01001-00', '2024-01-24 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itenspedido`
--

CREATE TABLE `itenspedido` (
  `id` int(11) NOT NULL,
  `id_pedidos` int(11) DEFAULT NULL,
  `id_produtos` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco_unitario` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itenspedido`
--

INSERT INTO `itenspedido` (`id`, `id_pedidos`, `id_produtos`, `quantidade`, `preco_unitario`) VALUES
(1, 1, 1, 1, 2999.9),
(2, 2, 5, 1, 3899),
(3, 3, 4, 1, 2199),
(4, 4, 3, 1, 299.9),
(5, 5, 2, 1, 3499),
(6, 6, 8, 1, 899),
(7, 7, 7, 1, 349.9),
(8, 8, 9, 1, 2899),
(9, 9, 10, 1, 4499),
(10, 10, 6, 1, 199.9);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_clientes` int(11) DEFAULT NULL,
  `data_pedido` datetime DEFAULT NULL,
  `status` enum('Aguarde','Enviado','Entregue') DEFAULT 'Aguarde',
  `valor_total` double DEFAULT NULL,
  `endereco_entrega` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_clientes`, `data_pedido`, `status`, `valor_total`, `endereco_entrega`) VALUES
(1, 1, '2024-03-01 00:00:00', 'Aguarde', 3298.8, 'Rua das Flores, 123 - São Paulo/SP'),
(2, 3, '2024-03-02 00:00:00', 'Enviado', 3899, 'Rua XV de Novembro, 789 - Curitiba/PR'),
(3, 2, '2024-03-02 00:00:00', 'Entregue', 2199, 'Avenida Brasil, 456 - Rio de Janeiro/RJ'),
(4, 5, '2024-03-03 00:00:00', 'Aguarde', 499.8, 'Rua da Praia, 1213 - Florianópolis/SC'),
(5, 7, '2024-03-04 00:00:00', 'Enviado', 5248.9, 'Rua das Palmeiras, 1617 - Belo Horizonte/MG'),
(6, 4, '2024-03-05 00:00:00', 'Aguarde', 899, 'Avenida Paulista, 1011 - São Paulo/SP'),
(7, 6, '2024-03-06 00:00:00', 'Entregue', 349.9, 'Alameda Santos, 1415 - São Paulo/SP'),
(8, 8, '2024-03-07 00:00:00', 'Enviado', 2899, 'Avenida Beira Mar, 1819 - Salvador/BA'),
(9, 10, '2024-03-08 00:00:00', 'Aguarde', 4499, 'Praça da Sé, 2223 - São Paulo/SP'),
(10, 9, '2024-03-09 00:00:00', 'Entregue', 199.9, 'Rua do Comércio, 2021 - Porto Alegre/RS');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` double NOT NULL,
  `sku` varchar(20) NOT NULL,
  `estoque` int(11) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `preco`, `sku`, `estoque`, `data_criacao`) VALUES
(1, 'Smartphone Galaxy S23', 'Smartphone Android com 128GB, 8GB RAM, câmera tripla 50MP', 2999.9, 'SM-GS23-128', 25, '2024-02-15 00:00:00'),
(2, 'Notebook Dell Inspiron 15', 'Notebook 15.6\" Intel i5, 8GB RAM, SSD 256GB, Windows 11', 3499, 'DELL-IN15-I5', 12, '2024-02-10 00:00:00'),
(3, 'Fone de Ouvido Bluetooth', 'Fone sem fio com cancelamento de ruído e 20h de bateria', 299.9, 'FONE-BT-001', 50, '2024-02-18 00:00:00'),
(4, 'Smart TV LED 55\" 4K', 'TV Smart com resolução 4K, HDR10 e Wi-Fi integrado', 2199, 'TV-55-4K-SM', 8, '2024-02-05 00:00:00'),
(5, 'Tablet iPad 10.9\"', 'Tablet Apple com chip A14 Bionic, 64GB, Wi-Fi', 3899, 'IPAD-109-64', 15, '2024-02-12 00:00:00'),
(6, 'Mouse Gamer Sem Fio', 'Mouse óptico 16000DPI, RGB, bateria recarregável', 199.9, 'MOUSE-GMF-01', 30, '2024-02-20 00:00:00'),
(7, 'Teclado Mecânico RGB', 'Teclado mecânico com switches blue, iluminação RGB', 349.9, 'TEC-MEC-RGB', 18, '2024-02-08 00:00:00'),
(8, 'Monitor 27\" IPS', 'Monitor Full HD 75Hz, painel IPS, HDMI/VGA', 899, 'MON-27-IPS', 10, '2024-02-14 00:00:00'),
(9, 'Câmera DSLR Canon', 'Câmera digital 24.1MP, kit lente 18-55mm, Wi-Fi', 2899, 'CAM-DSL-CAN', 6, '2024-02-16 00:00:00'),
(10, 'Console PlayStation 5', 'Console de videogame com controle DualSense, 825GB', 4499, 'PS5-DIGITAL', 3, '2024-02-22 00:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedidos` (`id_pedidos`),
  ADD KEY `id_produtos` (`id_produtos`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_clientes` (`id_clientes`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `itenspedido`
--
ALTER TABLE `itenspedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `itenspedido`
--
ALTER TABLE `itenspedido`
  ADD CONSTRAINT `itenspedido_ibfk_1` FOREIGN KEY (`id_pedidos`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `itenspedido_ibfk_2` FOREIGN KEY (`id_produtos`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
