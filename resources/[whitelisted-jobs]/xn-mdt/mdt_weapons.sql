CREATE TABLE IF NOT EXISTS `mdt_weapons` (
  `serial` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `description` text NOT NULL DEFAULT '',
  PRIMARY KEY (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
