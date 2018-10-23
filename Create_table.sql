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
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;