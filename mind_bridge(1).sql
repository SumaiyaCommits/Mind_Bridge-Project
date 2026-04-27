-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2026 at 06:41 PM
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
-- Database: `mind_bridge`
--

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `alert_id` int(11) NOT NULL,
  `report_id` int(11) DEFAULT NULL,
  `alert_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('unread','acknowledged','resolved') DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alerts`
--

INSERT INTO `alerts` (`alert_id`, `report_id`, `alert_type`, `created_at`, `status`) VALUES
(1, 2, 'High Risk Mental Health Alert', '2026-03-07 15:45:18', 'unread'),
(2, 4, 'High Risk Mental Health Alert', '2026-03-07 16:43:12', 'unread'),
(3, 10, 'High Risk Mental Health Alert', '2026-03-07 16:43:12', 'unread'),
(4, 12, 'High Risk Mental Health Alert', '2026-03-07 16:43:12', 'unread');

-- --------------------------------------------------------

--
-- Table structure for table `emotional_tracking`
--

CREATE TABLE `emotional_tracking` (
  `tracking_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `emotional_score` int(11) NOT NULL,
  `recorded_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message_text` text NOT NULL,
  `is_anonymous` tinyint(1) DEFAULT 0,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `report_type` enum('anonymous','open') DEFAULT NULL,
  `description` text DEFAULT NULL,
  `risk_level` enum('low','medium','high') DEFAULT NULL,
  `status` enum('pending','active','closed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`report_id`, `student_id`, `report_type`, `description`, `risk_level`, `status`, `created_at`) VALUES
(1, 1, 'open', 'Feeling stressed due to academic workload and exams.', 'medium', 'active', '2026-03-07 15:43:19'),
(2, 2, 'anonymous', 'Experiencing anxiety and difficulty sleeping.', 'high', 'pending', '2026-03-07 15:43:19'),
(3, 1, 'open', 'Feeling overwhelmed with assignments.', 'low', 'closed', '2026-03-07 15:43:19'),
(4, 1, 'open', 'Feeling stressed due to academic workload and exams', 'medium', 'active', '2026-03-07 16:30:49'),
(5, 2, 'anonymous', 'Experiencing anxiety and difficulty sleeping', 'high', 'pending', '2026-03-07 16:30:49'),
(6, 3, 'open', 'Struggling to balance study and personal life', 'medium', 'active', '2026-03-07 16:30:49'),
(7, 4, 'anonymous', 'Feeling lonely after moving to university', 'low', 'closed', '2026-03-07 16:30:49'),
(8, 5, 'open', 'Having panic attacks before presentations', 'high', 'active', '2026-03-07 16:30:49'),
(9, 6, 'open', 'Feeling overwhelmed with assignments', 'medium', 'pending', '2026-03-07 16:30:49'),
(10, 2, 'open', 'Difficulty concentrating during classes', 'low', 'closed', '2026-03-07 16:30:49'),
(11, 3, 'anonymous', 'Experiencing social anxiety in group activities', 'medium', 'active', '2026-03-07 16:30:49'),
(12, 4, 'open', 'Feeling homesick and demotivated', 'low', 'closed', '2026-03-07 16:30:49'),
(13, 5, 'anonymous', 'Frequent stress due to exam pressure', 'high', 'active', '2026-03-07 16:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `resource_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `resource_type` enum('article','video','exercise','guide') NOT NULL,
  `duration_minutes` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL,
  `report_id` int(11) DEFAULT NULL,
  `peer_id` int(11) DEFAULT NULL,
  `session_date` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('scheduled','completed','cancelled') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `report_id`, `peer_id`, `session_date`, `notes`, `status`) VALUES
(1, 1, 3, '2026-03-10 14:00:00', 'Discussed study stress and time management.', 'completed'),
(2, 2, 4, '2026-03-12 16:00:00', 'Initial session scheduled to discuss anxiety issues.', 'scheduled'),
(63, 3, 17, '2026-03-10 14:00:00', 'Discussed time management strategies', 'completed'),
(64, 4, 18, '2026-03-12 16:00:00', 'Initial consultation for anxiety support', 'scheduled'),
(65, 5, 2, '2026-03-14 15:00:00', 'Provided guidance on stress coping techniques', 'completed'),
(66, 6, 6, '2026-03-16 11:00:00', 'Discussed social connection activities', 'completed'),
(67, 7, 7, '2026-03-18 13:30:00', 'Helped student prepare for presentation stress', 'scheduled'),
(68, 8, 15, '2026-03-20 10:00:00', 'Reviewed assignment planning strategies', 'completed'),
(69, 9, 16, '2026-03-22 12:00:00', 'Discussed concentration techniques', 'completed'),
(70, 10, 18, '2026-03-24 14:30:00', 'Provided emotional support discussion', 'scheduled'),
(71, 11, 6, '2026-03-26 16:00:00', 'Guided student through stress reduction methods', 'completed'),
(72, 12, 18, '2026-03-28 17:00:00', 'Follow-up counseling session', 'scheduled');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','peer','supervisor') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `specialization` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `role`, `created_at`, `specialization`) VALUES
(1, 'Sadia Islam', 'sadia@test.com', '123456', 'student', '2026-03-07 15:40:34', NULL),
(2, 'Shanjida Hossain', 'shanjida@peer.com', '123456', 'peer', '2026-03-07 15:40:34', NULL),
(3, 'Dr. Ali', 'ali@admin.com', '123456', 'supervisor', '2026-03-07 15:40:34', NULL),
(4, 'Rahim Ahmed', 'rahim@student.com', 'pass123', 'student', '2026-03-07 15:41:41', NULL),
(5, 'Ayesha Khan', 'ayesha@student.com', 'pass123', 'student', '2026-03-07 15:41:41', NULL),
(6, 'Tanvir Hasan', 'tanvir@peer.com', 'pass123', 'peer', '2026-03-07 15:41:41', NULL),
(7, 'Nusrat Jahan', 'nusrat@peer.com', 'pass123', 'peer', '2026-03-07 15:41:41', NULL),
(8, 'Dr. Karim', 'karim@admin.com', 'pass123', 'supervisor', '2026-03-07 15:41:41', NULL),
(9, 'Fahad Ahmed', 'fahad@student.com', 'pass123', 'student', '2026-03-07 15:50:01', NULL),
(10, 'Ilma Khan', 'ilma@student.com', 'pass123', 'student', '2026-03-07 15:50:01', NULL),
(11, 'Fahim Islam', 'fahim@student.com', 'pass123', 'student', '2026-03-07 15:50:01', NULL),
(12, 'Nadia Rahman', 'nadia@student.com', 'pass123', 'student', '2026-03-07 15:50:01', NULL),
(13, 'Imran Hossain', 'imran@student.com', 'pass123', 'student', '2026-03-07 15:50:01', NULL),
(14, 'Sara Akter', 'sara@student.com', 'pass123', 'student', '2026-03-07 15:50:01', NULL),
(15, 'Adib Hasan', 'adib@peer.com', 'pass123', 'peer', '2026-03-07 15:50:01', NULL),
(16, 'Sumaiya Islam', 'sumaiya@peer.com', 'pass123', 'peer', '2026-03-07 15:50:01', NULL),
(17, 'Mahin Chowdhury', 'mahin@peer.com', 'pass123', 'peer', '2026-03-07 15:50:01', NULL),
(18, 'Sadia Kabir', 'sadia@peer.com', 'pass123', 'peer', '2026-03-07 15:50:01', NULL),
(19, 'Dr Nabil', 'nabil@admin.com', 'pass123', 'supervisor', '2026-03-07 15:50:01', NULL),
(20, 'Dr Farhana', 'farhana@admin.com', 'pass123', 'supervisor', '2026-03-07 15:50:01', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`alert_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `emotional_tracking`
--
ALTER TABLE `emotional_tracking`
  ADD PRIMARY KEY (`tracking_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`resource_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `report_id` (`report_id`),
  ADD KEY `peer_id` (`peer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `alert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `emotional_tracking`
--
ALTER TABLE `emotional_tracking`
  MODIFY `tracking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `resource_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alerts`
--
ALTER TABLE `alerts`
  ADD CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`);

--
-- Constraints for table `emotional_tracking`
--
ALTER TABLE `emotional_tracking`
  ADD CONSTRAINT `emotional_tracking_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  ADD CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`peer_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
