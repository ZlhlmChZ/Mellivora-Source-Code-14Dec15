-- phpMyAdmin SQL Dump
-- version 4.2.6deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 18, 2015 at 09:21 AM
-- Server version: 5.5.41-0ubuntu0.14.10.1
-- PHP Version: 5.5.12-2ubuntu4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mellivora`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(10) unsigned NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `available_from` int(10) unsigned NOT NULL DEFAULT '0',
  `available_until` int(10) unsigned NOT NULL DEFAULT '0',
  `instanceID` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `added`, `added_by`, `title`, `description`, `available_from`, `available_until`, `instanceID`) VALUES
(3, 1418854985, 5, 'Misc.', 'Simple Miscellaneous challenges for general knowledge', 1418854958, 1829082158, '0'),
(4, 1418855075, 6, 'Forensics', 'This challenge applies basic forensic technique. ', 1418855032, 1482013432, '0'),
(6, 1418856997, 7, 'Data Manipulation', 'The challenges in this category will show and guide you towards the art of data manipulation.', 1418856887, 1450392887, '0'),
(7, 1418859545, 6, 'Networking', 'Apply basic networking concepts,', 1418859530, 1450395530, '0'),
(9, 1418861342, 6, 'Malware', '', 1418861334, 1513555734, '0'),
(11, 1420507533, 4, 'Toaster Wars', '', 1420507509, 1452043509, '0'),
(85, 1422948791, 261, 'Network Challenges', '<p>Rapier Network services has hired you to do a penetration testing on their network. You have a range of tasks from WPA cracking to ARP poisoning. Have Fun!</p>\r\n', 1422948665, 1454484665, '0'),
(86, 1422948815, 261, 'Web Exploitation', 'You are a staff responsible for doing penetration testing for your company Rapier. \r\nRecently, you have received a report from your superiors that there has been cases of attacks on our system, resulting into losses for Rapier. You are required to find out how the attackers managed to attack and bypass Rapier''s security systems. ', 1422948599, 1486106999, '0'),
(87, 1422948990, 261, 'Rapier Internal Services', '<p style="border: 1px solid rgb(204, 204, 204); padding: 5px 10px; background: rgb(238, 238, 238);"><strong>The Rapier Internal Departme​nt has requested for you to check out the files that have been tampered by the hacker and to conduct forensic investigations in an effort to find the identity of the hacker. Do your best, the company awaits.</strong></p>\r\n', 1422948968, 4073787368, '0');

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

CREATE TABLE IF NOT EXISTS `challenges` (
`id` int(10) unsigned NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `available_from` int(10) unsigned NOT NULL DEFAULT '0',
  `available_until` int(10) unsigned NOT NULL DEFAULT '0',
  `flag` text NOT NULL,
  `case_insensitive` tinyint(1) NOT NULL DEFAULT '1',
  `automark` tinyint(1) NOT NULL DEFAULT '1',
  `points` int(10) unsigned NOT NULL,
  `num_attempts_allowed` tinyint(3) unsigned NOT NULL DEFAULT '5',
  `min_seconds_between_submissions` smallint(5) unsigned NOT NULL DEFAULT '0',
  `relies_on` int(10) unsigned NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `hint` varchar(500) DEFAULT NULL,
  `correct` text,
  `instanceID` varchar(45) NOT NULL DEFAULT '0',
  `cloneOf` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1216 ;

--
-- Dumping data for table `challenges`
--

INSERT INTO `challenges` (`id`, `added`, `added_by`, `title`, `category`, `description`, `available_from`, `available_until`, `flag`, `case_insensitive`, `automark`, `points`, `num_attempts_allowed`, `min_seconds_between_submissions`, `relies_on`, `pid`, `status`, `hint`, `correct`, `instanceID`, `cloneOf`) VALUES
(4, 1418855079, 1, 'Picsfucation', 3, 'While working in your lab, the lab operator sent in a recent forensic find, at first it just appears to be a normal picture file, \r\nhowever, through your years of experience in the forensic field, you believe there is more than that meets the eye. \r\n\r\n', 1418854988, 1829082188, 'ILOVEPICS<3SOOOOMUCH', 1, 1, 20, 255, 10, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(5, 1418855255, 1, 'I am hiding', 4, 'You are a forensic examiner and you are called in to investigate a case. A suspect was found to have stolen some trade secrets. You are required to find the files that the suspect has stolen.', 1418855078, 1450391078, 'Catch me if you can', 1, 1, 10, 255, 100, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(6, 1418855769, 1, 'The Pass Code', 3, 'You are tasked with securing all the old websites for Rapier Ltd.\r\n\r\nLooking through the servers of Rapier Ltd, you stumbled across this server hosting a profile page for an old client. You decided to check through the website to find any vulnerability which are in plain site.', 1418855655, 1860705255, 'flag_6d4bdd0871b19222015b77107141b75f5b5224ff', 1, 1, 10, 255, 10, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(7, 1418855967, 1, 'The Cheese Jar', 3, 'Since young, you have been a fan of the ''Diary of a wimpy kid'', as part of their anniversary promotion they will grant a special prize to the one who can solve the cheese jar challenge.\r\n\r\nTime to find out who has the cheese touch! ', 1418855889, 1860705489, 'Darren Walsh HAS THE CHEESE TOUCH', 1, 1, 70, 5, 10, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(9, 1418857061, 1, 'VALLEY OF DOOM', 3, 'Whilst walking around the area, you discovered a book named "THE VALLEY OF DOOM" and with it you also found a hard drive labelled as the "Key of doom" scribbled on it\r\nThe hard drive may be corrupted, but you were able to recover a small chunk of text. Scribbled on the back of the hard drive is a set of mysterious numbers. Can you discover the meaning behind these numbers? (1, 9, 4) (4, 2, 8) (4, 8, 3) (7, 1, 5) (8, 10, 1)', 1418856854, 1923778454, 'the flag, is Ceremonial plates.', 1, 1, 200, 255, 5, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(10, 1418857430, 1, 'Dont play with me', 4, 'A file has been recovered from a suspect. You are a forensics examiner and you are required to analyze the file.', 1418857354, 1513551754, 'Why are you so awesome?', 1, 1, 10, 255, 0, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(11, 1418857745, 1, 'Find out the flag ID', 6, 'You require a flag ID to pass this stage but the flag ID that was given was in hexadecimal format. \r\nHowever, this systems requires you to enter the flag ID in decimal format instead of hexadecimal format. \r\nDownload the notepad provided and convert the flag ID from hexadecimal to decimal format.', 1418857012, 1450393012, '4274635103', 0, 1, 10, 255, 0, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(12, 1418858113, 1, 'Vini Vici Vidi', 3, 'Looking through the penetrated server files, you stumbled across this trail of cipher left behind by the hacker:\r\n\r\nFdhvdu, rqh wuxh hpshuru ri urpd\r\n\r\n\r\nPerhaps, this could reveal the identity of the hacker.', 1418858053, 2239398853, 'Caesar, one true emperor of roma', 1, 1, 10, 255, 0, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(13, 1418858302, 1, 'Hash the flag ID', 6, 'Someone is trying to steal the flag ID to complete the challenge by themselves. You have to prevent them from stealing the flag ID and completing your challenges. Hash the flag ID using SHA-1 algorithm so that even if they managed to get the flag ID it will still be garbage characters and useless to them.', 1418857826, 1450393826, 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 0, 1, 20, 255, 0, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(14, 1418858665, 1, 'I love 3 trains', 4, 'I always travel by the rail. I have 3 carriages.\r\n\r\nIOAONRTNFMI SUTERYCI', 1418858586, 1513552986, 'Information Security', 1, 1, 20, 255, 0, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(16, 1418859610, 1, 'I have a packet to deliver to NYP.', 7, 'I need to deliver a packet to Nanyang Polytechnic, Can you tell me what the address is?', 1418859567, 1513553967, '202.0.127.11', 0, 1, 20, 100, 0, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(17, 1418859654, 1, 'Find The Password', 6, 'There is a old system that was coded by a programmer in the year 1990.\r\n It was mentioned that the password was a movie that he like in 1990s. View the photo provided and provide the system with the password as the flag id.', 1418859208, 1450395208, 'Home Alone', 1, 1, 20, 255, 0, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(18, 1418859991, 1, 'A simple mail needs to be delivered to my robot friend.', 7, 'I have a mail that i need to send to my friend. Which port should I use?', 1418859906, 1513295106, '25', 0, 1, 25, 25, 0, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(19, 1418860162, 1, 'Maybe just maybe', 3, 'You found the following file in the database server, appearing to be an innocent image file however, there are data hidden inside, suspecting that it could contain malicious content, you decided to extract the data from the file.', 1418859919, 1451432719, 'Flag_2Ez4RTZ', 1, 1, 20, 255, 10, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(21, 1418861096, 1, 'Crack the confidential document', 6, 'You have received a document that is highly confidential. \r\nCrack and decrypt the encrypted contents of the document which was encypted by DES algorithm and it  can be downloaded below to complete this challenge.', 1418860405, 1450396405, '94892289', 0, 1, 30, 255, 0, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(23, 1418861393, 1, 'Virus. Please dont touch!', 9, 'I will infect your PC!!!', 1418861345, 1513555745, 'You are so brave', 0, 1, 30, 255, 10, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(28, 1418930157, 1, 'Lookie Lookie', 6, 'Confidential information was stolen from our company on 17th December 2014. \r\nHowever, all of the colleagues were able to provide with an alibi to prove that they were not the one who stole the information. \r\nOnly for Andy, who provided a photo of NYP to prove that he was there on that day to meet his brother and is not in the office to steal the information. \r\nYou can download the photo below and tell us the origin and the author name.', 1418929654, 1450465654, 'Google', 1, 1, 20, 255, 0, 0, NULL, NULL, NULL, '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '0', 0),
(1002, 1420513286, 1, 'Failure to Boot', 11, 'What is the most used file system type in the world? ', 1420512530, 1704509330, 'FAT', 1, 1, 20, 99, 0, 0, 245, 1, 'Google is your best friend', '0', '0', 0),
(1003, 1420523909, 1, 'Extend the files ', 11, 'What is the most common file extension for compressed files?', 1420523673, 2020139673, 'Zip', 1, 1, 20, 99, 0, 1002, 246, 1, 'Common compressed file extension are tar, gz, zip', '0', '0', 0),
(1004, 1420524175, 1, 'Bitwise', 11, 'How many bits does Windows 8 runs in? ', 1420524054, 2146370454, '64', 1, 1, 10, 99, 0, 1003, 247, 1, 'most windows systems runs on 32 bits or 64 bits', '0', '0', 0),
(1005, 1420571353, 1, 'Art of stealing', 11, '_______ is the attempt to acquire sensitive information such as usernames, passwords, and credit card details.', 1420571250, 1452107250, 'Phishing', 1, 1, 10, 99, 0, 1004, 248, 1, NULL, NULL, '0', 0),
(1006, 1420571401, 1, 'Browser & HTML', 11, 'Most browsers uses HTML___?', 1420571360, 1452107360, '5', 0, 1, 10, 99, 0, 1005, 249, 1, NULL, NULL, '0', 0),
(1007, 1420571439, 1, 'CMD', 11, 'What do i type in the command propmt if i want to know my computer ip address?', 1420571406, 1452107406, 'IPCONFIG', 1, 1, 20, 99, 0, 1006, 250, 1, NULL, NULL, '0', 0),
(1008, 1420571545, 1, 'Directory Switching', 11, 'Is it possible to switch between directories in a computer using command prompt? Yes/No', 1420571496, 1452107496, 'Yes', 1, 1, 10, 99, 0, 1007, 251, 1, NULL, NULL, '0', 0),
(1009, 1420571634, 1, 'Who is the OS?', 11, 'What is the most commonly used Operating System for computers?', 1420571591, 1452107591, 'Windows', 1, 1, 10, 99, 0, 1008, 252, 1, NULL, NULL, '0', 0),
(1010, 1420571676, 1, 'Internet Tools', 11, 'What do we use to surf the net?', 1420571638, 1452107638, 'Browser', 1, 1, 10, 99, 0, 1009, 253, 1, NULL, NULL, '0', 0),
(1011, 1420571702, 1, 'Executable Files', 11, 'What is the name of file extensions for files that are executable?', 1420571681, 1452107681, 'exe', 1, 1, 10, 99, 0, 1010, 254, 1, NULL, NULL, '0', 0),
(1012, 1420571743, 1, 'Wireless Connection', 11, 'A device is required before our phone or computers can connect to the WIFI, what is the name of the device?', 1420571710, 1452107710, 'Router', 1, 1, 20, 99, 0, 1011, 255, 1, NULL, NULL, '0', 0),
(1013, 1420574388, 1, 'SQL Attack', 11, 'A form of attack on a website is called SQL _______?', 1420574363, 1452110363, 'Injection', 1, 1, 10, 99, 0, 1012, 256, 1, NULL, NULL, '0', 0),
(1014, 1420574434, 1, 'Data Security', 11, '_________is the most effective way to achieve data security', 1420574402, 1452110402, 'Encryption', 1, 1, 10, 99, 0, 1013, 257, 1, NULL, NULL, '0', 0),
(1015, 1420574483, 1, 'Data Conversion', 11, '______ is the transformation of a string of characters into a usually shorter fixed-length value or key that represents the original string.', 1420574443, 1452110443, 'Hashing', 1, 1, 20, 99, 0, 1014, 258, 1, NULL, NULL, '0', 0),
(1016, 1420574516, 1, 'Firewall Protection', 11, 'Firewall should be turned off at times. True or False?', 1420574488, 1452110488, 'False', 1, 1, 10, 99, 0, 1015, 259, 1, NULL, NULL, '0', 0),
(1017, 1420574570, 1, 'Protection for unauthorized access', 11, '______ protect (a network or system) from unauthorized access.', 1420574526, 1452110526, 'Firewall', 1, 1, 20, 99, 0, 1016, 260, 1, NULL, NULL, '0', 0),
(1018, 1420574611, 1, 'Hacker House', 11, 'Please Proceed to L520 to complete the hacker house challenge to get the flag', 1420574580, 1452110580, 'Attack at dawn', 1, 1, 10, 99, 0, 1017, 261, 1, NULL, NULL, '0', 0),
(1019, 1420574655, 1, 'DES ', 11, 'The full name for DES is?', 1420574620, 1452110620, 'Data Encryption Standard', 1, 1, 10, 99, 0, 1018, 262, 1, NULL, NULL, '0', 0),
(1020, 1420574687, 1, 'AES', 11, 'The full name for AES is?', 1420574661, 1452110661, 'Advanced Encryption Standard', 1, 1, 10, 99, 0, 1019, 263, 1, NULL, NULL, '0', 0),
(1021, 1420574728, 1, 'Key length for DES', 11, 'What is the key length for DES?', 1420574697, 1452110697, '56', 1, 1, 10, 99, 0, 1020, 264, 1, NULL, NULL, '0', 0),
(1022, 1420574765, 1, 'AES Block Size', 11, 'What is the block size for AES?', 1420574732, 1452110732, '128', 1, 1, 10, 99, 0, 1021, 265, 1, NULL, NULL, '0', 0),
(1023, 1420574793, 1, 'AES or DES?', 11, 'Which is more secure, AES or DES?', 1420574776, 1452110776, 'AES', 1, 1, 10, 99, 0, 1022, 266, 1, NULL, NULL, '0', 0),
(1024, 1420574826, 1, 'Are they using the same cipher?', 11, 'Both AES and DES Cipher Type are symmetric block cipher, True or False?', 1420574796, 1452110796, 'True', 1, 1, 10, 99, 0, 1023, 267, 1, NULL, NULL, '0', 0),
(1025, 1420574870, 1, 'Information spoofing', 11, '______ is a computer program that records every keystroke made by a computer user.', 1420574832, 1452110832, 'Keylogger', 1, 1, 20, 99, 0, 1024, 268, 1, NULL, NULL, '0', 0),
(1026, 1420574899, 1, 'Trial and Error', 11, 'A ________ attack is a trial-and-error method used to obtain information such as a user password.', 1420574881, 1452110881, 'Brute Force', 1, 1, 20, 99, 0, 1025, 269, 1, NULL, NULL, '0', 0),
(1027, 1420574928, 1, 'Hashing Key', 11, 'A key is required for the hashing of plaintext. True of False?', 1420574910, 1452110910, 'False', 1, 1, 10, 99, 0, 1026, 270, 1, NULL, NULL, '0', 0),
(1028, 1420574962, 1, 'Website Hoax', 11, 'Website _______ is the act of creating a website, as a hoax, with the intention of misleading readers that the website has been created by a different person or organization.', 1420574938, 1452110938, 'Spoofing', 1, 1, 20, 99, 0, 1027, 271, 1, NULL, NULL, '0', 0),
(1087, 1422948895, 1, 'WPA Password Cracking', 85, '<p>Rapier Network Service needs your help to gain access into a secured wireless network named &quot;CTF&quot;. You are required to find the password of the network using the tools in Kali Linux. Have fun!</p>\r\n', 1422948809, 1454484809, 'password', 1, 1, 10, 255, 0, 0, NULL, NULL, NULL, NULL, '0', 0),
(1088, 1422949154, 1, 'SQL Manipulation Level 1', 86, '<p>You have been assigned to investigate the current attacks on Rapier&#39;s login system. Reports of attacks has resulted into you taking over this case and try to attack the login system yourself, to find out whether the reports of attacks are true. Go to this link http://192.168.23.15/sql.aspx to do this challenge and acquire the flag id.</p>\r\n', 1422948830, 1486107230, 'breakinginiseasy', 1, 1, 200, 255, 0, 0, NULL, NULL, NULL, NULL, '0', 0),
(1089, 1422949454, 1, 'Sql Manipulation Level 2', 86, '<p>Reports of SQL Injection attacks to steal admin credentials from Rapier&#39;s database has brought the attention of this case to you. Investigate it like what you did during level 1 and try to find out how did the attacker managed to acquire Admin Credentials just by using Search function which can only be used to search users. Flag Id will be the password of the admin account. Go to this link http://192.168.23.15/sql2.aspx to complete this challenge.</p>\r\n', 1422949163, 1486107563, 'asd123', 1, 1, 200, 255, 0, 1088, NULL, NULL, NULL, NULL, '0', 0),
(1090, 1422949713, 1, 'Password file 08987', 87, 'The hacker has gained access into our systems and locked away some of our clients'' confidential data, he has hidden the password within a fake Classified file within our database. We are unsure of his intent but we suspect he kept it there for future reference. Our specialist team has pin point the file, but we are unable to dive the file and retrieve the password. \r\n\r\nThe password right now is our top priority, we risk the leakage of confidential data and you are our best bet.\r\n\r\nDon''t disappoint us.  ', 1422949016, 4073787416, 'Rapierz_TooEzForYa', 0, 1, 50, 0, 0, 0, NULL, NULL, NULL, NULL, '0', 0),
(1091, 1422950174, 1, 'Weak Authentication', 86, '<p>You have been informed to look into a case of brute force attacks done by the attackers due to many staffs having easy to guess password. One example of a staff using easy password that has been given to you by your superiors is the staff named judy. Investigate how the attackers managed to do it and try to guess judy password to get the flag id. Go to this link http://192.168.23.15/WeakAuthentication.aspx to complete this challenge.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<iframe src="http://192.168.23.15/WeakAuthentication.aspx" width=100% height=500px></iframe>', 1422949955, 1486108355, 'Judyeasypassword', 1, 1, 150, 255, 0, 0, NULL, NULL, NULL, NULL, '0', 0),
(1092, 1422950440, 1, 'Cookie Management', 86, '<p>Rapier has found out signs of data thefts by accounts which was not assigned with the role of admins to view the data. Investigations has been done and it was found out that the attackers changed the cookie value from user to admin to get access to information that only admin has accessed to. Find out how the attackers managed to do it to acquire the flag id. Go to this link http://192.168.23.15/cookiemanagement.aspx to complete this challenge.</p>\r\n', 1422950183, 1486108583, '6327sewretsew11', 1, 1, 250, 255, 0, 0, NULL, NULL, NULL, NULL, '0', 0),
(1094, 1422950882, 1, 'Parameter Tampering', 86, '<p>The accounting department has contacted you to inform you that, there has been cases of customers paying lesser than the amount stated on the Rapier&#39;s website when they purchased their item. This has caused the company to suffer severe financial losses to the company. Find out how the attackers managed to change the price of the item when they purchased the item to accuire the flag id. Go to this link to complete this challenge&nbsp;http://192.168.23.15:8080/OpenHouse/ParameterTampering.jsp</p>\r\n', 1422950648, 1486109048, 'Beetle', 1, 1, 200, 255, 0, 0, NULL, NULL, NULL, NULL, '0', 0),
(1095, 1422951165, 1, 'Data Exposure', 86, '<p>There has been police reports coming in to Rapier as there has been reports of credit cards number of our shareholders been stolen and used by attackers. Your superior wants you to investigate how the attackers managed to exploit the hidden fields of credit card number on the web page to acquire the flag id. Go to this link to complete this challenge&nbsp;http://192.168.23.15:8080/OpenHouse/ParameterTampering.jsp</p>\r\n', 1422950897, 1486109297, 'Credit Card Number of Mr Samuel Lim is 551213154879', 1, 1, 200, 255, 0, 0, NULL, NULL, NULL, NULL, '0', 0),
(1096, 1422954648, 1, '-SMB-', 87, 'The last password that you managed to retrieve was unable to unlock the locked file.\r\n\r\nWe have located one of the machines that the hacker has been utilizing for one of his many attacks, we require you to gain access into the system and look for the password file which contain the terminal password.\r\n\r\nThere would be security features implemented to protect his computer, bypass these and bring us the password.\r\n\r\n', 1422954646, 4073788454, 'P2ssw0r3', 0, 1, 120, 0, 0, 1090, NULL, NULL, NULL, NULL, '0', 0),
(1097, 1423011668, 1, 'Network Sniffing', 85, '<p>The Rapier Network Services needs you again. There is a FTP server with an active FTP client accessing it. The IP address of the FTP Server is 192.168.1.48. Find a way to get the credentials for the FTP server.</p>\r\n', 1423011368, 1454547368, 'bobby', 1, 1, 10, 255, 0, 0, NULL, NULL, NULL, NULL, '0', 0),
(1098, 1423012086, 1, 'FTP Server', 85, '<p>Congratulations on getting the FTP credentials! Now that you have the credentials for the FTP server, Access the FTP server to get the flag.</p>\r\n', 1423011741, 1454547741, 'a8db1d82db78ed', 1, 1, 10, 99, 65535, 1097, NULL, NULL, NULL, NULL, '0', 0),
(1122, 1423206716, 1, 'DDOS Detection ', 87, '<p>We have received reports regarding attacks on one of our server. The attacker appears to be attacking with multiple machines under different IP addresses&nbsp;within the network. However, our specialists suspects that this could be a case where the attacker is under multiple spoofed IP&nbsp;addresses. We hereby entrust you with the task of finding out whether&nbsp;our suspicion is true, and if so, we have to find the machine, and block out the hacker from getting in.&nbsp;</p>\r\n\r\n<p>Our experts have provided you&nbsp;with a file containing the traffic during one of the attacks.</p>\r\n\r\n<p>Once you found the IP address, get back to us.</p>\r\n\r\n<p>We await your good news.</p>\r\n', 1423027077, 4073865477, '192.168.23.19', 0, 1, 40, 0, 0, 0, NULL, NULL, NULL, NULL, '0', 0),
(1123, 1423549229, 1, 'Clickjacking', 86, '<p>You have been informed to look into a case of clickjacking attacks done by the attackers due to many staffs not being able to log in to our website and is instead, redirected to another page. Rapier&#39;s Cyber Forensic Team had managed to find out that the codes of our website was being touched and altered. Find out how to solve this problem by being able to log in to the correct plage to accuire the flag ID. Go to this link to complete this challenge&nbsp;http://192.168.23.15/clickjacking.aspx</p>\r\n', 1423027077, 4073865477, 'clickjackingislikesonewtome', 1, 1, 150, 255, 0, 0, NULL, NULL, NULL, NULL, '0', 0),
(1124, 1423549677, 1, 'Cross Site Scripting', 86, '<p>You has been informed that there has been signs of web defacement in our Rapier web pages. Find out how the attackers manage to use thetags to deface our website. Once you have managed to deface the website successfully as well, show it to your superior to acquire the flag id. Go to this link to complete this challenge http://192.168.23.15/crosssite.aspx/</p>\r\n', 1423027077, 4073865477, 'hacked', 1, 1, 300, 255, 0, 0, NULL, NULL, NULL, NULL, '0', 0),
(1147, 1423626059, 1, 'Password Cracking', 85, '<p>One of Rapier&#39;s Employee, named Tom, has his workstation compromised thorugh an SMB vulnerability in his XP machine. Tom has a habit of using the same password for all his devices. You are required to crack Tom&#39;s password through the his XP workstation. The URL for the password cracking service is 172.20.180.26/index.php</p>\r\n', 1423027077, 4073865477, 'vat23VAT', 0, 1, 20, 255, 0, 0, NULL, NULL, NULL, NULL, '0', 0),
(1148, 1423648684, 1, 'Gaining access', 85, '<p>The Rapier Network Services is impressed by your ability to crack Tom&#39;s password! Now, there is another flag inside Tom&#39;s personal computer. Gain access into Tom&#39;s Windows 7 system.</p>\r\n', 1423027077, 4073865477, '657*jkl543', 0, 1, 10, 255, 0, 1147, NULL, NULL, NULL, NULL, '0', 0),
(1149, 1423648920, 1, 'The Internal Net', 87, '<p>We believe there are several security vulnerabilities with our network, we hope to find out about them and patch them. Our specialists has come up with this secuirty analysis tool, we require you to inject the tool into them anonymously and test to see if they are really vulnerable.&nbsp;</p>\r\n\r\n<p>Once you have received enough samples, the system will output the result string to you.&nbsp;</p>\r\n\r\n<p>Retrieve this string and get back to us.&nbsp;</p>\r\n', 1423027077, 4073865477, 'flag_infectionComplete', 0, 1, 100, 0, 0, 0, NULL, NULL, NULL, NULL, '0', 0),
(1151, 1423650641, 1, 'The Rat', 87, '<p>We suspect that one of our employee has been leaking confidential company information out to the wrong hands. However no concrete evidence is obtained. We require you to eavesdrop on the traffic and get back to us with the evidence. (i.e. any kind of password exchanged sent through a chat service or any kind of communication services).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We need to eradicate this threat.</p>\r\n\r\n<p>Wishing you all the best!&nbsp;</p>\r\n', 1423027077, 4073865477, 'RapierP@ssw0rd', 0, 1, 80, 0, 0, 1149, NULL, NULL, NULL, NULL, '0', 0),
(1152, 1423709613, 1, 'The quieter you are the more you can hear', 87, '<p>Our network security experts has discovered that the hacker is constantly logging into his C&amp;C system and there are instructions being constantly fired out. However, we are unable to sniff the packets containing the information as he has encrypted them. We need you to breach his system and retrieve his credentials(Password) so that we can shut off this system, but do note that we need you to stay discrete and not alarm him.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Use your extensive Pentest skills and eradicate this threat for the company.</p>\r\n\r\n<p>We await your good news.</p>\r\n', 1423027077, 4073865477, 'KeyL00gerFtw', 0, 1, 60, 0, 0, 0, NULL, NULL, NULL, NULL, '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cookie_tokens`
--

CREATE TABLE IF NOT EXISTS `cookie_tokens` (
`id` int(10) unsigned NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `token_series` char(16) NOT NULL,
  `token` char(64) NOT NULL,
  `ip_created` int(10) unsigned NOT NULL,
  `ip_last` int(10) unsigned NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cookie_tokens`
--

INSERT INTO `cookie_tokens` (`id`, `added`, `user_id`, `token_series`, `token`, `ip_created`, `ip_last`) VALUES
(1, 1422932687, 4, 'z1RaBt/dzwmh337E', 'm3wNG/rx5VKB66s2QlLBjrbFKS8ED3BugIgVocCCd9U9OhQ/jpBdBPHX0QT4jS59', 2887026429, 2887026429);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
`id` smallint(5) unsigned NOT NULL,
  `country_name` varchar(50) NOT NULL DEFAULT '',
  `country_code` char(2) NOT NULL DEFAULT ''
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=252 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_name`, `country_code`) VALUES
(1, 'Afghanistan', 'af'),
(2, 'Aland Islands', 'ax'),
(3, 'Albania', 'al'),
(4, 'Algeria', 'dz'),
(5, 'American Samoa', 'as'),
(6, 'Andorra', 'ad'),
(7, 'Angola', 'ao'),
(8, 'Anguilla', 'ai'),
(9, 'Antarctica', 'aq'),
(10, 'Antigua and Barbuda', 'ag'),
(11, 'Argentina', 'ar'),
(12, 'Armenia', 'am'),
(13, 'Aruba', 'aw'),
(14, 'Australia', 'au'),
(15, 'Austria', 'at'),
(16, 'Azerbaijan', 'az'),
(17, 'Bahamas', 'bs'),
(18, 'Bahrain', 'bh'),
(19, 'Bangladesh', 'bd'),
(20, 'Barbados', 'bb'),
(21, 'Belarus', 'by'),
(22, 'Belgium', 'be'),
(23, 'Belize', 'bz'),
(24, 'Benin', 'bj'),
(25, 'Bermuda', 'bm'),
(26, 'Bhutan', 'bt'),
(27, 'Bolivia, Plurinational State of', 'bo'),
(28, 'Bonaire, Sint Eustatius and Saba', 'bq'),
(29, 'Bosnia and Herzegovina', 'ba'),
(30, 'Botswana', 'bw'),
(31, 'Bouvet Island', 'bv'),
(32, 'Brazil', 'br'),
(33, 'British Indian Ocean Territory', 'io'),
(34, 'Brunei Darussalam', 'bn'),
(35, 'Bulgaria', 'bg'),
(36, 'Burkina Faso', 'bf'),
(37, 'Burundi', 'bi'),
(38, 'Cambodia', 'kh'),
(39, 'Cameroon', 'cm'),
(40, 'Canada', 'ca'),
(41, 'Cape Verde', 'cv'),
(42, 'Cayman Islands', 'ky'),
(43, 'Central African Republic', 'cf'),
(44, 'Chad', 'td'),
(45, 'Chile', 'cl'),
(46, 'China', 'cn'),
(47, 'Christmas Island', 'cx'),
(48, 'Cocos (Keeling) Islands', 'cc'),
(49, 'Colombia', 'co'),
(50, 'Comoros', 'km'),
(51, 'Congo', 'cg'),
(52, 'Congo, The Democratic Republic of the', 'cd'),
(53, 'Cook Islands', 'ck'),
(54, 'Costa Rica', 'cr'),
(55, 'Cote d''Ivoire', 'ci'),
(56, 'Croatia', 'hr'),
(57, 'Cuba', 'cu'),
(58, 'Curacao', 'cw'),
(59, 'Cyprus', 'cy'),
(60, 'Czech Republic', 'cz'),
(61, 'Denmark', 'dk'),
(62, 'Djibouti', 'dj'),
(63, 'Dominica', 'dm'),
(64, 'Dominican Republic', 'do'),
(65, 'Ecuador', 'ec'),
(66, 'Egypt', 'eg'),
(67, 'El Salvador', 'sv'),
(68, 'Equatorial Guinea', 'gq'),
(69, 'Eritrea', 'er'),
(70, 'Estonia', 'ee'),
(71, 'Ethiopia', 'et'),
(72, 'Falkland Islands (Malvinas)', 'fk'),
(73, 'Faroe Islands', 'fo'),
(74, 'Fiji', 'fj'),
(75, 'Finland', 'fi'),
(76, 'France', 'fr'),
(77, 'French Guiana', 'gf'),
(78, 'French Polynesia', 'pf'),
(79, 'French Southern Territories', 'tf'),
(80, 'Gabon', 'ga'),
(81, 'Gambia', 'gm'),
(82, 'Georgia', 'ge'),
(83, 'Germany', 'de'),
(84, 'Ghana', 'gh'),
(85, 'Gibraltar', 'gi'),
(86, 'Greece', 'gr'),
(87, 'Greenland', 'gl'),
(88, 'Grenada', 'gd'),
(89, 'Guadeloupe', 'gp'),
(90, 'Guam', 'gu'),
(91, 'Guatemala', 'gt'),
(92, 'Guernsey', 'gg'),
(93, 'Guinea', 'gn'),
(94, 'Guinea-Bissau', 'gw'),
(95, 'Guyana', 'gy'),
(96, 'Haiti', 'ht'),
(97, 'Heard Island and McDonald Islands', 'hm'),
(98, 'Holy See (Vatican City State)', 'va'),
(99, 'Honduras', 'hn'),
(100, 'Hong Kong', 'hk'),
(101, 'Hungary', 'hu'),
(102, 'Iceland', 'is'),
(103, 'India', 'in'),
(104, 'Indonesia', 'id'),
(105, 'Iran, Islamic Republic of', 'ir'),
(106, 'Iraq', 'iq'),
(107, 'Ireland', 'ie'),
(108, 'Isle of Man', 'im'),
(109, 'Israel', 'il'),
(110, 'Italy', 'it'),
(111, 'Jamaica', 'jm'),
(112, 'Japan', 'jp'),
(113, 'Jersey', 'je'),
(114, 'Jordan', 'jo'),
(115, 'Kazakhstan', 'kz'),
(116, 'Kenya', 'ke'),
(117, 'Kiribati', 'ki'),
(118, 'Korea, Democratic People''s Republic of', 'kp'),
(119, 'Korea, Republic of', 'kr'),
(120, 'Kuwait', 'kw'),
(121, 'Kyrgyzstan', 'kg'),
(122, 'Lao People''s Democratic Republic', 'la'),
(123, 'Latvia', 'lv'),
(124, 'Lebanon', 'lb'),
(125, 'Lesotho', 'ls'),
(126, 'Liberia', 'lr'),
(127, 'Libyan Arab Jamahiriya', 'ly'),
(128, 'Liechtenstein', 'li'),
(129, 'Lithuania', 'lt'),
(130, 'Luxembourg', 'lu'),
(131, 'Macao', 'mo'),
(132, 'Macedonia, The former Yugoslav Republic of', 'mk'),
(133, 'Madagascar', 'mg'),
(134, 'Malawi', 'mw'),
(135, 'Malaysia', 'my'),
(136, 'Maldives', 'mv'),
(137, 'Mali', 'ml'),
(138, 'Malta', 'mt'),
(139, 'Marshall Islands', 'mh'),
(140, 'Martinique', 'mq'),
(141, 'Mauritania', 'mr'),
(142, 'Mauritius', 'mu'),
(143, 'Mayotte', 'yt'),
(144, 'Mexico', 'mx'),
(145, 'Micronesia, Federated States of', 'fm'),
(146, 'Moldova, Republic of', 'md'),
(147, 'Monaco', 'mc'),
(148, 'Mongolia', 'mn'),
(149, 'Montenegro', 'me'),
(150, 'Montserrat', 'ms'),
(151, 'Morocco', 'ma'),
(152, 'Mozambique', 'mz'),
(153, 'Myanmar', 'mm'),
(154, 'Namibia', 'na'),
(155, 'Nauru', 'nr'),
(156, 'Nepal', 'np'),
(157, 'Netherlands', 'nl'),
(158, 'New Caledonia', 'nc'),
(159, 'New Zealand', 'nz'),
(160, 'Nicaragua', 'ni'),
(161, 'Niger', 'ne'),
(162, 'Nigeria', 'ng'),
(163, 'Niue', 'nu'),
(164, 'Norfolk Island', 'nf'),
(165, 'Northern Mariana Islands', 'mp'),
(166, 'Norway', 'no'),
(167, 'Oman', 'om'),
(168, 'Pakistan', 'pk'),
(169, 'Palau', 'pw'),
(170, 'Palestinian Territory, Occupied', 'ps'),
(171, 'Panama', 'pa'),
(172, 'Papua New Guinea', 'pg'),
(173, 'Paraguay', 'py'),
(174, 'Peru', 'pe'),
(175, 'Philippines', 'ph'),
(176, 'Pitcairn', 'pn'),
(177, 'Poland', 'pl'),
(178, 'Portugal', 'pt'),
(179, 'Puerto Rico', 'pr'),
(180, 'Qatar', 'qa'),
(181, 'Reunion', 're'),
(182, 'Romania', 'ro'),
(183, 'Russian Federation', 'ru'),
(184, 'Rwanda', 'rw'),
(185, 'Saint Barthelemy', 'bl'),
(186, 'Saint Helena, Ascension and Tristan Da Cunha', 'sh'),
(187, 'Saint Kitts and Nevis', 'kn'),
(188, 'Saint Lucia', 'lc'),
(189, 'Saint Martin (French Part)', 'mf'),
(190, 'Saint Pierre and Miquelon', 'pm'),
(191, 'Saint Vincent and The Grenadines', 'vc'),
(192, 'Samoa', 'ws'),
(193, 'San Marino', 'sm'),
(194, 'Sao Tome and Principe', 'st'),
(195, 'Saudi Arabia', 'sa'),
(196, 'Senegal', 'sn'),
(197, 'Serbia', 'rs'),
(198, 'Seychelles', 'sc'),
(199, 'Sierra Leone', 'sl'),
(200, 'Singapore', 'sg'),
(201, 'Sint Maarten (Dutch Part)', 'sx'),
(202, 'Slovakia', 'sk'),
(203, 'Slovenia', 'si'),
(204, 'Solomon Islands', 'sb'),
(205, 'Somalia', 'so'),
(206, 'South Africa', 'za'),
(207, 'South Georgia and The South Sandwich Islands', 'gs'),
(208, 'South Sudan', 'ss'),
(209, 'Spain', 'es'),
(210, 'Sri Lanka', 'lk'),
(211, 'Sudan', 'sd'),
(212, 'Suriname', 'sr'),
(213, 'Svalbard and Jan Mayen', 'sj'),
(214, 'Swaziland', 'sz'),
(215, 'Sweden', 'se'),
(216, 'Switzerland', 'ch'),
(217, 'Syrian Arab Republic', 'sy'),
(218, 'Taiwan, Province of China', 'tw'),
(219, 'Tajikistan', 'tj'),
(220, 'Tanzania, United Republic of', 'tz'),
(221, 'Thailand', 'th'),
(222, 'Timor-Leste', 'tl'),
(223, 'Togo', 'tg'),
(224, 'Tokelau', 'tk'),
(225, 'Tonga', 'to'),
(226, 'Trinidad and Tobago', 'tt'),
(227, 'Tunisia', 'tn'),
(228, 'Turkey', 'tr'),
(229, 'Turkmenistan', 'tm'),
(230, 'Turks and Caicos Islands', 'tc'),
(231, 'Tuvalu', 'tv'),
(232, 'Uganda', 'ug'),
(233, 'Ukraine', 'ua'),
(234, 'United Arab Emirates', 'ae'),
(235, 'United Kingdom', 'gb'),
(236, 'United States', 'us'),
(237, 'United States Minor Outlying Islands', 'um'),
(238, 'Uruguay', 'uy'),
(239, 'Uzbekistan', 'uz'),
(240, 'Vanuatu', 'vu'),
(241, 'Venezuela, Bolivarian Republic of', 've'),
(242, 'Viet Nam', 'vn'),
(243, 'Virgin Islands, British', 'vg'),
(244, 'Virgin Islands, U.S.', 'vi'),
(245, 'Wallis and Futuna', 'wf'),
(246, 'Western Sahara', 'eh'),
(247, 'Yemen', 'ye'),
(248, 'Zambia', 'zm'),
(249, 'Zimbabwe', 'zw'),
(250, 'Multiple countries', 'wo'),
(251, 'United States of Calderia', 'uc');

-- --------------------------------------------------------

--
-- Table structure for table `dynamic_menu`
--

CREATE TABLE IF NOT EXISTS `dynamic_menu` (
`id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `permalink` varchar(255) NOT NULL,
  `internal_page` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `visibility` enum('public','private','both') NOT NULL,
  `min_user_class` tinyint(4) NOT NULL DEFAULT '0',
  `priority` smallint(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dynamic_pages`
--

CREATE TABLE IF NOT EXISTS `dynamic_pages` (
`id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `visibility` enum('public','private','both') NOT NULL DEFAULT 'public',
  `min_user_class` tinyint(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exceptions`
--

CREATE TABLE IF NOT EXISTS `exceptions` (
`id` int(10) unsigned NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `message` varchar(255) NOT NULL,
  `code` int(10) unsigned NOT NULL,
  `trace` text NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` int(10) unsigned NOT NULL,
  `user_ip` int(10) unsigned NOT NULL,
  `user_agent` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exceptions`
--

INSERT INTO `exceptions` (`id`, `added`, `added_by`, `message`, `code`, `trace`, `file`, `line`, `user_ip`, `user_agent`, `unread`) VALUES
(1, 1426692312, 1, 'Could not read the requested file: /var/www/mellivora/writable/upload/10', 0, '#0 /var/www/mellivora/htdocs/download.php(29): download_file(Array)\n#1 {main}', '/var/www/mellivora/include/files.inc.php', 100, 3232235777, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.76 Safari/537.36 OPR/28.0.1750.40', 1),
(2, 1426694201, 1, 'Invalid ID', 0, '#0 /var/www/mellivora/htdocs/admin/edit_instance.php(8): validate_id(''0'')\n#1 {main}', '/var/www/mellivora/include/general.inc.php', 134, 3232235777, 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.76 Safari/537.36 OPR/28.0.1750.40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
`id` int(10) unsigned NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `size` int(10) unsigned NOT NULL,
  `challenge` int(10) unsigned NOT NULL,
  `file_type` enum('local','remote') NOT NULL DEFAULT 'local'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `added`, `added_by`, `title`, `size`, `challenge`, `file_type`) VALUES
(2, 1418855499, 6, 'Dont Open Me. Please!.zip', 215, 5, 'local'),
(3, 1418855604, 5, 'ILovePics(Actual).bmp', 2488400, 4, 'local'),
(4, 1418855792, 5, 'KeyWord.html', 479, 6, 'local'),
(5, 1418855975, 5, 'Cheesy.jar', 777, 7, 'local'),
(8, 1418857443, 6, 'I hate the media player.mkv', 29, 10, 'local'),
(9, 1418857467, 5, 'ValleyOfDoom.txt', 6374, 9, 'local'),
(10, 1418857763, 7, 'FlagID(Hexadecimal to Decimal).txt', 126, 11, 'local'),
(11, 1418858341, 7, 'Hash The Flag ID.txt', 119, 13, 'local'),
(12, 1418859732, 7, 'Picture.jpg', 39292, 17, 'local'),
(13, 1418860175, 5, 'Image.png', 11374, 19, 'local'),
(14, 1418861226, 7, 'Confidential.txt', 340, 21, 'local'),
(18, 1418862126, 6, 'ILOVEYOU.exe', 8704, 23, 'local'),
(21, 1418930173, 7, 'nanyang.jpg', 103864, 28, 'local'),
(23, 1422949035, 261, 'WPACrack.zip', 545, 1087, 'local'),
(24, 1422949749, 261, 'File_089087.exe', 11264, 1090, 'local'),
(25, 1423014392, 261, 'webscarab-installer-20070504-1631.jar', 4949451, 1094, 'local'),
(26, 1423206730, 261, 'Capture.pcap', 21359, 1122, 'local'),
(27, 1423649021, 261, 'Server.jar', 356325, 1149, 'local'),
(28, 1423649037, 261, 'Infector.exe', 295647, 1149, 'local');

-- --------------------------------------------------------

--
-- Table structure for table `hints`
--

CREATE TABLE IF NOT EXISTS `hints` (
`id` int(10) unsigned NOT NULL,
  `challenge` int(10) unsigned NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `instanceID` varchar(45) NOT NULL DEFAULT '0',
  `value` varchar(45) DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `hints`
--

INSERT INTO `hints` (`id`, `challenge`, `added`, `added_by`, `visible`, `body`, `instanceID`, `value`) VALUES
(4, 4, 1418855226, 5, 1, 'Look at the file through a different editing software.', '0', '0'),
(5, 5, 1418857102, 6, 0, 'I love to hide. ', '0', '0'),
(6, 10, 1418857462, 6, 0, 'File extension.', '0', '0'),
(7, 11, 1418857815, 7, 1, 'There are converters available in the internet or by using the computer, that is if you know how to use the computer calculator to convert the values...', '0', '0'),
(8, 12, 1418858328, 5, 1, 'Several Ciphers are available online, this particular one is enciphered with the Caesar Cipher ', '0', '0'),
(9, 13, 1418858379, 7, 1, 'You know, google is always your best friend.', '0', '0'),
(10, 17, 1418859811, 7, 1, 'Remember, Google is always your best friend.', '0', '0'),
(11, 21, 1418861130, 7, 1, 'There is always a decrpyt tool available online. :)', '0', '0'),
(14, 28, 1418930206, 7, 1, 'There are always information stored in a image...', '0', '0'),
(15, 6, 1420236168, 5, 1, 'Look through the source code of the file ', '0', '0'),
(16, 19, 1420237701, 5, 1, 'image files could be zipped together with other files to hide malicious intent', '0', '0'),
(17, 7, 1420239377, 5, 1, 'Flag is Hexed, please convert it back to plain text', '0', '0'),
(21, 1123, 1423549398, 261, 0, 'Updated report from the Cyber Forensics Team states that there, there are signs of an additional Log In button being added which is hidden. The hidden button might be the original log in button before the attackers added the fake login button and hide the real login button. Delete the class = "hideClass" in the div tag to expose the hidden button.', '0', '100'),
(22, 1088, 1423549544, 261, 0, 'http://www.w3schools.com/sql/sql_injection.asp, this link provided by Rapier;s Cyber Forensics Team should be able to help you out. They also mention not to forget adding '' at the front of the code and -- and the end of the injection code to comment out the original sql statement.', '0', '150'),
(23, 1089, 1423549768, 261, 0, 'http://www.w3schools.com/sql/sql_union.asp, this ink should be able to help you out.', '0', '150'),
(24, 1095, 1423549940, 261, 0, 'Cyber Forensics detected a div tag with the class "hideClass" delete that to expose the fields, Or you can just copy the value of the text fields that are inside the div tag and decode everything to get the flag ID.', '0', '150'),
(25, 1092, 1423550062, 261, 0, 'http://www.w3schools.com/js/js_cookies.asp, Go to this link and Press F12 and go to console to enter the codes to change the cookie value.', '0', '200'),
(26, 1124, 1423550096, 261, 0, 'http://www.w3schools.com/tags/tag_iframe.asp, this link should be able to help you.', '0', '250');

-- --------------------------------------------------------

--
-- Table structure for table `instances`
--

CREATE TABLE IF NOT EXISTS `instances` (
`id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `authoratativeAccountID` varchar(45) NOT NULL,
  `instanceURI` varchar(45) NOT NULL,
  `registrationToken` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `instances`
--

INSERT INTO `instances` (`id`, `name`, `authoratativeAccountID`, `instanceURI`, `registrationToken`) VALUES
(0, 'Base', '1', 'Base', '0');

-- --------------------------------------------------------

--
-- Table structure for table `interest`
--

CREATE TABLE IF NOT EXISTS `interest` (
`id` int(10) unsigned NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `secret` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ip_log`
--

CREATE TABLE IF NOT EXISTS `ip_log` (
`id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `last_used` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `times_used` int(10) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=299 ;

--
-- Dumping data for table `ip_log`
--

INSERT INTO `ip_log` (`id`, `user_id`, `added`, `last_used`, `ip`, `times_used`) VALUES
(3, 3, 1418853779, 1418853916, 2887037959, 3),
(4, 4, 1418854268, 1420520123, 2887037954, 17),
(5, 5, 1418854902, 1420574451, 2887037975, 12),
(6, 6, 1418854952, 1420229316, 2887037959, 6),
(7, 7, 1418855843, 1420571213, 2887037967, 9),
(8, 8, 1418858674, 1418859120, 2887037966, 2),
(9, 9, 1419036566, 1419036578, 2887037954, 2),
(10, 7, 1419381392, 1419381392, 2887037975, 1),
(11, 10, 1419988623, 1420056934, 2887037975, 4),
(12, 4, 1420240643, 1420240643, 2887037959, 1),
(13, 11, 1420243028, 1420243045, 2887037975, 2),
(14, 12, 1420491749, 1420491754, 2887037954, 2),
(15, 12, 1420492390, 1420492390, 2887037975, 1),
(16, 13, 1420517582, 1420517589, 2887037975, 2),
(17, 4, 1420532868, 1422940925, 3232241420, 27),
(18, 14, 1420595868, 1420595868, 3232241420, 1),
(19, 4, 1420612718, 1420626913, 3232241439, 3),
(20, 6, 1420620659, 1420620686, 3232241439, 2),
(21, 7, 1420681283, 1420681283, 3232241420, 1),
(22, 8, 1420681619, 1420681619, 3232241420, 2),
(23, 9, 1420686019, 1420686019, 3232241430, 2),
(24, 10, 1420691176, 1420691176, 3232241555, 2),
(25, 11, 1420691685, 1420691685, 3232241420, 2),
(26, 12, 1420691780, 1420691780, 3232241555, 2),
(27, 4, 1420692303, 1420692303, 3232241579, 1),
(28, 5, 1420692556, 1420692556, 3232241579, 1),
(29, 13, 1420693346, 1420693346, 3232241567, 2),
(30, 14, 1420693498, 1420693498, 3232241579, 2),
(31, 15, 1420693501, 1420693502, 3232241537, 2),
(32, 16, 1420693512, 1420693512, 3232241453, 2),
(33, 17, 1420693519, 1420693519, 3232241549, 2),
(34, 18, 1420693711, 1420693711, 3232241533, 2),
(35, 19, 1420693735, 1420693735, 3232241562, 2),
(36, 17, 1420693867, 1420693867, 3232241545, 1),
(37, 5, 1420694321, 1420863800, 3232241430, 2),
(38, 20, 1420694397, 1420694397, 3232241595, 2),
(39, 21, 1420694483, 1420694483, 3232241555, 2),
(40, 22, 1420694502, 1420694502, 3232241545, 2),
(41, 23, 1420694518, 1420694518, 3232241575, 2),
(42, 24, 1420694528, 1420694528, 3232241583, 2),
(43, 25, 1420699784, 1420699784, 3232241430, 2),
(44, 26, 1420700781, 1420700781, 3232241446, 2),
(45, 27, 1420700806, 1420700806, 3232241579, 2),
(46, 28, 1420700821, 1420700821, 3232241591, 2),
(47, 29, 1420702913, 1420702913, 3232241453, 2),
(48, 30, 1420702926, 1420702926, 3232241595, 2),
(49, 31, 1420702940, 1420702940, 3232241545, 2),
(50, 32, 1420702957, 1420702957, 3232241533, 2),
(51, 33, 1420702971, 1420702971, 3232241583, 2),
(52, 31, 1420702972, 1420702972, 3232241555, 1),
(53, 34, 1420702995, 1420702995, 3232241575, 2),
(54, 35, 1420703002, 1420703002, 3232241571, 2),
(55, 36, 1420703008, 1420703008, 3232241567, 2),
(56, 37, 1420703185, 1420703186, 3232241537, 2),
(57, 38, 1420703276, 1420703276, 3232241562, 2),
(58, 39, 1420704404, 1420704404, 3232241545, 2),
(59, 40, 1420704418, 1420704418, 3232241575, 2),
(60, 41, 1420704420, 1420704420, 3232241503, 2),
(61, 42, 1420704453, 1420704453, 3232241475, 2),
(62, 43, 1420704454, 1420704454, 3232241486, 2),
(63, 40, 1420704455, 1420704455, 3232241567, 1),
(64, 44, 1420704456, 1420705027, 3232241541, 3),
(65, 45, 1420704466, 1420704467, 3232241555, 2),
(66, 40, 1420704473, 1420704473, 3232241595, 1),
(67, 46, 1420704474, 1420704474, 3232241496, 2),
(68, 40, 1420704475, 1420704475, 3232241571, 1),
(69, 40, 1420704477, 1420704477, 3232241583, 1),
(70, 47, 1420704479, 1420704479, 3232241562, 2),
(71, 48, 1420704513, 1420704513, 3232241549, 2),
(72, 49, 1420704549, 1420704549, 3232241453, 2),
(73, 50, 1420707246, 1420707246, 3232241533, 2),
(74, 51, 1420707313, 1420707341, 3232241575, 3),
(75, 52, 1420707313, 1420707313, 3232241446, 2),
(76, 53, 1420707328, 1420707328, 3232241579, 2),
(77, 54, 1420707329, 1420707329, 3232241591, 2),
(78, 55, 1420707340, 1420707340, 3232241571, 2),
(79, 56, 1420707366, 1420707366, 3232241567, 2),
(80, 57, 1420707452, 1420707453, 3232241595, 2),
(81, 58, 1420774768, 1420774768, 3232241579, 2),
(82, 59, 1420774769, 1420774769, 3232241436, 2),
(83, 60, 1420774775, 1420774775, 3232241463, 2),
(84, 61, 1420774776, 1420774776, 3232241571, 2),
(85, 62, 1420774779, 1420774779, 3232241575, 2),
(86, 63, 1420774782, 1420774782, 3232241475, 2),
(87, 64, 1420774782, 1420774782, 3232241450, 2),
(88, 65, 1420774795, 1420774795, 3232241501, 2),
(89, 66, 1420774797, 1420774797, 3232241521, 2),
(90, 67, 1420774799, 1420774799, 3232241567, 2),
(91, 68, 1420774802, 1420774802, 3232241555, 2),
(92, 69, 1420774804, 1420774804, 3232241595, 2),
(93, 70, 1420774806, 1420774806, 3232241446, 2),
(94, 71, 1420774813, 1420774813, 3232241526, 2),
(95, 72, 1420774813, 1420774813, 3232241599, 2),
(96, 73, 1420774814, 1420774814, 3232241503, 2),
(97, 74, 1420774821, 1420774821, 3232241492, 2),
(98, 75, 1420774846, 1420774846, 3232241591, 2),
(99, 76, 1420774856, 1420774857, 3232241481, 2),
(100, 77, 1420774872, 1420774872, 3232241506, 2),
(101, 78, 1420774876, 1420774876, 3232241486, 2),
(102, 79, 1420774893, 1420774893, 3232241514, 2),
(103, 80, 1420774917, 1420774918, 3232241496, 2),
(104, 81, 1420775437, 1420775438, 3232241583, 2),
(105, 82, 1420775438, 1420775438, 3232241599, 2),
(106, 83, 1420775441, 1420775441, 3232241486, 2),
(107, 84, 1420775443, 1420775443, 3232241575, 2),
(108, 85, 1420775445, 1420775445, 3232241450, 2),
(109, 86, 1420775445, 1420775445, 3232241521, 2),
(110, 87, 1420775448, 1420775448, 3232241446, 2),
(111, 88, 1420775451, 1420775451, 3232241503, 2),
(112, 89, 1420775453, 1420775453, 3232241591, 2),
(113, 90, 1420775454, 1420775454, 3232241526, 2),
(114, 91, 1420775461, 1420775461, 3232241492, 2),
(115, 92, 1420775477, 1420775477, 3232241595, 2),
(116, 93, 1420775478, 1420775478, 3232241463, 2),
(117, 94, 1420775495, 1420775495, 3232241514, 2),
(118, 95, 1420775501, 1420775501, 3232241501, 2),
(119, 96, 1420775510, 1420775510, 3232241567, 2),
(120, 97, 1420775539, 1420775539, 3232241571, 2),
(121, 98, 1420775563, 1420775585, 3232241521, 3),
(122, 99, 1420776564, 1420776564, 3232241595, 2),
(123, 100, 1420779124, 1420779124, 3232241521, 2),
(124, 101, 1420780643, 1420780643, 3232241526, 2),
(125, 102, 1420780644, 1420780644, 3232241521, 2),
(126, 103, 1420780655, 1420780655, 3232241501, 2),
(127, 104, 1420780687, 1420780687, 3232241514, 2),
(128, 105, 1420782525, 1420782525, 3232241595, 2),
(129, 106, 1420785270, 1420785270, 3232241446, 2),
(130, 107, 1420785271, 1420785271, 3232241595, 2),
(131, 108, 1420785274, 1420785274, 3232241599, 2),
(132, 109, 1420786017, 1420786017, 3232241591, 2),
(133, 110, 1420786019, 1420786019, 3232241450, 2),
(134, 111, 1420787545, 1420787545, 3232241514, 2),
(135, 112, 1420787559, 1420787559, 3232241506, 2),
(136, 113, 1420787578, 1420787578, 3232241475, 2),
(137, 114, 1420787595, 1420787595, 3232241481, 2),
(138, 115, 1420787595, 1420788420, 3232241496, 3),
(139, 116, 1420787618, 1420787618, 3232241526, 2),
(140, 117, 1420787627, 1420788367, 3232241521, 3),
(141, 118, 1420787720, 1420787720, 3232241501, 2),
(142, 119, 1420788422, 1420788422, 3232241436, 2),
(143, 120, 1420788431, 1420788431, 3232241463, 2),
(144, 121, 1420788450, 1420788450, 3232241545, 2),
(145, 122, 1420788455, 1420788455, 3232241567, 2),
(146, 123, 1420788463, 1420788463, 3232241541, 2),
(147, 124, 1420788466, 1420788466, 3232241555, 2),
(148, 125, 1420788483, 1420788483, 3232241579, 2),
(149, 126, 1420788493, 1420788493, 3232241486, 2),
(150, 127, 1420788508, 1420788508, 3232241549, 2),
(151, 128, 1420788508, 1420788509, 3232241571, 2),
(152, 129, 1420788532, 1420788532, 3232241537, 2),
(153, 130, 1420788542, 1420788542, 3232241562, 2),
(154, 131, 1420788549, 1420788549, 3232241503, 2),
(155, 132, 1420788569, 1420788569, 3232241492, 2),
(156, 133, 1420788578, 1420788644, 3232241575, 3),
(157, 134, 1420788590, 1420788590, 3232241583, 2),
(158, 135, 1420788603, 1420788603, 3232241533, 2),
(159, 136, 1420788608, 1420788608, 3232241453, 2),
(160, 137, 1420790494, 1420790494, 3232241555, 2),
(161, 138, 1420790540, 1420790540, 3232241562, 2),
(162, 139, 1420790558, 1420790558, 3232241537, 2),
(163, 140, 1420790575, 1420790575, 3232241453, 2),
(164, 141, 1420790587, 1420790587, 3232241533, 2),
(165, 142, 1420790650, 1420790650, 3232241549, 2),
(166, 143, 1420790659, 1420790660, 3232241545, 2),
(167, 144, 1420791537, 1420791537, 3232241537, 2),
(168, 145, 1420791561, 1420791561, 3232241575, 2),
(169, 146, 1420791562, 1420791562, 3232241481, 2),
(170, 147, 1420791562, 1420791562, 3232241545, 2),
(171, 148, 1420791562, 1420791563, 3232241492, 2),
(172, 149, 1420791567, 1420791567, 3232241571, 2),
(173, 150, 1420791569, 1420791569, 3232241562, 2),
(174, 151, 1420791570, 1420791570, 3232241541, 2),
(175, 152, 1420791572, 1420791572, 3232241599, 2),
(176, 153, 1420791573, 1420791573, 3232241583, 2),
(177, 154, 1420791573, 1420791574, 3232241496, 2),
(178, 155, 1420791577, 1420791578, 3232241595, 2),
(179, 156, 1420791587, 1420791587, 3232241533, 2),
(180, 157, 1420791589, 1420791589, 3232241514, 2),
(181, 158, 1420791589, 1420791590, 3232241567, 2),
(182, 159, 1420791595, 1420791595, 3232241503, 2),
(183, 160, 1420791596, 1420791596, 3232241579, 2),
(184, 161, 1420791597, 1420791597, 3232241453, 2),
(185, 162, 1420791598, 1420791598, 3232241436, 2),
(186, 163, 1420791606, 1420791606, 3232241486, 2),
(187, 164, 1420791617, 1420791617, 3232241549, 2),
(188, 165, 1420791628, 1420791628, 3232241446, 2),
(189, 166, 1420791637, 1420791637, 3232241521, 2),
(190, 167, 1420791651, 1420791651, 3232241463, 2),
(191, 168, 1420791668, 1420791668, 3232241555, 2),
(192, 169, 1420791674, 1420791674, 3232241506, 2),
(193, 170, 1420791682, 1420791682, 3232241501, 2),
(194, 171, 1420791686, 1420791686, 3232241475, 2),
(195, 172, 1420791724, 1420791724, 3232241526, 2),
(196, 173, 1420791913, 1420791913, 3232241591, 2),
(197, 174, 1420792010, 1420792010, 3232241450, 2),
(198, 175, 1420792771, 1420794643, 3232241450, 3),
(199, 176, 1420795045, 1420797041, 3232241503, 3),
(200, 177, 1420795050, 1420795050, 3232241486, 2),
(201, 178, 1420795099, 1420795099, 3232241575, 2),
(202, 179, 1420795108, 1420795108, 3232241583, 2),
(203, 180, 1420795120, 1420795120, 3232241492, 2),
(204, 181, 1420795324, 1420795324, 3232241475, 2),
(205, 182, 1420795354, 1420795354, 3232241496, 2),
(206, 183, 1420796923, 1420796923, 3232241599, 2),
(207, 184, 1420805168, 1420805168, 3232241599, 2),
(208, 185, 1420807506, 1420807506, 3232241450, 2),
(209, 186, 1420858265, 1420858903, 3232241595, 3),
(210, 4, 1420859080, 1420859552, 3232241599, 2),
(211, 187, 1420859546, 1420860808, 3232241446, 3),
(212, 188, 1420860701, 1420860701, 3232241450, 2),
(213, 189, 1420863451, 1420863451, 3232241591, 2),
(214, 190, 1420866122, 1420866122, 3232241591, 2),
(215, 191, 1420867020, 1420867020, 3232241591, 2),
(216, 192, 1420867857, 1420867857, 3232241521, 2),
(217, 193, 1420867906, 1420867906, 3232241501, 2),
(218, 194, 1420867929, 1420867929, 3232241481, 2),
(219, 195, 1420867938, 1420867938, 3232241526, 2),
(220, 196, 1420867963, 1420867963, 3232241514, 2),
(221, 197, 1420868021, 1420868021, 3232241545, 2),
(222, 198, 1420868457, 1420874319, 3232241571, 3),
(223, 199, 1420868472, 1420873774, 3232241575, 3),
(224, 200, 1420868484, 1420868484, 3232241567, 2),
(225, 201, 1420868509, 1420869785, 3232241579, 3),
(226, 202, 1420868516, 1420868516, 3232241463, 2),
(227, 203, 1420870129, 1420870129, 3232241537, 2),
(228, 204, 1420870506, 1420870507, 3232241545, 2),
(229, 205, 1420872062, 1420872063, 3232241591, 2),
(230, 206, 1420872079, 1420872079, 3232241450, 2),
(231, 207, 1420872402, 1420872402, 3232241549, 2),
(232, 208, 1420872549, 1420872549, 3232241503, 2),
(233, 200, 1420873716, 1420874275, 3232241571, 2),
(234, 198, 1420874061, 1420874200, 3232241463, 2),
(235, 201, 1420874064, 1420874064, 3232241571, 1),
(236, 209, 1420874080, 1420874080, 3232241591, 2),
(237, 198, 1420874252, 1420874252, 3232241567, 1),
(238, 200, 1420874321, 1420874321, 3232241575, 1),
(239, 210, 1420874341, 1420874342, 3232241481, 2),
(240, 211, 1420875116, 1420875116, 3232241533, 2),
(241, 212, 1420875601, 1420875601, 3232241521, 2),
(242, 213, 1420876115, 1420876115, 3232241521, 2),
(243, 214, 1420876344, 1420876344, 3232241571, 2),
(244, 215, 1420876415, 1420876416, 3232241567, 2),
(245, 216, 1420876425, 1420876426, 3232241575, 2),
(246, 217, 1420876941, 1420876941, 3232241521, 2),
(247, 218, 1420876997, 1420876997, 3232241446, 2),
(248, 219, 1420877036, 1420877036, 3232241521, 2),
(249, 220, 1420877247, 1420877247, 3232241599, 2),
(250, 221, 1420877659, 1420877659, 3232241463, 2),
(251, 222, 1420877662, 1420881692, 3232241436, 3),
(252, 223, 1420877672, 1420877672, 3232241579, 2),
(253, 224, 1420878170, 1420878170, 3232241503, 2),
(254, 225, 1420878974, 1420878974, 3232241481, 2),
(255, 226, 1420878987, 1420878987, 3232241526, 2),
(256, 227, 1420878996, 1420878996, 3232241514, 2),
(257, 228, 1420879427, 1420879427, 3232241492, 2),
(258, 229, 1420879479, 1420879479, 3232241591, 2),
(259, 230, 1420879820, 1420879820, 3232241571, 2),
(260, 231, 1420879843, 1420879843, 3232241567, 2),
(261, 232, 1420883628, 1420883629, 3232241537, 2),
(262, 233, 1421142982, 1421142982, 3232241420, 2),
(263, 5, 1421215976, 1421215976, 3232241420, 1),
(264, 234, 1421219496, 1421219496, 3232241420, 2),
(265, 4, 1421886776, 1422927605, 2130706433, 48),
(266, 235, 1421902736, 1422006781, 2130706433, 6),
(267, 236, 1421914291, 1422407275, 2130706433, 12),
(268, 238, 1422342468, 1422342468, 2130706433, 1),
(269, 239, 1422342609, 1422342609, 2130706433, 1),
(270, 240, 1422343023, 1422351257, 2130706433, 2),
(271, 241, 1422408032, 1422593444, 2130706433, 13),
(272, 242, 1422505869, 1422505869, 2130706433, 2),
(273, 243, 1422506150, 1422584549, 2130706433, 4),
(274, 254, 1422598784, 1422598784, 2130706433, 1),
(275, 257, 1422600507, 1422600507, 2130706433, 1),
(276, 258, 1422601666, 1422601666, 2130706433, 1),
(277, 259, 1422602268, 1422602268, 2130706433, 1),
(278, 260, 1422603772, 1422603772, 2130706433, 1),
(279, 4, 1422929695, 1423721799, 2887026429, 51),
(280, 261, 1422943309, 1423723463, 2887026429, 47),
(281, 262, 1423011704, 1423011704, 2887026429, 2),
(282, 263, 1423012549, 1423012635, 2887026429, 2),
(283, 264, 1423024833, 1423024834, 2887026429, 2),
(284, 266, 1423038372, 1423719392, 2887026429, 61),
(285, 267, 1423453155, 1423453157, 2887026429, 2),
(286, 5, 1423532305, 1423532305, 2887026429, 1),
(287, 261, 1423551228, 1423551228, 3232241425, 1),
(288, 270, 1423568454, 1423572861, 2887026429, 6),
(289, 271, 1423568751, 1423568752, 2887026429, 2),
(291, 273, 1423649332, 1423649332, 2887026429, 1),
(293, 275, 1423716385, 1423717229, 2887026429, 6),
(294, 276, 1423717266, 1423717270, 2887026429, 2),
(295, 277, 1423721906, 1423721906, 2887026429, 1),
(296, 1, 1425059992, 1425625457, 2130706433, 20),
(297, 2, 1425061871, 1425064384, 2130706433, 6),
(298, 1, 1425918684, 1426693616, 3232235777, 6);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
`id` int(10) unsigned NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `added_by` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `instanceID` varchar(45) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `added`, `added_by`, `title`, `body`, `instanceID`) VALUES
(1, 1418853265, 1, 'NYP SIT Cyber Range', 'Welcome to the Cyber Range. ', '0'),
(7, 1425147454, 1, 'Test', '<p><img alt="" src="/img/repo/Vladimir_Putin_-_2006.jpg" style="height:287px; width:200px" /></p>\r\n', '1296078145');

-- --------------------------------------------------------

--
-- Table structure for table `prizes`
--

CREATE TABLE IF NOT EXISTS `prizes` (
`prizeID` int(11) NOT NULL,
  `prizeName` varchar(45) NOT NULL,
  `prizeQty` varchar(45) NOT NULL,
  `pointsReq` varchar(45) NOT NULL,
  `instanceID` varchar(45) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `prizes`
--

INSERT INTO `prizes` (`prizeID`, `prizeName`, `prizeQty`, `pointsReq`, `instanceID`) VALUES
(1, 'iPod touch', '5', '500', '0'),
(2, 'iPad Mini', '5', '800', '0');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE IF NOT EXISTS `purchases` (
`id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `uid` varchar(45) DEFAULT NULL,
  `hid` varchar(45) DEFAULT NULL,
  `instanceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recruit`
--

CREATE TABLE IF NOT EXISTS `recruit` (
`id` int(10) unsigned NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE IF NOT EXISTS `reset_password` (
`id` int(10) unsigned NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned NOT NULL,
  `auth_key` char(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `restrict_email`
--

CREATE TABLE IF NOT EXISTS `restrict_email` (
`id` int(10) unsigned NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `added_by` int(11) NOT NULL,
  `rule` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `white` tinyint(1) NOT NULL DEFAULT '1',
  `priority` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE IF NOT EXISTS `submissions` (
`id` int(10) unsigned NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `challenge` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `flag` text NOT NULL,
  `correct` tinyint(1) NOT NULL,
  `marked` tinyint(1) NOT NULL DEFAULT '0',
  `instanceID` varchar(45) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `two_factor_auth`
--

CREATE TABLE IF NOT EXISTS `two_factor_auth` (
`id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `secret` char(32) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `two_factor_auth`
--

INSERT INTO `two_factor_auth` (`id`, `user_id`, `secret`) VALUES
(3, 6, 'IJKMR44J6EQO67E5X25DLGCZHOMW5GTQ'),
(4, 4, 'YV6QLF3RB36EXYKF5EFGWJLZ3AHDRIL4');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `team_name` varchar(255) NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `passhash` varchar(255) NOT NULL,
  `class` tinyint(4) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `competing` tinyint(1) NOT NULL DEFAULT '1',
  `country_id` smallint(5) unsigned NOT NULL,
  `2fa_status` enum('disabled','generated','enabled') NOT NULL DEFAULT 'disabled',
  `DOB` varchar(45) NOT NULL,
  `eduInstitution` varchar(200) NOT NULL,
  `mobileNo` varchar(45) NOT NULL,
  `instanceID` int(11) NOT NULL DEFAULT '0',
  `eduLevel` varchar(45) NOT NULL,
  `fullName` varchar(200) NOT NULL,
  `remarks` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `team_name`, `added`, `passhash`, `class`, `enabled`, `user_type`, `competing`, `country_id`, `2fa_status`, `DOB`, `eduInstitution`, `mobileNo`, `instanceID`, `eduLevel`, `fullName`, `remarks`) VALUES
(1, 'superadmin@cybergames.com', 'cybergamesuperadmin', 1425059992, '$2y$10$XMw1dt4CpsRA0BI8993thuql1WF8JSxV3AYmuGEgDZok2QCoLkvMu', 2, 1, 0, 1, 200, 'disabled', 'NA', 'Admiralty Secondary School', 'NA', 0, 'Secondary 1', 'Superadmin', NULL),
(2, 'test15@test.com', 'test15@test.com', 1426692203, '$2y$10$SVEGTyTDoknDF99iyAPppuVuY0VvbzDL.KxqTm01m7XBrCCJCmzZS', 100, 1, 0, 0, 200, 'disabled', '', '', '', 0, '', '', NULL),
(3, 'Test 513', 'Test 513', 1426694210, '$2y$10$/AtHwzWSotoW2FGYiWv5KeaMaW/XfZgfMC1TlhfGp6xaS9/jFxhnS', 100, 1, 0, 0, 200, 'disabled', '', '', '', 0, '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE IF NOT EXISTS `user_types` (
`id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `challenges`
--
ALTER TABLE `challenges`
 ADD PRIMARY KEY (`id`), ADD KEY `category` (`category`);

--
-- Indexes for table `cookie_tokens`
--
ALTER TABLE `cookie_tokens`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_t_ts` (`user_id`,`token`,`token_series`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `short` (`country_code`);

--
-- Indexes for table `dynamic_menu`
--
ALTER TABLE `dynamic_menu`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `permalink` (`permalink`);

--
-- Indexes for table `dynamic_pages`
--
ALTER TABLE `dynamic_pages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exceptions`
--
ALTER TABLE `exceptions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
 ADD PRIMARY KEY (`id`), ADD KEY `challenge` (`challenge`);

--
-- Indexes for table `hints`
--
ALTER TABLE `hints`
 ADD PRIMARY KEY (`id`), ADD KEY `challenge` (`challenge`);

--
-- Indexes for table `instances`
--
ALTER TABLE `instances`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `instanceID` (`id`);

--
-- Indexes for table `interest`
--
ALTER TABLE `interest`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `ip_log`
--
ALTER TABLE `ip_log`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_ip` (`user_id`,`ip`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prizes`
--
ALTER TABLE `prizes`
 ADD PRIMARY KEY (`prizeID`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recruit`
--
ALTER TABLE `recruit`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reset_password`
--
ALTER TABLE `reset_password`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_key` (`user_id`,`auth_key`);

--
-- Indexes for table `restrict_email`
--
ALTER TABLE `restrict_email`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
 ADD PRIMARY KEY (`id`), ADD KEY `challenge` (`challenge`), ADD KEY `user_id` (`user_id`), ADD KEY `challenge_user_id` (`challenge`,`user_id`);

--
-- Indexes for table `two_factor_auth`
--
ALTER TABLE `two_factor_auth`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`email`), ADD UNIQUE KEY `team_name` (`team_name`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `challenges`
--
ALTER TABLE `challenges`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1216;
--
-- AUTO_INCREMENT for table `cookie_tokens`
--
ALTER TABLE `cookie_tokens`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=252;
--
-- AUTO_INCREMENT for table `dynamic_menu`
--
ALTER TABLE `dynamic_menu`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dynamic_pages`
--
ALTER TABLE `dynamic_pages`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exceptions`
--
ALTER TABLE `exceptions`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `hints`
--
ALTER TABLE `hints`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `instances`
--
ALTER TABLE `instances`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `interest`
--
ALTER TABLE `interest`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ip_log`
--
ALTER TABLE `ip_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=299;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `prizes`
--
ALTER TABLE `prizes`
MODIFY `prizeID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `recruit`
--
ALTER TABLE `recruit`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `reset_password`
--
ALTER TABLE `reset_password`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `restrict_email`
--
ALTER TABLE `restrict_email`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `two_factor_auth`
--
ALTER TABLE `two_factor_auth`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
