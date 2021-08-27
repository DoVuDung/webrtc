delimiter $$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `webrtccommunicatorv1db`.`addpresence`
AFTER INSERT ON `webrtccommunicatorv1db`.`userdetails`
FOR EACH ROW
begin 
	insert into presence 
	set sipuri=new.sipuri,
	status='offline';
end
$$
