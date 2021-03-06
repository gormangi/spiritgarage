CREATE TABLE `TB_BLOG_RSS` (
  `BLOG_RSS_SEQ` varchar(50) NOT NULL,
  `AUTHOR` varchar(100) NOT NULL,
  `CATEGORY` varchar(100) NOT NULL,
  `TITLE` varchar(2000) NOT NULL,
  `LINK` varchar(300) NOT NULL,
  `DESCRIPTION` varchar(3000) NOT NULL,
  `PUB_DATE` datetime NOT NULL,
  `USE_YN` char(1) NOT NULL,
  `REG_DATE` datetime NOT NULL,
  `UPT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`BLOG_RSS_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TB_MNGR` (
  `MNGR_SEQ` varchar(50) NOT NULL,
  `ID` varchar(100) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `PASSWORD_KEY` varchar(200) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `USE_YN` char(1) NOT NULL,
  `REG_DATE` datetime DEFAULT NULL,
  `UPT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`MNGR_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TB_RESERVATION` (
  `RESERVATION_SEQ` varchar(50) NOT NULL,
  `RESERVATION_DATE` datetime NOT NULL,
  `RESERVATION_NAME` varchar(100) NOT NULL,
  `PHONE` varchar(13) NOT NULL,
  `CHOOSE_AREA` varchar(1000) NOT NULL,
  `RESERVATION_CONTENT` text DEFAULT NULL,
  `USE_YN` char(1) NOT NULL,
  `REG_DATE` datetime DEFAULT NULL,
  `UPT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`RESERVATION_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TB_MAINTENANCE_AREA` (
  `MAINTENANCE_AREA_SEQ` varchar(50) NOT NULL,
  `MAINTENANCE_NAME` varchar(100) NOT NULL,
  `REG_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`MAINTENANCE_AREA_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TB_NOTICE` (
  `NOTICE_SEQ` varchar(50) NOT NULL,
  `TITLE` varchar(300) NOT NULL,
  `CONTENT` text NOT NULL,
  `MAIN_VIEW_YN` char(1) NOT NULL,
  `REG_MNGR_ID` varchar(100) NOT NULL,
  `REG_DATE` datetime NOT NULL,
  `UPT_MNGR_ID` varchar(100) NOT NULL,
  `UPT_DATE` datetime NOT NULL,
  PRIMARY KEY (`NOTICE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TB_FILE` (
  `FILE_SEQ` varchar(50) NOT NULL,
  `POST_SEQ` varchar(50) NOT NULL,
  `ORIGIN_FILE_NAME` varchar(200) NOT NULL,
  `EXTENSION_NAME` varchar(10) NOT NULL,
  `FILE_SIZE` int(100) NOT NULL,
  `SAVE_FILE_NAME` varchar(200) NOT NULL,
  `SAVE_FILE_PATH` varchar(300) NOT NULL,
  `FILE_URL` varchar(100) NOT NULL,
  `FILE_KIND` varchar(100) NOT NULL,
  `REG_ID` varchar(100) NOT NULL,
  `REG_DATE` datetime NOT NULL,
  PRIMARY KEY (`FILE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TB_MAIN_SLIDE` (
  `MAIN_SLIDE_SEQ` varchar(50) NOT NULL,
  `SLIDE_DV` char(1) NOT NULL,
  `TOP_TEXT` varchar(100) DEFAULT NULL,
  `MIDDLE_TEXT` varchar(100) DEFAULT NULL,
  `BOTTOM_TEXT` varchar(100) DEFAULT NULL,
  `RESERVATION_BTN_YN` char(1) NOT NULL,
  `MAINTENANCE_HISTORY_BTN_YN` char(1) NOT NULL,
  `MAIN_SLIDE_ORDER` int(11) NOT NULL,
  `REG_DATE` datetime DEFAULT NULL,
  `UPT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`MAIN_SLIDE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TB_BLOG_CATEGORY` (
  `BLOG_CATEGORY_SEQ` varchar(50) NOT NULL,
  `CATEGORY` varchar(100) NOT NULL,
  `DISPLAY_YN` char(1) NOT NULL,
  `REG_DATE` datetime NOT NULL,
  `UPT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`BLOG_CATEGORY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TB_MAINTENANCE_HISTORY` (
  `MAINTENANCE_HISTORY_SEQ` varchar(50) NOT NULL,
  `PHONE` varchar(13) NOT NULL,
  `CAR_REG_NUM` varchar(8) NOT NULL,
  `NAME` varchar(10) DEFAULT NULL,
  `CAR_REG_DATE` datetime DEFAULT NULL,
  `MAINTENANCE_REQUEST_DATE` datetime DEFAULT NULL,
  `DISTANCE_DRIVEN` varchar(20) DEFAULT NULL,
  `PAYMENT` varchar(20) DEFAULT NULL,
  `REG_MNGR_ID` varchar(100) NOT NULL,
  `REG_DATE` datetime NOT NULL,
  `UPT_MNGR_ID` varchar(100) DEFAULT NULL,
  `UPT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`MAINTENANCE_HISTORY_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TB_MAINTENANCE_HISTORY_DETAIL` (
  `MAINTENANCE_HISTORY_DETAIL_SEQ` varchar(50) NOT NULL,
  `MAINTENANCE_HISTORY_SEQ` varchar(50) NOT NULL,
  `MAINTENANCE_DV` varchar(100) DEFAULT NULL,
  `WORK_CONTENT` varchar(2000) NOT NULL,
  `PARTS_CLASS` char(1) NOT NULL,
  `REG_DATE` datetime NOT NULL,
  PRIMARY KEY (`MAINTENANCE_HISTORY_DETAIL_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `TB_RESERVATION_NOT_POSSIBLE` (
  `NOT_POSSIBLE_SEQ` varchar(50) NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `REASON` varchar(1000) DEFAULT NULL,
  `REG_MNGR_ID` varchar(100) NOT NULL,
  `REG_DATE` datetime NOT NULL,
  `UPT_MNGR_ID` varchar(100) DEFAULT NULL,
  `UPT_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`NOT_POSSIBLE_SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;