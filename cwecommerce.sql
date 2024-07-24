-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 07:08 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cwecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `ID` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `totalPrice` int(10) NOT NULL,
  `customerID` int(10) NOT NULL,
  `productID` int(10) NOT NULL,
  `productImageUrl` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`ID`, `quantity`, `totalPrice`, `customerID`, `productID`, `productImageUrl`) VALUES
(4, 1, 421, 1, 2, '20240429_215718.jpg'),
(8, 1, 1500, 13, 7, '20240501_141037.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(10) NOT NULL,
  `fullName` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `phoneNumber` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `fullName`, `email`, `phoneNumber`, `password`, `address`) VALUES
(1, 'Rijan Paudel', 'paudelrijan369@gmail.com', '9805238286', 'unwkLUrCeAf5uvlLUGKaQj9dt9QuI0mZvn0EoPTAFQzrCqou0W23iZB3xCCuSr6y', '0'),
(10, 'Rijan Paudel', 'paudelrijan1@gmail.com', '980523828', 'OYAR+buny5xD5w+Y7i0hzfH8K8Dq47e1PnrPumBdZRG08GbjOitFv571Y0lu6Q==', 'Butwal'),
(11, 'Rijan Paudel', 'paudelrijan12@gmail.com', '9805238280', '8Y+Y6oJ9xRiX+mEGEiavHFka1jJOu9aNM5riVUyZo/TDzT7gNBfajZRlG49Zjg==', '0'),
(12, 'Kushal Gurung', 'kushal@gmail.com', '9805238299', 'RpMZEaUupcLHdQhMC2St02yUmdFWzQsq2fQvpMdrnNcawAcf5lgdu9fxzTNEFw==', '0'),
(13, 'Sujal Pant', 'sujal@gmail.com', '9801134000', 'mfuIU3ZQAFmFqST+0lH6wj9VAJuv58vTO37TvaENMUCj+UUqOdfqLj/oG1J8Gw==', '0'),
(14, 'Rijan Paudel', 'paudelrijan90@gmail.com', '9805238299', 'UQTjj/U+Fv4BW//J/PIjPKWI4tpuKA2gDN43pOjmKRBhLYTLz2Tn5LNFVdkYeA==', 'Butwal'),
(15, 'Rijan Paudel vfnjd', 'paudelrijan36@gmail.com', '9805238286', 'Vfko978288agYAGyR/irRRu5k3yaf/hcy/1MO3jYggmQ8sBBHGPVKLgqzMqHGQ==', 'Kathmandu'),
(16, 'Jenish Katuwal', 'jenish@gmail.com', '9800000001', '9RjlZNWN8r6gGwFy0OLp8Pi2ZupFM73l75gXpQ1OtShke55w97gvszxDIYtl+w==', 'Damak'),
(18, 'Rijan Paudel', 'paudelrija@gmail.com', '9805238286', 'zTjtP87/Yw+KmtI/KUnJ1T3+3Jc+BFqJOTxRvHTPJ3vlpdOoDHb6/pSQSlVZ', 'Butwal'),
(20, 'Kushal Sharma', 'kushal@gmail.cum', '9811100000', 'lq2vcqvK1KTCP53CcVWDPzhRsUGE6M6MI+Yj2I6zhNUKSPfSQAn3SleCV3S+nQ==', 'Kathmandu'),
(21, 'KP Sharma Oli', 'kpoli@gmail.com', '9877777777', 'AxmXF7onYYIWvC/Zu6ynd9AYxXLYc+t0joMgXINRRCWXOVcNJCe0KqEqQhkbLc8im27BSg==', 'Gulmi');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL,
  `orderDate` date NOT NULL DEFAULT current_timestamp(),
  `totalPrice` int(10) NOT NULL,
  `orderStatus` varchar(255) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `productName`, `productId`, `customerId`, `orderDate`, `totalPrice`, `orderStatus`, `quantity`) VALUES
(1, 'Mac', 1, 1, '2024-04-30', 120000, 'SHIP', 1),
(3, 'Acer Aspire', 7, 12, '2024-05-01', 1500, 'SHIP', 1),
(4, 'Acer Aspire', 7, 13, '2024-05-01', 1500, 'SHIP', 1),
(5, 'MacBook Pro 14', 1, 10, '2024-05-03', 120000, 'SHIP', 1),
(6, 'Acer Aspire', 7, 10, '2024-05-03', 1500, 'SHIP', 1),
(7, 'Pixel Laptop', 2, 10, '2024-05-03', 421, 'SHIP', 1),
(8, 'MacBook Pro 14', 1, 10, '2024-05-03', 120000, 'DECLINE', 1),
(9, 'MacBook Pro 14', 1, 10, '2024-05-03', 120000, 'DECLINE', 1),
(10, 'Acer Aspire', 10, 10, '2024-05-03', 4210, 'SHIP', 1),
(11, 'Pixel Laptop', 16, 10, '2024-05-09', 421, 'SHIP', 1),
(12, 'Pixel Laptop', 16, 10, '2024-05-09', 421, 'DECLINE', 1),
(13, 'Pixel Laptop', 16, 10, '2024-05-09', 421, 'DECLINE', 1),
(14, 'Pixel Laptop', 16, 10, '2024-05-09', 421, 'DECLINE', 1),
(15, 'Pixel Laptop', 16, 10, '2024-05-09', 421, 'DECLINE', 1),
(18, 'Lenovo IdeaPad 1 Student Laptop, Intel Dual Core Processor', 26, 10, '2024-05-10', 87000, 'PENDING', 1),
(19, 'Lenovo IdeaPad 1 Student Laptop, Intel Dual Core Processor', 26, 21, '2024-05-10', 87000, 'SHIP', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID` int(10) NOT NULL,
  `productName` varchar(256) NOT NULL,
  `productPrice` int(10) NOT NULL,
  `productImgUrl` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID`, `productName`, `productPrice`, `productImgUrl`) VALUES
(26, 'Lenovo IdeaPad 1 Student Laptop, Intel Dual Core Processor', 87000, '20240509_221824.jpg'),
(29, 'Apple 2024 MacBook Air 13-inch Laptop with M3 chip', 320000, '20240510_102952.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `customerId` (`customerId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
