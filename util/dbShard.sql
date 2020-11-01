SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

USE `dbShard`;

CREATE TABLE `guild` (
	`guildId` BIGINT NOT NULL,
	`prefix` varchar(32) NOT NULL DEFAULT 'ar!',
    `tokens` INT NOT NULL DEFAULT '100',
    `tokensFueled` INT NOT NULL DEFAULT '0',
	`voteTag` varchar(56) NOT NULL DEFAULT 'likes',
	`voteEmote` varchar(128) NOT NULL DEFAULT ':heart:',
    `downvoteEmote` varchar(128) NOT NULL DEFAULT ':x:',
	`bonusTag` varchar(56) NOT NULL DEFAULT 'bonus',
	`bonusEmote` varchar(128) NOT NULL DEFAULT ':trophy:',
	`entriesPerPage` SMALLINT NOT NULL DEFAULT '12',
	`showVoicescore` TINYINT NOT NULL DEFAULT '1',
	`showTextscore` TINYINT NOT NULL DEFAULT '1',
	`showVotescore` TINYINT NOT NULL DEFAULT '1',
	`notifyLevelupDm` TINYINT NOT NULL DEFAULT '0',
	`notifyLevelupCurrentChannel` TINYINT NOT NULL DEFAULT '0',
	`notifyLevelupOnlyWithRole` TINYINT NOT NULL DEFAULT '0',
	`takeAwayAssignedRolesOnLevelDown` TINYINT NOT NULL DEFAULT '0',
    `levelFactor` INT NOT NULL DEFAULT '100',
	`voteCooldownSeconds` INT NOT NULL DEFAULT '1800',
	`textMessageCooldownSeconds` SMALLINT NOT NULL DEFAULT '0',
	`xpPerVoiceMinute` SMALLINT NOT NULL DEFAULT '3',
	`xpPerTextMessage` SMALLINT NOT NULL DEFAULT '6',
	`xpPerVote` SMALLINT NOT NULL DEFAULT '30',
	`xpPerBonus` SMALLINT NOT NULL DEFAULT '1',
	`bonusPerTextMessage` SMALLINT NOT NULL DEFAULT '6',
	`bonusPerVoiceMinute` SMALLINT NOT NULL DEFAULT '3',
	`bonusPerVote` SMALLINT NOT NULL DEFAULT '20',
	`bonusUntilDate` BIGINT NOT NULL DEFAULT '0',
    `allowReactionVotes` TINYINT NOT NULL DEFAULT '0',
	`allowMutedXp` TINYINT NOT NULL DEFAULT '1',
	`allowSoloXp` TINYINT NOT NULL DEFAULT '1',
    `allowDownvotes` TINYINT NOT NULL DEFAULT '1',
	`autopost_levelup` BIGINT NOT NULL DEFAULT '0',
	`autopost_serverJoin` BIGINT NOT NULL DEFAULT '0',
	`autopost_serverLeave` BIGINT NOT NULL DEFAULT '0',
	`autopost_voiceChannelJoin` BIGINT NOT NULL DEFAULT '0',
	`autopost_voiceChannelLeave` BIGINT NOT NULL DEFAULT '0',
    `autoname_totalUserCount` BIGINT NOT NULL DEFAULT '0',
	`autoname_onlineUserCount` BIGINT NOT NULL DEFAULT '0',
	`autoname_activeUsersLast24h` BIGINT NOT NULL DEFAULT '0',
	`autoname_serverJoinsLast24h` BIGINT NOT NULL DEFAULT '0',
	`autoname_serverLeavesLast24h` BIGINT NOT NULL DEFAULT '0',
	`levelupMessage` varchar(2048) NOT NULL DEFAULT '',
	`serverJoinMessage` varchar(1024) NOT NULL DEFAULT '',
	`serverLeaveMessage` varchar(1024) NOT NULL DEFAULT '',
	`voiceChannelJoinMessage` varchar(512) NOT NULL DEFAULT '',
	`voiceChannelLeaveMessage` varchar(512) NOT NULL DEFAULT '',
	`roleAssignmentMessage` varchar(1024) NOT NULL DEFAULT '',
	`roleDeassignmentMessage` varchar(1024) NOT NULL DEFAULT '',
    `lastCommandDate` BIGINT NOT NULL DEFAULT '0',
	`joinedAtDate` BIGINT NOT NULL DEFAULT '0',
	`leftAtDate` BIGINT NOT NULL DEFAULT '0',
    `addDate` BIGINT NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `guildMember` (
  `guildId` BIGINT NOT NULL,
  `userId` BIGINT NOT NULL,
  `notifyLevelupDm` TINYINT NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `guildChannel` (
  `guildId` BIGINT NOT NULL,
  `channelId` BIGINT NOT NULL,
  `noXp` TINYINT NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `guildRole` (
  `guildId` BIGINT NOT NULL,
  `roleId` BIGINT NOT NULL,
  `assignLevel` INT NOT NULL DEFAULT '0',
  `deassignLevel` INT NOT NULL DEFAULT '0',
  `assignMessage` varchar(512) NOT NULL DEFAULT '',
  `deassignMessage` varchar(512) NOT NULL DEFAULT '',
  `noXp` TINYINT NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `textMessage` (
  `guildId` BIGINT NOT NULL,
  `userId` BIGINT NOT NULL,
  `channelId` BIGINT NOT NULL,
  `alltime` INT NOT NULL DEFAULT '0',
  `year` INT NOT NULL DEFAULT '0',
  `month` INT NOT NULL DEFAULT '0',
  `week` INT NOT NULL DEFAULT '0',
  `day` INT NOT NULL DEFAULT '0',
  `changeDate` BIGINT NOT NULL DEFAULT '0',
  `addDate` BIGINT NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `voiceMinute` (
  `guildId` BIGINT NOT NULL,
  `userId` BIGINT NOT NULL,
  `channelId` BIGINT NOT NULL,
  `alltime` INT NOT NULL DEFAULT '0',
  `year` INT NOT NULL DEFAULT '0',
  `month` INT NOT NULL DEFAULT '0',
  `week` INT NOT NULL DEFAULT '0',
  `day` INT NOT NULL DEFAULT '0',
  `changeDate` BIGINT NOT NULL DEFAULT '0',
  `addDate` BIGINT NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `vote` (
  `guildId` BIGINT NOT NULL,
  `userId` BIGINT NOT NULL,
  `alltime` INT NOT NULL DEFAULT '0',
  `year` INT NOT NULL DEFAULT '0',
  `month` INT NOT NULL DEFAULT '0',
  `week` INT NOT NULL DEFAULT '0',
  `day` INT NOT NULL DEFAULT '0',
  `changeDate` BIGINT NOT NULL DEFAULT '0',
  `addDate` BIGINT NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `bonus` (
  `guildId` BIGINT NOT NULL,
  `userId` BIGINT NOT NULL,
  `alltime` INT NOT NULL DEFAULT '0',
  `year` INT NOT NULL DEFAULT '0',
  `month` INT NOT NULL DEFAULT '0',
  `week` INT NOT NULL DEFAULT '0',
  `day` INT NOT NULL DEFAULT '0',
  `changeDate` BIGINT NOT NULL DEFAULT '0',
  `addDate` BIGINT NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user` (
  `userId` BIGINT NOT NULL,
  `lastDblUpvoteDate` BIGINT NOT NULL DEFAULT '0',
  `tokens` INT NOT NULL DEFAULT '10',
  `tokensFueled` INT NOT NULL DEFAULT '0',
  `voteMultiplier` INT NOT NULL DEFAULT '1',
  `voteMultiplierUntil` BIGINT NOT NULL DEFAULT '0',
  `addDate` BIGINT NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

ALTER TABLE `bonus`
  ADD PRIMARY KEY (`guildId`,`userId`),
  ADD KEY `guildId` (`guildId`);

ALTER TABLE `guild`
  ADD PRIMARY KEY (`guildId`);

ALTER TABLE `guildChannel`
  ADD PRIMARY KEY (`guildId`,`channelId`) ;

ALTER TABLE `guildMember`
  ADD PRIMARY KEY (`guildId`,`userId`);

ALTER TABLE `guildRole`
  ADD PRIMARY KEY (`guildId`,`roleId`);

ALTER TABLE `textMessage`
  ADD PRIMARY KEY (`guildId`,`userId`,`channelId`);

ALTER TABLE `voiceMinute`
  ADD PRIMARY KEY (`guildId`,`userId`,`channelId`);

ALTER TABLE `vote`
  ADD PRIMARY KEY (`guildId`,`userId`);

COMMIT;
