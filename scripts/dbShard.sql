CREATE DATABASE  IF NOT EXISTS `dbShard` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbShard`;


DROP TABLE IF EXISTS `bonus`;
CREATE TABLE `bonus` (
  `guildId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `alltime` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `week` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `changeDate` bigint(20) NOT NULL DEFAULT '0',
  `addDate` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildId`,`userId`),
  KEY `guildId` (`guildId`)
);

DROP TABLE IF EXISTS `guild`;
CREATE TABLE `guild` (
  `guildId` bigint(20) NOT NULL,
  `prefix` varchar(32) NOT NULL DEFAULT 'ar!',
  `tokens` int(11) NOT NULL DEFAULT '0',
  `tokensBurned` int(11) NOT NULL DEFAULT '0',
  `voteTag` varchar(56) NOT NULL DEFAULT 'likes',
  `voteEmote` varchar(128) NOT NULL DEFAULT ':heart:',
  `bonusTag` varchar(56) NOT NULL DEFAULT 'bonus',
  `bonusEmote` varchar(128) NOT NULL DEFAULT ':trophy:',
  `entriesPerPage` smallint(6) NOT NULL DEFAULT '12',
  `textXp` tinyint(4) NOT NULL DEFAULT '1',
  `voiceXp` tinyint(4) NOT NULL DEFAULT '1',
  `inviteXp` tinyint(4) NOT NULL DEFAULT '1',
  `voteXp` tinyint(4) NOT NULL DEFAULT '1',
  `notifyLevelupDm` tinyint(4) NOT NULL DEFAULT '0',
  `notifyLevelupCurrentChannel` tinyint(4) NOT NULL DEFAULT '0',
  `notifyLevelupWithRole` tinyint(4) NOT NULL DEFAULT '1',
  `takeAwayAssignedRolesOnLevelDown` tinyint(4) NOT NULL DEFAULT '0',
  `textMessageCooldownSeconds` smallint(6) NOT NULL DEFAULT '0',
  `xpPerVoiceMinute` smallint(6) NOT NULL DEFAULT '3',
  `xpPerTextMessage` smallint(6) NOT NULL DEFAULT '6',
  `xpPerVote` smallint(6) NOT NULL DEFAULT '30',
  `xpPerInvite` smallint(6) NOT NULL DEFAULT '100',
  `xpPerBonus` smallint(6) NOT NULL DEFAULT '10',
  `bonusPerTextMessage` smallint(6) NOT NULL DEFAULT '6',
  `bonusPerVoiceMinute` smallint(6) NOT NULL DEFAULT '3',
  `bonusPerVote` smallint(6) NOT NULL DEFAULT '20',
  `bonusPerInvite` smallint(6) NOT NULL DEFAULT '100',
  `bonusUntilDate` bigint(20) NOT NULL DEFAULT '0',
  `levelFactor` int(11) NOT NULL DEFAULT '100',
  `voteCooldownSeconds` int(11) NOT NULL DEFAULT '1800',
  `reactionVote` tinyint(4) NOT NULL DEFAULT '1',
  `allowMutedXp` tinyint(4) NOT NULL DEFAULT '1',
  `allowDeafenedXp` tinyint(4) NOT NULL DEFAULT '1',
  `allowSoloXp` tinyint(4) NOT NULL DEFAULT '1',
  `allowInvisibleXp` tinyint(4) NOT NULL DEFAULT '1',
  `serverJoinMessage` varchar(1024) NOT NULL DEFAULT '',
  `serverLeaveMessage` varchar(1024) NOT NULL DEFAULT '',
  `levelupMessage` varchar(2048) NOT NULL DEFAULT '',
  `roleAssignMessage` varchar(1024) NOT NULL DEFAULT '',
  `roleDeassignMessage` varchar(1024) NOT NULL DEFAULT '',
  `voiceChannelJoinMessage` varchar(512) NOT NULL DEFAULT '',
  `voiceChannelLeaveMessage` varchar(512) NOT NULL DEFAULT '',
  `showNicknames` tinyint(4) NOT NULL DEFAULT '0',
  `commandOnlyChannel` bigint(20) NOT NULL DEFAULT '0',
  `autopost_levelup` bigint(20) NOT NULL DEFAULT '0',
  `autopost_serverJoin` bigint(20) NOT NULL DEFAULT '0',
  `autopost_serverLeave` bigint(20) NOT NULL DEFAULT '0',
  `autopost_voiceChannelJoin` bigint(20) NOT NULL DEFAULT '0',
  `autopost_voiceChannelLeave` bigint(20) NOT NULL DEFAULT '0',
  `autoname_totalUserCount` bigint(20) NOT NULL DEFAULT '0',
  `autoname_onlineUserCount` bigint(20) NOT NULL DEFAULT '0',
  `autoname_activeUsersLast24h` bigint(20) NOT NULL DEFAULT '0',
  `autoname_serverJoinsLast24h` bigint(20) NOT NULL DEFAULT '0',
  `autoname_serverLeavesLast24h` bigint(20) NOT NULL DEFAULT '0',
  `lastCommandDate` bigint(20) NOT NULL DEFAULT '0',
  `lastTokenBurnDate` bigint(20) NOT NULL DEFAULT '0',
  `joinedAtDate` bigint(20) NOT NULL DEFAULT '0',
  `leftAtDate` bigint(20) NOT NULL DEFAULT '0',
  `addDate` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildId`)
);

DROP TABLE IF EXISTS `guildChannel`;
CREATE TABLE `guildChannel` (
  `guildId` bigint(20) NOT NULL,
  `channelId` bigint(20) NOT NULL,
  `noXp` tinyint(4) NOT NULL DEFAULT '0',
  `noCommand` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildId`,`channelId`)
);


DROP TABLE IF EXISTS `guildMember`;
CREATE TABLE `guildMember` (
  `guildId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `notifyLevelupDm` tinyint(4) NOT NULL DEFAULT '1',
  `tokensBurned` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildId`,`userId`)
);

DROP TABLE IF EXISTS `guildRole`;
CREATE TABLE `guildRole` (
  `guildId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  `assignLevel` int(11) NOT NULL DEFAULT '0',
  `deassignLevel` int(11) NOT NULL DEFAULT '0',
  `assignMessage` varchar(1024) NOT NULL DEFAULT '',
  `deassignMessage` varchar(1024) NOT NULL DEFAULT '',
  `noXp` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildId`,`roleId`)
);

DROP TABLE IF EXISTS `textMessage`;
CREATE TABLE `textMessage` (
  `guildId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `channelId` bigint(20) NOT NULL,
  `alltime` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `week` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `changeDate` bigint(20) NOT NULL DEFAULT '0',
  `addDate` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildId`,`userId`,`channelId`)
);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` bigint(20) NOT NULL,
  `tokens` int(11) NOT NULL DEFAULT '10',
  `tokensBought` int(11) NOT NULL DEFAULT '0',
  `voteMultiplier` int(11) NOT NULL DEFAULT '1',
  `voteMultiplierUntil` bigint(20) NOT NULL DEFAULT '0',
  `lastAskForPremiumDate` bigint(20) NOT NULL DEFAULT '0',
  `addDate` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`)
);

DROP TABLE IF EXISTS `voiceMinute`;
CREATE TABLE `voiceMinute` (
  `guildId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `channelId` bigint(20) NOT NULL,
  `alltime` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `week` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `changeDate` bigint(20) NOT NULL DEFAULT '0',
  `addDate` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildId`,`userId`,`channelId`)
);

DROP TABLE IF EXISTS `vote`;
CREATE TABLE `vote` (
  `guildId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `alltime` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `week` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `changeDate` bigint(20) NOT NULL DEFAULT '0',
  `addDate` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildId`,`userId`)
);

DROP TABLE IF EXISTS `invite`;
CREATE TABLE `invite` (
  `guildId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `alltime` int(11) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `week` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL DEFAULT '0',
  `changeDate` bigint(20) NOT NULL DEFAULT '0',
  `addDate` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildId`,`userId`),
  KEY `guildId` (`guildId`)
);