--
-- Database: `travel_guide`
-- Digital Travel Guide
-- 4 Categories: Asia, Africa, Europe, Antarctica
-- Each category has 6 destinations shown in a 3x2 grid
-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 24 destinations total (6 per continent = 3x2 grid per category page)
--

INSERT INTO `article` (`id`, `title`, `summary`, `content`, `created`, `category_id`, `member_id`, `image_id`, `published`) VALUES

-- -------------------------------------------------------
-- ASIA (category_id = 1)  |  image_id 1-6
-- -------------------------------------------------------
(1,  'Kyoto, Japan',
     'Ancient temples, bamboo groves, and timeless Japanese tradition',
     'Kyoto served as Japan\'s imperial capital for over a thousand years and remains the cultural heart of the country. The city is home to more than 1,600 Buddhist temples, 400 Shinto shrines, and 17 UNESCO World Heritage Sites. Walk through the towering bamboo groves of Arashiyama, explore the geisha district of Gion at dusk, or sit quietly in the raked gravel garden of Ryoanji. Every season brings a new face to Kyoto — cherry blossoms in spring, blazing maple canopies in autumn, and snow-dusted pagodas in winter.',
     '2024-01-10 09:00:00', 1, 1, 1, 1),

(2,  'Bali, Indonesia',
     'Tropical paradise of lush rice terraces and vibrant Hindu temples',
     'Bali is the jewel of the Indonesian archipelago, an island where extraordinary natural beauty meets a deeply spiritual Hindu culture. Emerald rice terraces step down volcanic hillsides, fragrant temple offerings line every pathway, and the rhythmic pulse of gamelan music fills the evening air. The cultural hub of Ubud offers world-class galleries, healing retreats, and the sacred Monkey Forest. Along the southern coast, Seminyak and Canggu deliver legendary surf, boutique dining, and sunsets that paint the Indian Ocean in gold and violet.',
     '2024-01-18 10:00:00', 1, 2, 2, 1),

(3,  'Ha Long Bay, Vietnam',
     'Emerald waters scattered with thousands of limestone karst islands',
     'Ha Long Bay is one of Southeast Asia\'s most spectacular natural wonders, a UNESCO World Heritage seascape of over 1,600 limestone islands rising dramatically from the emerald waters of the Gulf of Tonkin. Wooden junk boats drift through misty corridors of rock, past hidden lagoons, secret caves, and floating fishing villages that have existed for generations. Kayaking through the karst formations at dawn, when the mist still clings to the peaks and the bay is silent, is among the most unforgettable experiences in all of Asia.',
     '2024-01-25 08:00:00', 1, 3, 3, 1),

(4,  'Petra, Jordan',
     'The rose-red city carved into sandstone cliffs by the ancient Nabataeans',
     'Petra is one of the world\'s most awe-inspiring archaeological sites, a city of temples, tombs, and ceremonial halls carved directly into the rose-red sandstone cliffs of southern Jordan by the Nabataean civilization over 2,000 years ago. The iconic Treasury, Al-Khazneh, emerges suddenly at the end of the narrow Siq gorge in a moment that has stunned travellers for centuries. Beyond the Treasury lies an entire ancient metropolis to explore — colonnaded streets, royal tombs, a Roman amphitheatre, and high places of sacrifice set against a landscape of sculpted rock and desert sky.',
     '2024-02-01 09:00:00', 1, 1, 4, 1),

(5,  'Cappadocia, Turkey',
     'Fairy chimneys, cave dwellings, and hot-air balloons at sunrise',
     'Cappadocia is a dreamlike landscape in the heart of Turkey, where millennia of volcanic eruptions and erosion have sculpted the earth into an otherworldly terrain of towering fairy chimneys, honeycombed cliffs, and deep gorges. Early Christian communities carved entire underground cities and frescoed churches into the soft tuff rock, many of which remain beautifully preserved today. The region is most famous for its hot-air balloon flights at dawn, when dozens of colourful balloons drift silently above the valleys as the rising sun bathes the strange formations in warm amber light.',
     '2024-02-10 11:00:00', 1, 2, 5, 1),

(6,  'Angkor Wat, Cambodia',
     'The world\'s largest religious monument rising from the jungle',
     'Angkor Wat is the crowning achievement of the Khmer Empire, a 12th-century temple complex of such scale and beauty that it remains the largest religious monument on Earth. Spread across more than 400 square kilometres of the Cambodian jungle near Siem Reap, the Angkor Archaeological Park contains hundreds of temples, palaces, and hydraulic structures. The main temple of Angkor Wat, with its five iconic towers reflected in the surrounding moat, is best approached at sunrise when the sky shifts from indigo to gold and the stones seem almost to glow with an ancient, timeless warmth.',
     '2024-02-18 08:30:00', 1, 3, 6, 1),

-- -------------------------------------------------------
-- AFRICA (category_id = 2)  |  image_id 7-12
-- -------------------------------------------------------
(7,  'Serengeti, Tanzania',
     'Witness the greatest wildlife spectacle on Earth on the open plains',
     'The Serengeti is the stage for one of nature\'s most extraordinary dramas — the Great Migration, in which over two million wildebeest, zebra, and gazelle move in a continuous clockwise loop across the plains of Tanzania and Kenya in an ancient search for grass and water. The ecosystem teems with life year-round: lion prides rest in the shade of acacia trees, cheetahs scan the golden savannah from termite mounds, and enormous elephant herds move silently at dusk. Few places on Earth offer the same visceral sense of wildness and abundance as the Serengeti.',
     '2024-02-25 09:00:00', 2, 1, 7, 1),

(8,  'Victoria Falls, Zambia/Zimbabwe',
     'The smoke that thunders — the world\'s largest curtain of falling water',
     'Victoria Falls, known locally as Mosi-oa-Tunya — the Smoke That Thunders — is one of the world\'s most powerful natural spectacles. The Zambezi River plunges more than 100 metres into a narrow basalt gorge over a width of nearly two kilometres, generating a permanent cloud of mist and a roar that can be heard from 40 kilometres away. The spray feeds a unique rainforest on the opposite bank, and during peak flood season the sheer volume of water is almost incomprehensible. Visitors can swim in the famous Devil\'s Pool, a natural rock pool on the very lip of the falls.',
     '2024-03-01 08:00:00', 2, 2, 8, 1),

(9,  'Marrakech, Morocco',
     'A sensory feast of ancient medinas, souks, and Saharan gateway magic',
     'Marrakech is a city of perpetual enchantment, a place where the medieval and the modern collide in a riot of colour, scent, and sound. The ancient walled medina, a UNESCO World Heritage Site, is a labyrinth of narrow alleys leading to centuries-old mosques, ornate madrasas, and the legendary Djemaa el-Fna square — where snake charmers, acrobats, storytellers, and food vendors create a nightly spectacle unlike anything else in the world. The souks overflow with hand-woven carpets, beaten copper lanterns, spices, and leatherwork produced by craftspeople using techniques unchanged for generations.',
     '2024-03-08 10:00:00', 2, 3, 9, 1),

(10, 'Mount Kilimanjaro, Tanzania',
     'Africa\'s roof — the world\'s highest free-standing mountain',
     'Mount Kilimanjaro stands alone on the Tanzanian savannah, rising 5,895 metres above sea level to become the highest peak in Africa and the tallest free-standing mountain in the world. Unlike most great peaks, Kilimanjaro requires no technical climbing skill — determined trekkers of reasonable fitness can reach Uhuru Peak on foot via several established routes. The mountain passes through five distinct climate zones on its slopes, from tropical rainforest at the base, through moorland and alpine desert, to the permanent glaciers and ice fields of the summit, offering an experience unlike any other trek on the planet.',
     '2024-03-15 09:00:00', 2, 1, 10, 1),

(11, 'Okavango Delta, Botswana',
     'The world\'s largest inland delta — a pristine wilderness of waterways',
     'The Okavango Delta is one of Africa\'s most extraordinary ecosystems, a vast inland river delta in the middle of the Kalahari Desert where the Okavango River fans out into a maze of channels, lagoons, and floodplains. Each year a seasonal flood transforms the delta into a lush paradise that attracts an astonishing density of wildlife — elephant, buffalo, lion, leopard, wild dog, and hundreds of bird species. Exploration by traditional mokoro dugout canoe, gliding silently through papyrus-lined waterways while hippos surface nearby, is among the most intimate and magical wildlife experiences in Africa.',
     '2024-03-22 08:00:00', 2, 2, 11, 1),

(12, 'Sahara Desert, Algeria',
     'Endless golden dunes and star-filled skies in the world\'s greatest desert',
     'The Sahara is the largest hot desert on Earth, a vast ocean of sand, rock, and silence that stretches across eleven countries of North Africa. The towering dunes of the Algerian Sahara — some rising over 180 metres — are among the most photogenic landscapes on the planet, their colours shifting from pale gold at midday to deep amber and crimson at sunset. Camel caravans still cross this ancient landscape, following routes used by traders for thousands of years. At night, far from any artificial light, the Saharan sky explodes with stars in a display of celestial brilliance that few environments on Earth can match.',
     '2024-03-29 09:00:00', 2, 3, 12, 1),

-- -------------------------------------------------------
-- EUROPE (category_id = 3)  |  image_id 13-18
-- -------------------------------------------------------
(13, 'Santorini, Greece',
     'Iconic whitewashed villages perched above a dramatic volcanic caldera',
     'Santorini is perhaps the most visually striking island in the world, its famous whitewashed buildings and cobalt-blue domed churches clinging to the rim of an ancient submerged volcano above the impossibly blue Aegean Sea. The villages of Oia and Fira offer a perpetual procession of beauty — narrow marble lanes, bougainvillea-draped walls, candlelit restaurants, and the legendary sunsets that draw photographers and romantics from every corner of the globe. Below the cliffs, black and red volcanic beaches, hot springs, and the ruins of the ancient Minoan settlement of Akrotiri wait to be explored.',
     '2024-04-05 09:00:00', 3, 1, 13, 1),

(14, 'Amalfi Coast, Italy',
     'Vertiginous cliffs, pastel villages, and the shimmering Mediterranean',
     'The Amalfi Coast is a fifty-kilometre stretch of the most dramatic and beautiful coastline in Europe, where sheer limestone cliffs plunge directly into turquoise sea and pastel-coloured villages cling impossibly to the rock above. The towns of Positano, Ravello, and Amalfi itself each have their own distinct character — Positano is a cascade of boutiques and terraced cafes, Ravello a hilltop garden sanctuary with views that inspired writers and composers for centuries, and Amalfi a proud historic maritime republic with a magnificent cathedral at its heart. The entire coast is threaded by narrow, hair-raising roads that offer jaw-dropping panoramas at every bend.',
     '2024-04-12 10:00:00', 3, 2, 14, 1),

(15, 'Prague, Czech Republic',
     'A fairy-tale medieval city of towers, bridges, and golden spires',
     'Prague is one of Europe\'s best-preserved medieval cities, a place of such extraordinary architectural beauty that it feels at times like walking through an illuminated manuscript. The historic centre, a UNESCO World Heritage Site, is dominated by the vast Gothic bulk of Prague Castle on the hill above the Vltava River, connected to the Old Town by the iconic Charles Bridge with its avenue of Baroque saints. Below in the winding lanes of Mala Strana, Baroque palaces and intimate wine cellars hide behind ornate doorways, while the Old Town Square with its animated Astronomical Clock draws visitors at every hour of the day.',
     '2024-04-19 09:00:00', 3, 3, 15, 1),

(16, 'Scottish Highlands, Scotland',
     'Mist-covered mountains, ancient castles, and untamed Highland wilderness',
     'The Scottish Highlands are one of the last great wildernesses of Europe, a vast landscape of brooding mountains, mirror-like lochs, plunging glens, and ancient forests that has shaped the mythology and character of an entire nation. The region is home to Ben Nevis, Britain\'s highest peak, and Loch Ness, whose legendary depths have captured imaginations for centuries. Ruined castles emerge from hillsides at every turn — Eilean Donan on its island in a misty loch is perhaps the most photographed in Scotland. The Highlands also offer some of the finest whisky distilleries in the world, set into the landscape as naturally as the heather.',
     '2024-04-26 08:00:00', 3, 1, 16, 1),

(17, 'Dubrovnik, Croatia',
     'The Pearl of the Adriatic — a walled medieval city above a turquoise sea',
     'Dubrovnik is one of the most perfectly preserved medieval walled cities in the world, its honey-coloured limestone ramparts enclosing a car-free historic centre of Baroque churches, marble-paved streets, and Renaissance fountains that tumble down to a harbour of extraordinary clarity and colour. The city walls, walkable in their entirety, offer a continuous panorama of terracotta rooftops, the glittering Adriatic, and the green islands of the Elaphiti archipelago. Beyond the walls, a network of sea kayaking routes, island-hopping ferries, and cliff-diving spots make Dubrovnik as much an outdoor adventure destination as a cultural one.',
     '2024-05-03 09:00:00', 3, 2, 17, 1),

(18, 'Northern Lights, Iceland',
     'Aurora borealis dancing over volcanic landscapes and frozen waterfalls',
     'Iceland is the finest stage in the world for witnessing the Aurora Borealis, the Northern Lights — curtains of green, violet, and white light that ripple and dance across the night sky in a display of natural magic that leaves even seasoned travellers speechless. The island sits directly beneath the auroral oval, and from September to March, clear nights away from Reykjavik offer near-guaranteed sightings. But the Northern Lights are only one of Iceland\'s extraordinary offerings — the Golden Circle tour passes geysers, tectonic fault lines, and roaring waterfalls, while the Ring Road circumnavigates the island through lava fields, black sand beaches, and glacier tongues.',
     '2024-05-10 10:00:00', 3, 3, 18, 1),

-- -------------------------------------------------------
-- ANTARCTICA (category_id = 4)  |  image_id 19-24
-- -------------------------------------------------------
(19, 'Antarctic Peninsula',
     'The gateway to the frozen continent — penguins, icebergs, and silence',
     'The Antarctic Peninsula is the most accessible part of the world\'s most remote continent, a jagged finger of land pointing northward toward South America that offers visitors a breathtaking introduction to the polar world. Zodiac landings on black volcanic beaches reveal colonies of thousands of gentoo and chinstrap penguins entirely unafraid of human visitors. Humpback whales breach between blue-white icebergs of unearthly beauty, leopard seals lounge on ice floes, and the silence — when the wind drops — is more absolute than anywhere else on Earth. The journey across the Drake Passage is itself a rite of passage for serious travellers.',
     '2024-05-17 09:00:00', 4, 1, 19, 1),

(20, 'Ross Ice Shelf, Antarctica',
     'The world\'s largest floating ice shelf — a frozen ocean the size of France',
     'The Ross Ice Shelf is one of the most extraordinary geographical features on Earth, a floating platform of ice larger than France that forms the southern boundary of the Ross Sea in Antarctica. Its ice cliffs, rising up to 50 metres above the waterline and stretching for hundreds of kilometres, present a wall of blue-white ice so vast and so alien that early explorers described it as a landscape without parallel. It was from the edge of the Ross Ice Shelf that both Amundsen and Scott launched their legendary race to the South Pole in 1911, and their huts at McMurdo Sound remain as they were left, perfectly preserved by the polar cold.',
     '2024-05-24 08:00:00', 4, 2, 20, 1),

(21, 'South Georgia Island',
     'A subantarctic wildlife paradise of king penguins and elephant seals',
     'South Georgia is one of the most astonishing wildlife spectacles on the planet, a remote subantarctic island in the South Atlantic that supports the largest king penguin colonies in the world, enormous beaches packed with southern elephant seals, and skies perpetually thick with albatrosses, petrels, and prions. The island has a profound human history too — it was here at Stromness that Ernest Shackleton finally ended his extraordinary journey of survival, staggering into the whaling station after crossing the island\'s glaciated mountains. The rusted remnants of the whaling industry stand alongside the natural beauty in a haunting juxtaposition.',
     '2024-06-01 09:00:00', 4, 3, 21, 1),

(22, 'Weddell Sea, Antarctica',
     'Frozen sea of sapphire icebergs and the world\'s clearest waters',
     'The Weddell Sea lies on the Atlantic side of Antarctica and is considered the most challenging and spectacular body of water in the polar regions, its surface dominated by pack ice for much of the year and its depths holding some of the coldest and clearest water on Earth. In years when the sea ice retreats sufficiently, expedition ships can penetrate far south to encounter icebergs of extraordinary size and colour — ancient glacial ice that has compressed over thousands of years into vivid shades of sapphire, turquoise, and jade. It was in the Weddell Sea that Shackleton\'s ship Endurance was famously crushed by pack ice in 1915.',
     '2024-06-08 08:00:00', 4, 1, 22, 1),

(23, 'Deception Island, Antarctica',
     'An active volcanic caldera you can sail into — and bathe in geothermal pools',
     'Deception Island is one of the most unusual places in Antarctica, an active volcanic caldera whose walls have been breached by the sea to create a natural harbour that ships can sail directly into through a narrow gap in the rock called Neptune\'s Bellows. Inside, the collapsed volcanic crater forms a sheltered bay of dark sand beaches where visitors can dig into the volcanic soil and find water warm enough to bathe in — a surreal experience surrounded by snow and icebergs. The ruins of a British Antarctic Survey station and an old Norwegian whaling operation share the black beaches with colonies of chinstrap penguins, indifferent to history.',
     '2024-06-15 09:00:00', 4, 2, 23, 1),

(24, 'Mount Erebus, Antarctica',
     'The world\'s southernmost active volcano rising from the Ross Ice Shelf',
     'Mount Erebus is the most active volcano in Antarctica and one of the most extraordinary on Earth, a 3,794-metre peak on Ross Island that hosts a persistent lava lake in its summit crater — one of only a handful of such lakes in the world. The volcano is perpetually active, ejecting bombs of lava and emitting plumes of steam and gas that freeze instantly in the polar air to form spectacular ice towers and fumarolic ice caves around the crater rim. First climbed in 1908 during Shackleton\'s Nimrod expedition, Erebus remains a powerful symbol of the raw geological forces that shape this most elemental of continents.',
     '2024-06-22 08:00:00', 4, 3, 24, 1);

-- --------------------------------------------------------
-- Table structure for table `category`
-- --------------------------------------------------------

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `navigation` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `category` (`id`, `name`, `description`, `navigation`) VALUES
(1, 'Asia',        'Ancient traditions, modern wonders, and breathtaking landscapes',  1),
(2, 'Africa',      'Safari plains, ancient cultures, and untamed natural wonders',      1),
(3, 'Europe',      'Timeless cities, coastlines, and centuries of culture',             1),
(4, 'Antarctica',  'The last great wilderness — ice, silence, and raw wonder',          1);

-- --------------------------------------------------------
-- Table structure for table `image`
-- --------------------------------------------------------

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `file` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- All 24 image filenames — upload each to /uploads/
INSERT INTO `image` (`id`, `file`, `alt`) VALUES
-- Asia
(1,  'asia-kyoto.jpg',           'Bamboo grove path in Arashiyama, Kyoto, Japan'),
(2,  'asia-bali.jpg',            'Green terraced rice paddies with a Balinese temple, Bali, Indonesia'),
(3,  'asia-halong.jpg',          'Limestone karst islands rising from emerald waters, Ha Long Bay, Vietnam'),
(4,  'asia-petra.jpg',           'The Treasury carved into rose-red sandstone cliffs, Petra, Jordan'),
(5,  'asia-cappadocia.jpg',      'Hot-air balloons floating over fairy chimneys at sunrise, Cappadocia, Turkey'),
(6,  'asia-angkor.jpg',          'Angkor Wat temple reflected in a still pool at sunrise, Cambodia'),
-- Africa
(7,  'africa-serengeti.jpg',     'Wildebeest migration crossing the Mara River on the Serengeti plains, Tanzania'),
(8,  'africa-victoria.jpg',      'Victoria Falls thundering into the Zambezi Gorge, Zambia and Zimbabwe'),
(9,  'africa-marrakech.jpg',     'Colourful spice market stalls in the souks of Marrakech, Morocco'),
(10, 'africa-kilimanjaro.jpg',   'Snow-capped summit of Mount Kilimanjaro above the clouds, Tanzania'),
(11, 'africa-okavango.jpg',      'Mokoro dugout canoe gliding through channels of the Okavango Delta, Botswana'),
(12, 'africa-sahara.jpg',        'Vast golden sand dunes of the Sahara Desert at sunset, Algeria'),
-- Europe
(13, 'europe-santorini.jpg',     'Whitewashed buildings and blue domes above the Aegean caldera, Santorini, Greece'),
(14, 'europe-amalfi.jpg',        'Colourful village of Positano cascading down cliffs to the Mediterranean, Italy'),
(15, 'europe-prague.jpg',        'Charles Bridge and Gothic spires of Prague Castle reflected in the Vltava River, Czech Republic'),
(16, 'europe-highlands.jpg',     'Mist over a Highland loch with a ruined castle, Scotland'),
(17, 'europe-dubrovnik.jpg',     'Medieval walled city of Dubrovnik above the Adriatic Sea, Croatia'),
(18, 'europe-iceland.jpg',       'Green and violet Northern Lights aurora over a snowy Icelandic landscape'),
-- Antarctica
(19, 'ant-peninsula.jpg',        'Gentoo penguins on a black volcanic beach with icebergs, Antarctic Peninsula'),
(20, 'ant-ross-shelf.jpg',       'Towering blue-white ice cliffs of the Ross Ice Shelf, Antarctica'),
(21, 'ant-south-georgia.jpg',    'Thousands of king penguins on a beach at South Georgia Island'),
(22, 'ant-weddell.jpg',          'Massive sapphire-blue iceberg floating in the Weddell Sea, Antarctica'),
(23, 'ant-deception.jpg',        'Black volcanic sand beach inside the caldera of Deception Island, Antarctica'),
(24, 'ant-erebus.jpg',           'Steam plume rising from Mount Erebus volcano above the Ross Ice Shelf, Antarctica');

-- --------------------------------------------------------
-- Table structure for table `member`
-- --------------------------------------------------------

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `forename` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `member` (`id`, `forename`, `surname`, `email`, `password`, `joined`, `picture`) VALUES
(1, 'Sofia',  'Reyes',  'sofia@travelguide.link',  'tr4v-so01-gu1d-e001', '2024-01-01 08:00:00', NULL),
(2, 'Kenji',  'Tanaka', 'kenji@travelguide.link',  'tr4v-ke02-gu1d-e002', '2024-01-02 09:00:00', NULL),
(3, 'Amara',  'Osei',   'amara@travelguide.link',  'tr4v-am03-gu1d-e003', '2024-01-03 10:00:00', NULL);

-- --------------------------------------------------------
-- Indexes
-- --------------------------------------------------------

ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `author_id` (`member_id`),
  ADD KEY `image_id` (`image_id`);

ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

-- --------------------------------------------------------
-- AUTO_INCREMENT
-- --------------------------------------------------------

ALTER TABLE `article`  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
ALTER TABLE `category` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `image`    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
ALTER TABLE `member`   MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- --------------------------------------------------------
-- Constraints
-- --------------------------------------------------------

ALTER TABLE `article`
  ADD CONSTRAINT `category_exists` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `image_exists`    FOREIGN KEY (`image_id`)    REFERENCES `image` (`id`),
  ADD CONSTRAINT `member_exists`   FOREIGN KEY (`member_id`)   REFERENCES `member` (`id`);
