-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/09/2025 às 20:25
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
-- Banco de dados: `locadora`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alugar`
--

CREATE TABLE `alugar` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_carro` int(11) DEFAULT NULL,
  `data_reserva` date DEFAULT NULL,
  `data_retirada` datetime DEFAULT NULL,
  `data_devolucao` date DEFAULT NULL,
  `status` enum('Reservado','Em Andamento','Finalizado','Cancelado') DEFAULT 'Reservado',
  `valor_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alugar`
--

INSERT INTO `alugar` (`id`, `id_cliente`, `id_carro`, `data_reserva`, `data_retirada`, `data_devolucao`, `status`, `valor_total`) VALUES
(1, 1, 3, '2024-03-20', '2024-03-20 10:30:00', '2024-03-25', 'Em Andamento', 750.00),
(2, 2, 8, '2024-03-21', '2024-03-21 14:15:00', '2024-03-26', 'Em Andamento', 690.00),
(3, 5, 5, '2024-03-19', '2024-03-19 09:45:00', '2024-03-27', 'Reservado', 570.00),
(4, 7, 1, '2024-03-22', '2024-03-22 16:20:00', '2024-03-28', 'Reservado', 360.00),
(5, 9, 10, '2024-03-18', '2024-03-18 11:10:00', '2024-03-29', 'Reservado', 1050.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `carro`
--

CREATE TABLE `carro` (
  `id` int(11) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `ano` year(4) DEFAULT NULL,
  `placa` varchar(7) DEFAULT NULL,
  `cor` varchar(20) DEFAULT NULL,
  `categoria` enum('Econômico','Intermediário','SUV','Luxo') DEFAULT 'Intermediário',
  `status` enum('Disponível','Alugado','Manutenção') DEFAULT 'Disponível',
  `valor_diaria` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carro`
--

INSERT INTO `carro` (`id`, `modelo`, `marca`, `ano`, `placa`, `cor`, `categoria`, `status`, `valor_diaria`) VALUES
(1, 'Onix', 'Chevrolet', '2022', 'ABC1D23', 'Branco', 'Econômico', 'Disponível', 120.00),
(2, 'HB20', 'Hyundai', '2023', 'EFG4H56', 'Prata', 'Econômico', 'Disponível', 110.00),
(3, 'Compass', 'Jeep', '2023', 'IJK7L89', 'Preto', 'SUV', 'Alugado', 250.00),
(4, 'Corolla', 'Toyota', '2022', 'MNO1P23', 'Prata', 'Intermediário', 'Disponível', 180.00),
(5, 'Civic', 'Honda', '2023', 'QRS4T56', 'Vermelho', 'Intermediário', 'Manutenção', 190.00),
(6, 'T-Cross', 'Volkswagen', '2022', 'UVW7X89', 'Azul', 'SUV', 'Disponível', 220.00),
(7, 'Kwid', 'Renault', '2023', 'YZA1B23', 'Branco', 'Econômico', 'Disponível', 100.00),
(8, 'Nivus', 'Volkswagen', '2023', 'CDE4F56', 'Cinza', 'SUV', 'Alugado', 230.00),
(9, 'Argo', 'Fiat', '2022', 'GHI7J89', 'Verde', 'Econômico', 'Disponível', 115.00),
(10, 'A3', 'Audi', '2023', 'KLM1N23', 'Preto', 'Luxo', 'Disponível', 350.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `cpf`, `email`, `telefone`, `data_nascimento`, `endereco`) VALUES
(1, 'Maria Silva', '12345678901', 'maria.silva@email.com', '(11) 99999-1111', '1985-03-15', 'Rua das Flores, 123 - São Paulo/SP'),
(2, 'João Santos', '23456789012', 'joao.santos@email.com', '(11) 99999-2222', '1990-07-22', 'Av. Paulista, 456 - São Paulo/SP'),
(3, 'Ana Oliveira', '34567890123', 'ana.oliveira@email.com', '(11) 99999-3333', '1988-11-05', 'Rua Augusta, 789 - São Paulo/SP'),
(4, 'Pedro Costa', '45678901234', 'pedro.costa@email.com', '(11) 99999-4444', '1995-01-30', 'Alameda Santos, 101 - São Paulo/SP'),
(5, 'Carla Rodrigues', '56789012345', 'carla.rodrigues@email.com', '(11) 99999-5555', '1992-09-18', 'Rua Oscar Freire, 202 - São Paulo/SP'),
(6, 'Ricardo Almeida', '67890123456', 'ricardo.almeida@email.com', '(11) 99999-6666', '1987-12-25', 'Av. Brigadeiro Faria Lima, 303 - São Paulo/SP'),
(7, 'Fernanda Lima', '78901234567', 'fernanda.lima@email.com', '(11) 99999-7777', '1993-04-12', 'Rua Haddock Lobo, 404 - São Paulo/SP'),
(8, 'Bruno Souza', '89012345678', 'bruno.souza@email.com', '(11) 99999-8888', '1989-06-08', 'Alameda Jaú, 505 - São Paulo/SP'),
(9, 'Juliana Martins', '90123456789', 'juliana.martins@email.com', '(11) 99999-9999', '1991-08-14', 'Rua Lisboa, 606 - São Paulo/SP'),
(10, 'Paulo Ferreira', '01234567890', 'paulo.ferreira@email.com', '(11) 99999-0000', '1986-02-28', 'Av. Europa, 707 - São Paulo/SP');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alugar`
--
ALTER TABLE `alugar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_carro` (`id_carro`);

--
-- Índices de tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alugar`
--
ALTER TABLE `alugar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `carro`
--
ALTER TABLE `carro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alugar`
--
ALTER TABLE `alugar`
  ADD CONSTRAINT `alugar_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `alugar_ibfk_2` FOREIGN KEY (`id_carro`) REFERENCES `carro` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
