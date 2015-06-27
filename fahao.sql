CREATE TABLE `v9_content_index` (
    `contentid` bigint(20) NOT NULL AUTO_INCREMENT,
    `catid` int(11) NOT NULL,
    `modelid` int(11) NOT NULL,
    `siteid` int(11) NOT NULL,
    PRIMARY KEY (`contentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
