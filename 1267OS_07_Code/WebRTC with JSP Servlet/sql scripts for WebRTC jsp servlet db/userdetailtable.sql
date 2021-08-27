CREATE TABLE `userdetails` (
  `displayName` varchar(30) DEFAULT NULL,
  `sipuri` varchar(30) NOT NULL DEFAULT '',
  `privateIdentity` varchar(30) NOT NULL DEFAULT '',
  `password` varchar(30) DEFAULT NULL,
  `realm` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sipuri`)
) 

