-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 20, 2025 at 08:57 AM
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
-- Database: `be25_exam4_lyudmil_biglibrary`
--
CREATE DATABASE IF NOT EXISTS `be25_exam4_lyudmil_biglibrary` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be25_exam4_lyudmil_biglibrary`;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `isbn_code` varchar(13) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `media_type` enum('book','cd','dvd') NOT NULL,
  `author_first_name` varchar(50) NOT NULL,
  `author_last_name` varchar(50) DEFAULT NULL,
  `publisher_name` varchar(100) NOT NULL,
  `publisher_address` varchar(255) DEFAULT NULL,
  `publish_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `isbn_code`, `title`, `image`, `description`, `media_type`, `author_first_name`, `author_last_name`, `publisher_name`, `publisher_address`, `publish_date`) VALUES
(1, '0165487954', 'Harry Potter and the order of the Phoenix', 'https://imgs.search.brave.com/TAhNv3KyoR5ijmJ-NsGqWwbUov2len0K7nyKQby-C4s/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YWRhemluZy5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMjIv/MTIvSGFycnktUG90/dGVyLUJvb2stQ292/ZXJzLU9yZGVyLW9m/LXRoZS1QaG9lbml4/LXVzLTY4M3gxMDI0/LnBuZw', 'As the wizarding world refuses to believe Voldemort has returned, Harry faces skepticism, isolation, and a new tyrannical professor at Hogwarts. With the help of friends and a secret student group, he prepares for the growing threat — and uncovers chilling truths about himself and the past.', 'book', 'Joanne', 'Rowling', 'Bloomsbury', '50 Bedford Square, London, WC1B 3DP', '2003-06-21'),
(2, '0165487955', 'World of Warcraft: Stormrage', 'https://imgs.search.brave.com/hTj7jRf3k8_VsGgxpSshsvPLybxsaj3IHcrMZjPA2ww/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9ibG9n/YWJvdXR3b3cud29y/ZHByZXNzLmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvMjAxMC8w/OS9pdHprb29wYV9z/dG9ybXJhZ2Vfd293/X2Jvb2tfcmV2aWV3/X2NvdmVyLmpwZz93/PTU5NQ', 'As a mysterious nightmare spreads across Azeroth, trapping victims in eternal sleep, Archdruid Malfurion Stormrage becomes the key to stopping it. But to save the world, heroes must venture into a twisted dreamscape — and face an ancient evil threatening to break into reality.', 'book', 'Richard', 'Knaak', 'Pocket Star Books', '1230 Avenue of the Americas, New York, NY 10020, USA', '2010-02-23'),
(3, '1517907876', 'The Witcher: The Last Wish', 'https://imgs.search.brave.com/HDr5VakKE1lHmEBQIeCNw7HB-LJpR6LX8-G1dwDuEPw/rs:fit:860:0:0:0/g:ce/aHR0cDovL2JlZm9y/ZXdlZ29ibG9nLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAy/NC8wOC9UaGUtTGFz/dC1XaXNoLmpwZw', 'In this collection of linked short stories, Geralt of Rivia — a monster hunter known as a Witcher — navigates a world of deadly beasts, dark magic, and moral ambiguity, questioning what truly makes a monster.', 'book', 'Andrzey', 'Sapkowski', 'SuperNowa', 'ul. Nowowiejska 10/12, 00-653 Warszawa, Poland', '2007-06-07'),
(4, '9383962176', 'Hybrid Theory', 'https://imgs.search.brave.com/RCHfwoQwxdZ9GXFdxUP_M5J4sF_MgbeUzgZTA3dI_Ig/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YTEuanBjLmRlL2lt/YWdlL3c0NjgvZnJv/bnQvMC8wMDkzNjI0/Nzc1NTIyLmpwZw', 'Linkin Park\'s debut album, Hybrid Theory, blends nu-metal, rap, and electronic elements into an emotional exploration of angst, identity, and resilience — featuring iconic tracks like “In the End” and “Crawling.”', 'cd', 'Linkin', 'Park', 'Warner Bros. Records', '3300 Warner Boulevard, Burbank, CA 91505-4964, USA', '2000-10-24'),
(5, '2630597314', 'The Marshall Mathers LP', 'https://imgs.search.brave.com/0-RaAXT53eB4oRY9UELf7tYQQrODbfdXXf0JjpRole4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9kb3Nl/LnN0b3JlL2Nkbi9z/aG9wL2ZpbGVzL2Vt/aW5lbW1hcnNoYWxs/Y292ZXJfMTAyNHgx/MDI0QDJ4LnBuZz92/PTE3MDQ4OTQ4OTc', 'Eminem’s groundbreaking second album, The Marshall Mathers LP, dives deep into fame, anger, and personal struggles with unfiltered lyricism. Combining controversy and introspection, it features powerful tracks like “Stan,” “The Way I Am,” and “The Real Slim Shady,” pushing the boundaries of hip-hop and storytelling.', 'cd', 'EMINEM', '', 'Aftermath Entertainment', '', '2000-05-23'),
(6, '8267474983', 'Meteora', 'https://imgs.search.brave.com/8bkXtLbtDS1McSpySkri0owqMhfVyjPTIgRYewvcmlw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/bWV0YWxtdXNpY2Fy/Y2hpdmVzLmNvbS9p/bWFnZXMvY292ZXJz/L2xpbmtpbi1wYXJr/LW1ldGVvcmEtMjAx/NTA5MjMyMzMzMTcu/anBn', 'Linkin Park’s Meteora is a high-energy fusion of nu-metal, alternative rock, and electronic elements, showcasing the band’s signature blend of aggressive guitars, melodic hooks, and introspective lyrics. Released in 2003, it builds on the success of Hybrid Theory, featuring powerful tracks like “Numb,” “Faint,” and “Breaking the Habit” that explore themes of inner struggle, alienation, and emotional resilience.', 'cd', 'Linkin', 'Park', 'Warner Bros. Records', '3300 Warner Boulevard, Burbank, CA 91505-4964, USA', '2003-03-25'),
(7, '6621767174', 'The Matrix', 'https://imgs.search.brave.com/1742yx3ZdBdFri2hPrdHF9kWEr4QmDxLIG_gp8RyMY4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS1jYWNoZS5jaW5l/bWF0ZXJpYWwuY29t/L3AvNTAweC9kMG1z/cXFkNC90aGUtbWF0/cml4LWR2ZC1tb3Zp/ZS1jb3Zlci5qcGc_/dj0xNDU2MDQyMzkw', 'The Matrix is a mind-bending science fiction thriller that follows Neo, a computer hacker who discovers that the world he lives in is an artificial simulation created by intelligent machines to subdue humanity. After being freed by a group of rebels, Neo is drawn into a dangerous fight for freedom, as he learns to manipulate the simulated reality and embrace his destiny as \"The One\"—the prophesied figure who can bring down the Matrix and awaken the real world.', 'dvd', 'the Wachowski Brothers', '', 'Warner Home Video', '4000 Warner Boulevard, Burbank, California, United States', '1999-03-31'),
(9, '0221850138', 'The Witcher: Sword of Destiny', 'https://imgs.search.brave.com/L4i7PT1EbbEcOZD72utm3hJ2x1tU8by2ysRR8e5za-0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMtbmEuc3NsLWlt/YWdlcy1hbWF6b24u/Y29tL2ltYWdlcy9J/LzgxYVMyVTN1SlBM/LmpwZw', 'The Witcher: Sword of Destiny is a captivating collection of interconnected short stories by Andrzej Sapkowski that follows Geralt of Rivia, a monster hunter navigating a world filled with magic, war, and moral ambiguity. The book explores key relationships, including Geralt’s bond with the sorceress Yennefer and his destined connection to Ciri, blending action, folklore, and philosophical depth in a dark, richly imagined fantasy world.', 'book', 'Andrzey', 'Sapkowski', 'SuperNowa', 'ul. Nowowiejska 10/12, 00-653 Warszawa, Poland', '2015-05-21'),
(10, '9157226738', 'Cloud Atlas', 'https://imgs.search.brave.com/3RE6gIjLL1J0cGe1If2a-jB0bdCxKq-eQxs7UoQTzWE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tLm1l/ZGlhLWFtYXpvbi5j/b20vaW1hZ2VzL0kv/OTErT1ZEZS1zR0wu/anBn', 'Cloud Atlas is an ambitious sci-fi drama that interweaves six stories across time — from the 19th century to a distant post-apocalyptic future. It explores how actions ripple through lifetimes, shaping destinies and connecting souls. With themes of reincarnation, resistance, and freedom, the film blends genres and characters in a visually stunning, thought-provoking narrative.', 'dvd', 'the Wachowski Brothers', '', 'Warner Home Video', '4000 Warner Boulevard, Burbank, California, United States', '2013-05-13'),
(11, '8871248086', 'The Chronic', 'https://imgs.search.brave.com/xOPicLGIDDqLuYdkqupbLhSVPimowBwF-Qasj_8avTU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pYTYw/MDQwNy51cy5hcmNo/aXZlLm9yZy81L2l0/ZW1zL1RoZS1DaHJv/bmljLTQyMDY5L0No/cm9uaWNDb3Zlci5q/cGc_Y250PTA', 'ChatGPT said:\r\nThe Chronic is Dr. Dre’s groundbreaking debut solo album that redefined West Coast hip-hop in the early \'90s. Released in 1992, it introduced the world to G-funk — a smooth, bass-heavy style fused with funk samples — and launched the career of Snoop Dogg. With its laid-back yet hard-hitting sound, The Chronic became a cultural milestone, blending street realism, political commentary, and infectious grooves.', 'cd', 'Dr.', 'Dre', 'Aftermath Entertainment and Interscope Records', '', '1992-12-15'),
(12, '8765510807', 'Masters of Reality', 'https://imgs.search.brave.com/jZp3489B9HgJ7jWsVfFfOaci-9bIT9RsindUGPUQ36k/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9yZXNv/dXJjZXMudGlkYWwu/Y29tL2ltYWdlcy9i/YWYyMTU2OC8yZDJm/LzRkYWMvYjgxNy8w/Mzg2OTczNzM0ZDkv/NjQweDY0MC5qcGc', 'ChatGPT said:\r\nMaster of Reality is Black Sabbath’s third studio album and a cornerstone of heavy metal history. Released in 1971, it showcases a darker, heavier sound with downtuned guitars, sludgy riffs, and haunting lyrics. Songs like “Sweet Leaf,” “Children of the Grave,” and “Into the Void” pushed the boundaries of rock music and laid the foundation for doom and stoner metal. Gritty, powerful, and atmospheric, the album cemented Black Sabbath’s legacy as pioneers of the genre.', 'cd', 'Black', 'Sabbath', 'Vertigo Records', '364-366 Kensington High Street, London, Greater London, United Kingdom W14 8NS', '1971-08-06'),
(13, '6308918073', 'Paranoid', 'https://imgs.search.brave.com/GAf1a_1Hvt1vCLvl2XsGJtn8sb43_130D0YEJSRDR0s/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YXJ0Z3JvdXAuY29t/L2Fzc2V0cy9pbWcv/cHJvZHVjdHMvQUNQ/UFI0ODAzMA', 'Paranoid is Black Sabbath’s iconic second album, released in 1970, and is widely regarded as one of the most influential heavy metal albums of all time. Featuring legendary tracks like “War Pigs,” “Iron Man,” and the title track “Paranoid,” the record blends dark, apocalyptic themes with heavy, driving riffs and Ozzy Osbourne’s haunting vocals. Its raw energy, powerful lyrics, and genre-defining sound helped shape the future of metal and solidified Black Sabbath’s role as pioneers of the movement.', 'cd', 'Black', 'Sabbath', 'Vertigo Records', '364-366 Kensington High Street, London, Greater London, United Kingdom W14 8NS', '1970-09-18'),
(14, '8294742349', 'World of Warcraft: Arthas: Rise of the Lich King', 'https://imgs.search.brave.com/9SwC-OrUy81pVxbVgyCHX22OMeyQ6qRbDU5miFMrkt4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMtbmEuc3NsLWlt/YWdlcy1hbWF6b24u/Y29tL2ltYWdlcy9J/LzgxTklidkVla1lM/LmpwZw', 'World of Warcraft: Arthas: Rise of the Lich King tells the gripping origin story of one of Azeroth’s most tragic and iconic villains. Following Prince Arthas Menethil, the novel traces his descent from a noble paladin of Lordaeron to the dreaded Lich King. As Arthas battles enemies both external and internal, his decisions—driven by desperation and pride—slowly unravel his humanity. Set against the backdrop of epic war and ancient magic, this tale explores themes of destiny, corruption, and sacrifice in the rich universe of World of Warcraft.', 'book', 'Christie', 'Golden', 'Pocket Star Books', '1230 Avenue of the Americas, New York, NY 10020, USA', '2009-04-21'),
(15, '2723799495', 'Harry Potter and the Deathly Hollows', 'https://imgs.search.brave.com/f6pFy2T_gPz6QzvDc8mJvy9nhevc_0188ZhiMGpBmq4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMtbmEuc3NsLWlt/YWdlcy1hbWF6b24u/Y29tL2ltYWdlcy9J/LzgxMXQxcGZJWlhM/LmpwZw', 'Harry Potter and the Deathly Hallows is the powerful final chapter in J.K. Rowling’s legendary series. As Voldemort tightens his grip on the wizarding world, Harry, Ron, and Hermione set out on a dangerous mission to destroy the remaining Horcruxes. With no Hogwarts to return to and danger lurking everywhere, the trio must rely on courage, loyalty, and each other. As secrets are revealed and final battles fought, Harry faces his destiny in an epic showdown that will determine the fate of both the magical and Muggle worlds.', 'book', 'Joanne', 'Rowling', 'Bloomsbury', 'Address: 50 Bedford Square, London, WC1B 3DP', '2007-07-21'),
(16, '0074545712', 'The Dark Knight', 'https://imgs.search.brave.com/49RXWe6pLRUsS81Rz_5sNyfl0QnsQsWa9zd0YCEeUZY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/cHJldmlld3N3b3Js/ZC5jb20vU2l0ZUlt/YWdlL01haW5JbWFn/ZS9TVEszODMxMzI', 'Christopher Nolan\'s The Dark Knight is a gripping and morally complex superhero film that redefined the genre. With Christian Bale as Batman and Heath Ledger’s unforgettable, Oscar-winning performance as the Joker, the film explores chaos, justice, and the fragile balance between heroism and vigilantism in Gotham City. Tense, atmospheric, and emotionally charged, it stands as one of the most acclaimed comic book adaptations of all time.', 'dvd', 'Christopher', 'Nolan', 'Warner Home Video', '4000 Warner Boulevard, Burbank, California, United States', '2008-12-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `isbn_code` (`isbn_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
