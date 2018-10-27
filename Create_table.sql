CREATE TABLE `smdr` (
	`CallStart` DATETIME NULL DEFAULT NULL,
	`ConnectedTime` TIME NULL DEFAULT NULL,
	`RingTime` INT(11) NULL DEFAULT NULL,
	`Caller` VARCHAR(50) NULL DEFAULT NULL,
	`Direction` VARCHAR(50) NULL DEFAULT NULL,
	`CalledNumber` VARCHAR(50) NULL DEFAULT NULL,
	`DialledNumber` VARCHAR(50) NULL DEFAULT NULL,
	`Account` VARCHAR(50) NULL DEFAULT NULL,
	`IsInternal` VARCHAR(50) NULL DEFAULT NULL,
	`CallID` VARCHAR(50) NULL DEFAULT NULL,
	`Continuation` VARCHAR(50) NULL DEFAULT NULL,
	`timestamp` VARCHAR(50) NULL DEFAULT NULL,
	`extension` VARCHAR(50) NULL DEFAULT NULL,
	`dialednumber` VARCHAR(50) NULL DEFAULT NULL,
	`duration` VARCHAR(50) NULL DEFAULT NULL,
	`cond` VARCHAR(50) NULL DEFAULT NULL,
	`frl` VARCHAR(50) NULL DEFAULT NULL,
	`Party1Device` VARCHAR(50) NULL DEFAULT NULL,
	`Party1Name` VARCHAR(50) NULL DEFAULT NULL,
	`Party2Device` VARCHAR(50) NULL DEFAULT NULL,
	`Party2Name` VARCHAR(50) NULL DEFAULT NULL,
	`HoldTime` VARCHAR(50) NULL DEFAULT NULL,
	`ParkTime` VARCHAR(50) NULL DEFAULT NULL,
	`AuthValid` VARCHAR(50) NULL DEFAULT NULL,
	`AuthCode` VARCHAR(50) NULL DEFAULT NULL,
	`UserCharged` VARCHAR(50) NULL DEFAULT NULL,
	`CallCharge` VARCHAR(50) NULL DEFAULT NULL,
	`Currency` VARCHAR(50) NULL DEFAULT NULL,
	`AmountatLastUserChange` VARCHAR(50) NULL DEFAULT NULL,
	`CallUnits` VARCHAR(50) NULL DEFAULT NULL,
	`UnitsatLastUserChange` VARCHAR(50) NULL DEFAULT NULL,
	`CostperUnit` VARCHAR(50) NULL DEFAULT NULL,
	`MarkUp` VARCHAR(50) NULL DEFAULT NULL,
	`ExternalTargetingCause` VARCHAR(50) NULL DEFAULT NULL,
	`ExternalTargeterId` VARCHAR(50) NULL DEFAULT NULL,
	`ExternalTargetedNumber` VARCHAR(50) NULL DEFAULT NULL
)

CREATE TABLE `cdr` (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`calldate` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
	`clid` VARCHAR(80) NOT NULL DEFAULT '',
	`src` VARCHAR(80) NOT NULL DEFAULT '' COMMENT 'Кто звонил',
	`dst` VARCHAR(80) NOT NULL DEFAULT '' COMMENT 'Куда звонил',
	`realdst` VARCHAR(80) NOT NULL DEFAULT '',
	`dcontext` VARCHAR(80) NOT NULL DEFAULT '',
	`channel` VARCHAR(80) NOT NULL DEFAULT '',
	`dstchannel` VARCHAR(80) NOT NULL DEFAULT '',
	`lastapp` VARCHAR(80) NOT NULL DEFAULT '',
	`lastdata` VARCHAR(80) NOT NULL DEFAULT '',
	`start` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Начало звонка',
	`answer` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Начало разговора',
	`end` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Конец звонка',
	`duration` INT(11) NOT NULL DEFAULT '0' COMMENT 'Продолжительность',
	`billsec` INT(11) NOT NULL DEFAULT '0',
	`disposition` VARCHAR(45) NOT NULL DEFAULT '',
	`amaflags` INT(11) NOT NULL DEFAULT '0',
	`remoteip` VARCHAR(60) NOT NULL DEFAULT '',
	`accountcode` VARCHAR(20) NOT NULL DEFAULT '',
	`peeraccount` VARCHAR(20) NOT NULL DEFAULT '',
	`uniqueid` VARCHAR(32) NOT NULL DEFAULT '',
	`userfield` VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Комментарий',
	`did` VARCHAR(50) NOT NULL DEFAULT '',
	`linkedid` VARCHAR(32) NOT NULL DEFAULT '',
	`sequence` INT(11) NOT NULL DEFAULT '0',
	`filename` VARCHAR(255) NULL DEFAULT 'none' COMMENT 'Путь к записи',
	PRIMARY KEY (`id`),
	INDEX `calldate` (`calldate`),
	INDEX `src` (`src`),
	INDEX `dst` (`dst`),
	INDEX `accountcode` (`accountcode`),
	INDEX `uniqueid` (`uniqueid`),
	INDEX `dcontext` (`dcontext`),
	INDEX `clid` (`clid`),
	INDEX `did` (`did`)
)

COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
