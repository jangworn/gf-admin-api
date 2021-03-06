-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2020-10-14 23:24:54
-- 服务器版本： 8.0.20
-- PHP 版本： 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `gfadmin`
--
CREATE DATABASE IF NOT EXISTS `gfadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gfadmin`;

-- --------------------------------------------------------

--
-- 表的结构 `chatroom`
--

DROP TABLE IF EXISTS `chatroom`;
CREATE TABLE `chatroom` (
  `id` int NOT NULL COMMENT 'id',
  `name` varchar(255) NOT NULL COMMENT '群聊名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态(1:正常,0:不可用)',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `chatroom`
--

INSERT INTO `chatroom` (`id`, `name`, `status`, `create_time`, `update_time`) VALUES
(1, '公共聊天室', 1, '2020-10-11 22:20:20', NULL),
(2, '群聊', 1, '2020-10-11 22:21:18', NULL),
(3, '群聊', 1, '2020-10-11 22:22:36', NULL),
(4, '群聊', 1, '2020-10-11 22:24:14', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `chatroom_client`
--

DROP TABLE IF EXISTS `chatroom_client`;
CREATE TABLE `chatroom_client` (
  `id` int UNSIGNED NOT NULL COMMENT 'id',
  `room_id` int UNSIGNED NOT NULL COMMENT '群聊房间id',
  `uid` varchar(100) NOT NULL COMMENT '用户id',
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '昵称',
  `is_owner` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是群主'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天室';

--
-- 转存表中的数据 `chatroom_client`
--

INSERT INTO `chatroom_client` (`id`, `room_id`, `uid`, `nickname`, `is_owner`) VALUES
(1, 1, 'MjIyMQ==', '', 0),
(2, 1, 'MzMz', '', 0),
(3, 1, 'MjIy', '', 0),
(4, 2, 'MjIyMQ==', '', 0),
(5, 2, 'MzMz', '', 0),
(6, 2, 'MjIy', '', 1),
(7, 3, 'MjIyMQ==', '', 0),
(8, 3, 'MzMz', '', 0),
(9, 3, 'MjIy', '', 1),
(10, 4, 'MjIyMQ==', '', 0),
(11, 4, 'MjIy', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `chatroom_record`
--

DROP TABLE IF EXISTS `chatroom_record`;
CREATE TABLE `chatroom_record` (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `sender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送人id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `time` datetime NOT NULL COMMENT '时间',
  `room_id` int UNSIGNED NOT NULL COMMENT '群聊id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天室聊天记录';

--
-- 转存表中的数据 `chatroom_record`
--

INSERT INTO `chatroom_record` (`id`, `sender`, `content`, `time`, `room_id`) VALUES
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
(21, 'YWFhYQ==', 'jdbyhlldQauqLFucvPrA7g==', '2020-09-11 13:03:19', 1),
(22, 'YWFhYQ==', 'tZANURp4Qod+2NpFeQmZe/y0vVVzKkIsE0uEqrNpiuNZ+9CgKw+4DBHCahd6JzFC4d/fZLAXmnrU\nXf3/NRK3YgfaCRFGHaIpWXEtcd9wLDZqwoLXG8Ni3HInasCOrqd+', '2020-09-11 13:03:23', 1),
(23, 'YWFhYQ==', 'QPYcTbZdIwrphvNDsPC9j5VWVJ3+IE5GWZt+Wlc60REtLtpQS02wRt2vFbSZK5yjD/T/zX5i66oR\nWy/OHeLA8kfg5PVL9qmWpMx+wASstXk=', '2020-09-11 13:10:36', 1),
(24, 'YWFhYQ==', 'Yp+mvnBHHmUP/0REn7GnVw==', '2020-09-11 13:17:57', 1),
(25, 'YWFhYQ==', 'k+sazk1EMRncjyo2nq8LyYTU5QkYuA9hZm0MfPyLdH8=', '2020-09-11 13:18:08', 1),
(26, 'MzMzMw==', 'hI9xJbtReJHDTxbdd8U6Zw==', '2020-09-11 14:08:14', 1),
(27, 'MzMzMw==', 'hI9xJbtReJHDTxbdd8U6Zw==', '2020-09-11 14:08:15', 1),
(28, 'YWFhYQ==', 'BGCzePJ7ACEW8JrxmYu5Y4c1yLwnApKnlTfRTPcXLR5xvZ1PFB6TEAB16nkpLXXV', '2020-09-11 14:08:18', 1),
(29, 'MzMzMw==', 'GLktZJlTOfk0KGsKjRr+qg==', '2020-09-11 14:09:13', 1),
(30, 'MzMzMw==', 'fxQVdIVXNSboN0OlGp+Kzw==', '2020-09-11 14:09:16', 1),
(31, 'YWFhYQ==', 'UZavjaP4uzgNIUDXAE0ecUNIAEs7RdC/dcgEOd9+oiqdvNpZ1Rco9a9ku3TTU6CXcPZ/1YX9PlMh\nHFspABgGOQ==', '2020-09-11 14:13:36', 1),
(32, 'YWFhYQ==', 'SRKMTXIY0Dj1+t1gtsVJws78kvGCjY4Ia/hmIyK6as7Xn1xif8Vtgzujaqvp7NwVPTOKUKAY9oCH\nbWQfb+fM+0fg5PVL9qmWpMx+wASstXk=', '2020-09-11 14:15:32', 1),
(33, 'YWFhYQ==', 'Bx6lwfPqFBik6oJeWFbDsA==', '2020-09-11 14:16:16', 1),
(34, 'YWFhYQ==', '3sTmdp4XMakSjKOKMu1mxoBid3dZUW4tezPhm8xxmFg=', '2020-09-11 14:17:02', 1),
(35, 'MzRkZHM=', 'xoRB3/ULX0YtzIVtddidZw==', '2020-09-11 14:18:30', 1),
(36, 'MzRkZHM=', 'RNQOU6fcxO/kK76mWgU/m5JHTswlTDxw5Rgr9llknJU=', '2020-09-11 14:18:34', 1),
(37, 'MzRkZHM=', '3sTmdp4XMakSjKOKMu1mxuKf0bE8MlUjtBChgRJlcdk=', '2020-09-11 14:18:37', 1),
(38, 'MzMzMw==', 'Jze64gCaZYxntS2u5RQ/cA==', '2020-09-11 14:18:42', 1),
(39, 'MzMzMw==', 'lrXlKF66LaaJVxQoIcD2e9Sqi6XxIpcTleHe1oHuHYQ=', '2020-09-11 14:18:47', 1),
(40, 'YWFhYQ==', 'hI9xJbtReJHDTxbdd8U6Zw==', '2020-09-11 14:22:23', 1),
(41, 'MzRkZHM=', 'QPYcTbZdIwrphvNDsPC9j5VWVJ3+IE5GWZt+Wlc60REtLtpQS02wRt2vFbSZK5yjD/T/zX5i66oR\nWy/OHeLA8kfg5PVL9qmWpMx+wASstXk=', '2020-09-11 14:22:33', 1),
(42, 'MzRkZHM=', 'bcNjy9L14ojJIq2e8iUGtkEakBOK9SVHQuAmnAl6kroZcUYRWbb0buHGi1W/LNdMx11uQQ+Hh5xS\nvpgOAouHyCRFTrJXQqr+G3eXwZ9m7bg=', '2020-09-11 14:30:09', 1),
(43, 'MzMzMw==', 'bcNjy9L14ojJIq2e8iUGtkEakBOK9SVHQuAmnAl6kroGVHF9PQerbJmaAI6zw1pI', '2020-09-11 14:30:29', 1),
(44, 'MzMzMw==', 'QPYcTbZdIwrphvNDsPC9jwEDdfuaWPo0iZcZC3ryoSRdYzB5j2zUCdxQHMHFkNRw', '2020-09-11 14:36:50', 1),
(45, 'MzMzMw==', 'LAgdx0fIlc2wVRHRDAEdMg==', '2020-09-11 14:36:52', 1),
(46, 'MzMzMw==', '6D+6GTFGT9DGQda/OXOjsOfz31gDekADpOIquKd29fo=', '2020-09-11 14:36:55', 1),
(47, 'MzRkZHM=', 'wImsqCL2HD3UbJJ8zRYU0/yg4OBAxPaK5rqNF6ih+8mVmk6NbMetYp5GjguzFi8i1+dB3RyH9Nt0\nDfX8TQvY/w==', '2020-09-11 14:36:57', 1),
(48, 'YWFhYQ==', 'bDwgFfIUPMT5srZ0u+D/IOxaRNgquarBetN4JZS7HUf1kCQElhiaVekaVMXx7vwRjIiYdazfDdc+\nyO7WkiEzUglizm3tNxdr9+I715epnZfKs9F0eo8mgRiy6v5YsQQNcPZ/1YX9PlMhHFspABgGOQ==', '2020-09-11 14:37:01', 1),
(49, 'YWFhYQ==', 'QPYcTbZdIwrphvNDsPC9j5VWVJ3+IE5GWZt+Wlc60REtLtpQS02wRt2vFbSZK5yjD/T/zX5i66oR\nWy/OHeLA8hrgZM/ur4zYrO20vINc6YximmtCjvrm/PUttm7AyQZB', '2020-09-11 14:37:05', 1),
(50, 'MzMzMw==', 'SRKMTXIY0Dj1+t1gtsVJws78kvGCjY4Ia/hmIyK6as7Xn1xif8Vtgzujaqvp7NwVPTOKUKAY9oCH\nbWQfb+fM+9hypoWJ41yely302Z9UQCk=', '2020-09-11 14:37:14', 1),
(51, 'MzMzMw==', 'nbKHnRLMrqoWF3R/A8NjZw==', '2020-09-11 14:37:15', 1),
(52, 'MzMzMw==', 'QPYcTbZdIwrphvNDsPC9j5VWVJ3+IE5GWZt+Wlc60REtLtpQS02wRt2vFbSZK5yjD/T/zX5i66oR\nWy/OHeLA8kfg5PVL9qmWpMx+wASstXk=', '2020-09-11 14:37:16', 1),
(53, 'YWFhYQ==', 'oS1wdGk4Nfhti7TM5sdF+s4ErQ1z3H5AfD09oZ2B+BO7NGstK2FqkRvUH1His2TemHLLnIqaphHV\nJ01Ty0q7rEfg5PVL9qmWpMx+wASstXk=', '2020-09-11 15:08:35', 1),
(54, 'MzMzMw==', 'apDyxBtQXIYw4mu9ArUQHfstf6DHjDYDqXxoNMCMsp5pZoQhjCE1pI8lZfokHLI3Q4oVkNhSdFVM\nVPXTEFw42Wtt4D58nshWP+MlFkm7M1xGdmm6DyXn7s+gBSXwibEV', '2020-09-11 15:08:46', 1),
(55, 'MzMzMw==', 'oJPidTtLgdGPunp5XE8xUCLftO/zWEQPPQSR/uZept0=', '2020-09-11 15:08:56', 1),
(56, 'MzMzMw==', 'QPYcTbZdIwrphvNDsPC9jwEDdfuaWPo0iZcZC3ryoSRdYzB5j2zUCdxQHMHFkNRw', '2020-09-11 15:09:39', 1),
(57, 'MzMzMw==', '3r6otlLgIBVgQ++j5bvTF8oufQd4LeVaoFKTFq4kplrIq9mqKBLr7nxW/3/ASZXbZvrvVy5oAPYU\nNYiGtY34GotMtu+Pi9nhiDcqOpTC+Ospx1tDK92rCwebO5EGU0Dq', '2020-09-11 15:14:53', 1),
(58, 'MzMzMw==', 'XCJaBTcyp6WwgNS35pRhcg==', '2020-09-11 15:28:21', 1),
(59, 'YWFhYQ==', 'bdmf+NY9wAuN5WzeCn9CBw==', '2020-09-11 15:59:38', 1),
(60, 'OTk5OQ==', 'u45FEZzqrW1CAvvOWeQK9g==', '2020-09-11 16:55:29', 1),
(61, 'MjIy', 'SpLc1csmkdL+Ktp2LS85Rg==', '2020-09-11 16:55:35', 1),
(62, 'MDAwMDA=', 'A+j8RAnC6rOvE5pEejD/gg==', '2020-09-11 16:56:08', 1),
(63, 'OTk5OQ==', 'ioWu4vFmFfs0gtG/nAOcxg==', '2020-09-11 17:12:25', 1),
(64, 'OTk5OQ==', 'lrXlKF66LaaJVxQoIcD2eytnPvEMbATrFj7kZ41gzky1cKWhL/k3NH0tbsiO4143', '2020-09-11 17:12:48', 1),
(65, 'MjIy', 'FqV4AExGIiQ6qtFBL2DzY0Z9DVXtZsfQ181tGKphnXbZDl35G4Vb/quJ9QaeUYFfcPZ/1YX9PlMh\nHFspABgGOQ==', '2020-09-11 17:13:00', 1),
(66, 'ODg4ODg=', '9+4lJ8VVE6MQXkQMd50LqQUMbRKdpCkr5wE90q24fJJ7+U0iz/QXfZ9gCawA5de12ERLPqAPhBmc\nNOO7N+TWwxBrrSnc4CtVLN3b/2mA8gBMKGmA2lX3YFXDQ63t/b9mUA6ZU90zlhA5BdBT+FhSXQ==', '2020-09-11 17:22:22', 1),
(67, 'c3Nz', 'w4DuXzFNhDAAVvmLB6c6gw==', '2020-09-11 17:45:20', 1),
(68, 'MjIy', '/T+ZaUBClRAv8+dJuPCSeQ==', '2020-09-28 22:50:06', 1),
(69, 'MjIy', 'SpLc1csmkdL+Ktp2LS85Rg==', '2020-09-28 22:53:49', 1),
(70, 'MzMz', 'm+VAWiRze4JZwLljkUtQJQ==', '2020-09-28 22:57:05', 1),
(71, 'MjIy', 'lrXlKF66LaaJVxQoIcD2e0jZBa1JZue8AYD5AQQRoPM=', '2020-09-28 22:57:14', 1),
(72, 'MzMz', 'MEyhJrZmmfi8e29TKrZbvz7avsF6DBZRZw4xs/RBwLc=', '2020-09-28 22:57:32', 1),
(73, 'MzMz', 'apDyxBtQXIYw4mu9ArUQHdx+M3L0pzpHM61Q2TmX108=', '2020-09-28 22:57:52', 1),
(74, 'MjIy', '7O+/KCR40jqDyX5Z8XyAfQ==', '2020-09-28 22:57:57', 1),
(75, 'MjIy', 'boLVO5Ua01p9nrz1/i3cNZiX3/XMkGce9P0Sb/ZXAHVJIdsGBo5JNXZDAqWj0P5ekFtxyJrrOpcj\nHS2f+p9sXA==', '2020-09-28 22:58:01', 1),
(76, 'MzMz', 'tUsyWsx0Kq0d+nio+JQT+4rfNNulw2QIECyFqtuw5x8Xf9qWdAIvErEs+cxg0U6Xa7LUPEQmgzZ9\nqmU5VHZwK0fg5PVL9qmWpMx+wASstXk=', '2020-09-28 22:58:04', 1),
(77, 'MzMz', '19SclkBkbTGYX6syB2pLpA==', '2020-09-28 22:58:06', 1),
(78, 'MjIy', 'XfbveiuUaCDuMoenZgMxmg==', '2020-10-02 16:30:20', 1),
(79, 'MjIyMQ==', '4Gjjao6AE6uUQwfelGBQQg==', '2020-10-02 20:43:41', 1),
(80, 'MjIyMQ==', 'XfbveiuUaCDuMoenZgMxmg==', '2020-10-02 20:44:00', 1),
(81, 'MjIyMQ==', 'BnBGPA3b/azNspnl04V3Jw==', '2020-10-02 20:44:03', 1),
(82, 'MjIy', 'KGuN/9I/u9YCKTFYBAeN5A==', '2020-10-02 20:44:05', 1),
(83, 'MjIy', 'eCqoPY1myYWDcwA6ZwwYDA==', '2020-10-04 00:23:12', 1),
(84, 'MjIy', 'L9MxdDuXe+l53XuwVmaa3uthzp4gfJ7VtDjc2Nw3L08=', '2020-10-04 00:30:08', 2),
(85, 'MjIy', 'XOfcWY9/FOa/tBsA7QKuO/6LuN7JLtl6d/RPeSQEv30=', '2020-10-04 00:30:28', 3),
(86, 'MjIy', 'VeFJQujp+KwnElTfVmtweQ==', '2020-10-05 15:05:21', 2),
(87, 'MjIy', 'XN4LuAFO4cizLP1y/0BB6Q==', '2020-10-11 23:23:13', 1);

-- --------------------------------------------------------

--
-- 表的结构 `chat_record`
--

DROP TABLE IF EXISTS `chat_record`;
CREATE TABLE `chat_record` (
  `id` int NOT NULL COMMENT 'id',
  `sender` varchar(100) NOT NULL COMMENT '发送人',
  `receiver` varchar(100) NOT NULL COMMENT '接收人',
  `content` text NOT NULL COMMENT '内容',
  `time` datetime NOT NULL COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天记录';

--
-- 转存表中的数据 `chat_record`
--

INSERT INTO `chat_record` (`id`, `sender`, `receiver`, `content`, `time`) VALUES
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
(80, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-04 21:47:46'),
(81, 'MTIzNDU2', '999', 'ZV76cbCvVbgGW4c1Eu8saGj8G65B/UA3zkqsSMsg4aw=', '2020-08-05 17:30:29'),
(82, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-05 17:30:29'),
(83, 'MTIzNDU2', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-05 19:06:55'),
(84, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-05 19:06:55'),
(85, 'MTIzNDU2', '999', 'wMahwLu3MMfwYU6E/W8YNQ==', '2020-08-06 22:25:19'),
(86, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-06 22:25:19'),
(87, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-06 22:47:15'),
(88, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-06 22:47:15'),
(89, 'MTIzNDU=', '999', 'DuVmhdAfp2h4jIa1P5O/wQ==', '2020-08-17 01:02:28'),
(90, '999', 'MTIzNDU=', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 01:02:28'),
(91, '1', '', 'guXIaFL0xgawmHZ0Gjsdqg==', '2020-08-17 01:03:41'),
(92, '1', '', '0qag8RUvrS9vEYMBMA4TYw==', '2020-08-17 01:04:02'),
(93, '1', '', '1QxS3ARbsEnlTnDI8K4QTg==', '2020-08-17 01:05:31'),
(94, '1', 'MTIzNDU=', 'utiWirQLDkdClr0CE6O4TA==', '2020-08-17 01:07:43'),
(95, '1', 'MTIzNDU=', 'hI9xJbtReJHDTxbdd8U6Zw==', '2020-08-17 01:13:49'),
(96, '1', 'MTIzNDU=', '3sTmdp4XMakSjKOKMu1mxoBid3dZUW4tezPhm8xxmFg=', '2020-08-17 01:13:54'),
(97, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 01:30:36'),
(98, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 01:30:36'),
(99, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 01:40:48'),
(100, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 01:41:21'),
(101, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 01:42:11'),
(102, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 01:44:00'),
(103, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 01:44:00'),
(104, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 09:42:41'),
(105, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 10:05:40'),
(106, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 10:05:40'),
(107, '1', 'MTIzNDU2', '4Gjjao6AE6uUQwfelGBQQg==', '2020-08-17 13:06:20'),
(108, '1', 'MTIzNDU2', 'hI9xJbtReJHDTxbdd8U6Zw==', '2020-08-17 13:06:40'),
(109, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 21:35:10'),
(110, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 21:35:10'),
(111, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 21:41:34'),
(112, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 21:41:34'),
(113, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 21:44:52'),
(114, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 21:44:52'),
(115, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 21:48:14'),
(116, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 21:48:14'),
(117, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 21:51:17'),
(118, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 21:51:17'),
(119, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 21:52:12'),
(120, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 21:52:12'),
(121, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 21:53:08'),
(122, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 21:53:08'),
(123, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgR6AK83hBteFkwsw/he/Lcs=', '2020-08-17 21:57:23'),
(124, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 21:57:23'),
(125, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 23:08:01'),
(126, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 23:08:01'),
(127, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-17 23:09:50'),
(128, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-17 23:09:50'),
(129, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 18:57:11'),
(130, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 18:57:11'),
(131, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 18:58:38'),
(132, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 18:59:20'),
(133, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 18:59:47'),
(134, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 19:00:19'),
(135, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 19:01:32'),
(136, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 19:02:14'),
(137, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 22:49:39'),
(138, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 22:49:39'),
(139, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 22:51:19'),
(140, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 22:51:19'),
(141, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 22:53:18'),
(142, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 22:53:18'),
(143, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 22:53:34'),
(144, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 22:53:34'),
(145, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 22:57:28'),
(146, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 22:57:28'),
(147, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 22:58:01'),
(148, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 22:58:01'),
(149, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 23:32:04'),
(150, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 23:32:04'),
(151, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 23:34:29'),
(152, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 23:34:29'),
(153, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 23:42:54'),
(154, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 23:43:12'),
(155, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 23:43:12'),
(156, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-18 23:56:20'),
(157, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-18 23:56:20'),
(158, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-19 00:02:49'),
(159, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-19 00:02:49'),
(160, '1', 'MTIzNDU2', '/F5/0aDYI72Ij0Ii+4ccuFmm2dzk/433ElHc33v/z7AI25PhjGxJE3RQ/8pV3ACS8hQnkNdPQ2ov\nbmliZZFVEkfg5PVL9qmWpMx+wASstXk=', '2020-08-19 21:12:42'),
(161, 'MTIzNDU2', '999', 'u4fF7USHvhbzE+DZMJ3i9g==', '2020-08-19 21:14:24'),
(162, 'MTIzNDU2', '999', 'apDyxBtQXIYw4mu9ArUQHe2PlYn0sqZrKODCHmwMDfk=', '2020-08-19 21:16:33'),
(163, 'MTIzNDU2', '999', 'jkaAvLpBc+izCfOgFW4w7w==', '2020-08-19 21:16:59'),
(164, 'MTIzNDU2', '999', 'cPZ/1YX9PlMhHFspABgGOQ==', '2020-08-19 21:17:57'),
(165, 'MTIzNDU2', '999', 'cPZ/1YX9PlMhHFspABgGOQ==', '2020-08-19 21:17:57'),
(166, 'MTIzNDU2', '999', 'zPb8J4CS8vyyGSLVqcoTHo1dZz/c/RFAix8N516Iw3x3D3oYvlyu5rrk2vvQbIBux11uQQ+Hh5xS\nvpgOAouHyHtK4lWViSdfreNWySc+960=', '2020-08-19 21:17:59'),
(167, 'MTIzNDU2', '999', 'L9MxdDuXe+l53XuwVmaa3sX6L8jb8Bthv9nTZKOoyqI=', '2020-08-19 21:18:09'),
(168, 'MTIzNDU2', '999', 'apDyxBtQXIYw4mu9ArUQHeNU1zBaiP6fQcT5HnPrpmo=', '2020-08-19 21:19:08'),
(169, 'MTIzNDU2', '999', 'eSOe2Z3NyWgr3Bt0DoDuxR+Td0hXrk/T5FPc2+HhIdfaFvHKR0PKdC5X6wsoFOLk', '2020-08-19 21:20:23'),
(170, 'MTIzNDU2', '999', 'apDyxBtQXIYw4mu9ArUQHe2PlYn0sqZrKODCHmwMDfk=', '2020-08-19 21:20:31'),
(171, 'MTIzNDU2', '999', 'apDyxBtQXIYw4mu9ArUQHe2PlYn0sqZrKODCHmwMDfk=', '2020-08-19 21:22:43'),
(172, 'MTIzNDU2', '999', 'QPYcTbZdIwrphvNDsPC9jwEDdfuaWPo0iZcZC3ryoSRf2Wt8tInlZSjbTZk2wCeo', '2020-08-19 21:23:21'),
(173, 'MTIzNDU2', '999', '0CBm2SfuF3uNIqFmu3rZdw==', '2020-08-19 21:23:41'),
(174, '1', 'MTIzNDU2', 'QO9ysD6dJ40zgfgzOXZcSg==', '2020-08-19 21:23:54'),
(175, 'MTIzNDU2', '999', 'BEQ2NTsaplnwgXByxYiioZ8hBO+ZD/4NfmB7UJ4eOKo=', '2020-08-19 21:24:18'),
(176, 'MTIzNDU2', '999', 'apDyxBtQXIYw4mu9ArUQHe2PlYn0sqZrKODCHmwMDfk=', '2020-08-19 21:24:42'),
(177, 'MTIzNDU2', '999', 'apDyxBtQXIYw4mu9ArUQHeNU1zBaiP6fQcT5HnPrpmo=', '2020-08-19 21:27:44'),
(178, 'MTIzNDU2', '999', 'oVVPheXJd6OSICteXlPLWa8t+vVTJw9WnNeGsy0uVS4=', '2020-08-19 21:27:51'),
(179, 'MTIzNDU2', '999', 'BEQ2NTsaplnwgXByxYiioZ8hBO+ZD/4NfmB7UJ4eOKo=', '2020-08-19 21:32:19'),
(180, 'MTIzNDU2', '999', 'sJoF/YVzQ40u9lVZ1ox2N+2PlYn0sqZrKODCHmwMDfk=', '2020-08-19 21:32:58'),
(181, 'MTIzNDU2', '999', 'BGCzePJ7ACEW8JrxmYu5Y4c1yLwnApKnlTfRTPcXLR7CQpvr2VTK0u5TdPiIYvrD', '2020-08-19 21:33:03'),
(182, 'MTIzNDU2', '999', 'QPYcTbZdIwrphvNDsPC9jwEDdfuaWPo0iZcZC3ryoSRf2Wt8tInlZSjbTZk2wCeo', '2020-08-19 21:33:11'),
(183, 'MTIzNDU2', '999', 'QPYcTbZdIwrphvNDsPC9j5VWVJ3+IE5GWZt+Wlc60RHZSavreE48UF0CEPkQFR7G', '2020-08-19 21:33:15'),
(184, 'MTIzNDU2', '999', 'QPYcTbZdIwrphvNDsPC9jwEDdfuaWPo0iZcZC3ryoSRf2Wt8tInlZSjbTZk2wCeo', '2020-08-19 21:33:52'),
(185, 'MTIzNDU2', '999', 'zPb8J4CS8vyyGSLVqcoTHo1dZz/c/RFAix8N516Iw3x3D3oYvlyu5rrk2vvQbIBux11uQQ+Hh5xS\nvpgOAouHyHtK4lWViSdfreNWySc+960=', '2020-08-19 21:34:03'),
(186, 'MTIzNDU2', '999', 'apDyxBtQXIYw4mu9ArUQHeNU1zBaiP6fQcT5HnPrpmo=', '2020-08-19 21:38:50'),
(187, 'MTIzNDU2', '999', 'FjSlV9VrVhpIdGX2W/cliXa0shXYbTk9/4D0/scDQRc=', '2020-08-19 21:39:28'),
(188, 'MTIzNDU2', '999', 'DuVmhdAfp2h4jIa1P5O/wQ==', '2020-08-19 21:49:15'),
(189, 'MTIzNDU2', '999', 'apDyxBtQXIYw4mu9ArUQHeNU1zBaiP6fQcT5HnPrpmo=', '2020-08-19 21:51:03'),
(190, 'MTIzNDU2', '999', 'apDyxBtQXIYw4mu9ArUQHeNU1zBaiP6fQcT5HnPrpmo=', '2020-08-19 21:53:28'),
(191, 'MTIzNDU2', '999', 'BGCzePJ7ACEW8JrxmYu5Y4c1yLwnApKnlTfRTPcXLR7CQpvr2VTK0u5TdPiIYvrD', '2020-08-19 21:53:32'),
(192, 'MTIzNDU2', '999', '1serSc/XKyEwjUVd9p25fg==', '2020-08-19 21:53:35'),
(193, 'MTIzNDU2', '999', 'QPYcTbZdIwrphvNDsPC9j5VWVJ3+IE5GWZt+Wlc60REtLtpQS02wRt2vFbSZK5yjxb8KubXISpNF\nsyV//NP3YA==', '2020-08-19 21:53:43'),
(194, 'MTIzNDU2', '999', 'QPYcTbZdIwrphvNDsPC9j5VWVJ3+IE5GWZt+Wlc60RHKmXZrgOpYGczfjABaj+Y6UL406vjo5vSh\nftzyf/fy9w==', '2020-08-19 21:53:53'),
(195, 'MTIzNDU2', '999', 'mcC4CbdcWikvouSKFIFsYg==', '2020-08-19 21:53:58'),
(196, 'MTIzNDU2', '999', 'bcNjy9L14ojJIq2e8iUGtkEakBOK9SVHQuAmnAl6kroZcUYRWbb0buHGi1W/LNdMx11uQQ+Hh5xS\nvpgOAouHyHtK4lWViSdfreNWySc+960=', '2020-08-19 21:54:05'),
(197, '1', 'MTIzNDU2', 'iYK7n5YoWX/pt9ZetWKbFv3nW7s5xaiAlB2Nf2aod74HuPX3DiXPt4OwkD5MMlVwcPZ/1YX9PlMh\nHFspABgGOQ==', '2020-08-19 21:54:13'),
(198, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-19 21:54:47'),
(199, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-19 21:54:47'),
(200, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-19 21:59:21'),
(201, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-19 21:59:21'),
(202, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-19 22:00:22'),
(203, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-19 22:00:22'),
(204, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-19 22:04:55'),
(205, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-19 22:04:55'),
(206, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-19 22:07:20'),
(207, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-19 22:07:20'),
(208, 'MTIzNDU2', '999', '6HaJKVEc4OwXfux/WTFwHz4xr0mChITOHD0crZPfHLaw24FNovR4FbipAi/M+Dfojfa7wvPQH/2H\njFriaqZVSw==', '2020-08-19 22:13:28'),
(209, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-19 22:13:28'),
(210, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-19 22:13:29'),
(211, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-19 22:13:29'),
(212, 'MTIzNDU2', '999', 'QPYcTbZdIwrphvNDsPC9jwEDdfuaWPo0iZcZC3ryoSRf2Wt8tInlZSjbTZk2wCeo', '2020-08-19 22:13:38'),
(213, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-19 22:13:47'),
(214, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-19 22:13:47'),
(215, 'MTIzNDU2', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-19 22:39:33'),
(216, '999', 'MTIzNDU2', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-19 22:39:33'),
(217, 'MTIzNDU2', '999', '3kt31JUDDywfhgxBKGkrlScI6TuXWiGEQcCyNglv4QA=', '2020-08-21 10:00:39'),
(218, 'MTIzNDU2', '999', 'FXbC+bW7qhV6eQ6CL3lrg4ZLzzreszjmKmNbBI4eOqw=', '2020-08-21 10:02:17'),
(219, 'MTIzNDU2', '999', 'eeSGMO+V5EjoqQYtekY7Jw==', '2020-08-21 10:02:53'),
(220, '1', 'MTIzNDU2', 'QPYcTbZdIwrphvNDsPC9jwEDdfuaWPo0iZcZC3ryoSRdYzB5j2zUCdxQHMHFkNRw', '2020-08-21 10:03:04'),
(221, 'MTIzNDU2', '999', 'HHP4NijCNBCQs+JSceUHVA==', '2020-08-21 15:17:57'),
(222, '1', 'MTIzNDU2', 'ctuqFwqjE76mtqziqeFG9Q==', '2020-08-21 15:33:12'),
(223, '1', 'MTIzNDU2', 'npR9kWxUp8URy6y1FWgH5A==', '2020-08-21 17:52:49'),
(224, 'MTIzNDU=', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-25 15:46:13'),
(225, '999', 'MTIzNDU=', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-25 15:46:13'),
(226, 'MTIzNDU2', '999', 'HHP4NijCNBCQs+JSceUHVA==', '2020-08-25 15:46:24'),
(227, 'MTIzNDU2', '999', 'DuVmhdAfp2h4jIa1P5O/wQ==', '2020-08-25 15:46:39'),
(228, 'MTIzNDU2', '999', 'cl1tRNWCGOo2gp2pgST+TA==', '2020-08-25 15:46:51'),
(229, 'MTIzNDU2', '999', 'lc/Jld2t3Jb9937B0D949Q==', '2020-08-25 15:47:06'),
(230, 'MTIzNDU2', '999', 'lrXlKF66LaaJVxQoIcD2e+hZjAmD2rimLhglZv3met4EzqZrjHq9C37NSoJP/Pyi', '2020-08-25 15:47:18'),
(231, '1', 'MTIzNDU2', '/o1x+CahJrGdgSmO5xa3rixxdff6UBLJrQ9L1HRiNg7bLU8xVWh7vvkJ2gydtZ+D', '2020-08-25 15:47:28'),
(232, 'MTIzNDU=', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-25 15:53:47'),
(233, '999', 'MTIzNDU=', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-25 15:53:47'),
(234, '1', 'MTIzNDU=', 'Op3FqjfejpSch9xJ4gmC/6rbxYat+BxZjnAWeNF+0/Q=', '2020-08-25 15:54:37'),
(235, '1', 'MTIzNDU=', 'E5TDfxFn0CfvGZVmQgzwugx1Rdyor9qzJz0daY9n6EOp6vYipxKKTrATgeyTNSyKuxh6PRsO/mTG\nJldQwy0W+Ufg5PVL9qmWpMx+wASstXk=', '2020-08-25 15:54:37'),
(236, '1', 'MTIzNDU=', 'CBPd9O/XZFcl7bxlnX5lE2B4NZlBab7EHIROoA3qD51lLGUuStht2RP0iZ3zEe/kcPZ/1YX9PlMh\nHFspABgGOQ==', '2020-08-25 15:54:55'),
(237, 'MTIzNDU=', '999', 'bLv6IVYiB8uF2JTBm1AI9A==', '2020-08-25 15:54:58'),
(238, '1', 'MTIzNDU=', 'Go0V+lm1FS5lrzgsCr6OtA==', '2020-08-25 15:55:37'),
(239, '1', 'MTIzNDU=', 'Fcz+VbQrQUsOZzry+SHKXiCmAuv/6/2R8nnAlXcq3+g=', '2020-08-25 15:57:50'),
(240, '1', 'MTIzNDU=', 'oS1wdGk4Nfhti7TM5sdF+s4ErQ1z3H5AfD09oZ2B+BP2X+4kcYss2dbc/xh925tBcPZ/1YX9PlMh\nHFspABgGOQ==', '2020-08-25 15:57:52'),
(241, 'MTIz', '999', '8R4fS9VCf0nvTmVpNLhKgTIMI6NyKQVE+Ew1pdytNg0=', '2020-08-25 15:58:00'),
(242, '999', 'MTIz', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-25 15:58:00'),
(243, '1', 'MTIz', 'WApNmFNi+xDjdReJevvCtoxFOSIHfVDbHb5Bo2RXHqU=', '2020-08-25 15:58:08'),
(244, 'MTIz', '999', 'qOsUQBlcmUIvEgqZPGlsNcEco3gSjeaYpP9HnknJ7NSRa3RW+MDDOfmSlrdF1bId', '2020-08-25 15:59:12'),
(245, '1', 'MTIz', 'QPYcTbZdIwrphvNDsPC9jwEDdfuaWPo0iZcZC3ryoSRdYzB5j2zUCdxQHMHFkNRw', '2020-08-25 15:59:18'),
(246, '1', 'MTIz', 'QPYcTbZdIwrphvNDsPC9jwEDdfuaWPo0iZcZC3ryoSRdYzB5j2zUCdxQHMHFkNRw', '2020-08-25 15:59:22'),
(247, '1', 'MTIz', 'PVGJdxoVg3gPWoEP80mM4g==', '2020-08-25 15:59:24'),
(248, 'MTIz', '999', 'BGCzePJ7ACEW8JrxmYu5Y4c1yLwnApKnlTfRTPcXLR7CQpvr2VTK0u5TdPiIYvrD', '2020-08-25 15:59:28'),
(249, 'MTIz', '999', 'wchqQeWK7YCAdovZg9DOaLYtgzfFSkKnD/R0G2N/cjAYhOVoreZGWzJwphwOumZF', '2020-08-25 15:59:29'),
(250, 'MTIz', '999', 'wKhhXWffuSgDjvrccP021g==', '2020-08-25 15:59:31'),
(251, '1', 'MTIz', 'kykTsq1kmNUvtqUMhuQyvA==', '2020-08-25 16:05:28'),
(252, '1', 'MTIz', 'fogD2UL/mmWaoz+YTtmFaQ==', '2020-08-25 16:05:33'),
(253, 'MTIzNDU=', '999', 'K0Ves7rDvWBV+wl00aQ8qQ==', '2020-08-25 16:15:35'),
(254, '1', 'MTIz', 'Lpvjbp7Yeg878EYEfp0tVA==', '2020-08-25 20:55:33'),
(255, 'MTIz', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-25 20:55:41'),
(256, 'MTIz', '999', 'SJhJ5kJRJFlUu6GfB01+FA==', '2020-08-25 21:39:01'),
(257, 'MTIz', '999', 'HHP4NijCNBCQs+JSceUHVA==', '2020-08-25 21:49:14'),
(258, '1', 'MTIz', 'W4bBGJQEXAbi0g5hBRU5aA==', '2020-08-25 21:49:25'),
(259, 'MTIz', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-25 22:04:06'),
(260, '1', 'MTIz', 'GLktZJlTOfk0KGsKjRr+qg==', '2020-08-25 22:04:09'),
(261, 'MTIz', '999', 'QaMos1Bu8ueM0yjhUWc33g==', '2020-08-25 22:05:09'),
(262, 'MTIz', '999', 'S4PoMqCe5X6cm9LyTZpXtQ==', '2020-08-25 22:05:13'),
(263, 'MTIz', '999', 'CMZgb+DqMv87q4Wn1v3CHg==', '2020-08-25 22:07:00'),
(264, '1', 'MTIz', '0bBA8D4rjxA/7NUFBNusWQ==', '2020-08-25 22:07:03'),
(265, '1', 'MTIz', 'PTTCRmO+Y7kOmxWzu4/6fg==', '2020-08-25 22:07:04'),
(266, '1', 'MTIz', 'yEx7pKU9hXKfOegMsSd6pg==', '2020-08-25 22:07:04'),
(267, '1', 'MTIz', 'EcRT4UhWmWuURRfZhgU/Yg==', '2020-08-25 22:07:05'),
(268, '1', 'MTIz', 'Y3L1Uwr0kJujj6hVURniVQ==', '2020-08-25 22:07:05'),
(269, '1', 'MTIz', 'oA2J5cBM9GgdsFS4zZ+d+Q==', '2020-08-25 22:07:05'),
(270, '1', 'MTIz', 'NIqv+PUo1y7tBqHSdFdeEQ==', '2020-08-25 22:07:05'),
(271, '1', 'MTIz', '2SrrZ1NbtRKCZigdZ6948A==', '2020-08-25 22:07:05'),
(272, '1', 'MTIz', 'jHhV1Ll58WFbZF4WJcyN7w==', '2020-08-25 22:07:06'),
(273, '1', 'MTIz', 'yt8hMbP9fgIC+14jX9bRfw==', '2020-08-25 22:07:06'),
(274, '1', 'MTIz', '2SrrZ1NbtRKCZigdZ6948A==', '2020-08-25 22:07:06'),
(275, '1', 'MTIz', '8ZHjq4hJxub0xdM+aFaXxA==', '2020-08-25 22:07:06'),
(276, '1', 'MTIz', 'CciX4Eec3xlh0WfAb1VFXA==', '2020-08-25 22:07:06'),
(277, '1', 'MTIz', '5EEKbyKpMl3cxxBiauqaiQ==', '2020-08-25 22:07:06'),
(278, '1', 'MTIz', 'xFodoxMaeLU0aRb66imv1A==', '2020-08-25 22:07:07'),
(279, '1', 'MTIz', 'CciX4Eec3xlh0WfAb1VFXA==', '2020-08-25 22:07:07'),
(280, '1', 'MTIz', 'oA2J5cBM9GgdsFS4zZ+d+Q==', '2020-08-25 22:07:07'),
(281, 'MTIzNA==', '999', 'DuVmhdAfp2h4jIa1P5O/wQ==', '2020-08-25 22:34:32'),
(282, '999', 'MTIzNA==', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-25 22:34:32'),
(283, 'MTIzNDU=', '999', '9foINsOSy1YYrFhNTQodLA==', '2020-08-25 23:50:50'),
(284, 'MTIzNA==', '999', 'ma47H2VoiZxQnVodHFN1hA==', '2020-08-26 09:33:00'),
(285, '999', 'MTIzNA==', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-26 09:33:00'),
(286, '1', 'MTIzNDU2', '7Dlz9YigAoUxWrs+dPGOzA==', '2020-08-26 09:58:42'),
(287, 'MTIzNDU=', '999', 'r9deB9m+touELf7e3X6QEw==', '2020-08-26 09:58:50'),
(288, '1', 'MTIzNDU=', '0qag8RUvrS9vEYMBMA4TYw==', '2020-08-26 09:59:23'),
(289, 'MTIzNA==', '999', 'XftMOclJCL7VIGyOwOrlPg==', '2020-08-26 10:01:09'),
(290, '999', 'MTIzNA==', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-08-26 10:01:09'),
(291, 'MTIzNDU=', '999', 'CMZgb+DqMv87q4Wn1v3CHg==', '2020-08-26 10:01:31'),
(292, '1', 'MTIzNDU=', '0bBA8D4rjxA/7NUFBNusWQ==', '2020-08-26 10:01:37'),
(293, '1', 'MTIzNDU=', 'p9lpVG+2w4Gz0QOQ+z/7Kw==', '2020-08-26 10:01:45'),
(294, 'MTIzNDU2', '999', 'pMtvMIjzPcMl3G3JlmRXJg==', '2020-08-26 10:02:13'),
(295, '1', 'MTIzNDU2', 'kdPQB9wq/o3yPuqOkMA8JISQOqDNggr4MhFnUUltCxk=', '2020-08-26 10:02:17'),
(296, 'MTIzNDU2', '999', 'CtHBUBcXdTr/cUU/yKJudw==', '2020-08-26 10:02:24'),
(297, 'MTIzNDU2', '999', 'CMZgb+DqMv87q4Wn1v3CHg==', '2020-08-26 10:02:25'),
(298, '1', 'MTIzNDU2', '8D0l8oK80l6xG3EOtHeFig==', '2020-08-26 10:02:37'),
(299, 'MTIzNDU2', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-08-26 10:03:01'),
(300, 'MTIzNDU2', '999', 'nuuxYB+jeG0EvlkNt8TMDQ==', '2020-08-26 10:14:07'),
(301, '1', 'MTIzNDU2', 'xz66J71qMl2gVpE9vT5f/g==', '2020-08-26 10:35:04'),
(302, 'MTIzNDU2', '999', 'HHP4NijCNBCQs+JSceUHVA==', '2020-08-26 10:39:05'),
(303, '1', 'MTIzNDU2', 'cekpNUGHvLzeom+ZAHNVyQ==', '2020-08-26 10:39:09'),
(304, 'MTIzNDU2', '999', 'CMZgb+DqMv87q4Wn1v3CHg==', '2020-08-27 22:21:56'),
(305, 'MTIzNDU2', '999', 'DuVmhdAfp2h4jIa1P5O/wQ==', '2020-08-27 22:22:42'),
(306, 'MTIzNDU2', '999', 'MHGc+OsqF2vU8M8N+poqWg==', '2020-08-27 22:24:34'),
(307, 'MTIzNDU2', '999', 'jUCj5y85hY3PtC1FJDo2FA==', '2020-08-27 22:24:35'),
(308, 'MTIzNDU2', '999', '3sTmdp4XMakSjKOKMu1mxpkg1BeezZT10qgQFm3cEv4=', '2020-08-27 22:24:38'),
(309, '1', 'MTIzNDU2', 'apDyxBtQXIYw4mu9ArUQHSlL+vcwRRWbgiYH5DiUVH8=', '2020-08-27 22:38:14'),
(310, 'MTIzNDU2', '999', 'ma47H2VoiZxQnVodHFN1hA==', '2020-08-28 00:17:38'),
(311, 'MTIzNDU2', '999', 'cPZ/1YX9PlMhHFspABgGOQ==', '2020-09-01 15:47:03'),
(312, 'MTIzNDU2', '999', 'zPb8J4CS8vyyGSLVqcoTHo1dZz/c/RFAix8N516Iw3zOzkBHOMO8ZGeeF5dOau0n', '2020-09-01 15:47:07'),
(313, 'MTIzNDU2', '999', 'zPb8J4CS8vyyGSLVqcoTHo1dZz/c/RFAix8N516Iw3y/iirRkhlrYBpl3v2dnyo0vGXJfxt/nUeg\nSePAii79+w==', '2020-09-01 15:47:16'),
(314, 'MTIzNDU=', '999', '/6u3fdBt2ifS3w1BT1fADw==', '2020-09-01 15:51:48'),
(315, '999', 'MTIzNDU=', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-09-01 15:51:48'),
(316, 'MTIzNDU=', '999', '3sTmdp4XMakSjKOKMu1mxpkg1BeezZT10qgQFm3cEv4=', '2020-09-01 15:51:51'),
(317, '999', 'MTIzNDU=', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-09-01 15:51:51'),
(318, 'MTIzNDU=', '999', 'Bepx8LNpW8YdS4EHbCmjKA==', '2020-09-01 16:08:24'),
(319, '999', 'MTIzNDU=', 'yPILSUwmVwvFC+Y0QHMGtA==', '2020-09-01 16:08:24'),
(320, 'MTIzNDU2', '999', 'NiMSjk2VuxPUOuFFpIYNTA==', '2020-09-01 19:58:21'),
(321, '1', 'MTIzNDU2', 'bdmf+NY9wAuN5WzeCn9CBw==', '2020-09-01 19:58:24'),
(322, 'MTIzNDU2', '999', 'QaMos1Bu8ueM0yjhUWc33g==', '2020-09-01 22:52:26'),
(323, 'MTIzNDU2', '999', 'QPYcTbZdIwrphvNDsPC9j5VWVJ3+IE5GWZt+Wlc60REtLtpQS02wRt2vFbSZK5yjxb8KubXISpNF\nsyV//NP3YA==', '2020-09-01 22:52:28'),
(324, '1', 'MTIzNDU2', 'QPYcTbZdIwrphvNDsPC9jwEDdfuaWPo0iZcZC3ryoSRdYzB5j2zUCdxQHMHFkNRw', '2020-09-01 22:52:33'),
(325, '1', 'MTIzNDU2', 'apDyxBtQXIYw4mu9ArUQHfstf6DHjDYDqXxoNMCMsp5pZoQhjCE1pI8lZfokHLI3Q4oVkNhSdFVM\nVPXTEFw42Wtt4D58nshWP+MlFkm7M1xGdmm6DyXn7s+gBSXwibEV', '2020-09-01 22:52:38'),
(326, '1', 'MTIzNDU2', 'JEDgD6ZnJPFmQOKJSqMFkg==', '2020-09-01 22:52:42'),
(327, 'MTIzNDU2', '999', 'WApNmFNi+xDjdReJevvCtoOuM3oUavVnDFxnIdTM+RM=', '2020-09-02 09:39:29'),
(328, '1', 'MTIzNDU2', 'RcTe8Ikzk3SPo1+HGHfTqEmJ2B524ZpMCDc2eRNhANZ2j0MzQMMNIsZ9I64nCNyby4sxsz6KfQ09\nv1Dy2zI5jrduofEd1vYM0tNy+vXCv1nOeXh0YBro7rKCxzkBaYYX', '2020-09-02 09:40:31'),
(329, 'MTIzNDU2', '999', 'apDyxBtQXIYw4mu9ArUQHfstf6DHjDYDqXxoNMCMsp5pZoQhjCE1pI8lZfokHLI3Q4oVkNhSdFVM\nVPXTEFw42Wtt4D58nshWP+MlFkm7M1ydIrIDE3rrNfdkN9VKOu7vqan6HT+e3rD/ZzaK4As3Gw==', '2020-09-02 09:40:34'),
(330, 'MTIzNDU2', '999', 'QPYcTbZdIwrphvNDsPC9jwEDdfuaWPo0iZcZC3ryoSRf2Wt8tInlZSjbTZk2wCeo', '2020-09-02 09:40:48'),
(331, 'MTIzNDU2', '999', 'QPYcTbZdIwrphvNDsPC9j5VWVJ3+IE5GWZt+Wlc60REtLtpQS02wRt2vFbSZK5yjxb8KubXISpNF\nsyV//NP3YA==', '2020-09-02 09:40:50'),
(332, 'MTIzNDU2', '999', '1HCxmr4n3/6Ed09lNyf4vg==', '2020-09-02 14:46:05'),
(333, 'MTIzNDU2', '999', 'Ro4SbLw3GalD/oX74tHJ2Q==', '2020-09-02 17:16:55'),
(336, 'MTIzNDU2', '999', 'DGLtDzlw96av+DCpoHtSfA==', '2020-09-28 22:05:53'),
(337, 'MTIzNDU2', '999', '3sTmdp4XMakSjKOKMu1mxpkg1BeezZT10qgQFm3cEv4=', '2020-09-28 22:06:18'),
(338, '1', 'MTIzNDU2', '4Gjjao6AE6uUQwfelGBQQg==', '2020-09-28 22:34:11'),
(339, 'MTIzNDU2', '999', '3sTmdp4XMakSjKOKMu1mxpkg1BeezZT10qgQFm3cEv4=', '2020-09-28 22:36:05'),
(340, 'MTIzNDU2', '999', 'apDyxBtQXIYw4mu9ArUQHe2PlYn0sqZrKODCHmwMDfk=', '2020-09-28 22:36:46'),
(341, '1', 'MTIzNDU2', '4Gjjao6AE6uUQwfelGBQQg==', '2020-09-28 22:37:02'),
(342, '1', 'MTIzNDU2', 'N7/lxhVUBTn1ZY9XbEptig==', '2020-09-28 22:37:08'),
(343, 'MTIzNDU2', '999', 'wqk6hhEvS1EGr8FZWKt4aQ==', '2020-09-28 22:38:02'),
(344, 'MTIzNDU2', '999', '6zgw0vP1g/WUkoZxg9nX0Q==', '2020-09-28 23:01:56'),
(345, '1', 'MTIzNDU2', 'u45FEZzqrW1CAvvOWeQK9g==', '2020-09-28 23:02:00');

-- --------------------------------------------------------

--
-- 表的结构 `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int NOT NULL COMMENT '自增',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '客户名称',
  `kf_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '接到客服id',
  `latest_time` datetime DEFAULT NULL COMMENT '最新消息时间',
  `uid` varchar(100) NOT NULL COMMENT '客户唯一id',
  `join_time` datetime DEFAULT NULL COMMENT '加入时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '对话状态（1：机器人，2：排队中，3：人工对话）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';

--
-- 转存表中的数据 `client`
--

INSERT INTO `client` (`id`, `name`, `kf_id`, `latest_time`, `uid`, `join_time`, `status`) VALUES
(4, '', '3', '2020-09-28 23:01:56', 'MTIzNDU2', '2020-06-26 15:36:03', 3),
(5, '', '3', '2020-09-01 16:08:24', 'MTIzNDU=', '2020-06-26 23:59:18', 1),
(12, '', '', '2020-06-27 11:03:38', 'MTEx', '2020-06-27 11:02:15', 1),
(14, '', '3', '2020-08-25 22:07:00', 'MTIz', '2020-08-25 15:58:00', 1),
(15, '', '', '2020-08-26 10:01:09', 'MTIzNA==', '2020-08-25 22:34:32', 1),
(17, '', '', '2020-09-11 12:44:23', 'JUU2JTkyJTkyJUU3JTlBJTg0JUU1JThGJTkxJUU3JTk0JTlGJUU3JTlBJTg0', '2020-09-11 11:29:51', 1),
(18, '', '', '2020-09-11 15:59:38', 'YWFhYQ==', '2020-09-11 12:31:24', 1),
(19, '', '', '2020-09-11 15:28:21', 'MzMzMw==', '2020-09-11 14:08:13', 1),
(20, '', '', '2020-09-11 14:36:57', 'MzRkZHM=', '2020-09-11 14:18:30', 1),
(21, '', '', '2020-09-11 17:12:48', 'OTk5OQ==', '2020-09-11 16:55:29', 1),
(22, '', '', '2020-10-11 23:23:13', 'MjIy', '2020-09-11 16:55:35', 1),
(23, '', '', '2020-09-11 16:56:08', 'MDAwMDA=', '2020-09-11 16:56:08', 1),
(24, '', '', '2020-09-11 17:22:22', 'ODg4ODg=', '2020-09-11 17:22:22', 1),
(25, '', '', '2020-09-11 17:45:20', 'c3Nz', '2020-09-11 17:45:20', 1),
(29, '', '', '2020-09-28 22:58:06', 'MzMz', '2020-09-28 22:57:05', 1),
(30, '', '', '2020-10-02 20:44:03', 'MjIyMQ==', '2020-10-02 20:43:41', 1);

-- --------------------------------------------------------

--
-- 表的结构 `friendship`
--

DROP TABLE IF EXISTS `friendship`;
CREATE TABLE `friendship` (
  `id` int UNSIGNED NOT NULL,
  `applicant` varchar(100) NOT NULL COMMENT '申请人',
  `respondent` varchar(100) NOT NULL COMMENT '被申请人',
  `message` varchar(100) NOT NULL COMMENT '验证留言',
  `create_time` datetime NOT NULL COMMENT '时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='好友关系';

--
-- 转存表中的数据 `friendship`
--

INSERT INTO `friendship` (`id`, `applicant`, `respondent`, `message`, `create_time`, `update_time`, `status`) VALUES
(1, 'MjIy', 'MjIyMQ==', '你好吗，我是想23', '2020-10-04 14:55:50', NULL, 0),
(2, 'MjIyMQ==', 'MjIy', '333', '2020-10-04 23:02:12', NULL, 1),
(3, 'MzMz', 'MjIy', '123123123', '2020-10-05 11:37:07', NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int UNSIGNED NOT NULL COMMENT 'id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：停用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='账号表';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `nickname`, `password`, `create_time`, `status`) VALUES
(1, 'test11', 'aa123123', '01ee7f6575a386e7fa80958367c4c9ae', '2020-05-01 12:26:26', 1),
(2, 'test12', 'ccc', '01ee7f6575a386e7fa80958367c4c9ae', '2020-05-01 12:26:26', 1),
(3, 'test113', 'bbb驱蚊器', '01ee7f6575a386e7fa80958367c4c9ae', '2020-05-01 12:26:26', 1),
(4, 'test112', '123', '01ee7f6575a386e7fa80958367c4c9ae', '2020-07-29 23:54:58', 1),
(5, '123123', 'bbbb', '01ee7f6575a386e7fa80958367c4c9ae', '2020-08-03 22:05:23', 1),
(6, 'aaa111', '123123', '04e8ed01f11478a9b15a5ade46ecf463', '2020-08-25 21:39:57', 1),
(7, '222aaaaa', '12EEEE', '9624fe5809b00f507989097f040d4339', '2020-09-28 00:06:07', 1);

--
-- 转储表的索引
--

--
-- 表的索引 `chatroom`
--
ALTER TABLE `chatroom`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `chatroom_client`
--
ALTER TABLE `chatroom_client`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `chatroom_record`
--
ALTER TABLE `chatroom_record`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `chat_record`
--
ALTER TABLE `chat_record`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- 表的索引 `friendship`
--
ALTER TABLE `friendship`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `chatroom`
--
ALTER TABLE `chatroom`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `chatroom_client`
--
ALTER TABLE `chatroom_client`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `chatroom_record`
--
ALTER TABLE `chatroom_record`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=88;

--
-- 使用表AUTO_INCREMENT `chat_record`
--
ALTER TABLE `chat_record`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=346;

--
-- 使用表AUTO_INCREMENT `client`
--
ALTER TABLE `client`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT '自增', AUTO_INCREMENT=31;

--
-- 使用表AUTO_INCREMENT `friendship`
--
ALTER TABLE `friendship`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id', AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
