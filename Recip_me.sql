-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2018 at 09:22 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recip_me`
--

-- --------------------------------------------------------

--
-- Table structure for table `amount_ingredients`
--

CREATE TABLE `amount_ingredients` (
  `idAmount` int(11) NOT NULL,
  `amount` int(55) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `ingredient` varchar(100) NOT NULL,
  `fk_idUnits` int(11) DEFAULT NULL,
  `fk_idIngredients` int(11) DEFAULT NULL,
  `fk_idRecipe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `amount_ingredients`
--

INSERT INTO `amount_ingredients` (`idAmount`, `amount`, `unit`, `ingredient`, `fk_idUnits`, `fk_idIngredients`, `fk_idRecipe`) VALUES
(1, 1, '', '', 1, 7, 2),
(2, 250, '', '', 2, 1, 2),
(3, 100, '', '', 2, 2, 2),
(4, 250, '', '', 2, 3, 2),
(5, 3, '', '', 3, 4, 2),
(6, 1, '', '', 3, 5, 2),
(7, 1, '', '', 4, 6, 2),
(8, 500, '', '', 2, 8, 4),
(9, 500, '', '', 2, 9, 4),
(10, 400, '', '', 9, 12, 4),
(11, 1, '', '', 3, 15, 4),
(12, 1, '', '', 5, 10, 4),
(13, 2, '', '', 8, 13, 4),
(14, 8, '', '', 3, 14, 4),
(15, 1, '', '', 8, 16, 5),
(16, 100, '', '', 2, 17, 5),
(17, 3, '', '', 6, 21, 5),
(18, 1, '', '', 7, 19, 5),
(19, 1, '', '', 7, 20, 5),
(20, 3, '', '', 8, 16, 6),
(21, 250, '', '', 2, 23, 6),
(22, 5, '', '', 3, 22, 6),
(23, 2, '', '', NULL, NULL, NULL),
(24, 2, '', '', 13, 25, 6),
(25, 1, '', '', 5, 10, 6),
(28, 2, '', '', 7, 11, 6),
(29, 2, '', '', 5, 26, 6);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `idComment` int(11) NOT NULL,
  `fk_idRecipe` int(11) NOT NULL,
  `comment` varchar(600) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `idImage` int(11) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`idImage`, `image`) VALUES
(1, 'vegetarian_default_portrait.gif'),
(2, '01_granola_dust.jpg'),
(3, 'almond_cookies.jpg'),
(4, 'almond_default.jpg'),
(5, 'almondmilk.jpg'),
(6, 'ananas_avocado_salad.jpg'),
(7, 'apple_pie.jpg'),
(8, 'apples_default.jpg'),
(9, 'asia_nudle_bowl.jpg'),
(10, 'asian_nudeln.jpg'),
(11, 'avocado_default.jpg'),
(12, 'avocado_egg_sandwich.jpg'),
(13, 'berries.jpg'),
(14, 'blackberry_icecream.jpg'),
(15, 'blueberry_banana_bowl.jpg'),
(16, 'blueberry_breakfast_bowl.jpg'),
(17, 'blueberry_default.jpg'),
(18, 'breakfast.jpg'),
(19, 'breakfast_bowl.jpg'),
(20, 'burger_patty.jpg'),
(21, 'cake_vanilla_sauce.jpg'),
(22, 'cheeseburger.jpg'),
(23, 'cherry.jpg'),
(24, 'cherry_default.jpg'),
(25, 'chiaseed.jpg'),
(26, 'chicken_egg_salad.jpg'),
(27, 'chicken_recipes.jpg'),
(28, 'chickpea_bowl.jpg'),
(29, 'chillipot.jpg'),
(30, 'chocolate_cookies.jpg'),
(31, 'christmas_cookies.jpg'),
(32, 'coconut.jpg'),
(33, 'crispy_nut_muesli.jpg'),
(34, 'crispy_potatoes.jpg'),
(35, 'cucumber_default.jpg'),
(36, 'energy_balls.jpg'),
(37, 'fish.jpg'),
(38, 'french_toast.jpg'),
(39, 'fruit_salad.jpg'),
(40, 'fruits.jpg'),
(41, 'green_aspargus.jpg'),
(42, 'green_beans_default.jpg'),
(43, 'herbs_default.jpg'),
(44, 'home_made_fries.jpg'),
(45, 'icecream.jpg'),
(46, 'italien_default.jpg'),
(47, 'lemon_default.jpg'),
(48, 'lentils.jpg'),
(49, 'low_carb_pancakes.jpg'),
(50, 'mango.jpg'),
(51, 'meat.jpg'),
(52, 'millet_salad.jpg'),
(53, 'more_fruits.jpg'),
(54, 'more_strawberries.jpg'),
(55, 'mozzarela_salad.jpg'),
(56, 'muesli.jpg'),
(57, 'mushrooms_default.jpg'),
(58, 'okra.jpg'),
(59, 'omlette.jpg'),
(60, 'paella.jpg'),
(61, 'pancakes.jpg'),
(62, 'papaya_bowl.jpg'),
(63, 'paprika.jpg'),
(64, 'pasta.jpg'),
(65, 'pasta_default.jpg'),
(66, 'pasta_meatballs.jpg'),
(67, 'pasta1.jpg'),
(68, 'pasta2.jpg'),
(69, 'pasta3.jpg'),
(70, 'pear_default.jpg'),
(71, 'pepper_default.jpg'),
(72, 'pesto.jpg'),
(73, 'pistacious.jpg'),
(74, 'pizza.jpg'),
(75, 'pizza1.jpg'),
(76, 'popcorn.jpg'),
(77, 'porridge.jpg'),
(78, 'porridge_bowl.jpg'),
(79, 'pudding.jpg'),
(80, 'rasberry.jpg'),
(81, 'pumpkin_soup.jpg'),
(82, 'rasberry_icecream.jpg'),
(83, 'rice_vegetable_stew.jpg'),
(84, 'risotto.jpg'),
(85, 'risotto1.jpg'),
(86, 'salad_default.jpg'),
(87, 'salmon_spinach_stew.jpg'),
(88, 'self_made_bread.jpg'),
(89, 'strawberries.jpg'),
(90, 'strawberries_default.jpg'),
(91, 'strawberry.jpg'),
(92, 'strawberry_default.jpg'),
(93, 'strawberry_joghurt.jpg'),
(94, 'sweet_potatoe_fries.jpg'),
(95, 'toast_sugar_free_jam.jpg'),
(96, 'tomato_sauce.jpg'),
(97, 'vegetable_curry-jpg.jpg'),
(98, 'vegetable_default.jpg'),
(99, 'vegetable_soup.jpg'),
(100, 'veggies.jpg'),
(101, 'waffles.jpg'),
(102, 'white_aspargus.jpg'),
(103, 'vegetarian_default.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `idIngredient` int(11) NOT NULL,
  `ingredient` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`idIngredient`, `ingredient`) VALUES
(1, 'unsalted mixed nuts'),
(2, 'mixed seeds'),
(3, 'mixed dried fruit'),
(4, 'cocoa powder'),
(5, 'ground coffee'),
(6, 'orange'),
(7, 'porridge oats'),
(8, 'Hokaido squash'),
(9, 'Butternut squash'),
(10, 'Salt'),
(11, 'Pepper'),
(12, 'Coconut milk'),
(13, 'Vegetable stock'),
(14, 'Pumpkin seeds'),
(15, 'Nutmeg'),
(16, 'Water'),
(17, 'almonds'),
(18, 'walnuts'),
(19, 'Vanilla'),
(20, 'Cinnamon'),
(21, 'dates'),
(22, 'olive oil'),
(23, 'spaghetti'),
(24, 'pasta'),
(25, 'garlic'),
(26, 'oregano'),
(27, 'apple'),
(28, 'pear'),
(29, 'apples'),
(30, 'pears'),
(31, 'marple sirup'),
(32, 'coconut sugar'),
(33, 'sugar'),
(34, 'banana'),
(35, 'bananas'),
(36, 'amaranth'),
(37, 'quinoa'),
(38, 'almond milk'),
(39, 'cocoa powder'),
(40, 'chocolate dark sugarfree'),
(41, 'millet'),
(42, 'potato'),
(43, 'chicken breast'),
(44, 'chicken legs'),
(45, 'beef'),
(46, 'minced beef'),
(47, 'salmon'),
(48, 'cream'),
(49, 'oat milk'),
(50, 'kiwi'),
(51, 'pasta'),
(52, 'steel cut oats'),
(53, 'strawberries'),
(54, 'rasberries'),
(55, 'blueberries'),
(56, 'blackberries'),
(57, 'broccoli'),
(58, 'carrots'),
(59, 'cauliflower'),
(60, 'cheddar cheese'),
(61, 'green beans'),
(62, 'majoran'),
(63, 'peas'),
(64, 'lentils'),
(65, 'black beans'),
(66, 'kidney beans'),
(67, 'mixed fruits'),
(68, 'mango'),
(69, 'cabbage'),
(70, 'kale'),
(71, 'spelt toast'),
(72, 'dark bread'),
(73, 'buckwheat'),
(74, 'spelt'),
(75, 'flour'),
(76, 'egg'),
(77, 'eggs'),
(78, 'ham'),
(79, 'Gouda cheese'),
(80, 'cream cheese'),
(81, 'mozzarella'),
(82, 'parmesan'),
(83, 'cashew nuts'),
(84, 'hazelnuts'),
(85, 'pecan nuts'),
(86, 'pine nuts'),
(87, 'avocado'),
(88, 'shrimps'),
(89, 'prawns'),
(90, 'fish filet'),
(91, 'dorada'),
(92, 'tofu'),
(93, 'basmati rice'),
(94, 'brown rice'),
(95, 'papaya'),
(96, 'coconut joghurt'),
(97, 'jogurt'),
(98, 'sheep yogurt'),
(99, 'mascarpone'),
(100, 'sour cream'),
(101, 'feta'),
(102, 'haloumi'),
(103, 'mustard'),
(104, 'tomato sauce'),
(105, 'tomato paste'),
(106, 'curry powder'),
(107, 'berbere herb mix'),
(108, 'gochi berries'),
(109, 'mulberry'),
(110, 'pomegranate'),
(111, 'lemon'),
(112, 'lemons'),
(113, 'lemon peel'),
(114, 'orange peel'),
(115, 'orange'),
(116, 'oranges'),
(117, 'vanilla extract'),
(118, 'erythritol'),
(119, 'stevia'),
(120, 'xylit'),
(121, 'pumpkin'),
(122, 'basil'),
(123, 'garlic'),
(124, 'onion'),
(125, 'onions'),
(126, 'red onion'),
(127, 'red onions'),
(128, 'whole chicken'),
(129, 'polenta'),
(130, 'red lentils'),
(131, 'yellow lentils'),
(132, 'green lentils'),
(133, 'grapefruit'),
(134, 'fleur de sel'),
(135, 'spinach'),
(136, 'baby spinach'),
(137, 'salad'),
(138, 'beetroot'),
(139, 'lime'),
(140, 'tomato'),
(141, 'tomatoes'),
(142, 'cucumber'),
(143, 'porree'),
(144, 'chard'),
(145, 'apricots'),
(146, 'cherries'),
(147, 'honey'),
(148, 'barbecue sauce'),
(149, 'rice sirup'),
(150, 'cashew milk'),
(151, 'rice milk'),
(152, 'silk tofu'),
(153, 'almond butter'),
(154, 'peanut butter'),
(155, 'cashew butter'),
(156, 'apple sauce'),
(157, 'chia seeds'),
(158, 'bread crumbs'),
(159, 'almond flour'),
(160, 'coconut flour'),
(161, 'chocolate drops'),
(162, 'ananas'),
(163, 'granola'),
(164, 'chickpeas'),
(165, 'hummus'),
(166, 'chilli'),
(167, 'shredded coconut'),
(168, 'coconut flakes'),
(169, 'sweet potato'),
(170, 'sweet potatoes'),
(171, 'coconut butter'),
(172, 'sugar or any sugarfree alternative'),
(173, 'date sugar'),
(174, 'date sirup'),
(175, 'green aspargus'),
(176, 'white aspargus'),
(177, 'sweet pepper powder'),
(178, 'maize starch'),
(179, 'maize'),
(180, 'shredded cheese'),
(181, 'shredded mozzarella'),
(182, 'pizza cheese'),
(183, 'pork-filet'),
(184, 'bacon'),
(185, 'portobello mushrooms'),
(186, 'mushrooms'),
(187, 'champignons'),
(188, 'fresh basil'),
(189, 'pistaccio nuts'),
(190, 'ginger'),
(191, 'cumin'),
(192, 'curcumin'),
(193, 'rosemary'),
(194, 'fresh rosemary'),
(195, 'coriander'),
(196, 'fresh coriander'),
(197, 'okra'),
(198, 'white beans'),
(199, 'gelatine'),
(200, 'agar agar'),
(201, 'aragula'),
(202, 'icecubes'),
(203, 'celery'),
(204, 'turnip cabbage'),
(205, 'pastry'),
(206, 'pizza dough'),
(207, 'pumpkin seeds'),
(208, 'vegetable stock or water');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `idRecipe` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `cookingMethod` varchar(8000) NOT NULL,
  `instructions` varchar(8000) NOT NULL,
  `origin` varchar(50) NOT NULL,
  `fk_idImage` int(11) NOT NULL DEFAULT '1',
  `fk_userid` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`idRecipe`, `name`, `cookingMethod`, `instructions`, `origin`, `fk_idImage`, `fk_userid`) VALUES
(2, 'Awesome granola dust', 'Preparation time 25 min<br>\r\nOven 180 degrees for 15 min', '1. Preheat the oven to 180 Degrees C/350 Degrees F/gas 4.<br><br>\r\n2. Place the oats, nuts and seeds in your largest roasting tray. Toss together and roast for 15 minutes, stirring halfway.<br><br>\r\n3. Stir the dried fruit, cocoa and coffee into the mix, finely grate over the orange zest, then, in batches, simply blitz to a rough powder in a food processor, tipping it into a large airtight jar as you go for safekeeping.<br><br>\r\n4. To serve, you can have loads of fun - the simplest way is 50g of granola dust per person, either with cold cow\'s, goat\'s, soya, nut or oat milk or 2 tablespoons of natural yoghurt, and a handful of fresh fruit (80g is one of our 5-a-day). You can make porridge using 50g of granola dust to 200ml of milk, then top with fresh fruit, and this ratio also works for a smoothie - I like to chuck 1 ripe banana and 1 handful of frozen raspberries into the mix too. It\'s even a great base for pancakes - simply beat 2 heaped tablespoons of granola dust with 1 heaped tablespoon of wholemeal self-raising flour, 1 mashed banana and 1 large free-range egg, then cook as normal. And in winter, try a hot drink - heat 25g of granola dust with 200ml of your favourite milk to your desired consistency', 'Jamie Oliver', 2, 1),
(4, 'Pumpkin soup', 'Preparation time: 5 minutes.\r\nCooking time: \r\n25 minutes\r\n', 'Cut both squashes into small pieces and cook them in water or vegetable stock for 20 minutes on middle heat.\r\nAdd the coconut milk and the nutmeg and cook for another 5 minutes on reduced heat. \r\nAdd salt and puree through.\r\nIf you want serve with pumpkin seeds.\r\n', 'Nina', 81, 1),
(5, 'Almond milk', 'Preparation time:  1day\r\nCooking time: \r\n5 minutes\r\n', 'Soak the almonds in 1l of water over night.\r\nLet the dates soak for 1 hour in some water a separate bowl.\r\nRinse the almonds.\r\nPut all the ingredients together and mix them in food processor on high speed for two minutes with breaks in between. \r\nSqueeze everything through a sieve or a cheese- or nutcloth in a bottle with a filter.\r\n', 'Nina', 5, 1),
(6, 'Spaghetti al olio', 'Preparation time: 10 minutes.\r\nCooking time: 10 minutes\r\n', 'Place the noodles in 3 liters of cooking saltwater.\r\nCook them al dente (8-10 minutes) and rinse them through a sieve.\r\nMix the pasta olive oil, oregano, salt water, pepper and squashed garlic.\r\n', 'Nina', 67, 1),
(7, 'pie', 'difficult', 'a lot of work', 'my', 21, 1),
(8, 'pie', 'difficult', 'a lot of work', 'my', 31, 1),
(9, 'dummy', 'dumm', 'dummy', 'me', 87, 1),
(10, '123', '123r', '123', 'wer', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_tags`
--

CREATE TABLE `recipe_tags` (
  `idRecTag` int(11) NOT NULL,
  `fk_idRecipe` int(11) NOT NULL,
  `fk_idTag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipe_tags`
--

INSERT INTO `recipe_tags` (`idRecTag`, `fk_idRecipe`, `fk_idTag`) VALUES
(7, 2, 1),
(8, 2, 3),
(10, 5, 11),
(11, 4, 7),
(12, 6, 1),
(13, 6, 7),
(14, 8, 10),
(15, 8, 4),
(16, 7, 12),
(17, 9, 2),
(18, 10, 14);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `idTag` int(11) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`idTag`, `category`) VALUES
(1, 'main meal'),
(2, 'starter'),
(3, 'breakfast'),
(4, 'snack'),
(5, 'sugar-free'),
(6, 'egg-free'),
(7, 'vegan'),
(8, 'vegetarian'),
(9, 'lactose-free'),
(10, 'low-carb'),
(11, 'cow milk free'),
(12, 'nut-free'),
(13, 'drinks'),
(14, 'shakes');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `idUnits` int(11) NOT NULL,
  `unit_EN` varchar(255) NOT NULL,
  `unit_DE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`idUnits`, `unit_EN`, `unit_DE`) VALUES
(1, 'kg', 'kg'),
(2, 'g', 'g'),
(3, 'tablespoons', 'Esslöffel'),
(4, 'piece', 'Stück'),
(5, 'teaspoons', 'Teelöffel'),
(6, 'pieces', 'Stück'),
(7, 'pinch', 'Messerspitze'),
(8, 'liter', 'Liter'),
(9, 'ml', 'ml'),
(10, 'dl', 'dl'),
(11, 'sheets', 'Platten'),
(12, 'cup', 'Tasse'),
(13, 'cloves', 'Zehen'),
(14, 'l', 'l'),
(15, 'liters', 'Liter'),
(16, 'small piece', 'kleines Stück'),
(17, 'big piece', 'großes Stück'),
(18, 'middle size ', 'mittlere Größe');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `userlastname` varchar(30) NOT NULL,
  `useremail` varchar(60) NOT NULL,
  `userpass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `userlastname`, `useremail`, `userpass`) VALUES
(1, 'test', 'test', 'test@test.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(2, 'Sabine', 'Hartmann', 'sabine.k.hartmann@gmail.com', 'dfcb9625569cdabc2c5f2ac2cf1521cf4682ba7d1ecea24f381e7213401c7b37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amount_ingredients`
--
ALTER TABLE `amount_ingredients`
  ADD PRIMARY KEY (`idAmount`),
  ADD KEY `fk_idRecipe` (`fk_idRecipe`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `fk_idRecipe` (`fk_idRecipe`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`idImage`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`idIngredient`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`idRecipe`),
  ADD KEY `fk_idImage` (`fk_idImage`),
  ADD KEY `fk_userid` (`fk_userid`);

--
-- Indexes for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  ADD PRIMARY KEY (`idRecTag`),
  ADD KEY `fk_idRecipe` (`fk_idRecipe`),
  ADD KEY `fk_idTag` (`fk_idTag`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`idTag`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`idUnits`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `useremail` (`useremail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amount_ingredients`
--
ALTER TABLE `amount_ingredients`
  MODIFY `idAmount` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `idImage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `idIngredient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `idRecipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  MODIFY `idRecTag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `idTag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `idUnits` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amount_ingredients`
--
ALTER TABLE `amount_ingredients`
  ADD CONSTRAINT `amount_ingredients_ibfk_3` FOREIGN KEY (`fk_idRecipe`) REFERENCES `recipe` (`idRecipe`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`fk_idRecipe`) REFERENCES `recipe` (`idRecipe`);

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `fk_idImage` FOREIGN KEY (`fk_idImage`) REFERENCES `images` (`idImage`),
  ADD CONSTRAINT `fk_userid` FOREIGN KEY (`fk_userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  ADD CONSTRAINT `fk_idRecipe` FOREIGN KEY (`fk_idRecipe`) REFERENCES `recipe` (`idRecipe`),
  ADD CONSTRAINT `fk_idTag` FOREIGN KEY (`fk_idTag`) REFERENCES `tags` (`idTag`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
