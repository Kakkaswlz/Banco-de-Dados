-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/09/2025 às 18:43
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
-- Banco de dados: `clinica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`id`, `id_paciente`, `id_medico`, `data_hora`, `observacoes`) VALUES
(1, 1, 3, '2025-09-19 14:00:00', 'Tratamento de Acne'),
(2, 20, 1, '2025-10-20 16:00:00', 'Dores No Peito'),
(3, 21, 5, '2025-09-30 15:30:00', 'Visão Embaçada'),
(4, 22, 2, '2025-11-25 17:00:00', 'Consulta De Rotina'),
(5, 23, 7, '2025-12-05 12:00:00', 'Consulta de rotina');

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `crm` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medico`
--

INSERT INTO `medico` (`id`, `nome`, `especialidade`, `telefone`, `crm`) VALUES
(1, 'Dr. Carlos Souza', 'Cardiologista', '9998-9999', 'CRM123456'),
(2, 'Dra. Ana Lima', 'Pediatra', '9990-9999', 'CRM78901'),
(3, 'Dr. Marcos Alves', 'Dermatologista', '9995-9999', 'CRM24680'),
(4, 'Dra. Luísa Costa', 'Ginecologista', '9969-9999', 'CRM44556'),
(5, 'Dr. Claudio Pinto Nascimento', 'Oftalmologista', '9991-9999', 'CRM11111'),
(6, 'Dra. Isadora Leite', 'Cardiologista', '9990-9999', 'CRM22222'),
(7, 'Dr. Renan Tacuko Navara', 'Pediatra', '9993-9999', 'CRM33333'),
(8, 'Dra. Giovana Takeshi Hiramatsu Hira', 'Dermatologista', '9989-9999', 'CRM44444'),
(9, 'Dr. Wellington', 'Ginecologista', '9905-9999', 'CRM55555'),
(10, 'Dra. Mariana Takeshi', 'Oftalmologista', '9936-9999', 'CRM66666');

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`id`, `nome`, `data_nascimento`, `telefone`, `endereco`, `cep`, `email`) VALUES
(1, 'João Silva', '1990-05-12', '9900-9999', 'Rua das Monções, 34', '12345-250', 'joao@gmail.com'),
(20, 'Renan Takeshi', '1990-05-13', '9900-9999', 'Rua das Monções, 32', '12342-250', 'renan@gmail.com'),
(21, 'Kauã Santos', '1990-05-14', '9900-9999', 'Rua das Monções, 33', '12343-250', 'kaua@gmail.com'),
(22, 'Thiago Souza', '1990-05-15', '9900-9999', 'Rua das Monções, 34', '12344-250', 'tg@gmail.com'),
(23, 'Gustavo Crespilho', '1990-05-16', '9900-9999', 'Rua das Monções, 35', '12345-250', 'cres@gmail.com'),
(24, 'Juan Neves', '1990-05-17', '9900-9999', 'Rua das Monções, 36', '12346-250', 'juan@gmail.com'),
(25, 'Davi Sandoval', '1990-05-18', '9900-9999', 'Rua das Monções, 37', '12347-250', 'davi@gmail.com'),
(26, 'Lucca Ferreira', '1990-05-19', '9900-9999', 'Rua das Monções, 38', '12348-250', 'lucca@gmail.com'),
(27, 'Danivel Avila', '1990-05-10', '9900-9999', 'Rua das Monções, 39', '12349-250', 'daniel@gmail.com'),
(28, 'Arthur Domingues', '1990-05-30', '9900-9999', 'Rua das Monções, 40', '12340-250', 'arthur@gmail.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `medico`
--
ALTER TABLE `medico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
