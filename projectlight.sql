-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2024 at 09:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectlight`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` varchar(12) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `stock_price` decimal(10,2) NOT NULL,
  `price_per_bottle` decimal(10,2) NOT NULL,
  `expected_profit` decimal(10,2) DEFAULT NULL,
  `user_in_charge` varchar(8) DEFAULT NULL,
  `date_added` date DEFAULT curdate(),
  `time_added` time DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category`, `quantity`, `stock_price`, `price_per_bottle`, `expected_profit`, `user_in_charge`, `date_added`, `time_added`) VALUES
('S5882', 'redpurple', 'soda', 20, 12000.00, 100.00, 2400.00, 'A115107', '2024-11-03', '23:03:00'),
('W8866', '4cousins', 'whiskey', 45, 70000.00, 1000.00, 50000.00, 'A115107', '2024-11-03', '23:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `ROLE_ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `quantity_sold` int(11) NOT NULL,
  `kshSold` decimal(10,2) NOT NULL,
  `userIncharge` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `price_per_bottle` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `product_id`, `quantity_sold`, `kshSold`, `userIncharge`, `category`, `product_name`, `sale_date`, `price_per_bottle`) VALUES
(1, 'S5882', 5, 500.00, 'kirika', 'soda', 'redpurple', '2024-11-03 20:03:27', 100.00),
(2, 'W8866', 5, 5000.00, 'kirika', 'whiskey', '4cousins', '2024-11-03 20:07:40', 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` varchar(20) NOT NULL,
  `FULL_NAME` varchar(100) NOT NULL,
  `USER_NAME` varchar(50) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `CONTACT` varchar(15) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `ROLE` enum('Admin','Employee') NOT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`, `FULL_NAME`, `USER_NAME`, `EMAIL`, `CONTACT`, `PASSWORD`, `ROLE`, `CREATED_AT`) VALUES
('A115107', 'Joseph kirika', 'kirika', 'kirikajoseph16@gmail.com', '0769200240', '$2y$10$BXSB1nyttBQ7snmtafB31uXzKyYqwJqQ7KKtmQAgeLqTkqCaygQYO', 'Admin', '2024-11-03 20:02:02'),
('A648444', 'Alfa festus', 'Mr Alifa', 'alfafestus@gmail.com', '0732688736', '$2y$10$azBPtoNGe9Z12K0Qj7GRIOiFDzmbNXEnV9END4DGZAK3Wm/ecqfYq', 'Admin', '2024-11-03 20:11:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ROLE_ID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `ROLE_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
