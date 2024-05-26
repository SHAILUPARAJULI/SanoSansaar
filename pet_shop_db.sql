-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2024 at 08:48 AM
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
-- Database: `pet_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Food', 'Sample Description', 1, '2021-06-21 10:17:41'),
(4, 'Accessories', '&lt;p&gt;Sample Category&lt;/p&gt;', 1, '2021-06-21 16:34:04'),
(5, 'Pets', '&lt;p&gt;Adopt your bestfriend&lt;/p&gt;', 1, '2024-05-17 18:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'John', 'Smith', 'Male', '09123456789', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'Sample Address', '2021-06-21 16:00:23'),
(2, 'Ashish', 'Choudhari', 'Male', '9813813110', 'ashish20012057@gmail.com', '43462fa6fc521c8b9bab87beca00d650', 'near A K Restaurant & Bar with Homestay, Khursanitar Marga, Kathmandu 44600, Nepal\r\nShree marga khursanitar', '2024-05-17 18:43:04'),
(3, 'Ashish', 'Chanchalani', 'Male', '4413004', 'ashishchau492@gmail.com', '43462fa6fc521c8b9bab87beca00d650', 'near A K Restaurant & Bar with Homestay, Khursanitar Marga', '2024-05-18 12:24:22');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `size` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `unit`, `price`, `size`, `date_created`, `date_updated`) VALUES
(1, 1, 49, 'pcs', 250, 'M', '2021-06-21 13:01:30', '2024-05-19 20:45:10'),
(2, 1, 20, 'Sample', 300, 'L', '2021-06-21 13:07:00', NULL),
(3, 4, 144, 'pcs', 500, 'M', '2021-06-21 16:50:37', '2024-05-18 17:21:06'),
(4, 3, 50, 'pack', 150, 'M', '2021-06-21 16:51:12', NULL),
(5, 5, 30, 'pcs', 50, 'M', '2021-06-21 16:51:35', NULL),
(6, 4, 200, 'pcs', 550, 'L', '2021-06-21 16:51:54', '2024-05-18 17:34:19'),
(7, 6, 98, 'pcs', 150, 'S', '2021-06-22 15:50:47', '2024-05-18 17:39:25'),
(8, 6, 18, 'pcs', 180, 'M', '2021-06-22 15:51:13', '2024-05-18 17:39:18'),
(9, 7, 2, 'German Shepherd', 200, 'M', '2024-05-17 18:26:45', '2024-05-18 11:54:44'),
(10, 8, 1, 'Siamese cat', 200, 'M', '2024-05-17 18:39:23', '2024-05-18 11:54:23'),
(11, 9, 1, 'Hyacinth macaw', 199, 'S', '2024-05-17 19:30:51', '2024-05-18 11:53:58'),
(12, 10, 1, 'Mini Lop', 225, 'M', '2024-05-17 19:54:14', '2024-05-18 11:53:23'),
(14, 12, 1, 'Labrador Retriever', 250, 'L', '2024-05-18 11:33:48', '2024-05-18 11:52:46'),
(15, 13, 1, 'German Shepherd', 150, 'M', '2024-05-18 11:38:26', '2024-05-18 11:52:25'),
(16, 14, 1, 'Beagle', 100, 'M', '2024-05-18 11:40:02', '2024-05-18 11:52:08'),
(17, 15, 1, 'Golden Retriever', 250, 'L', '2024-05-18 11:41:27', '2024-05-18 11:51:35'),
(18, 16, 1, 'Siberian Husky', 300, 'M', '2024-05-18 11:50:51', NULL),
(19, 17, 1, 'Boxer', 200, 'L', '2024-05-18 11:57:56', NULL),
(20, 18, 2, 'Cocker Spaniel', 250, 'M', '2024-05-18 11:59:49', '2024-05-18 17:29:46'),
(21, 19, 1, 'Rottweiler', 200, 'L', '2024-05-18 12:02:55', NULL),
(22, 20, 1, 'French Bulldog', 200, 'M', '2024-05-18 12:04:52', '2024-05-18 17:29:41'),
(23, 21, 1, 'Siamese Cat', 350, 'M', '2024-05-18 12:09:50', NULL),
(24, 22, 1, 'Maine Coon', 300, 'L', '2024-05-18 12:12:20', NULL),
(25, 23, 1, 'Bengal Cat', 200, 'M', '2024-05-18 12:14:09', NULL),
(26, 24, 1, 'Angora Rabbit', 250, 'M', '2024-05-18 20:36:03', NULL),
(27, 25, 50, 'pcs', 250, 'S', '2024-05-23 19:14:08', NULL),
(28, 26, 50, 'pcs', 250, 'M', '2024-05-24 09:53:28', NULL),
(29, 27, 50, 'pcs', 2500, 'M', '2024-05-24 09:57:20', NULL),
(30, 28, 1, 'Russian Blue', 2000, 'M', '2024-05-24 12:29:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(1, 1, 'Sample Address', 'Online Payment', 1100, 2, 1, '2021-06-22 13:48:54', '2021-06-22 14:49:15'),
(2, 1, 'Sample Address', 'cod', 750, 3, 1, '2021-06-22 15:26:07', '2021-06-22 15:32:55'),
(4, 2, 'near A K Restaurant & Bar with Homestay, Khursanitar Marga, Kathmandu 44600, Nepal\r\nShree marga khursanitar', 'cod', 200, 2, 0, '2024-05-17 18:43:39', '2024-05-17 18:44:22'),
(5, 2, 'near A K Restaurant & Bar with Homestay, Khursanitar Marga, Kathmandu 44600, Nepal\r\nShree marga khursanitar', 'cod', 150, 0, 0, '2024-05-17 19:24:28', NULL),
(6, 2, 'near A K Restaurant & Bar with Homestay, Khursanitar Marga, Kathmandu 44600, Nepal\r\nShree marga khursanitar', 'cod', 200, 0, 0, '2024-05-17 19:50:26', NULL),
(7, 2, 'near A K Restaurant & Bar with Homestay, Khursanitar Marga, Kathmandu 44600, Nepal\r\nShree marga khursanitar', 'cod', 200, 3, 1, '2024-05-18 10:40:46', '2024-05-18 11:15:14'),
(8, 2, 'near A K Restaurant & Bar with Homestay, Khursanitar Marga, Kathmandu 44600, Nepal\r\nShree marga khursanitar', 'cod', 199, 3, 1, '2024-05-18 11:22:48', '2024-05-18 11:26:05'),
(9, 3, 'near A K Restaurant & Bar with Homestay, Khursanitar Marga', 'cod', 200, 3, 1, '2024-05-18 12:29:41', '2024-05-18 12:34:04'),
(10, 3, 'near A K Restaurant & Bar with Homestay, Khursanitar Marga', 'cod', 550, 3, 1, '2024-05-18 16:31:27', '2024-05-18 17:09:41'),
(11, 3, 'near A K Restaurant & Bar with Homestay, Khursanitar Marga', 'cod', 650, 3, 1, '2024-05-18 17:15:56', '2024-05-18 17:18:54'),
(12, 3, 'near A K Restaurant & Bar with Homestay, Khursanitar Marga', 'cod', 14850, 3, 1, '2024-05-18 17:24:44', '2024-05-18 17:26:49'),
(13, 3, 'near A K Restaurant & Bar with Homestay, Khursanitar Marga', 'cod', 330, 3, 1, '2024-05-18 17:37:27', '2024-05-18 17:38:45'),
(14, 3, 'near A K Restaurant & Bar with Homestay, Khursanitar Marga', 'cod', 250, 3, 1, '2024-05-19 20:43:06', '2024-05-19 20:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `size` varchar(20) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `size`, `unit`, `quantity`, `price`, `total`) VALUES
(1, 1, 4, 'L', 'pcs', 2, 550, 1100),
(2, 2, 3, 'M', 'pack', 5, 150, 750),
(5, 4, 7, 'M', '1', 1, 200, 200),
(6, 5, 6, 'S', 'pcs', 1, 150, 150),
(7, 6, 8, 'M', '1', 1, 200, 200),
(8, 7, 8, 'M', '1', 1, 200, 200),
(9, 8, 9, 'S', '1', 1, 199, 199),
(10, 9, 20, 'M', 'French Bulldog', 1, 200, 200),
(11, 10, 4, 'M', 'pcs', 1, 500, 500),
(12, 10, 5, 'M', 'pcs', 1, 50, 50),
(13, 11, 6, 'S', 'pcs', 1, 150, 150),
(14, 11, 4, 'M', 'pcs', 1, 500, 500),
(15, 12, 6, 'S', 'pcs', 99, 150, 14850),
(16, 13, 6, 'S', 'pcs', 1, 150, 150),
(17, 13, 6, 'M', 'pcs', 1, 180, 180),
(18, 14, 1, 'M', 'pcs', 1, 250, 250);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `product_name`, `description`, `status`, `date_created`) VALUES
(1, 1, 1, 'Dog Food 101', '&lt;p&gt;Introducing &quot;Puppylicious Delights,&quot; the ultimate gourmet dog food experience for your furry best friend! Made with only the finest, all-natural ingredients, each bite is packed with flavor and nutrition to keep your pup happy and healthy. Our unique blend of proteins, grains, and veggies is specially crafted to cater to your dog&#039;s taste buds and dietary needs. Treat your canine companion to a dining experience like no other with Puppylicious Delights - because they deserve nothing but the best!&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 11:19:31'),
(3, 1, 3, 'Cat Food 101', '&lt;p&gt;Introducing Meow Mix Gourmet Delights - the purr-fect meal for your feline friend! Made with premium ingredients and carefully crafted to satisfy even the pickiest of eaters, this delectable cat food will have your kitty meowing for more. Packed with essential nutrients and vitamins to support your cat&#039;s overall health and well-being, Meow Mix Gourmet Delights is the ultimate choice for discerning cat owners who want only the best for their beloved pets. Treat your furry companion to a gourmet dining experience with Meow Mix Gourmet Delights - because every cat deserves to dine like royalty!&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:48:16'),
(4, 4, 4, 'Dog bed', '&lt;p&gt;Introducing the Pawsome Comfort Deluxe Dog Bed - the ultimate luxury retreat for your furry friend! Crafted with plush, memory foam padding and a soft, machine-washable cover, this bed provides unparalleled comfort and support for dogs of all sizes. The stylish design features a non-slip bottom and reinforced stitching for durability, making it the perfect blend of style and functionality. Treat your beloved pet to a cozy oasis with the Pawsome Comfort Deluxe Dog Bed.&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:49:07'),
(5, 4, 5, 'Cat  Plates 623', '&lt;p style=&quot;text-align: justify; &quot;&gt;Introducing our exclusive collection of cat-themed plates and bowls, perfect for any feline enthusiast! Made from high-quality ceramic, these adorable dishes feature whimsical designs of playful cats in various poses. Whether you&#039;re serving up a meal for your own furry friend or simply adding a touch of charm to your kitchen decor, these cat plates and bowls are sure to delight cat lovers of all ages. Upgrade your dining experience with these purrfectly charming dishes today!&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:50:11'),
(6, 4, 4, 'Dog Belt', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;The revolutionary Canine Comfort Belt is the ultimate accessory for your furry best friend. Crafted from premium faux leather and adorned with sparkling rhinestones, this belt not only adds a touch of glamour to your dog&#039;s wardrobe but also provides unparalleled comfort and support. The adjustable strap ensures a perfect fit for dogs of all sizes, while the sturdy buckle ensures security and peace of mind during walks and outings. Treat your pup to the luxury they deserve with the Canine Comfort Belt.&lt;br&gt;&lt;/p&gt;', 1, '2021-06-22 15:50:16'),
(7, 5, 6, 'Max', '&lt;p&gt;&lt;h2&gt;Sex: Male&lt;br&gt;Breed: German Shepherd&lt;br&gt;Age: 2 years&lt;br&gt;Location: Bouddha&lt;/h2&gt;&lt;h2&gt;About Max&lt;/h2&gt;Max is a majestic German Shepherd with a sleek black and tan coat that glistens in the sunlight. His piercing brown eyes exude intelligence and loyalty, making him the perfect companion for any adventure. With a playful spirit and boundless energy, Max loves to run and explore the great outdoors. He is fiercely protective of his family and will stop at nothing to keep them safe. Max is not just a pet, he is a true member of the family, bringing joy and happiness wherever he goes.&lt;br&gt;&lt;/p&gt;', 1, '2024-05-17 18:25:58'),
(8, 5, 7, 'Snookie', '&lt;p&gt;&lt;p&gt;&lt;/p&gt;&lt;h2&gt;&lt;/h2&gt;&lt;h3&gt;Sex: Male&lt;br&gt;Breed: Siamese Cat&lt;br&gt;Age: 2 years&lt;br&gt;Location: Kathmandu&lt;/h3&gt;&lt;h2&gt;About Snookie&lt;/h2&gt;&lt;/p&gt;&lt;p&gt;Meet Snookie, the adventurous and mischievous feline who loves to explore every nook and cranny of the house. With her luxurious fur coat and mesmerizing green eyes, Snookie is the epitome of grace and elegance. She enjoys lounging in sunbeams, chasing after toy mice, and demanding attention with her gentle purrs. Snookie is the perfect companion for anyone looking for a playful and affectionate feline friend.&lt;br&gt;&lt;p&gt;&lt;/p&gt;&lt;/p&gt;', 1, '2024-05-17 18:38:07'),
(9, 5, 8, 'Pituu', '&lt;h3&gt;Sex: Female&lt;br&gt;Breed: Hyacinth Macaw&lt;br&gt;Age: 2 years&lt;br&gt;Location: Pokhara&lt;/h3&gt;&lt;h2&gt;About Pituu&lt;/h2&gt;&lt;p&gt;Pituu is a vibrant and colorful parrot with a playful personality. Known for its impressive mimicry skills, Pituu can imitate a wide range of sounds and voices with incredible accuracy. This feathered friend loves to show off its talents and entertain anyone who is lucky enough to be in its presence. With a mischievous twinkle in its eye, Pituu is always ready to brighten up your day with its cheerful chirps and charming antics. Whether perched on your shoulder or flying around the room, Pituu is sure to capture your heart with its infectious energy and charm.&lt;br&gt;&lt;/p&gt;', 1, '2024-05-17 19:30:31'),
(10, 5, 9, 'Sugar', '&lt;p&gt;&lt;/p&gt;&lt;h2&gt;&lt;/h2&gt;&lt;h3&gt;Sex: Male&lt;br&gt;Breed: Holland Lop&lt;br&gt;Age: 2 years&lt;br&gt;Location: Saipal&lt;/h3&gt;About SugarRabbit Sugar is a fluffy, pink-colored poodle with wings that allow her to fly through cotton candy clouds. She has a magical bark that can turn anything she touches into delicious treats. With her sparkling rainbow collar and shimmering fur, Rabbit Sugar is truly a one-of-a-kind pup who brings joy and sweetness wherever she goes.&lt;br&gt;&lt;p&gt;&lt;/p&gt;', 1, '2024-05-17 19:53:52'),
(12, 5, 6, 'Bella', '&lt;h2&gt;&lt;h3&gt;Sex: Female&lt;br&gt;Breed: Labrador Retriever&lt;br&gt;Age: 2 years&lt;br&gt;Location: Kathmandu&lt;/h3&gt;About Bella&lt;/h2&gt;Bella is a charming and popular name for a Labrador Retriever, a breed renowned for its friendly, affectionate, and outgoing nature. Labradors are known for their intelligence and versatility, excelling in roles such as search and rescue, service dogs, and therapy animals. They have a gentle temperament, making them perfect companions for families with children. Bella, like most Labradors, would thrive on regular exercise and mental stimulation, enjoying activities such as fetching, swimming, and agility training.', 1, '2024-05-18 11:33:01'),
(13, 5, 6, 'Maxus', '&lt;p&gt;&lt;/p&gt;&lt;h3&gt;&lt;/h3&gt;&lt;h3&gt;Sex: Male&lt;br&gt;Breed: German Shepherd&lt;br&gt;Age: 3 years&lt;br&gt;Location: Lazimpath&lt;/h3&gt;&lt;h2&gt;About Maxus&lt;/h2&gt;Maxus is a strong and fitting name for a German Shepherd, a breed that epitomizes loyalty, intelligence, and courage. German Shepherds are often employed in police and military roles due to their keen sense of duty and trainability. They are also excellent family pets, offering protection and companionship. Max would likely excel in obedience training and enjoy activities that challenge his mind and body, such as tracking, herding, and protection work.&lt;br&gt;&lt;p&gt;&lt;/p&gt;', 1, '2024-05-18 11:37:57'),
(14, 5, 6, 'Daisy', '&lt;p&gt;&lt;h3&gt;Sex: Male&lt;br&gt;Breed: Beagle&lt;br&gt;Age: 2 years&lt;br&gt;Location: Bhaktapur&lt;/h3&gt;&lt;h2&gt;About Daisy&lt;/h2&gt;Daisy is a delightful name for a Beagle, reflecting the breed&#039;s cheerful and energetic personality. Beagles are small to medium-sized hounds with an exceptional sense of smell, often used in hunting and detection work. They are known for their sociable nature and get along well with other dogs and children. Daisy would enjoy activities that engage her nose, such as scent trails and games, and would thrive in a home where she receives plenty of attention and exercise.&lt;br&gt;&lt;/p&gt;', 1, '2024-05-18 11:39:45'),
(15, 5, 6, 'Charlie', '&lt;p&gt;&lt;h3&gt;Sex: Male&lt;br&gt;Breed: Golden Retriever&lt;br&gt;Age: 2 years&lt;br&gt;Location: Kathmandu&lt;/h3&gt;&lt;h2&gt;About Charlie&lt;/h2&gt;Charlie is an endearing name for a Golden Retriever, a breed celebrated for its friendly, tolerant, and trustworthy demeanor. Golden Retrievers are highly intelligent and eager to please, making them ideal for roles as service dogs, therapy animals, and search and rescue dogs. They are great with children and other pets, making them a favorite in family homes. Charlie would love activities like fetch, swimming, and obedience training, which allow him to bond with his family and use his natural talents.&lt;br&gt;&lt;/p&gt;', 1, '2024-05-18 11:41:09'),
(16, 5, 6, 'Luna', '&lt;p&gt;&lt;h3&gt;Sex: Female&lt;br&gt;Breed: Siberian Husky&lt;br&gt;Age: 2 years&lt;br&gt;Location: Kalinchowk&lt;/h3&gt;&lt;h2&gt;About Luna&lt;/h2&gt;Luna is a mystical and fitting name for a Siberian Husky, a breed known for its striking appearance and spirited nature. Huskies are highly energetic and require regular exercise to stay happy and healthy. They are friendly and outgoing, with a strong pack mentality, making them great companions for active families. Luna would enjoy activities that cater to her endurance and agility, such as running, hiking, and sledding. Her beautiful coat and captivating eyes make her a standout in any setting.&lt;br&gt;&lt;/p&gt;', 1, '2024-05-18 11:49:59'),
(17, 5, 6, 'Rocky', '&lt;p&gt;&lt;/p&gt;&lt;h3&gt;Sex: Male&lt;br&gt;Breed: Boxer&lt;br&gt;Age: 3 years&lt;br&gt;Location: Lalitpur&lt;/h3&gt;&lt;h2&gt;About Rocky&lt;/h2&gt;Rocky is a robust and playful name for a Boxer, a breed recognized for its energetic and affectionate personality. Boxers are known for their boundless energy and love of play, often retaining a puppy-like demeanor well into adulthood. They are also protective and loyal, making them excellent family guardians. Rocky would thrive on activities that provide both physical and mental stimulation, such as agility courses, obedience training, and interactive play sessions. His muscular build and expressive face make him a delightful companion.&lt;br&gt;&lt;p&gt;&lt;/p&gt;', 1, '2024-05-18 11:57:20'),
(18, 5, 6, 'Sadie', '&lt;p&gt;&lt;/p&gt;&lt;h2&gt;&lt;/h2&gt;&lt;h3&gt;Sex: Male&lt;br&gt;Breed: Cocker Spaniel&lt;br&gt;Age: 3 years&lt;br&gt;Location: Maharajgunj&lt;/h3&gt;&lt;h2&gt;About Sadie&lt;/h2&gt;Sadie is a sweet and fitting name for a Cocker Spaniel, a breed known for its gentle and affectionate nature. Cocker Spaniels are friendly, easy-going, and thrive on human companionship. They have a beautiful, silky coat and soulful eyes that endear them to everyone they meet. Sadie would enjoy activities that involve close interaction with her family, such as leisurely walks, cuddling, and gentle play. She would also benefit from regular grooming to maintain her lovely coat.&lt;br&gt;&lt;p&gt;&lt;/p&gt;', 1, '2024-05-18 11:59:13'),
(19, 5, 6, 'Zeus', '&lt;h3&gt;&lt;span style=&quot;font-family: &amp;quot;Segoe UI Emoji&amp;quot;;&quot;&gt;﻿&lt;/span&gt;Sex: Male&amp;nbsp;&lt;br&gt;&lt;/h3&gt;&lt;h3&gt; Breed: Rottweiler&lt;br&gt; Age: 2 years&lt;br&gt;Location: Bishalnagar&lt;/h3&gt;&lt;h2&gt;About Zeus&lt;/h2&gt;&lt;h3&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;font-size: 18px; font-family: &amp;quot;Times New Roman&amp;quot;;&quot;&gt;Zeus is a powerful and commanding name for a Rottweiler, a breed known for its strength, confidence, and protective instincts. Rottweilers are loyal and courageous, often used in roles requiring physical strength and determination, such as search and rescue and police work. They are also loving family pets, providing both companionship and protection. Zeus would excel in activities that harness his physical prowess and intelligence, such as obedience training, protection sports, and agility courses.&lt;/span&gt;&lt;/p&gt;&lt;/h3&gt;', 1, '2024-05-18 12:02:33'),
(20, 5, 6, 'Molly', '&lt;p&gt;&lt;h2&gt;Sex: Male&lt;br&gt;Breed: French Bulldog&lt;br&gt;Age: 2 years&lt;br&gt;Location: Khursanitar&lt;/h2&gt;&lt;h2&gt;About&lt;/h2&gt;&lt;/p&gt;&lt;p&gt;Molly is a charming and adorable name for a French Bulldog, a breed known for its affectionate and easygoing personality. French Bulldogs are small but sturdy, with a playful and friendly demeanor that makes them excellent companions for urban living. They are known for their distinctive bat-like ears and expressive faces. Molly would enjoy activities that involve close interaction with her human companions, such as short walks, playtime, and cuddling. She would also appreciate a comfortable environment where she can relax and enjoy her family&#039;s company.&lt;br&gt;&lt;/p&gt;', 1, '2024-05-18 12:04:28'),
(21, 5, 7, 'Minion', '&lt;h3 id=&quot;sex-female&quot;&gt;Sex: Female&lt;/h3&gt;&lt;h2&gt;\r\n&lt;/h2&gt;&lt;h3&gt;Breed: Siamese Cat&lt;br&gt;Age: 3 years&lt;br&gt;Location: Naxal&lt;/h3&gt;&lt;h2&gt;About&lt;/h2&gt;&lt;p&gt;Minion is a mystical and elegant name for a Siamese cat, a breed known for its striking appearance and vocal personality. Siamese cats are highly social, intelligent, and affectionate, often forming strong bonds with their human companions. They are characterized by their sleek, slender bodies, large ears, and striking blue almond-shaped eyes. Minion would thrive in a home where she receives plenty of attention and interaction. Siamese cats are known for their talkative nature, often engaging in conversations with their owners using a range of vocalizations. Minion would enjoy interactive toys, puzzle feeders, and climbing structures to keep her mentally stimulated and physically active.&lt;br&gt;&lt;/p&gt;', 1, '2024-05-18 12:09:28'),
(22, 5, 7, 'Oliver', '&lt;h3&gt;Sex: Female&lt;br&gt;Breed: Maine Coon&lt;br&gt;Age: 3 years&lt;br&gt;Location: Baluwatar&lt;/h3&gt;&lt;h2&gt;About Oliver&lt;/h2&gt;&lt;div&gt;Oliver is a robust and friendly name for a Maine Coon, a breed celebrated for its large size and gentle disposition. Maine Coons are one of the largest domesticated cat breeds, with males typically weighing between 13 to 18 pounds, and some even larger. They have a long, shaggy coat, tufted ears, and a bushy tail, giving them a majestic and rugged appearance. Despite their size, Maine Coons are known for their friendly and sociable nature. Oliver would enjoy a variety of activities, including interactive play with toys, climbing on cat trees, and even playing fetch. Maine Coons are also known for their intelligence and can learn tricks and commands. They are often described as &quot;gentle giants&quot; and are very good with children and other pets.&lt;font color=&quot;#ececec&quot; face=&quot;S&ouml;hne, ui-sans-serif, system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Arial, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/div&gt;', 1, '2024-05-18 12:11:56'),
(23, 5, 7, 'Milo', '&lt;p&gt;&lt;h3&gt;Sex: Male&lt;br&gt;Breed: Bengal Cat&lt;br&gt;Age: 2 years&lt;br&gt;Location: Kathmandu&lt;/h3&gt;&lt;h2&gt;About Milo&lt;/h2&gt;Milo is an energetic and adventurous name for a Bengal cat, a breed known for its striking, leopard-like appearance and high energy levels. Bengals have a distinctive coat with spots or marbled patterns, often with a glittery sheen, making them look like wild jungle cats. They are highly active, intelligent, and curious, requiring plenty of physical and mental stimulation. Milo would thrive in an environment that provides ample opportunities for climbing, exploring, and interactive play. Bengals are known for their love of water and might enjoy playing in shallow water dishes or fountains. Milo would also benefit from puzzle toys and activities that challenge his mind, keeping him engaged and entertained. With their outgoing and affectionate nature, Bengals form strong bonds with their owners and are known to be quite vocal, communicating with a range of sounds.&lt;br&gt;&lt;/p&gt;', 1, '2024-05-18 12:13:44'),
(24, 5, 9, 'Laiger', '&lt;p&gt;&lt;h3&gt;Sex: Male&lt;/h3&gt;&lt;h3&gt;Breed: Angora Rabbit&lt;br&gt;Age: 2 years&lt;br&gt;Location: Kathmandu&lt;/h3&gt;&lt;h2&gt;About Laiger&lt;/h2&gt;Laiger is a fluffy and adorable rabbit with soft fur that is a mix of white and brown. He has big, expressive eyes and long, floppy ears that perk up when he&#039;s curious. Laiger loves to hop around and explore his surroundings, always on the lookout for tasty treats and cozy places to nap. He is friendly and social, enjoying the company of humans and other animals. Overall, Laiger is a lovable and charming bunny who brings joy to everyone around him.&lt;br&gt;&lt;/p&gt;', 1, '2024-05-18 20:26:54'),
(25, 1, 3, 'Catnip', '&lt;p&gt;Catnip is a herb that belongs to the mint family and is known for its stimulating effects on cats. When cats come into contact with catnip, they may exhibit behaviors such as rolling, rubbing, and playful activity. Our high-quality catnip product is sure to provide hours of entertainment and enrichment for your feline friend.&lt;br&gt;&lt;/p&gt;', 1, '2024-05-23 19:03:50'),
(26, 1, 1, 'Churpi', '&lt;p&gt;Introducing Churpi for Dogs - the ultimate treat for your furry friend! Made with all-natural ingredients and packed with delicious flavors, Churpi is sure to become your pup&#039;s new favorite snack. These long-lasting chews are perfect for keeping your dog entertained and satisfied. Give your dog the gift of Churpi and watch them wag their tail in delight!&lt;br&gt;&lt;/p&gt;', 1, '2024-05-24 09:52:58'),
(27, 4, 5, 'Cat Bed', '&lt;p&gt;Introducing our cozy and luxurious cat bed, designed to provide your feline friend with the ultimate comfort and relaxation. Made from soft and plush materials, this bed features a spacious and padded sleeping area that will keep your cat warm and snug throughout the day and night. The stylish design and neutral color scheme will complement any home decor, making it a perfect addition to your pet&#039;s living space. Treat your beloved cat to a restful and peaceful sleep with our premium cat bed.&lt;br&gt;&lt;/p&gt;', 1, '2024-05-24 09:56:55'),
(28, 5, 6, 'Prime', '&lt;h3&gt;Sex: Male&lt;br&gt;Breed: Russian Blue&lt;br&gt;Age: 2 years&lt;br&gt;Location: Kathmandu&lt;/h3&gt;&lt;h2&gt;About Prime&lt;/h2&gt;&lt;p&gt;Introducing Luna, a graceful Russian Blue with stunning green eyes. Luna is a bit shy at first but warms up quickly once she feels safe. She&rsquo;s a quiet and gentle cat who enjoys a calm environment. Luna is looking for a peaceful home where she can feel secure and loved.&lt;br&gt;&lt;/p&gt;', 1, '2024-05-24 12:29:10');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 1, 1100, '2021-06-22 13:48:54'),
(2, 2, 750, '2021-06-22 15:26:07'),
(4, 4, 200, '2024-05-17 18:43:39'),
(5, 5, 150, '2024-05-17 19:24:28'),
(6, 6, 200, '2024-05-17 19:50:26'),
(7, 7, 200, '2024-05-18 10:40:46'),
(8, 8, 199, '2024-05-18 11:22:48'),
(9, 9, 200, '2024-05-18 12:29:41'),
(10, 10, 550, '2024-05-18 16:31:27'),
(11, 11, 650, '2024-05-18 17:15:56'),
(12, 12, 14850, '2024-05-18 17:24:44'),
(13, 13, 330, '2024-05-18 17:37:27'),
(14, 14, 250, '2024-05-19 20:43:06');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(30) NOT NULL,
  `size` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`) VALUES
(1, 'xs'),
(2, 's'),
(3, 'm'),
(4, 'l'),
(5, 'xl'),
(6, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Dog Food', '&lt;p&gt;Sample only&lt;/p&gt;', 1, '2021-06-21 10:58:32'),
(3, 1, 'Cat Food', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:34:59'),
(4, 4, 'Dog Needs', '&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;', 1, '2021-06-21 16:35:26'),
(5, 4, 'Cat Needs', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:35:36'),
(6, 5, 'Dogs', '&lt;p&gt;Adoption&lt;/p&gt;', 1, '2024-05-17 18:24:47'),
(7, 5, 'Cats', 'Adoption', 1, '2024-05-17 18:36:56'),
(8, 5, 'Birds', '&lt;p&gt;Adoption&lt;/p&gt;', 1, '2024-05-17 19:29:26'),
(9, 5, 'Rabbit', '&lt;p&gt;Adoption&lt;/p&gt;', 1, '2024-05-17 19:52:40');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Sano Sansaar'),
(6, 'short_name', 'Paws & Purrs: Your Pet Shop'),
(11, 'logo', 'uploads/1624240440_paw.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1715951160_bg.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', 'a17b1f5a50e5fbad8aaea0436a769db9', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2024-05-18 15:27:09'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-06-19 10:53:12'),
(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 0, '2021-06-19 10:01:51', '2021-06-19 12:03:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
