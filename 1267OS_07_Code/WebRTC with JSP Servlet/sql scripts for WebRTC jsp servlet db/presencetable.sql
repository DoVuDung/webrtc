CREATE TABLE `presence` (
  `sipuri` varchar(45) NOT NULL,
  `status` varchar(10) DEFAULT 'offline',
  PRIMARY KEY (`sipuri`)
)
