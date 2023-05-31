
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dinamic-site`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(12) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `page` int(10) NOT NULL,
  `email` varchar(110) NOT NULL,
  `comment` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

-- --------------------------------------------------------

--
-- Структура таблицы `doc`
--

CREATE TABLE `doc` (
  `id` int(12) NOT NULL,
  `title` varchar(125) NOT NULL,
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `doc`
--

INSERT INTO `doc` (`id`, `title`, `content`, `created`) VALUES
(1, 'Диванный эксперт', '<p>фцв цв цв</p><h1>ЦВ ФЦв Ф Цв</h1><p>&nbsp;</p><p>Цв Цв ФЦв&nbsp;</p><ul><li>фцвфцв</li><li>фцвфцв</li><li>фцвфцв</li></ul><p>фцвфцвфцвфв</p><ol><li>фцвф</li><li>фцвфцв<ol><li>вцв</li><li>фвфыв</li></ol></li><li>фывфыв</li><li>&nbsp;</li></ol>', '2021-04-26 19:39:46'),
(2, 'фыйцйцвйвйв', '<p>фыыйыс</p>', '2021-04-26 19:40:42'),
(3, 'Третья документация', '<h2>Основы третеье йдокументации</h2><p>Это обычный параграфф</p><ul><li>Это просто список</li><li>второй пункт списка<ul><li>подсписок</li><li>подсписок-2</li></ul></li></ul>', '2021-04-26 20:07:19'),
(4, 'AndreiTest', '<p>аукп ука ука укп</p>', '2021-04-26 20:07:51');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(12) NOT NULL,
  `id_user` int(12) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `id_topic` int(12) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

-- --------------------------------------------------------

--
-- Структура таблицы `topics`
--

CREATE TABLE `topics` (
  `id` int(12) NOT NULL,
  `name` varchar(121) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `topics`
--

INSERT INTO `topics` (`id`, `name`, `description`) VALUES
(15, 'php', 'Some about php'),
(16, 'uncategory', '...'),
(17, 'О жизни IT', 'Как протекает ручей спокойствия и безмятежен в IT'),
(18, 'Top topics', 'Категория для вывода статей в горизонтальное слайдшоу на главной странице.');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(12) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `admin`, `username`, `email`, `password`, `created`) VALUES
(50, 1, 'Andrei', 'ahdepc88@gmail.com', '$2y$10$mkpLBHXIXJbVcy3N/NJdieHK.JWezPbul4VeMh/malzOO/Ug9IKf2', '2021-05-05 18:04:34'),
(51, 1, 'test', 'ah@gmail.com', '$2y$10$bsx9bl2pS0sNvBDXLI5ksOyHd8CiXU54FhSNyrevwHksMPB.aistG', '2021-05-17 16:16:41'),
(52, 0, 'Test22', 'test22@gmail.com', '$2y$10$QnMnaL.Uzbi77Y3XaFA1MeofmCh8M31fMCvahekLt0dPBP7twpeq2', '2021-05-27 18:23:26');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `doc`
--
ALTER TABLE `doc`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_topic` (`id_topic`);

--
-- Индексы таблицы `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `doc`
--
ALTER TABLE `doc`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`id_topic`) REFERENCES `topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
