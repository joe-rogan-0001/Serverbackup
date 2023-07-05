**Add this to your shared>items.lua**

['plxtab']                              = {['name'] = 'plxtab',                           ['label'] = 'Hakapp',                 ['weight'] = 50,             ['type'] = 'item',         ['image'] = 'Raspberry_Pi.png',         ['unique'] = true,         ['useable'] = true,     ['shouldClose'] = true,       ['combinable'] = nil,   ['description'] = "Should you have this?"},





**This also needs to be stored in the database(?)**
CREATE TABLE IF NOT EXISTS `hacker_job` (
    `identifier` VARCHAR(50) NOT NULL,
    `experience` INT(5) NOT NULL DEFAULT 0,
    `level` INT(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`identifier`)
);
