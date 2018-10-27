CREATE TRIGGER `smdr_after_insert` AFTER INSERT ON `smdr` FOR EACH ROW BEGIN
INSERT INTO `cdr`
   ( `calldate`,
	`clid`,
	`src`,
	`dst`,
	`start`,
	`answer`,
	`end`,
	`duration`, `userfield`)
   VALUES
   ( NEW.CallStart,'',NEW.Caller,NEW.CalledNumber,NEW.CallStart,NEW.HoldTime,NEW.duration, NEW.Party1Name
);
END
