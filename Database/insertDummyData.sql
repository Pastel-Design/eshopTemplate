INSERT INTO
    `image` (`id`, `name`, `data_type`)
VALUES
    (NULL, 'f12ad88eb24e7430596756a70364ce56', 'jpg'),
    (NULL, '2cd324f30dc548396570da4e637c53ee', 'jpg'),
    (NULL, 'c3a193e2705d9f116ba4707e1e0f936b', 'jpg'),
    (NULL, 'f1267c53b7b94232d731e7e530fb3aa5', 'jpg'),
    (NULL, '80613c7cff11658d57aa234f075f1154', 'jpg');

INSERT INTO
    `category` (
        `id`,
        `name`,
        `dash_name`,
        `active`,
        `main_category`,
        `short_desc`,
        `long_desc`,
        `category_id`,
        `image_id`
    )
VALUES
    (
        NULL,
        'Notebooky, Počítače',
        'notebooky-pocitace',
        1,
        1,
        'Notebooky a počítače',
        'Notebooky a počítače',
        NULL,
        1
    ),
    (
        NULL,
        'Telefony, Tablety',
        'telefony-tablety',
        1,
        1,
        'Telefony, tablety a mobilní zařízení',
        'Telefony, tablety a mobilní zařízení',
        NULL,
        2
    ),
    (
        NULL,
        'Notebooky',
        'notebooky',
        1,
        1,
        'Notebooky a netbooky',
        'Notebooky a netbooky',
        1,
        3
    ),
    (
        NULL,
        'Počítače',
        'pocitace',
        1,
        0,
        'Herní a kancelářské počítače',
        'Herní a kancelářské počítače',
        1,
        4
    ),
    (
        NULL,
        'Telefony',
        'telefony',
        1,
        0,
        'Telefony a mobilní zařízení',
        'Telefony a mobilní zařízení',
        2,
        5
    );

INSERT INTO
    `product`(
        `id`,
        `name`,
        `dash_name`,
        `longdesc`,
        `shortdesc`,
        `price`,
        `dph`,
        `active`,
        `amount`,
        `rating`,
        `category_id`
    )
VALUES
    (
        NULL,
        'OMEN by HP 15-dc1110nc, černá',
        'omen-by-hp-15-dc1110nc-cerna',
        'Výkonný herní notebook společnosti HP, displej 15,6“ FullHD 60Hz IPS s úpravou proti odleskům, procesor Intel Core i7-9750H (2,6 GHz až 4,5 GHz, 12 MB mezipaměti, 6 jader), paměť 16 GB DDR4 2666 MHz, čipset Intel HM370, datové úložiště 1 TB M.2 SSD PCIe NVMe, grafická karta NVIDIA GeForce RTX 2060 (6GB GDDR6), RGB podsvícená klávesnice, bez mechaniky, webkamera 720p, 2 reproduktory a integrovaný mikrofon, čtečka SD paměťových karet, Wi-Fi 6 (2x2), Bluetooth 5.0, konektory: 1x USB-C (podpora DP 1.2), 3x USB 3.2 Gen1, 2x 3,5 mm jack (pro headsety/mikrofon), 1x HDMI 2.0, 1x mini DisplayPort, 1x GLAN; OS Windows 10 Home.',
        'Výkonný herní notebook společnosti HP, displej 15,6“ FullHD 60Hz IPS s úpravou proti odleskům.',
        36490,
        21,
        1,
        15,
        4,
        3
    ),
    (
        NULL,
        'Lenovo Legion Y540-17IRH, černá',
        'lenovo-legion-y540-17irh-cerna',
        'Herní notebook pro skvělé zážitky z mobilního hraní a zábavy. 4jádrový procesor Intel Core i5-9300H (2.4GHz, TB 4.1GHz, HyperThreading); 16GB RAM DDR4; 17.3“ 144Hz IPS Full HD displej s rozlišením 1920 x 1080 bodů; grafika NVIDIA GeForce RTX 2060 6GB GDDR6; disk 512GB SSD M.2 PCIe NVMe; bez mechaniky; Wi-Fi ac, GLAN, Bluetooth 4.2, 3x USB 3.0/3.1/3.2 Gen 1, USB Type-C 3.1/3.2 Gen 1, HDMI, mini DisplayPort, HD kamera, reproduktory Harman a zvuk Dolby Atmos, podsvícená klávesnice, operační systém Windows 10 Home.',
        'Herní notebook pro skvělé zážitky z mobilního hraní a zábavy. 4jádrový procesor Intel Core i5-9300H',
        34989,
        21,
        1,
        15,
        4,
        3
    ),
    (
        NULL,
        'OMEN by HP Obelisk 875-1000nc, černá',
        'omen-by-hp-obelisk-875-1000nc-cerna',
        'Excelentní herní počítač s vysokým výkonem ve stylovém herním designu s LED osvětlením. 6jádrový procesor Intel Core i5-9400F (2.9GHz, TB 4.1GHz), operační paměť 16GB DDR4, grafická karta NVIDIA GeForce RTX 2060 6GB GDDR6, pevné disky 512GB PCIe NVMe M.2 SSD a 1TB HDD, bez mechaniky, GLAN, WiFi ac, Bluetooth 4.2, USB Type-C, DisplayPort, HDMI, DVI, zvuk DTS Studio Sound a DTS Headphone:X, klávesnice a myš, OS Windows 10 Home.',
        'Excelentní herní počítač s vysokým výkonem ve stylovém herním designu s LED osvětlením.',
        29999,
        21,
        1,
        15,
        4,
        4
    ),
    (
        NULL,
        'MSI Trident 3 8RC-024EU, černá',
        'msi-trident-3-8rc-024eu-cerna',
        'Herní počítač v kompaktním provedení velikosti herní konzole s řadou pokročilých technologií pro dokonalý zážitek při hře. 6jádrový procesor Intel Core i7-8700 (3.2GHz, TB 4.6GHz, HyperThreading); 16GB RAM DDR4; grafika NVIDIA GeForce GTX 1060 6GB GDDR5; pevné disky 128GB M.2 NVMe PCIe SSD a 1TB HDD; bez mechaniky; Wi-Fi ac, GLAN, USB 2.0 a 3.0/3.1 Gen 1 včetně Type-C, zvukové technologie Audio Boost 3 a Nahimic 3; systém chlazení Silent Storm 2, RGB osvětlení Mystic Light, operační systém Windows 10 Home. ',
        'Herní počítač v kompaktním provedení velikosti herní konzole s řadou pokročilých technologií pro dokonalý zážitek při hře.',
        32991,
        21,
        1,
        15,
        4,
        4
    ),
    (
        NULL,
        'Samsung Galaxy S20+, 8GB/128GB, Cosmic Black',
        'samsung-galaxy-s20-8gb-128gb-cosmic-black',
        'Prémiový chytrý telefon řady Galaxy S, který přináší vylepšené fotoaparáty, superrychlý 120Hz displej, skvělý výkon a nové funkce. 6.7“ displej Dynamic AMOLED 2X Infinity-O s rozlišením 3200 x 1440 bodů, 8jádrový procesor Exynos 990, 8GB operační paměti, 128GB interní paměť, slot pro paměťové karty microSD; fotoaparáty: zadní Ultra Wide: 12 Mpx, F2.2 (120˚) + Wide-angle: 12 Mpx, F1.8 (79˚), Super Speed Dual Pixel AF, OIS + Telephoto: 64 Mpx, PDAF, F2.0 (76˚), OIS + DepthVision: snímač hloubky, přední 10 Mpx F2.2 AF, LTE cat.20, Bluetooth 5.0, NFC, WiFi ac/ax, GPS/Glonass/BDS/Galileo, USB Type-C, podpora bezdrátového nabíjení a sdílení energie Qi, rychlé nabíjení, čtečka otisků prstů v displeji, odolné provedení IP68, podpora DeX, zvuk AKG, 4500 mAh baterie, platforma Android 10 s One UI 2.',
        'Prémiový chytrý telefon řady Galaxy S, který přináší vylepšené fotoaparáty, superrychlý 120Hz displej, skvělý výkon a nové funkce',
        21990,
        21,
        1,
        15,
        4,
        5
    ),
    (
        NULL,
        'Apple iPhone 7, 32GB, Silver',
        'apple-iphone-7-32gb-silver',
        'Sedmá generace iPhone s řadou skvělých vylepšení, 4,7“ Retina displej s širokým barevným gamutem a 3D Touch, rozlišení 1334 x 750 bodů, čip A10 Fusion až s dvojnásobným výkonem než iPhone 6, 32 GB interní paměti, 12MP fotoaparát s clonou ƒ/1,8 a optickou stabilizací, 7MP FaceTime HD kamera, Touch ID. 4G LTE. Bluetooth 4.2, NFC, Wi-Fi ac, aGPS/Glonass, rozhraní Lightning, delší výdrž baterie, stereo zvuk, odolnost proti vodě a prachu IP67, operační systém iOS 10.',
        'Sedmá generace iPhone s řadou skvělých vylepšení, 4,7“ Retina displej s širokým barevným gamutem a 3D Touch',
        8890,
        21,
        1,
        15,
        4,
        5
    );

INSERT INTO
    `image` (`id`, `name`, `data_type`)
VALUES
    (NULL, 'ntb10', 'jpg'),
    (NULL, 'ntb11', 'jpg'),
    (NULL, 'ntb20', 'jpg'),
    (NULL, 'ntb21', 'jpg'),
    (NULL, 'pc10', 'jpg'),
    (NULL, 'pc11', 'jpg'),
    (NULL, 'pc20', 'jpg'),
    (NULL, 'pc21', 'jpg'),
    (NULL, 'ph10', 'jpg'),
    (NULL, 'ph11', 'jpg'),
    (NULL, 'ph20', 'jpg'),
    (NULL, 'ph21', 'jpg');

INSERT INTO
    `image_has_product`(`image_id`, `product_id`, `main_image`)
VALUES
    (6, 1, 1),
    (7, 1, 0),
    (8, 2, 1),
    (9, 2, 0),
    (10, 3, 1),
    (11, 3, 0),
    (12, 4, 1),
    (13, 4, 0),
    (14, 5, 1),
    (15, 5, 0),
    (16, 6, 1),
    (17, 6, 0);