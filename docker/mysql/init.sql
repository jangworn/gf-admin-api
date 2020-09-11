
CREATE DATABASE IF NOT EXISTS `gfadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gfadmin`;

DROP TABLE IF EXISTS `ga_chat_records`;
CREATE TABLE `ga_chat_records` (
  `id` int NOT NULL COMMENT 'id',
  `sender` varchar(100) NOT NULL COMMENT '发送人',
  `receiver` varchar(100) NOT NULL COMMENT '接收人',
  `content` text NOT NULL COMMENT '内容',
  `time` datetime NOT NULL COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天记录';

INSERT INTO `ga_chat_records` (`id`, `sender`, `receiver`, `content`, `time`) VALUES
(1, 'MTIzNDU=', '999', 'DuVmhdAfp2h4jIa1P5O/wQ==', '2020-08-03 14:51:43'),
(2, '999', 'MTIzNDU=', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 14:51:43'),
(3, 'MTIzNDU=', '999', 'DuVmhdAfp2h4jIa1P5O/wQ==', '2020-08-03 14:51:49'),
(4, '999', 'MTIzNDU=', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 14:51:49'),
(5, 'MTIzNDU=', '999', 'xi2Bu9/9dSdmxAV2ywVWFA==', '2020-08-03 14:51:51'),
(6, '999', 'MTIzNDU=', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 14:51:51'),
(7, 'MTIzNDU=', '999', 'Vm9Yrzdo8JeWLVqVgDH/dw==', '2020-08-03 14:51:53'),
(8, '999', 'MTIzNDU=', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 14:51:53'),
(9, 'MTIzNDU2', '999', 'UiWt6oqIepfN5DVoswYo+A==', '2020-08-03 14:51:57'),
(10, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 14:51:57'),
(11, 'MTIzNDU2', '999', '0Yho9edkO0fhNphGRv5kgg==', '2020-08-03 14:51:58'),
(12, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 14:51:58'),
(13, 'MTIzNDU2', '999', '0Yho9edkO0fhNphGRv5kgg==', '2020-08-03 14:51:59'),
(14, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 14:51:59'),
(15, 'MTIzNDU2', '999', 'ld9RyjLvgkSIhIZf/K952A==', '2020-08-03 14:52:00'),
(16, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 14:52:00'),
(17, 'MTIzNDU2', '999', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 14:52:02'),
(18, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 14:52:02'),
(19, 'MTIzNDU2', '999', 'rtWJ+IroxBflbRTrT6pR1HEkuHGLxMZaJZ9DZkVyS+8=', '2020-08-03 14:52:03'),
(20, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 14:52:03'),
(21, 'MTIzNDU=', '999', 'Wgn2jElqOmG6Bv4RWstqZg==', '2020-08-03 21:18:34'),
(22, '999', 'MTIzNDU=', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:18:34'),
(23, 'MTIzNDU=', '999', 'qqdnLnLjR1LPmnLmiHFBtw==', '2020-08-03 21:24:16'),
(24, '999', 'MTIzNDU=', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:24:16'),
(25, 'MTIzNDU=', '999', 'Pkfy0kDnpF2KRWr4AqlsOA==', '2020-08-03 21:24:25'),
(26, '999', 'MTIzNDU=', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:24:25'),
(27, '', '999', '4Ppd0t6N0QLS5X974VoaSw==', '2020-08-03 21:35:27'),
(28, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:27'),
(29, '', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-03 21:35:28'),
(30, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:28'),
(31, '', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-03 21:35:29'),
(32, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:29'),
(33, '', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-03 21:35:29'),
(34, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:29'),
(35, '', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-03 21:35:30'),
(36, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:30'),
(37, '', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-03 21:35:30'),
(38, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:30'),
(39, '', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-03 21:35:31'),
(40, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:31'),
(41, '', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-03 21:35:31'),
(42, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:31'),
(43, '', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-03 21:35:31'),
(44, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:31'),
(45, '', '999', 'HHP4NijCNBCQs+JSceUHVA==', '2020-08-03 21:35:32'),
(46, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:32'),
(47, '', '999', 'ApUMtH/mAWRWhOzW9wWnUw==', '2020-08-03 21:35:32'),
(48, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:32'),
(49, '', '999', 'Hrsm9ZGj9nguyEplEZAs9A==', '2020-08-03 21:35:32'),
(50, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:32'),
(51, '', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-03 21:35:32'),
(52, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:32'),
(53, '', '999', 'iRHkr737YtQoSQRKs6DBTQ==', '2020-08-03 21:35:33'),
(54, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:33'),
(55, '', '999', 'Hrsm9ZGj9nguyEplEZAs9A==', '2020-08-03 21:35:33'),
(56, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:33'),
(57, '', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-03 21:35:33'),
(58, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:33'),
(59, '', '999', 'GNC/r6DZIC24629NJomy8w==', '2020-08-03 21:35:33'),
(60, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:33'),
(61, '', '999', 'lc4yrrGilmkv3G3cWqdWUg==', '2020-08-03 21:35:33'),
(62, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:33'),
(63, '', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-03 21:35:33'),
(64, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:35:33'),
(65, '', '999', 'k5xZnFVz6fdKRljn/2V8OyywU/rz6Wxf6YvpUcXz4/A=', '2020-08-03 21:40:49'),
(66, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:40:49'),
(67, '', '999', 'lOWrUiZOPPf2Xq5wtuecNA==', '2020-08-03 21:44:55'),
(68, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:44:55'),
(69, '', '999', 'DuVmhdAfp2h4jIa1P5O/wQ==', '2020-08-03 21:44:59'),
(70, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-03 21:44:59'),
(71, '', '999', '61bn9StRd4sQRBKEdKWsYg==', '2020-08-04 12:04:28'),
(72, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-04 12:04:28'),
(73, '', '999', 'CFVSp1wlHpUIDOnSzJY4rA==', '2020-08-04 12:04:30'),
(74, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-04 12:04:30'),
(75, '', '999', 'IFNDXQbFlublH3XFMOXktpr3wAjPNvhUdNu+v4VLMJg=', '2020-08-04 17:57:02'),
(76, '999', '', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-04 17:57:02'),
(77, 'MTIzNDU2', '999', 'IFNDXQbFlublH3XFMOXktpr3wAjPNvhUdNu+v4VLMJg=', '2020-08-04 18:00:05'),
(78, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-04 18:00:05'),
(79, 'MTIzNDU2', '999', 'XyKx+5NOwNwVGLHFbuVHkArHvWTfx3BlC+mP1lwvU4o=', '2020-08-04 21:47:46'),
(80, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-04 21:47:46');

DROP TABLE IF EXISTS `ga_client`;
CREATE TABLE `ga_client` (
  `id` int NOT NULL COMMENT '自增',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '客户名称',
  `kf_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '接到客服id',
  `latest_time` datetime DEFAULT NULL COMMENT '最新消息时间',
  `uid` varchar(100) NOT NULL COMMENT '客户唯一id',
  `join_time` datetime DEFAULT NULL COMMENT '加入时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '对话状态（1：机器人，2：排队中，3：人工对话）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';

INSERT INTO `ga_client` (`id`, `name`, `kf_id`, `latest_time`, `uid`, `join_time`, `status`) VALUES
(4, '', '', '2020-08-04 21:47:46', 'MTIzNDU2', '2020-06-26 15:36:03', 1),
(5, '', '', '2020-08-03 21:24:25', 'MTIzNDU=', '2020-06-26 23:59:18', 1),
(12, '', '', '2020-06-27 11:03:38', 'MTEx', '2020-06-27 11:02:15', 1),
(13, '', '', '2020-08-04 17:57:02', '', '2020-08-03 21:35:27', 1);

DROP TABLE IF EXISTS `ga_user`;
CREATE TABLE `ga_user` (
  `id` int UNSIGNED NOT NULL COMMENT 'id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：停用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='账号表';


INSERT INTO `ga_user` (`id`, `username`, `nickname`, `password`, `create_time`, `status`) VALUES
(1, 'test11', 'aa123123', '01ee7f6575a386e7fa80958367c4c9ae', '2020-05-01 12:26:26', 1),
(2, 'test12', 'ccc', '01ee7f6575a386e7fa80958367c4c9ae', '2020-05-01 12:26:26', 1),
(3, 'test113', 'bbb驱蚊器', '01ee7f6575a386e7fa80958367c4c9ae', '2020-05-01 12:26:26', 1),
(4, 'test112', '123', '01ee7f6575a386e7fa80958367c4c9ae', '2020-07-29 23:54:58', 1),
(5, '123123', 'bbbb', '01ee7f6575a386e7fa80958367c4c9ae', '2020-08-03 22:05:23', 1);

DROP TABLE IF EXISTS `ga_chatroom_records`;
CREATE TABLE `ga_chatroom_records` (
  `id` bigint UNSIGNED NOT NULL,
  `sender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text NOT NULL,
  `time` datetime NOT NULL,
  `room_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天室聊天记录';
INSERT INTO `ga_chatroom_records` (`id`, `sender`, `content`, `time`, `room_id`) VALUES
(1, 'JUU2JTkyJTkyJUU3JTlBJTg0JUU1JThGJTkxJUU3JTk0JTlGJUU3JTlBJTg0', '5fSJz/CYgkSXHuIadpa3EejgtWOGSwlJzqRk9OSkMLK+XhewPCCSz6gGBh0wCj0b/NvbwAWKayKP\nrpt7zEJ40BkBDX0CwbKeVYqAAHqIl2V+WvAUNcoG7ihA+tPltBm/1FMGyZrh6HOs5PoQX/r/LQ==', '2020-09-11 11:31:39', 1),
(2, 'JUU2JTkyJTkyJUU3JTlBJTg0JUU1JThGJTkxJUU3JTk0JTlGJUU3JTlBJTg0', 'ctuqFwqjE76mtqziqeFG9Q==', '2020-09-11 12:18:20', 1),
(3, 'JUU2JTkyJTkyJUU3JTlBJTg0JUU1JThGJTkxJUU3JTk0JTlGJUU3JTlBJTg0', 'UxPjBfeeOKzihSUHT1mUgw==', '2020-09-11 12:22:48', 1),
(4, 'JUU2JTkyJTkyJUU3JTlBJTg0JUU1JThGJTkxJUU3JTk0JTlGJUU3JTlBJTg0', 'Bx6lwfPqFBik6oJeWFbDsA==', '2020-09-11 12:26:27', 1),
(5, 'JUU2JTkyJTkyJUU3JTlBJTg0JUU1JThGJTkxJUU3JTk0JTlGJUU3JTlBJTg0', 'DIHuBRR2nho+IwNPB/gutQ==', '2020-09-11 12:28:46', 1),
(6, 'JUU2JTkyJTkyJUU3JTlBJTg0JUU1JThGJTkxJUU3JTk0JTlGJUU3JTlBJTg0', '6aAmR+U67qtq/R1kI4O9pkfg5PVL9qmWpMx+wASstXk=', '2020-09-11 12:29:06', 1),
(7, 'JUU2JTkyJTkyJUU3JTlBJTg0JUU1JThGJTkxJUU3JTk0JTlGJUU3JTlBJTg0', 'xoRB3/ULX0YtzIVtddidZw==', '2020-09-11 12:29:44', 1),
(8, 'JUU2JTkyJTkyJUU3JTlBJTg0JUU1JThGJTkxJUU3JTk0JTlGJUU3JTlBJTg0', 'UJO1RKUCnjY4+QUTb0nIaQ==', '2020-09-11 12:30:51', 1),
(9, 'YWFhYQ==', 'hI9xJbtReJHDTxbdd8U6Zw==', '2020-09-11 12:31:24', 1),
(10, 'YWFhYQ==', 'mNcn8dvv5G8GG5CM8rweDQ==', '2020-09-11 12:33:04', 1),
(11, 'YWFhYQ==', 'hI9xJbtReJHDTxbdd8U6Zw==', '2020-09-11 12:38:27', 1),
(12, 'JUU2JTkyJTkyJUU3JTlBJTg0JUU1JThGJTkxJUU3JTk0JTlGJUU3JTlBJTg0', 'Yp+mvnBHHmUP/0REn7GnVw==', '2020-09-11 12:44:10', 1),
(13, 'JUU2JTkyJTkyJUU3JTlBJTg0JUU1JThGJTkxJUU3JTk0JTlGJUU3JTlBJTg0', 'Q/ib2yximcOXjWnDjNvW8AShVZV7sShdRLm/d02NjSY=', '2020-09-11 12:44:23', 1),
(14, 'YWFhYQ==', 'hI9xJbtReJHDTxbdd8U6Zw==', '2020-09-11 12:45:05', 1),
(15, 'YWFhYQ==', 'apDyxBtQXIYw4mu9ArUQHfstf6DHjDYDqXxoNMCMsp7lXAgEJDlgM+q/OGjePtAocPZ/1YX9PlMh\nHFspABgGOQ==', '2020-09-11 12:46:24', 1),
(16, 'YWFhYQ==', 'QPYcTbZdIwrphvNDsPC9jwEDdfuaWPo0iZcZC3ryoSRdYzB5j2zUCdxQHMHFkNRw', '2020-09-11 12:48:10', 1),
(17, 'YWFhYQ==', 'GKXE8lPMgtR6ZMPf+5j6ox+Td0hXrk/T5FPc2+HhIdcEit1HU1CoAAFAd1Pi/hhb', '2020-09-11 12:50:43', 1),
(18, 'YWFhYQ==', 'mm7RjVsc9+7Nb43dQ6j2buVjTeVJnfMASaIH2KCL/x0=', '2020-09-11 12:50:48', 1),
(19, 'YWFhYQ==', '35WDt8deT1Won/puflVfFSFlSxTEQUYsqeaB7UjMe3g=', '2020-09-11 12:55:24', 1),
(20, 'YWFhYQ==', 'QPYcTbZdIwrphvNDsPC9j5VWVJ3+IE5GWZt+Wlc60REtLtpQS02wRt2vFbSZK5yjD/T/zX5i66oR\nWy/OHeLA8kfg5PVL9qmWpMx+wASstXk=', '2020-09-11 12:56:47', 1),
(21, 'YWFhYQ==', 'jdbyhlldQauqLFucvPrA7g==', '2020-09-11 13:03:19', 1);

ALTER TABLE `ga_chat_records` ADD PRIMARY KEY (`id`);

ALTER TABLE `ga_client`  ADD PRIMARY KEY (`id`);


ALTER TABLE `ga_user`  ADD PRIMARY KEY (`id`);


ALTER TABLE `ga_chat_records` MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=81;


ALTER TABLE `ga_client` MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '自增', AUTO_INCREMENT=14;


ALTER TABLE `ga_user` MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=6;

ALTER TABLE `ga_chatroom_records` ADD PRIMARY KEY (`id`);

ALTER TABLE `ga_chatroom_records` MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;