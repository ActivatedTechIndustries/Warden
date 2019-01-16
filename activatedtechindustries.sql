-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 21-Nov-2018 às 14:01
-- Versão do servidor: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `activatedtechindustries`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bot_answers`
--

CREATE TABLE `bot_answers` (
  `idbot_answer` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bot_questions`
--

CREATE TABLE `bot_questions` (
  `idbot_question` int(11) NOT NULL,
  `question` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bot_question_answer`
--

CREATE TABLE `bot_question_answer` (
  `idbot_question_answer` int(11) NOT NULL,
  `idbot_question` int(11) NOT NULL,
  `idbot_answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contacts_forum`
--

CREATE TABLE `contacts_forum` (
  `id_user1` int(11) NOT NULL,
  `id_user2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `likes_dislikes_messages_forum`
--

CREATE TABLE `likes_dislikes_messages_forum` (
  `id_message` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `likes` int(11) DEFAULT NULL,
  `dislikes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `likes_dislikes_news_forum`
--

CREATE TABLE `likes_dislikes_news_forum` (
  `id_News` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `Likes` int(11) DEFAULT NULL,
  `Dislikes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `messages_forum`
--

CREATE TABLE `messages_forum` (
  `id_Message` int(11) NOT NULL,
  `users_id_user` int(11) DEFAULT NULL,
  `Messsages` text,
  `Date` date DEFAULT NULL,
  `Hour` time DEFAULT NULL,
  `Likes` int(11) NOT NULL,
  `Dislikes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `new_messages_forum`
--

CREATE TABLE `new_messages_forum` (
  `id_News` int(11) NOT NULL,
  `News_Message` text,
  `Date` date DEFAULT NULL,
  `Hour` time DEFAULT NULL,
  `Likes` int(11) NOT NULL,
  `Dislikes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `private_messages_forum`
--

CREATE TABLE `private_messages_forum` (
  `idPrivate_Messages` int(11) NOT NULL,
  `id_user1` int(11) NOT NULL,
  `id_user2` int(11) NOT NULL,
  `Message` text NOT NULL,
  `Data` datetime NOT NULL,
  `Readed` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `type_users`
--

CREATE TABLE `type_users` (
  `id_type` int(11) NOT NULL,
  `Type` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(41) NOT NULL,
  `country` varchar(30) NOT NULL,
  `type_user_id_type` int(11) NOT NULL,
  `last_login` datetime NOT NULL,
  `last_logout` datetime NOT NULL,
  `avatar` int(11) NOT NULL,
  `status_display` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_bot_questions`
--

CREATE TABLE `user_bot_questions` (
  `id_user_bot_question` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_bot_question` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bot_answers`
--
ALTER TABLE `bot_answers`
  ADD PRIMARY KEY (`idbot_answer`);

--
-- Indexes for table `bot_questions`
--
ALTER TABLE `bot_questions`
  ADD PRIMARY KEY (`idbot_question`);

--
-- Indexes for table `bot_question_answer`
--
ALTER TABLE `bot_question_answer`
  ADD PRIMARY KEY (`idbot_question_answer`),
  ADD KEY `idbot_question` (`idbot_question`),
  ADD KEY `idbot_answer` (`idbot_answer`);

--
-- Indexes for table `contacts_forum`
--
ALTER TABLE `contacts_forum`
  ADD PRIMARY KEY (`id_user1`,`id_user2`);

--
-- Indexes for table `likes_dislikes_messages_forum`
--
ALTER TABLE `likes_dislikes_messages_forum`
  ADD PRIMARY KEY (`id_message`,`id_user`);

--
-- Indexes for table `likes_dislikes_news_forum`
--
ALTER TABLE `likes_dislikes_news_forum`
  ADD PRIMARY KEY (`id_News`,`id_user`);

--
-- Indexes for table `messages_forum`
--
ALTER TABLE `messages_forum`
  ADD PRIMARY KEY (`id_Message`);

--
-- Indexes for table `new_messages_forum`
--
ALTER TABLE `new_messages_forum`
  ADD PRIMARY KEY (`id_News`);

--
-- Indexes for table `private_messages_forum`
--
ALTER TABLE `private_messages_forum`
  ADD PRIMARY KEY (`idPrivate_Messages`);

--
-- Indexes for table `type_users`
--
ALTER TABLE `type_users`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `type_user_id_type` (`type_user_id_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bot_answers`
--
ALTER TABLE `bot_answers`
  MODIFY `idbot_answer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bot_questions`
--
ALTER TABLE `bot_questions`
  MODIFY `idbot_question` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bot_question_answer`
--
ALTER TABLE `bot_question_answer`
  MODIFY `idbot_question_answer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages_forum`
--
ALTER TABLE `messages_forum`
  MODIFY `id_Message` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `new_messages_forum`
--
ALTER TABLE `new_messages_forum`
  MODIFY `id_News` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `private_messages_forum`
--
ALTER TABLE `private_messages_forum`
  MODIFY `idPrivate_Messages` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type_users`
--
ALTER TABLE `type_users`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
