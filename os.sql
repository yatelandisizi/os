-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2020-05-21 00:43:47
-- 服务器版本： 10.3.22-MariaDB-0+deb10u1
-- PHP Version: 7.3.14-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `os`
--

-- --------------------------------------------------------

--
-- 表的结构 `think_admin`
--

CREATE TABLE `think_admin` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

--
-- 转存表中的数据 `think_admin`
--

INSERT INTO `think_admin` (`ID`, `name`, `pass`) VALUES
(1, 'admin', '7f2d6f198dab803c5596aeff833db515');

-- --------------------------------------------------------

--
-- 表的结构 `think_book`
--

CREATE TABLE `think_book` (
  `id` int(11) NOT NULL,
  `book` varchar(600) NOT NULL,
  `date` date NOT NULL,
  `username` varchar(100) NOT NULL,
  `zan` int(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `cai` varchar(50) NOT NULL COMMENT '踩次数',
  `type` varchar(100) NOT NULL COMMENT '分类',
  `softname` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言表';

--
-- 转存表中的数据 `think_book`
--

INSERT INTO `think_book` (`id`, `book`, `date`, `username`, `zan`, `photo`, `cai`, `type`, `softname`) VALUES
(1, '软件很好看', '2017-09-12', 'MARK JOHNSON', 29, '', '10', '1', 'Adobe Audition CC'),
(8, '软件很棒', '2017-12-11', 'jieke', 3, '', '1', '1', ''),
(13, '软件很赞', '2017-12-11', 'book', 1, '', '0', '2', ''),
(18, '软件很完美', '2017-12-19', 'admin', 1, '/os/public/userphoto/20171219\\ddfb706aded4a9b9dbfdfc2275f3b8a0.jpg', '0', '2', ''),
(19, '软件很好看', '2017-12-20', 'admin', 0, '/os/public/userphoto/20171220\\c6c2a3d65b3c4da732d6f68e44af9c2b.jpg', '1', '2', ''),
(20, '软件很好看', '2017-12-20', 'admin', 0, '/os/public/userphoto/20171220\\e7c432cdeab9199b7ce2cb4b5f0de183.jpg', '0', '2', ''),
(21, '软件很好', '2018-04-09', 'admin', 0, '/os/public/userphoto/20171220\\e7c432cdeab9199b7ce2cb4b5f0de183.jpg', '0', '', ''),
(22, '软件很好看', '2018-04-09', 'admin', 0, '/os/public/userphoto/20171220\\e7c432cdeab9199b7ce2cb4b5f0de183.jpg', '0', '3', ''),
(25, '软件很好看', '2018-04-10', 'admin', 0, '/os/public/userphoto/20171220\\e7c432cdeab9199b7ce2cb4b5f0de183.jpg', '0', '2', 'Adobe Audition CC'),
(26, '软件很好看', '2019-12-10', 'admin', 0, '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', '0', '2', 'Adobe Audition CC'),
(27, '软件非常好用', '2020-05-15', 'admin', 0, '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', '0', '1', '3Dmax2017');

-- --------------------------------------------------------

--
-- 表的结构 `think_bookshuangji`
--

CREATE TABLE `think_bookshuangji` (
  `id` int(11) NOT NULL,
  `bookid` varchar(200) NOT NULL,
  `user` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_bookshuangji`
--

INSERT INTO `think_bookshuangji` (`id`, `bookid`, `user`) VALUES
(1, '1', 'zhang'),
(7, '8', 'admin'),
(8, '23', 'admin'),
(9, '13', 'admin'),
(10, '18', 'admin'),
(11, '19', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `think_fedora`
--

CREATE TABLE `think_fedora` (
  `id` int(11) NOT NULL,
  `title1` varchar(200) NOT NULL,
  `introduce1` varchar(500) NOT NULL,
  `title2` varchar(200) NOT NULL,
  `introduce2` varchar(500) NOT NULL,
  `title3` varchar(200) NOT NULL,
  `title4` varchar(200) NOT NULL,
  `title5` varchar(200) NOT NULL,
  `title6` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_fedora`
--

INSERT INTO `think_fedora` (`id`, `title1`, `introduce1`, `title2`, `introduce2`, `title3`, `title4`, `title5`, `title6`, `photo`) VALUES
(1, 'Fedora操作系统', 'Fedora 是一个 Linux 发行版，是一款由全球社区爱好者构建的面向日常应用的快速、稳定、强大的操作系统。它允许任何人自由地使用、修改和重发布，无论现在还是将来。它由一个强大的社群开发，这个社群的成员以自己的不懈努力，提供并维护自由、开放源码的软件和开放的标准。', 'Fedora的功能对于用户而言，它是一套功能完备、更新快速的免费操作系统。', 'Fedora基于Red Hat Linux，在Red Hat Linux终止发行后，红帽公司计划以Fedora来取代Red Hat Linux在个人领域的应用，而另外发行的Red Hat Enterprise Linux（Red Hat企业版Linux，RHEL）则取代Red Hat Linux在商业应用的领域。', 'Fedora 项目总是力求领导，而非跟随。', 'Fedora 项目始终如一地试图创造、改进，并积极传播自由免费的代码及其精神。', 'Fedora 项目通过社区成员的协作和共享获得成功。\r\n', 'Fedora 项目的任务是作为一个合作社区来领导自由开源的软件及其精神的进步。', '\\os\\public\\index\\images/fedora.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `think_foot`
--

CREATE TABLE `think_foot` (
  `ID` int(11) NOT NULL,
  `internet` varchar(50) NOT NULL COMMENT '网络',
  `computer` varchar(50) NOT NULL COMMENT '电脑种类',
  `os` varchar(50) NOT NULL COMMENT '电脑系统',
  `server` varchar(50) NOT NULL COMMENT '服务器',
  `sqlku` varchar(50) NOT NULL COMMENT '数据库',
  `phpmyadmin` varchar(50) NOT NULL COMMENT '数据库管理',
  `environment` varchar(50) NOT NULL COMMENT '运行环境',
  `webname` varchar(50) NOT NULL COMMENT '网站名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='尾部表';

--
-- 转存表中的数据 `think_foot`
--

INSERT INTO `think_foot` (`ID`, `internet`, `computer`, `os`, `server`, `sqlku`, `phpmyadmin`, `environment`, `webname`) VALUES
(1, '花生壳内网穿透', '树莓派3B服务器', 'raspberry bain', 'Apache', 'MySQL', 'phpmyadmin', 'PHP7', '爆软网站(BOW)');

-- --------------------------------------------------------

--
-- 表的结构 `think_index`
--

CREATE TABLE `think_index` (
  `id` int(11) NOT NULL,
  `winbanben` varchar(200) NOT NULL,
  `upbanben` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_index`
--

INSERT INTO `think_index` (`id`, `winbanben`, `upbanben`, `name`) VALUES
(1, 'chuangyizhe', 'windows10', '创意者');

-- --------------------------------------------------------

--
-- 表的结构 `think_mac`
--

CREATE TABLE `think_mac` (
  `id` int(11) NOT NULL,
  `title1` varchar(200) NOT NULL,
  `introduce1` varchar(500) NOT NULL,
  `title2` varchar(200) NOT NULL,
  `introduce2` varchar(500) NOT NULL,
  `title3` varchar(200) NOT NULL,
  `title4` varchar(200) NOT NULL,
  `title5` varchar(200) NOT NULL,
  `title6` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_mac`
--

INSERT INTO `think_mac` (`id`, `title1`, `introduce1`, `title2`, `introduce2`, `title3`, `title4`, `title5`, `title6`, `photo`) VALUES
(1, 'Mac OS X操作系统', 'Mac OS是一套运行于苹果Macintosh系列电脑上的操作系统。Mac OS是首个在商用领域成功的图形用户界面操作系统。现行的最新的系统版本是OS X 10.12 ，且网上也有在PC上运行的Mac系统，简称 Mac PC。', '多平台兼容模式，为安全和服务做准备，占用更少的内存，多种开发工具。', 'Launchpad 可让你以iPad方式迅速访问应用程序，只须点击 Dock 内的 Launchpad 图标，你打开的窗口即逐渐淡出，Mac 上的所有应用程序将以美观的全屏模式呈现在屏幕上。', '只须用手指轻扫一下，即可查看多个应用程序页面，你还可随意安排应用程序，将它们的图标拖动至新位置，或者分组至文件夹。', '任务控制整合了Dock和控制面板，并可以窗口和全屏模式查看各种应用。\r\n', '在iPad上，每个应用程序都能全屏显示，有效排除视觉干扰，你还可轻松返回其他应用程序。Mac OS X Lion 将同一功能带到台式电脑。', '快速启动面板的工作方式与iPad完全相同。它以类似于iPad的用户界面显示电脑中安装的一切应用，并通过App Store进行管理。', '/os/public/index/images/mac.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `think_movie`
--

CREATE TABLE `think_movie` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `video` varchar(500) NOT NULL,
  `photo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_movie`
--

INSERT INTO `think_movie` (`id`, `name`, `video`, `photo`) VALUES
(1, '愤怒的小鸟', '/os/public/moviephoto/20200520/41586f9a27b1da7925547effda4ed309.MP4', '/os/public/moviefile/20200520/6c085d0f38bc1e7a46807deee6206567.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `think_order`
--

CREATE TABLE `think_order` (
  `id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL COMMENT '图片',
  `price` varchar(200) NOT NULL COMMENT '价格',
  `type` varchar(200) NOT NULL COMMENT '球名',
  `order_id` varchar(100) NOT NULL COMMENT '用户id',
  `count` varchar(50) NOT NULL COMMENT '选购数量',
  `address` varchar(100) NOT NULL COMMENT '详细地址',
  `phone` varchar(200) NOT NULL COMMENT '电话',
  `pro` varchar(200) NOT NULL COMMENT '省',
  `city` varchar(200) NOT NULL COMMENT '市',
  `county` varchar(200) NOT NULL COMMENT '县',
  `name` varchar(100) NOT NULL COMMENT '收货人姓名',
  `color` varchar(100) NOT NULL COMMENT '颜色',
  `goodsname` varchar(100) NOT NULL COMMENT '商品名',
  `dingdan` varchar(100) NOT NULL COMMENT '判断订单'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_order`
--

INSERT INTO `think_order` (`id`, `photo`, `price`, `type`, `order_id`, `count`, `address`, `phone`, `pro`, `city`, `county`, `name`, `color`, `goodsname`, `dingdan`) VALUES
(18, '\\shop\\public\\index\\images\\huangzhe41.jpg', '370', 'krown', '张涛1', '1', '456464564', '对方告诉对方公司', '北京', '市辖区', '东城区', '是的发个撒地方告诉对方', '磨砂紫', 'C3yoyodesign 皇者之冠', '1'),
(17, '\\shop\\public\\index\\images\\newton21.jpg', '688', 'newton', '张涛1', '1', '456464564', '对方告诉对方公司', '北京', '市辖区', '东城区', '是的发个撒地方告诉对方', '亮面金', '牛顿悠悠球newton 专业悠悠球', '1'),
(16, '\\shop\\public\\index\\images\\newton31.jpg', '688', 'newton', '张涛1', '1', '456464564', '对方告诉对方公司', '北京', '市辖区', '东城区', '是的发个撒地方告诉对方', '亮面金', '牛顿悠悠球newton 专业悠悠球', '1'),
(23, '\\shop\\public\\index\\images\\huangzhe21.jpg', '370', 'krown', '张涛1', '1', '456464564', '对方告诉对方公司', '北京', '市辖区', '东城区', '是的发个撒地方告诉对方', '磨砂银', 'C3yoyodesign 皇者之冠', '1'),
(24, '\\shop\\public\\index\\images\\huangzhe41.jpg', '370', 'krown', '张涛1', '1', '456464564', '对方告诉对方公司', '北京', '市辖区', '东城区', '是的发个撒地方告诉对方', '磨砂紫', 'C3yoyodesign 皇者之冠', '0'),
(25, '\\shop\\public\\index\\images\\huangzhe11.jpg', '370', 'krown', '张涛1', '1', '456464564', '对方告诉对方公司', '北京', '市辖区', '东城区', '是的发个撒地方告诉对方', '磨砂蓝', 'C3yoyodesign 皇者之冠', '0'),
(27, '\\shop\\public\\index\\images\\newton31.jpg', '688', 'newton', '张涛1', '1', '456464564', '对方告诉对方公司', '北京', '市辖区', '东城区', '是的发个撒地方告诉对方', '亮面银', '牛顿悠悠球newton 专业悠悠球', '0');

-- --------------------------------------------------------

--
-- 表的结构 `think_question`
--

CREATE TABLE `think_question` (
  `id` int(11) NOT NULL,
  `question` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='密保问题表';

--
-- 转存表中的数据 `think_question`
--

INSERT INTO `think_question` (`id`, `question`) VALUES
(1, '您母亲的姓名是？'),
(2, '您父亲的姓名是？'),
(3, '您配偶的姓名是？'),
(4, '您的出生地是？'),
(5, '您高中班主任的名字是？'),
(6, '您初中班主任的名字是？'),
(7, '您小学班主任的名字是？'),
(8, '您的小学校名是？'),
(9, '您的学号（或工号）是？'),
(10, '您父亲的生日是？'),
(12, '您母亲的生日是？'),
(13, '您配偶的生日是？');

-- --------------------------------------------------------

--
-- 表的结构 `think_raspbain`
--

CREATE TABLE `think_raspbain` (
  `id` int(11) NOT NULL,
  `title1` varchar(200) NOT NULL,
  `introduce1` varchar(500) NOT NULL,
  `title2` varchar(200) NOT NULL,
  `introduce2` varchar(500) NOT NULL,
  `title3` varchar(200) NOT NULL,
  `introduce3` varchar(500) NOT NULL,
  `title4` varchar(200) NOT NULL,
  `introduce4` varchar(500) NOT NULL,
  `photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_raspbain`
--

INSERT INTO `think_raspbain` (`id`, `title1`, `introduce1`, `title2`, `introduce2`, `title3`, `introduce3`, `title4`, `introduce4`, `photo`) VALUES
(1, 'raspbain(树莓派)操作系统', 'Raspberry Pi(中文名为“树莓派”,简写为RPi，(或者RasPi / RPI)是为学习计算机编程教育而设计，只有信用卡大小的微型电脑，其系统基于Linux。 随着Windows 10 IoT的发布，我们也将可以用上运行Windows的树莓派。', '红版树莓派', '2013年2月国内厂商深圳韵动电子取得了该产品在国内的生产及销售权限，为了便于区分市场，树莓派基金会规定韵动电子在中国大陆销售的树莓派一律采用红色的PCBConsonantia, there live the blind texts.', 'Real Project For Real Solutions', 'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.', 'Real Project For Real Solutions', 'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.', '/os/public/index/images/raspbain.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `think_redhat`
--

CREATE TABLE `think_redhat` (
  `id` int(11) NOT NULL,
  `title1` varchar(500) NOT NULL COMMENT '标题1',
  `introduce1` varchar(500) NOT NULL COMMENT '介绍1',
  `title2` varchar(500) NOT NULL COMMENT '标题2',
  `introduce2` varchar(500) NOT NULL COMMENT '介绍2',
  `title3` varchar(500) NOT NULL COMMENT '标题3',
  `introduce3` varchar(500) NOT NULL COMMENT '介绍3',
  `title4` varchar(500) NOT NULL COMMENT '标题4',
  `introduce4` varchar(500) NOT NULL COMMENT '介绍4',
  `photo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_redhat`
--

INSERT INTO `think_redhat` (`id`, `title1`, `introduce1`, `title2`, `introduce2`, `title3`, `introduce3`, `title4`, `introduce4`, `photo`) VALUES
(1, 'Redhat操作系统', 'Red Hat（红帽）公司（NYSE：RHT）是一家开源解决方案供应商，也是标准普尔500指数成员。总部位于美国北卡罗来纳州的罗利市，截止2015年3月3日，共有80多个分公司。红帽公司为诸多重要IT技术如操作系统、存储、中间件、虚拟化和云计算提供关键任务的软件与服务。', '红帽企业Linux', '红帽在2014年6月发布了最新旗舰版企业操作系统——红帽企业Linux 7。基于红帽企业Linux 7操作系统，企业可整合裸机服务器、 虚拟机、基础设施即服务(IaaS)和平台即服务(PaaS)，以构建一个强大稳健的数据中心环境，满足不断变化的业务需求。', '红帽卫星', '红帽卫星是一个综合性解决方案，它通过配置软件分发、补丁和配置管理，以及物理、虚拟和云环境的订阅管理为红帽系统提供完整的生命周期管理，为管理构建、部署、运行和淘汰系统所需的工具提供了单独的管理控制台和方法论。', '红帽培训', '红帽培训分别提供了数十门涵盖5大技术领域（云计算、存储、虚拟化、中间件、操作系统）的专业课程。红帽认为将培训作为部署和维护战略的一部分，则企业可以实现开源技术价值和性能的最大化。', '/os/public/index/images/redhat.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `think_shiyan`
--

CREATE TABLE `think_shiyan` (
  `id` int(11) NOT NULL,
  `file1` varchar(100) NOT NULL,
  `file2` varchar(100) NOT NULL,
  `file3` varchar(100) NOT NULL,
  `file4` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_shiyan`
--

INSERT INTO `think_shiyan` (`id`, `file1`, `file2`, `file3`, `file4`, `name`, `pass`) VALUES
(7, '/os/public/shiyanfile/20191211\\fcee23e403f4c088d39bd6e18c77fb93.jfif', '/os/public/shiyanfile/20191211\\a11f1856c5f21d048ffd876fc1e89523.jfif', '/os/public/shiyanfile/20191211\\f5ef69f4838df49f7cc8987da6791491.png', '/os/public/shiyanfile/20191211\\6659dcf7f12c031f5a49e6e655e22cbb.png', 'admin', 'qwer'),
(8, '未选择任何图片', '未选择任何图片', '未选择任何图片', '未选择任何图片', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `think_shoucang`
--

CREATE TABLE `think_shoucang` (
  `id` int(11) NOT NULL,
  `videoid` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` varchar(200) NOT NULL,
  `zan` varchar(200) NOT NULL,
  `cai` varchar(200) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `look` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `typename` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `videofile` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_shoucang`
--

INSERT INTO `think_shoucang` (`id`, `videoid`, `username`, `title`, `author`, `zan`, `cai`, `comment`, `look`, `type`, `typename`, `date`, `videofile`, `photo`) VALUES
(7, '44', 'admin', '瀑布风景', 'admin', '0', '0', '0', '0', 'meijing', '美景', '2020-05-18', '/os/public/videofile/20200515\\1a13989f7cce0ade546a1516ba3d103c.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG'),
(8, '43', 'admin', 'Excel技巧', 'admin', '1', '0', '0', '6', 'jineng', '技能分享', '2020-05-20', '/os/public/videofile/20200515\\c821cdf647e57447a15661bbbb9f1d0b.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG'),
(9, '46', 'admin', 'Excal快速核对数据', 'admin', '0', '0', '0', '3', 'jineng', '技能分享', '2020-05-20', '/os/public/videofile/20200515\\c75ed31070fce5bb1cb80524974057c6.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG');

-- --------------------------------------------------------

--
-- 表的结构 `think_soft`
--

CREATE TABLE `think_soft` (
  `id` int(11) NOT NULL,
  `device` varchar(50) NOT NULL COMMENT '运行设备',
  `environment` varchar(100) NOT NULL COMMENT '运行环境',
  `filename` varchar(100) NOT NULL COMMENT '文件名',
  `language` varchar(50) NOT NULL COMMENT '支持语言',
  `name` varchar(50) NOT NULL COMMENT '软件名',
  `photo` varchar(100) NOT NULL COMMENT '软件图片',
  `photo1` varchar(100) NOT NULL COMMENT '软件截图1',
  `photo2` varchar(100) NOT NULL COMMENT '软件截图2',
  `photo3` varchar(100) NOT NULL COMMENT '软件截图3',
  `score` varchar(50) NOT NULL COMMENT '软件评分',
  `size` varchar(50) NOT NULL COMMENT '软件大小',
  `support` varchar(50) NOT NULL COMMENT '支持位数',
  `type` varchar(100) NOT NULL COMMENT '软件类型',
  `uptime` date NOT NULL COMMENT '更新时间',
  `sha` varchar(100) NOT NULL COMMENT '哈希值',
  `frequency` varchar(50) NOT NULL COMMENT '下载次数',
  `xunlei` varchar(300) NOT NULL COMMENT '迅雷地址',
  `yunpan` varchar(300) NOT NULL COMMENT '云盘地址',
  `bendi` varchar(300) NOT NULL COMMENT '本地下载',
  `title1` varchar(100) NOT NULL COMMENT '标题1',
  `introduce1` varchar(500) NOT NULL COMMENT '介绍1',
  `title2` varchar(100) NOT NULL COMMENT '标题2',
  `introduce2` varchar(500) NOT NULL COMMENT '介绍2',
  `title3` varchar(100) NOT NULL COMMENT '标题3',
  `introduce3` varchar(500) NOT NULL COMMENT '介绍3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='软件表';

--
-- 转存表中的数据 `think_soft`
--

INSERT INTO `think_soft` (`id`, `device`, `environment`, `filename`, `language`, `name`, `photo`, `photo1`, `photo2`, `photo3`, `score`, `size`, `support`, `type`, `uptime`, `sha`, `frequency`, `xunlei`, `yunpan`, `bendi`, `title1`, `introduce1`, `title2`, `introduce2`, `title3`, `introduce3`) VALUES
(1, 'windows', 'win7/win8/win10', 'shop.rar', '简体中文/英文', '3Dmax2017', '/os/public/softphoto/20200408/u=3925444327,2415424198&fm=26&gp=0.jpg', '/os/public/softphoto/20200518\\33d82f476b045e38067df826da381575.png', '/os/public/softphoto/20200518\\640d85f22fe3aaf0630a9b2c642a4799.jpg', '/os/public/softphoto/20200518\\f3c3cfc95291fe706ad07ee60e2caa35.jpg', '9.0', '179.98M', '32/64', '专业设计软件', '2020-05-18', '893b25edc560315710963b0a90d27d51', '41', '', '', '/os/public/softfile/20191221/shop.rar', '简介', '3D Studio Max，常简称为3d Max或3ds MAX，是Discreet公司开发的（后被Autodesk公司合并）基于PC系统的三维动画渲染和制作软件。其前身是基于DOS操作系统的3D Studio系列软件。', '简介', '在Windows NT出现以前，工业级的CG制作被SGI图形工作站所垄断。3D Studio Max + Windows NT组合的出现一下子降低了CG制作的门槛，首先开始运用在电脑游戏中的动画制作，后更进一步开始参与影视片的特效制作，例如X战警II，最后的武士等。', '简介', '在Discreet 3Ds max 7后，正式更名为Autodesk 3ds Max 最新版本是3ds max 2020'),
(2, 'windows', 'win7/win8/win10', '3181907124.pkt', '简体中文', 'Adobe Audition CC', '/os/public/softphoto/20200408/b3b7d0a20cf431adfaae45054536acaf2edd9889.jpg', '/os/public/softphoto/20200518\\162504501508b3cf2a33178d4da3a0d4.png', '/os/public/softphoto/20200518\\5b947dc46c00e8a6f8e97fc44311a4d1.png', '/os/public/softphoto/20200518\\e48464fd29cc7792111cf158d0b48b42.png', '9.0', '168.74K', '32/64', '音频处理软件', '2020-05-20', 'e553b981dd0a0d032444d18a5ab52b84', '35', '', '', '/var/www/html/os/public/softfile20200520/5e6c7420f8ad0b19bcbf68ef5a0e7e57.pkt', '简介', 'Audition CC 是一款完善的工具集，其中包含用于创建、混合、编辑和复原音频内容的多轨、波形和光谱显示功能。这一强大的音频工作站旨在加快视频制作工作流程和音频修整的速度，并且还提供带有纯净声音的精美混音效果。', '简介', 'Au，是Adobe Audition的简称，由Adobe公司开发。是一个专业音频编辑和混合环境，原名为Cool Edit Pro. 被Adobe公司收购后，改名为Adobe Audition。', '简介', 'Audition专为在照相室、广播设备和后期制作设备方面工作的音频和视频专业人员设计，可提供先进的音频混合、编辑、控制和效果处理功能。'),
(3, 'windows', 'win7/win8/win10', '机器学习.docx', '简体中文', 'Dreamweaver CS6', '/os/public/softphoto/20200408/00e93901213fb80e05c3a5d839d12f2eb93894ab.jpg', '/os/public/softphoto/20200518\\3e437683b3c32bdc983d392e5676d707.jpg', '/os/public/softphoto/20200518\\bd6686a1c25464da433cfabc4e07a1b1.png', '/os/public/softphoto/20200518\\ab0e33d5d0186f802b5831d1d8f52154.jpg', '8.5', '0.132', '32/64', '网站设计软件', '2020-05-18', '9d5817a6afcf43e207da70e5aa200722', '6', '', '', '/os/public/softfile/20191211/机器学习.docx', '简介', 'Adobe Dreamweaver，简称“DW”，中文名称 \"梦想编织者\"，最初为美国MACROMEDIA公司开发 ，2005年被Adobe公司收购。DW是集网页制作和管理网站于一身的所见即所得网页代码编辑器。', '简介', '利用对 HTML、CSS、JavaScript等内容的支持，设计师和程序员可以在几乎任何地方快速制作和进行网站建设。Adobe Dreamweaver使用所见即所得的接口，亦有HTML（标准通用标记语言下的一个应用）编辑的功能，借助经过简化的智能编码引擎，轻松地创建、编码和管理动态网站。', '简介', '访问代码提示，即可快速了解 HTML、CSS 和其他Web 标准。 使用视觉辅助功能减少错误并提高网站开发速度。'),
(4, 'windows', 'win7/win8/win10', 'cn_office_professional_plus_2016_x86_x64_dvd_6969182.iso', '简体中文', 'office2016', '/os/public/softphoto/20200518/b21bb051f819861857e946ed45ed2e738bd4e629.jpg', '/os/public/softphoto/20200518\\2e3c59b8c016a0c94b93a93407a6edb6.png', '/os/public/softphoto/20200518\\cdd4c928c3170f6c1b6a9c99bf1701c4.jpg', '/os/public/softphoto/20200518\\9850231dac0266604f6cf15900a19bbc.jpg', '9.0', '2.41', '32/64', '办公套件', '2020-05-18', '', '', '', '', '', '', '', '', '', '', ''),
(41, 'windows', 'Win7/win8/win10', 'wampserver3.1.7_x64.exe', '简体中文', 'SQL server', '/os/public/softphoto/20200518/30adcbef76094b362b14c21ba1cc7cd98c109d46.jpg', '/os/public/softphoto/20200518\\a9398bc2201028d87fbb2d66150b8e2e.gif', '/os/public/softphoto/20200518\\9681f01c6a931feda0802fb7bbca26dd.jpg', '/os/public/softphoto/20200518\\f55bef2f6162a785555af72186845833.jpg', '', '285.8M', '32/64', '数据库软件', '2020-05-18', '997e83edff5811bd4403fb9e2f01c6e0', '5', '', '', '/os/public/softfile/20200518/wampserver3.1.7_x64.exe', '简介', 'SQL Server 是Microsoft 公司推出的关系型数据库管理系统。具有使用方便可伸缩性好与相关软件集成程度高等优点，可跨越从运行Microsoft Windows 98 的膝上型电脑到运行Microsoft Windows 2012 的大型多处理器的服务器等多种平台使用。', '简介', 'Microsoft SQL Server 是一个全面的数据库平台，使用集成的商业智能 (BI)工具提供了企业级的数据管理。Microsoft SQL Server 数据库引擎为关系型数据和结构化数据提供了更安全可靠的存储功能，使您可以构建和管理用于业务的高可用和高性能的数据应用程序。', '简介', 'SQL Server 是一个关系数据库管理系统。它最初是由Microsoft、Sybase 和Ashton-Tate三家公司共同开发的，于1988 年推出了第一个OS/2版本。在Windows NT 推出后，Microsoft与Sybase 在SQL Server 的开发上就分道扬镳了，Microsoft 将SQL Server移植到Windows NT系统上，专注于开发推广SQL Server 的Windows NT 版本。Sybase 则较专注于SQL Server在UNⅨ操作系统上的应用。'),
(45, 'windows', 'Win7/win8/win10', '6.实用电子小软件.zip', '简体中文', 'Adobe PhotoShop', '/os/public/softphoto/20200520/a59d75bbae80b511da37272def9a55fe.jpg', '/os/public/softphoto/20200520/a19c2b6a70cbe449cdba7fea0bb420af.jpg', '/os/public/softphoto/20200520/120904ad870b609f42aaa71fce3f5177.jpg', '/os/public/softphoto/20200520/d954a84670ef59229a6ef04b2424ff8c.jpg', '', '1.76M', '32/64', '图像处理软件', '2020-05-19', '8714044d492b9300c5f16c962db25304', '0', '', '', '/os/public/softfile/20200520/ee5db7ca27e2fd72336d9e219e40f943.zip', '简介', 'Audition CC 是一款完善的工具集，其中包含用于创建、混合、编辑和复原音频内容的多轨、波形和光谱显示功能。这一强大的音频工作站旨在加快视频制作工作流程和音频修整的速度，并且还提供带有纯净声音的精美混音效果。', '简介', '2003年，Adobe Photoshop 8被更名为Adobe Photoshop CS。2013年7月，Adobe公司推出了新版本的Photoshop CC，自此，Photoshop CS6作为Adobe CS系列的最后一个版本被新的CC系列取代。', '简介', '截止2019年1月Adobe Photoshop CC 2019为市场最新版本。 Adobe支持Windows操作系统 、Android与Mac OS， 但Linux操作系统用户可以通过使用Wine来运行Photoshop。'),
(46, 'windows', 'Win7/win8/win10', 'OIP.jpg', '简体中文', 'admin', '/os/public/softphoto/20200520/912707821781b691bf1c4898dd32886b.jpg', '/os/public/softphoto/20200520/ffa694274c48becd5670baafb1525d2b.jpg', '/os/public/softphoto/20200520/15050ea246369de5f15d85d7af0129f4.jpg', '/os/public/softphoto/20200520/af49ddea2955304a2c2584e44c83fee0.jpg', '', '37.75K', '32/64', '图像处理软件', '2020-05-20', '4d28379e0a04c57feb42ec955edcd0fd', '2', '', '', '/os/public/softfile/20200520/f5582fc90c7cf329cfde613fbed01217.jpg', '简介', 'Audition CC 是一款完善的工具集，其中包含用于创建、混合、编辑和复原音频内容的多轨、波形和光谱显示功能。这一强大的音频工作站旨在加快视频制作工作流程和音频修整的速度，并且还提供带有纯净声音的精美混音效果。', '简介', '2003年，Adobe Photoshop 8被更名为Adobe Photoshop CS。2013年7月，Adobe公司推出了新版本的Photoshop CC，自此，Photoshop CS6作为Adobe CS系列的最后一个版本被新的CC系列取代。', '简介', '截止2019年1月Adobe Photoshop CC 2019为市场最新版本。 Adobe支持Windows操作系统 、Android与Mac OS， 但Linux操作系统用户可以通过使用Wine来运行Photoshop。');

-- --------------------------------------------------------

--
-- 表的结构 `think_softshoucang`
--

CREATE TABLE `think_softshoucang` (
  `ID` int(15) NOT NULL,
  `userid` varchar(15) NOT NULL COMMENT '用户id',
  `photo` varchar(100) NOT NULL COMMENT '软件封面',
  `name` varchar(50) NOT NULL COMMENT '软件名',
  `type` varchar(50) NOT NULL COMMENT '软件类型',
  `softid` int(15) NOT NULL COMMENT '软件id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='软件收藏表';

--
-- 转存表中的数据 `think_softshoucang`
--

INSERT INTO `think_softshoucang` (`ID`, `userid`, `photo`, `name`, `type`, `softid`) VALUES
(1, 'admin', '/os/public/softphoto/20200408/u=3925444327,2415424198&fm=26&gp=0.jpg', '3Dmax2017', '专业设计软件', 1);

-- --------------------------------------------------------

--
-- 表的结构 `think_ubuntu`
--

CREATE TABLE `think_ubuntu` (
  `id` int(11) NOT NULL,
  `title1` varchar(500) NOT NULL COMMENT '标题1',
  `introduce1` varchar(500) NOT NULL COMMENT '介绍1',
  `title2` varchar(500) NOT NULL COMMENT '标题2',
  `introduce2` varchar(500) NOT NULL COMMENT '介绍2',
  `title3` varchar(500) NOT NULL COMMENT '标题3',
  `title4` varchar(500) NOT NULL COMMENT '标题4',
  `title5` varchar(500) NOT NULL COMMENT '标题5',
  `title6` varchar(500) NOT NULL COMMENT '标题6',
  `photo` varchar(500) NOT NULL COMMENT '图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_ubuntu`
--

INSERT INTO `think_ubuntu` (`id`, `title1`, `introduce1`, `title2`, `introduce2`, `title3`, `title4`, `title5`, `title6`, `photo`) VALUES
(1, 'Ubuntu操作系统', 'Ubuntu的开发由英国Canonical有限公司主导，南非企业家Mark Shuttleworth所创立。Canonical通过销售与Ubuntu相关的技术支持和其他服务来产生收益。Ubuntu项目公开承诺开源软件开发的原则；鼓励人们使用自由软件，研究它的工作原理，改进和分发。', 'ubuntu基于linux的免费开源桌面PC操作系统，十分契合英特尔的超极本定位，支持x86、64位和ppc架构', 'Ubuntu的目标在于为一般用户提供一个最新同时又相当稳定，主要以自由软件建构而成的操作系统。Ubuntu目前具有庞大的社区力量支持，用户可以方便地从社区获得帮助。', '强调易用性和国际化，以便为更多的人所用', '最安全的系统环境', '免费开源的正版系统', '更加有好的Linux交互界面', '/os/public/index/images/ubuntu.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `think_user`
--

CREATE TABLE `think_user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `pro` varchar(50) NOT NULL COMMENT '省',
  `city` varchar(50) NOT NULL COMMENT '市',
  `county` varchar(50) NOT NULL COMMENT '县',
  `phone` varchar(100) NOT NULL COMMENT '电话',
  `email` varchar(100) NOT NULL COMMENT '电子邮箱',
  `weixin` varchar(50) NOT NULL,
  `guojia` varchar(50) NOT NULL,
  `QQ` varchar(50) NOT NULL,
  `question` varchar(100) NOT NULL,
  `answer` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `jifen` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_user`
--

INSERT INTO `think_user` (`id`, `username`, `password`, `pro`, `city`, `county`, `phone`, `email`, `weixin`, `guojia`, `QQ`, `question`, `answer`, `photo`, `jifen`) VALUES
(1, '亚特兰蒂斯', '123', '', '', '', '15027931551', '', '', '', '', '', '', '', 0),
(4, 'admin', '7f2d6f198dab803c5596aeff833db515', '北京', '市辖区', '东城区', '', '2064245662@qq.com', '', '中国', '', '您母亲的姓名是？', '', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', 9280),
(11, '123', '202cb962ac59075b964b07152d234b70', '北京', '市辖区', '东城区', '123', '123456798456123@qq.com', '123', '中国', '123', '您母亲的姓名是？', '123', '/os/public/userphoto/20200520/cd64ebe6e70b7f1a4389797b811e15fa.jpg', 350),
(12, '123456789', '25f9e794323b453885f5181f1b624d0b', '北京', '市辖区', '东城区', '1231232', '2064212312312345662@qq.com', '123123123', '中国', '123123123', '您母亲的姓名是？', '123123123123', '/os/public/userphoto/20200520/b292d70fba3d622cb29e203615aa9b88.jpg', 350);

-- --------------------------------------------------------

--
-- 表的结构 `think_video`
--

CREATE TABLE `think_video` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL COMMENT '标题',
  `author` varchar(200) NOT NULL COMMENT '作者',
  `zan` varchar(100) NOT NULL COMMENT '赞次数',
  `cai` varchar(100) NOT NULL COMMENT '踩次数',
  `comment` varchar(500) NOT NULL COMMENT '评论',
  `look` varchar(100) NOT NULL COMMENT '观看次数',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `typename` varchar(200) NOT NULL COMMENT '类型名',
  `date` date NOT NULL COMMENT '发布日期',
  `videofile` varchar(200) NOT NULL COMMENT '文件地址',
  `photo` varchar(200) NOT NULL COMMENT '作者头像',
  `verify` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_video`
--

INSERT INTO `think_video` (`id`, `title`, `author`, `zan`, `cai`, `comment`, `look`, `type`, `typename`, `date`, `videofile`, `photo`, `verify`) VALUES
(43, 'Excel技巧', 'admin', '1', '0', '0', '8', 'jineng', '技能分享', '2020-05-15', '/os/public/videofile/20200515\\c821cdf647e57447a15661bbbb9f1d0b.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', 1),
(44, '瀑布风景', 'admin', '0', '0', '0', '2', 'meijing', '美景', '2020-05-15', '/os/public/videofile/20200515\\1a13989f7cce0ade546a1516ba3d103c.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', 1),
(45, '夏威夷海滩', 'admin', '0', '0', '0', '0', 'meijing', '美景', '2020-05-15', '/os/public/videofile/20200515\\ad83123060204dfaa1c636707bd800eb.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', 0),
(46, 'Excal快速核对数据', 'admin', '0', '0', '0', '5', 'jineng', '技能分享', '2020-05-15', '/os/public/videofile/20200515\\c75ed31070fce5bb1cb80524974057c6.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', 0),
(47, 'Excal关于ctrl键的应用', 'admin', '0', '0', '0', '5', 'jineng', '技能分享', '2020-05-15', '/os/public/videofile/20200515\\987de98e45e500d2db664161f53c5594.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', 0),
(48, 'Excel快速整理表格', 'admin', '0', '0', '0', '0', 'jineng', '技能分享', '2020-05-15', '/os/public/videofile/20200515\\d58c3b9b9d1d04d3ad795016ac0f9e6a.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', 0),
(49, '清澈河水', 'admin', '0', '0', '0', '0', 'meijing', '美景', '2020-05-15', '/os/public/videofile/20200515\\de25ec70af630ed3cb25e30bea81bac1.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', 0),
(50, '海里溶洞', 'admin', '0', '0', '0', '0', 'meijing', '美景', '2020-05-15', '/os/public/videofile/20200515\\33cb9909f12f54d9f8b2190a6e229af5.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', 0),
(51, 'Excel求和技巧', 'admin', '0', '0', '0', '0', 'jineng', '技能分享', '2020-05-15', '/os/public/videofile/20200515\\fbeb5eaa2e8163f328e7ba681f5d0e3a.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', 0),
(52, 'Excel制作图表技巧', 'admin', '0', '0', '0', '2', 'gufeng', '古风', '2020-05-15', '/os/public/videofile/20200515\\ae3e0343d44ce206847b1a00ef8b984a.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', 0),
(53, 'Excel快速合并技巧', 'admin', '0', '0', '0', '3', 'jineng', '技能分享', '2020-05-15', '/os/public/videofile/20200515\\26acc568caccccfaba756cc03d217c61.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', 0),
(54, '泡茶', 'admin', '0', '0', '0', '0', 'meijing', '美景', '2020-05-19', '/os/public/videofile/20200519\\5b355e5aeb987a157b3023bfdf14048f.MP4', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', 0);

-- --------------------------------------------------------

--
-- 表的结构 `think_videobook`
--

CREATE TABLE `think_videobook` (
  `id` int(11) NOT NULL,
  `book` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `username` varchar(200) NOT NULL,
  `zan` varchar(200) NOT NULL,
  `cai` varchar(200) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `videoname` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_videobook`
--

INSERT INTO `think_videobook` (`id`, `book`, `date`, `username`, `zan`, `cai`, `photo`, `type`, `videoname`) VALUES
(1, 'sdfgsfdgsdf', '2018-04-11', 'admin', '0', '0', '/os/public/userphoto/20171220\\e7c432cdeab9199b7ce2cb4b5f0de183.jpg', '5', '地球望远镜计划'),
(2, '好恐怖啊', '2018-04-11', 'admin', '1', '0', '/os/public/userphoto/20171220\\e7c432cdeab9199b7ce2cb4b5f0de183.jpg', '5', '地球望远镜计划'),
(3, '唱得好', '2018-04-11', 'admin', '1', '0', '/os/public/userphoto/20171220\\e7c432cdeab9199b7ce2cb4b5f0de183.jpg', '9', '好汗歌'),
(4, '温热台湾儿童问题', '2018-04-11', 'admin', '0', '0', '/os/public/userphoto/20171220\\e7c432cdeab9199b7ce2cb4b5f0de183.jpg', '12', '李子柒'),
(5, '体育局昂反复国家体育', '2018-04-11', 'admin', '0', '0', '/os/public/userphoto/20171220\\e7c432cdeab9199b7ce2cb4b5f0de183.jpg', '2', '宇宙无边'),
(6, '分公司法定', '2018-04-11', 'admin', '1', '0', '/os/public/userphoto/20171220\\e7c432cdeab9199b7ce2cb4b5f0de183.jpg', '5', '地球望远镜计划'),
(7, '的花费更多更好', '2018-04-11', 'admin', '0', '0', '/os/public/userphoto/20171220\\e7c432cdeab9199b7ce2cb4b5f0de183.jpg', '5', '地球望远镜计划'),
(8, 'qqq', '2018-04-13', 'admin', '0', '0', '/os/public/userphoto/20171220\\e7c432cdeab9199b7ce2cb4b5f0de183.jpg', '38', '张全蛋说换7'),
(9, '软件非常好用', '2020-05-15', 'admin', '0', '0', '/os/public/userphoto/20191209\\ba6a93d5e3201b9077012f5daf6f3dd1.JPG', '47', 'Excal关于ctrl键的应用');

-- --------------------------------------------------------

--
-- 表的结构 `think_videobookshuangji`
--

CREATE TABLE `think_videobookshuangji` (
  `id` int(11) NOT NULL,
  `bookid` varchar(200) NOT NULL,
  `user` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_videobookshuangji`
--

INSERT INTO `think_videobookshuangji` (`id`, `bookid`, `user`) VALUES
(1, '1', 'admin'),
(2, '2', 'admin'),
(3, '3', 'admin'),
(4, '6', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `think_videoshuangji`
--

CREATE TABLE `think_videoshuangji` (
  `id` int(11) NOT NULL,
  `bookid` varchar(200) NOT NULL,
  `user` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_videoshuangji`
--

INSERT INTO `think_videoshuangji` (`id`, `bookid`, `user`) VALUES
(1, '5', 'admin'),
(2, '5', 'admin'),
(3, '5', 'admin'),
(4, '5', 'admin'),
(5, '5', 'admin'),
(6, '5', 'admin'),
(7, '5', 'admin'),
(8, '5', 'admin'),
(9, '1', 'admin'),
(10, '2', 'admin'),
(11, '25', 'admin'),
(12, '', 'admin'),
(13, '', 'zhangsan'),
(14, '43', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `think_videotype`
--

CREATE TABLE `think_videotype` (
  `id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL COMMENT '类型',
  `typename` varchar(200) NOT NULL COMMENT '类型名',
  `look` varchar(100) NOT NULL COMMENT '观看次数',
  `photo` varchar(200) NOT NULL COMMENT '图片',
  `introduce` varchar(200) NOT NULL COMMENT '介绍'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_videotype`
--

INSERT INTO `think_videotype` (`id`, `type`, `typename`, `look`, `photo`, `introduce`) VALUES
(1, 'gufeng', '古风', '59', '/os/public/video/images/gufeng.jpg', '诗词歌赋，与君共赏\r\n'),
(2, 'keji', '科技', '138', '/os/public/video/images/keji.jpg', '上九天揽月，下五洋捉鳖'),
(3, 'qiwen', '奇闻', '100', '/os/public/video/images/qiwen.jpg', '探世间奥秘，寻未解谜团'),
(4, 'jianji', '创意剪辑', '142', '/os/public/video/images/jianji.jpg', '每一帧画面都是一个新世界'),
(5, 'meijing', '美景', '16', '/os/public/video/images/meijing.jpg', '大好河山，迷人之境'),
(6, 'duanju', '情景短剧', '0', '/os/public/video/images/duanju.jpg', '人生每天都是现场直播'),
(7, 'jineng', '技能分享', '96', '/os/public/video/images/jineng.jpg', '赠人玫瑰，手有余香'),
(8, 'duanjilupian', '短纪录片', '0', '/os/public/video/images/duanjilupian.jpg', '世界处处都有精彩发生'),
(9, 'caifang', '街头采访', '0', '/os/public/video/images/caifang.jpg', '普罗大众，千姿百态'),
(10, 'meishi', '美食', '0', '/os/public/video/images/meishi.jpg', '川鲁粤苏，觥筹交错'),
(11, 'yingshi', '影视预告', '10', '/os/public/video/images/yingshi.jpg', '大片来袭，不容错过'),
(12, 'mengchong', '萌宠', '0', '/os/public/video/images/mengchong.jpg', '萌宠出没，备好粮食'),
(13, 'qinggan', '情感视频', '12', '/os/public/video/images/qinggan.jpg', '人生百态，共追幸福'),
(14, 'caiyi', '才艺展示', '1', '/os/public/video/images/caiyi.jpg', '技多不压身'),
(15, 'yinyue', '音乐欣赏', '42', '/os/public/video/images/yinyue.jpg', '如听仙月耳暂明');

-- --------------------------------------------------------

--
-- 表的结构 `think_win`
--

CREATE TABLE `think_win` (
  `id` int(11) NOT NULL,
  `upbanben` varchar(50) NOT NULL COMMENT '更新版本',
  `jianname` varchar(200) NOT NULL COMMENT '简称',
  `winbanben` varchar(50) NOT NULL COMMENT 'win版本',
  `banbenname` varchar(100) NOT NULL COMMENT '更新名称',
  `stname` varchar(100) NOT NULL COMMENT '系统名称',
  `chname` varchar(200) NOT NULL,
  `filename` varchar(200) NOT NULL COMMENT '文件名称',
  `sha` varchar(300) NOT NULL COMMENT '哈希值',
  `filesize` varchar(20) NOT NULL COMMENT '文件大小',
  `bendi` varchar(300) NOT NULL COMMENT '本地下载',
  `xunlei` varchar(300) NOT NULL COMMENT '迅雷下载',
  `yunpan` varchar(300) NOT NULL COMMENT '网盘下载',
  `shunxu` int(20) NOT NULL COMMENT '排序',
  `wei` int(20) NOT NULL COMMENT '位数',
  `frequency` varchar(50) NOT NULL COMMENT '下载次数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='win系统表';

--
-- 转存表中的数据 `think_win`
--

INSERT INTO `think_win` (`id`, `upbanben`, `jianname`, `winbanben`, `banbenname`, `stname`, `chname`, `filename`, `sha`, `filesize`, `bendi`, `xunlei`, `yunpan`, `shunxu`, `wei`, `frequency`) VALUES
(1, 'windows10', 'Win10', 'chuangyizhe', '创意者', 'Professional', '专业版', 'cn_windows_10_multiple_editions_version_1703_updated_march_2017_x64_dvd_10194190.iso', '054C741DED8989F4D0D419946EB37182F20E4482', '4.27', '/os/public/uploads/20200520/43f45c8374f1d50e7614961e0ac0aa68.jpg', 'ed2k://|file|cn_windows_10_multiple_editions_version_1703_updated_march_2017_x64_dvd_10194190.iso|4587292672|373B263D307F6AA2486A74E557DD22C9|/', '', 4, 64, '165'),
(2, 'windows10', 'Win10', 'chuangyizhe', '创意者', 'Professional', '专业版', 'cn_windows_10_multiple_editions_version_1703_updated_march_2017_x86_dvd_10189569.iso', '08D8F230E516523AD80B9A8F69ADEA6F77F2836A', '3.22', '', 'ed2k://|file|cn_windows_10_multiple_editions_version_1703_updated_march_2017_x86_dvd_10189569.iso|3456649216|945C69ABEE0EFE9B07CF5B4C6E141262|/', '', 4, 32, '5'),
(3, 'windows10', 'Win10', 'chuangyizhe', '创意者', 'Education', '教育版', 'cn_windows_10_education_version_1703_updated_march_2017_x64_dvd_10194187.iso', 'C7B477E404C714854734312A210F764DCF08C56A', '4.16', '', 'ed2k://|file|cn_windows_10_education_version_1703_updated_march_2017_x64_dvd_10194187.iso|4470315008|BA9D2AB8865B80C2227E6E08BB2DD2AE|/', '', 5, 64, '14'),
(4, 'windows10', 'Win10', 'chuangyizhe', '创意者', 'Education', '教育版', 'cn_windows_10_education_version_1703_updated_march_2017_x86_dvd_10189568.iso', '57759D60ED27D2DF459571A5592F5B703F74F80E', '3.17', '', 'ed2k://|file|cn_windows_10_education_version_1703_updated_march_2017_x86_dvd_10189568.iso|3401973760|5DD08371AF9B6E953F879E574D593607|/', '', 5, 32, '14'),
(5, 'windows10', 'Win10', 'chuangyizhe', '创意者', 'Enterprise', '企业版', 'cn_windows_10_enterprise_version_1703_updated_march_2017_x64_dvd_10194191.iso', 'F3ACA74FA2177C06EFF3C1F8FEB1B4F26BEA880B', '4.19', '', 'ed2k://|file|cn_windows_10_enterprise_version_1703_updated_march_2017_x64_dvd_10194191.iso|4498978816|98F0EAD4122B9B9D72FD08D22657AB45|/', '', 6, 64, '4'),
(6, 'windows10', 'Win10', 'chuangyizhe', '创意者', 'Enterprise', '企业版', 'cn_windows_10_enterprise_version_1703_updated_march_2017_x86_dvd_10189572.iso', '14CC045F0C885CBED0AE0B9EA4B8C6F2FF7DD854', '3.16', '', 'ed2k://|file|cn_windows_10_enterprise_version_1703_updated_march_2017_x86_dvd_10189572.iso|3394940928|2E72355CDA5373B9F778D36CF03B86FD|/', '', 6, 32, '17'),
(7, 'windows10', 'Win10', 'zhounian', '周年更新', 'Professional', '专业版', 'cn_windows_10_multiple_editions_version_1607_updated_jul_2016_x64_dvd_9056935.iso', 'A2DDAA7BE3BB73FD87C29D6EF8E1EDF4C764DCD9', '4.05', '', 'ed2k://|file|cn_windows_10_multiple_editions_version_1607_updated_jul_2016_x64_dvd_9056935.iso|4347183104|35EA5DB0F3BB714F5CE0740FB89D82D1|/', '', 4, 64, '7'),
(8, 'windows10', 'Win10', 'zhounian', '周年更新', 'Professional', '专业版', 'cn_windows_10_multiple_editions_version_1607_updated_jul_2016_x86_dvd_9060050.iso', 'EAF7394A25A69E94AD2D3D1D9FBC0007D1DFF720', '3.05', '', 'ed2k://|file|cn_windows_10_multiple_editions_version_1607_updated_jul_2016_x86_dvd_9060050.iso|3275581440|006F76229DB61ADA1D8E49DD4A6A0A5D|/', '', 2, 32, '2'),
(9, 'windows10', 'Win10', 'zhounian', '周年更新', 'Education', '教育版', 'cn_windows_10_education_version_1607_updated_jul_2016_x64_dvd_9056220.iso', 'F89AAAE227D7B7D9644E70AEBBD1DD43DC16632A', '3.87', '', 'ed2k://|file|cn_windows_10_education_version_1607_updated_jul_2016_x64_dvd_9056220.iso|4150953984|AD0737D5F182082C37E6D1DB7CCDBB77|/', '', 3, 64, '4'),
(10, 'windows10', 'Win10', 'zhounian', '周年更新', 'Education', '教育版', 'cn_windows_10_education_version_1607_updated_jul_2016_x86_dvd_9056381.iso', '095473BE76792E63A9E9F3EBA87E8E287376AB65', '2.89', '', 'ed2k://|file|cn_windows_10_education_version_1607_updated_jul_2016_x86_dvd_9056381.iso|3103516672|BA95618BB3D14C0B91A7D6D2518DCCFC|/', '', 3, 32, '5'),
(11, 'windows10', 'Win10', 'zhounian', '周年更新', 'Enterprise', '企业版', 'cn_windows_10_enterprise_version_1607_updated_jul_2016_x64_dvd_9057083.iso', '1D287AB1F79BCA7166A49ACB27A81B43BE7D75DD', '3.86', '', 'ed2k://|file|cn_windows_10_enterprise_version_1607_updated_jul_2016_x64_dvd_9057083.iso|4149981184|EFCB9D522DAA0C6A7BF3A5464C65DCBC|/', '', 4, 64, '6'),
(12, 'windows10', 'Win10', 'zhounian', '周年更新', 'Enterprise', '企业版', 'cn_windows_10_enterprise_version_1607_updated_jul_2016_x86_dvd_9059597.iso', 'C13CA613DD308441F554935912B426A7424AE052', '2.89', '', 'ed2k://|file|cn_windows_10_enterprise_version_1607_updated_jul_2016_x86_dvd_9059597.iso|3100624896|0E1580E308D316A8648B0BF58D5CDEE2|/', '', 4, 32, '8'),
(13, 'windows8', 'Win8.1', 'win8.1', 'Win8.1正式版', 'VL', '多合一版', 'cn_windows_8.1_with_update_x64_dvd_6051473.iso', '9A85EAC2D20446E3E086BF57A7DFC8832FB3BA56', '4.20', '', 'ed2k://|file|cn_windows_8.1_with_update_x64_dvd_6051473.iso|4504475648|D66BEF759548656EDA981D902A957545|/', '', 1, 64, '5'),
(14, 'windows8', 'Win8.1', 'win8.1', 'Win8.1正式版', 'VL', '多合一版', 'cn_windows_8.1_with_update_x86_dvd_6051523.iso', 'ABBF814846C425C88910B011BC9D3D3C77932056', '3.12', '', 'ed2k://|file|cn_windows_8.1_with_update_x86_dvd_6051523.iso|3349960704|C1B8A61BD8F1300825BF03C4D31B35A0|/', '', 1, 32, ''),
(15, 'windows8', 'Win8.1', 'win8.1', 'Win8.1正式版', 'Professional', '专业版', 'cn_windows_8.1_pro_vl_with_update_x64_dvd_6050873.iso', '15F67116E6616A70B89EE0079B34E64635FBD8A0', '4.02', '', 'ed2k://|file|cn_windows_8.1_pro_vl_with_update_x64_dvd_6050873.iso|4317507584|B0888275B5BD40E67D3F178B84B9A874|/', '', 2, 64, '4'),
(16, 'windows8', 'Win8.1', 'win8.1', 'Win8.1正式版', 'Professional', '专业版', 'cn_windows_8.1_pro_vl_with_update_x86_dvd_6050910.iso', '9559E5FB616F8E5F25BAEBF64312AA5B99383771', '2.98', '', 'ed2k://|file|cn_windows_8.1_pro_vl_with_update_x86_dvd_6050910.iso|3200301056|B078A986993B7EDD474FD09EB6FF7E1B|/', '', 2, 32, ''),
(17, 'windows8', 'Win8.1', 'win8.1', 'Win8.1正式版', 'Enterprise', '企业版', 'cn_windows_8.1_enterprise_with_update_x64_dvd_6050374.iso', '0C1EE95EBB1714B3EE8453F840DF8FCD41B0F766', '4.02', '', 'ed2k://|file|cn_windows_8.1_enterprise_with_update_x64_dvd_6050374.iso|4317065216|AC8215A13817CC0EC4EA42E5C92E88B7|/', '', 4, 64, ''),
(18, 'windows8', 'Win8.1', 'win8.1', 'Win8.1正式版', 'Enterprise', '企业版', 'cn_windows_8.1_enterprise_with_update_x86_dvd_6050645.iso', 'B1FD75ADFC52550C3E72DB02C8AFB456D404964A', '2.98', '', 'ed2k://|file|cn_windows_8.1_enterprise_with_update_x86_dvd_6050645.iso|3199901696|0209A1FDE82A5AC7A248B4CA3F860F2B|/', '', 4, 32, '1'),
(19, 'windows8', 'Win8', 'win8', 'win8正式版', 'DVD', '标准版', 'cn_windows_8_x64_dvd_915407.iso', 'A87C4AA85D55CD83BAE9160560D1CB3319DD675C', '3.40', '', 'ed2k://|file|cn_windows_8_x64_dvd_915407.iso|3652950016|5C7F8C212BD3A1827866563773A431C2|/', '', 1, 64, '4'),
(20, 'windows8', 'Win8', 'win8', 'Win8正式版', 'DVD', '标准版', 'cn_windows_8_x86_dvd_915414.iso', '0C4A168E37E38EFB59E8844353B2535017CBC587', '2.50', '', 'ed2k://|file|cn_windows_8_x86_dvd_915414.iso|2679801856|9AF10141BFD61BC66D9D6459758D7749|/', '', 1, 32, ''),
(21, 'windows8', 'Win8', 'win8', 'win8正式版', 'Professional', '专业版', 'cn_windows_8_pro_vl_x64_dvd_917773.iso', '9C4EC9FC4FB561F841E22256BC9DEA6D9D6611FF', '3.31', '', 'ed2k://|file|cn_windows_8_pro_vl_x64_dvd_917773.iso|3558014976|7956620A80428F37D4F2989CB5CF3B5A|/', '', 2, 64, ''),
(22, 'windows8', 'Win8', 'win8', 'win8正式版', 'Professional', '专业版', 'cn_windows_8_pro_vl_x86_dvd_917720.iso', 'EEEF3C3F6F05115C7F7C9C1D19D6A6A6418B5059', '2.42', '', 'ed2k://|file|cn_windows_8_pro_vl_x86_dvd_917720.iso|2595137536|E87CEF7B8B4EFB12B0A7397795209301|/', '', 2, 32, ''),
(23, 'windows8', 'Win8', 'win8', 'win8正式版', 'Enterprise', '企业版', 'cn_windows_8_enterprise_x64_dvd_917570.iso', '1280BC3A38A7001FDE981FA2E465DEB341478667', '3.32', '', 'ed2k://|file|cn_windows_8_enterprise_x64_dvd_917570.iso|3560837120|8CAE8064C4B8F9CD84941B4FF4A34722|/', '', 4, 64, '1'),
(24, 'windows8', 'Win8', 'win8', 'win8正式版', 'Enterprise', '企业版', 'cn_windows_8_enterprise_x86_dvd_917682.iso', '951565D8579C5912FB4A407B3B9F715FBDB77EFE', '2.42', '', 'ed2k://|file|cn_windows_8_enterprise_x86_dvd_917682.iso|2597502976|7B6541942A16EB54BC81E84558DF09DF|/', '', 4, 32, '1'),
(25, 'windows7', 'Win7', 'win7', 'win7正式版', 'HomePremium', '家庭高级版', 'cn_windows_7_home_premium_with_sp1_x64_dvd_u_676691.iso', 'BB5A8A1480FE54C497601AA1DC7BE698A784BE1C', '3.19', '', 'ed2k://|file|cn_windows_7_home_premium_with_sp1_x64_dvd_u_676691.iso|3420557312|1A3CF44F3F5E0BE9BBC1A938706A3471|/', '', 1, 64, '4'),
(26, 'windows7', 'Win7', 'win7', 'Win7正式版', 'HomePremium', '家庭高级版', 'cn_windows_7_home_premium_with_sp1_x86_dvd_u_676770.iso', '1B3B55C00CA60CE00D7745BF477D523B192E78DE', '2.47', '', 'ed2k://|file|cn_windows_7_home_premium_with_sp1_x86_dvd_u_676770.iso|2653276160|A8E8BD4421174DF34BD14D60750B3CDB|/', '', 1, 32, ''),
(27, 'windows7', 'Win7', 'win7', 'Win7正式版', 'Professional', '专业版', 'cn_windows_7_professional_with_sp1_vl_build_x64_dvd_u_677816.iso', '647B26479A3A46C078F5B1364A89003A31F4AADA', '3.04', '', 'ed2k://|file|cn_windows_7_professional_with_sp1_vl_build_x64_dvd_u_677816.iso|3266004992|5A52F4CCEFA71797D58389B397038B2F|/', '', 2, 64, '1'),
(28, 'windows7', 'Win7', 'win7', 'Win7正式版', 'Professional', '专业版', 'cn_windows_7_professional_with_sp1_vl_build_x86_dvd_u_677939.iso', '27AE9FBAF9EE076F50F153353E42A3BE74A61FAB', '2.33', '', 'ed2k://|file|cn_windows_7_professional_with_sp1_vl_build_x86_dvd_u_677939.iso|2502909952|935E5B4B754527BE3C238FA6ABDD9B86|/', '', 2, 32, ''),
(29, 'windows7', 'Win7', 'win7', 'Win7正式版', 'Enterprise', '企业版', 'cn_windows_7_enterprise_with_sp1_x64_dvd_u_677685.iso', '9BA5E85596C2F25BE59F7E96139D83D4CB261A62', '3.04', '', 'ed2k://|file|cn_windows_7_enterprise_with_sp1_x64_dvd_u_677685.iso|3265574912|E9DB2607EA3B3540F3FE2E388F8C53C4|/', '', 4, 64, '6'),
(30, 'windows7', 'Win7', 'win7', 'Win7正式版', 'Enterprise', '企业版', 'cn_windows_7_enterprise_with_sp1_x86_dvd_u_677716.iso', 'C488B3D72DDC4AC63BCDCA36820BB986A1E670AC', '2.33', '', 'ed2k://|file|cn_windows_7_enterprise_with_sp1_x86_dvd_u_677716.iso|2502856704|B3C25EA4DD88D7E54F22D3C3E78C410B|/', '', 4, 32, ''),
(31, 'windows7', 'Win7', 'win7', 'Win7正式版', 'Ultimate', '旗舰版', 'cn_windows_7_ultimate_with_sp1_x64_dvd_u_677408.iso', '2CE0B2DB34D76ED3F697CE148CB7594432405E23', '3.19', '', 'ed2k://|file|cn_windows_7_ultimate_with_sp1_x64_dvd_u_677408.iso|3420557312|B58548681854236C7939003B583A8078|/', '', 5, 64, ''),
(32, 'windows7', 'Win7', 'win7', 'Win7正式版', 'Ultimate', '旗舰版', 'cn_windows_7_ultimate_with_sp1_x86_dvd_u_677486.iso', 'B92119F5B732ECE1C0850EDA30134536E18CCCE7', '2.47', '', 'ed2k://|file|cn_windows_7_ultimate_with_sp1_x86_dvd_u_677486.iso|2653276160|7503E4B9B8738DFCB95872445C72AEFB|/', '', 5, 32, ''),
(35, 'windows10', 'Win10', 'qiujichuangyizhe', '秋季创意者', 'multi-editionVL', 'VL多和一版', 'cn_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406208.iso', '69dc07e7b7940121027be4c9b51648fa31d2b6ad', '4.66', '', 'ed2k://|file|cn_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x64_dvd_100406208.iso|5007116288|317BDC520FA2DD6005CBA8293EA06DF6|/', '', 9, 64, ''),
(36, 'windows10', 'Win10', 'qiujichuangyizhe', '秋季创意者', 'multi-editionVL', 'VL多合一版', 'cn_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406319.iso', 'efcf3b81076990951dcfea08ab387e9099813ceb', '3.63', '', 'ed2k://|file|cn_windows_10_multi-edition_vl_version_1709_updated_dec_2017_x86_dvd_100406319.iso|3896993792|D533E16A7FF32BEA5851785DFAA09390|/', '', 9, 32, ''),
(37, 'windows10', 'Win10', 'qiujichuangyizhe', '秋季创意者', 'multi-edition', '多合一版', 'cn_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406696.iso', '5cc6e158a9d90b9c474ace8a55b66f88bd16221d', '4.88', '', 'ed2k://|file|cn_windows_10_multi-edition_version_1709_updated_dec_2017_x64_dvd_100406696.iso|5242322944|7D89E63B0C4B5881DBCDB042FF1EB8F3|/', '', 8, 64, '1'),
(38, 'windows10', 'Win10', 'qiujichuangyizhe', '秋季创意者', 'multi-edition', '多合一版', ' cn_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406742.iso', ' 6f1aaf615a78cb0c01b5a5d9fd3ba148f6dea74b', '3.78', '', 'ed2k://|file|cn_windows_10_multi-edition_version_1709_updated_dec_2017_x86_dvd_100406742.iso|4056664064|5FCF7887A5B9C001B1A55A9A1D8EC32E|/', '', 8, 32, ''),
(42, 'windows10', 'Win10', '1903', 'Windows101903', '标准版', 'DVD', '491112.jpg', 'ab988f9c1430af42463237e30dcab8e4', '1M', '/os/public/windowsfile/20200520/20200520/3417a6da83e11b3f86bcd851cc3f7d80.jpg', '', '', 3, 32, '0'),
(48, 'windows8', 'Win10', 'chuangyizhe', '创意者', 'Professional', '专业版', '491112.jpg', 'ab988f9c1430af42463237e30dcab8e4', '1M', '/os/public/windowsfile/20200520/abce6371c8e513e265b65f42b0cf40b3.jpg', '', '', 4, 64, '0');

-- --------------------------------------------------------

--
-- 表的结构 `think_win7`
--

CREATE TABLE `think_win7` (
  `id` int(11) NOT NULL,
  `title1` varchar(500) NOT NULL COMMENT '标题1',
  `introduce1` varchar(500) NOT NULL COMMENT '介绍1',
  `title2` varchar(500) NOT NULL COMMENT '标题2',
  `introduce2` varchar(500) NOT NULL COMMENT '介绍2',
  `title3` varchar(500) NOT NULL COMMENT '标题3',
  `introduce3` varchar(500) NOT NULL COMMENT '介绍3',
  `title4` varchar(500) NOT NULL COMMENT '标题4',
  `introduce4` varchar(500) NOT NULL COMMENT '介绍4',
  `photo` varchar(500) NOT NULL COMMENT 'win7图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_win7`
--

INSERT INTO `think_win7` (`id`, `title1`, `introduce1`, `title2`, `introduce2`, `title3`, `introduce3`, `title4`, `introduce4`, `photo`) VALUES
(1, 'Windows7操作系统', 'Windows 7 是由微软公司（Microsoft）开发的操作系统，内核版本号为Windows NT 6.1。Windows 7可供家庭及商业工作环境 笔记本电脑 平板电脑 多媒体中心等使用。Windows 7 也延续了 Windows Vista -Aero风格，并且在此基础上增添了些许功能。', '人性化，简单，易操作', 'Windows 7 的设计主要围绕五个重点——针对笔记本电脑的特有设计；基于应用服务的设计；用户的个性化；视听娱乐的优化；用户易用性的新引擎。 跳跃列表，系统故障快速修复等，这些新功能令Windows 7成为最易用的Windows。', '更加高效', 'Windows 7中，系统集成的搜索功能非常的强大，只要用户打开开始菜单并开始输入搜索内容，无论要查找应用程序、文本文档等，搜索功能都能自动运行，给用户的操作带来极大的便利。', '高效搜索框', 'Windows7系统资源管理器的搜索框在菜单栏右侧，可以灵活调节宽窄。它能快速搜索Windows中的文档、图片、程序、帮助甚至网络等信息。Win7系统的搜索是动态的，当我们在搜索框中输入第一个字的时刻，Win7的搜索就已经开始工作，大大提高了搜索效率。', '/os/public/index/images/win7.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `think_win8`
--

CREATE TABLE `think_win8` (
  `id` int(11) NOT NULL,
  `title1` varchar(500) NOT NULL COMMENT '标题1',
  `introduce1` varchar(500) NOT NULL COMMENT '介绍1',
  `title2` varchar(500) NOT NULL COMMENT '标题2',
  `introduce2` varchar(500) NOT NULL COMMENT '介绍2',
  `title3` varchar(500) NOT NULL COMMENT '标题3',
  `title4` varchar(500) NOT NULL COMMENT '标题4',
  `title5` varchar(500) NOT NULL COMMENT '标题5',
  `title6` varchar(500) NOT NULL COMMENT '标题6',
  `title7` varchar(500) NOT NULL COMMENT '标题7',
  `photo` varchar(500) NOT NULL COMMENT '系统图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_win8`
--

INSERT INTO `think_win8` (`id`, `title1`, `introduce1`, `title2`, `introduce2`, `title3`, `title4`, `title5`, `title6`, `title7`, `photo`) VALUES
(1, 'Windows8操作系统', 'Windows 8的界面变化极大。系统界面上，Windows 8采用Modern UI界面，各种程序以磁贴的样式呈现；操作上，大幅改变以往的操作逻辑，提供屏幕触控支持；硬件兼容上，Windows8支持来自Intel、AMD和ARM的芯片架构，可应用于台式机、笔记本、平板电脑上。', '2014年4月，微软在Build 2014大会上发布Windows 8.1 Update 1', '微软在Windows 8操作系统上对界面做了相当大的调整。取消了Windows 7和Vista的Aero效果，加入了ModernUI，和Windows传统界面并存。同时Windows徽标大幅简化，以反映新的Modern UI风格。前身旗形标志转化成长方形。', 'Charm边栏菜单的中文名为“超级按钮”', '适应平板需求，微软推出了metro应用', 'Windows 8为软件开发者提供了一个新的平台', 'Windows 8对系统的优化使得电脑具有更好的续航能力', '新一代的Windows 8将全面支持USB 3.0接口', '/os/public/index/images/win8.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `think_win10`
--

CREATE TABLE `think_win10` (
  `id` int(11) NOT NULL,
  `title1` varchar(500) NOT NULL COMMENT '标题1',
  `introduce1` varchar(500) NOT NULL COMMENT '介绍1',
  `photo1` varchar(500) NOT NULL COMMENT '轮播图片1',
  `photo2` varchar(500) NOT NULL COMMENT '轮播图片2',
  `photo3` varchar(500) NOT NULL COMMENT '轮播图片3',
  `photo4` varchar(500) NOT NULL COMMENT '轮播图片4',
  `photo5` varchar(500) NOT NULL COMMENT '轮播图片5',
  `photo6` varchar(500) NOT NULL COMMENT '轮播图片6',
  `title2` varchar(500) NOT NULL COMMENT '标题2',
  `introduce2` varchar(500) NOT NULL COMMENT '介绍2',
  `title3` varchar(500) NOT NULL COMMENT '标题3',
  `introduce3` varchar(500) NOT NULL COMMENT '介绍3',
  `title4` varchar(500) NOT NULL COMMENT '标题4',
  `introduce4` varchar(500) NOT NULL COMMENT '介绍4'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_win10`
--

INSERT INTO `think_win10` (`id`, `title1`, `introduce1`, `photo1`, `photo2`, `photo3`, `photo4`, `photo5`, `photo6`, `title2`, `introduce2`, `title3`, `introduce3`, `title4`, `introduce4`) VALUES
(1, 'Windows10操作系统', '微软表示 Windows 10 是迄今为止最好的 Windows 操作系统。无论你是普通办公用户、游戏玩家还是开发者，Win10都能带给你目前最先进的功能特性以及使用体验，相比Win7、Win8.1改进巨大，不仅新的界面更加友好易用，而且系统更加安全难被病毒入侵，在速度性能和兼容性上也非常出色！创意者更新为Win10带来了很多新功能和新特性！目前，微软已经为「Windows 10 创意者更新」推出了完整的光盘安装镜像ISO文件，使用它直接安装好系统就已经包含发布时所有的系统补丁了，这样就不必在安装好系统后还要苦苦等待大量更新下载安装了。', '', '', '', '', '', '', 'Cortana小娜语音助手', 'Win10另一大特色是加入了类似苹果Siri的语音助手——Cortana小娜语音助手。Cortana可以帮助您完成各种任务，例如发送电子邮件、安排活动、记事提醒、搜索内容等。甚至你还可以让她唱首歌、讲个笑话，摇身一变段子手。', 'Win10UWP通用程序', 'UWP是微软专为Win10平台推出的一种全新的具有颠覆意义的APP架构，采用这种架构开发出来的APP不仅可以发挥Win10的全部威力和功能特性，而且在不同分辨率不同设备(尤其是触摸屏)上的性能、用户体验都比传统的应用更好。', '内置Ubuntu!原生支持Linux', '从Win10一周年更新版开始，微软正式从系统中内嵌了一个Ubuntu子系统，它可以让Win10系统完美兼容Linux应用程序，可以直接原生运行LinuxBash命令行以及数万个Linux应用！这是微软史上最为惊人的一次尝试,从此，Linux与Windows将不再有界限！从Win10一周年更新版开始，微软正式从系统中内嵌了一个Ubuntu子系统，它可以让Win10系统完美兼容Linux应用程序，可以直接原生运行LinuxBash命令行以及数万个Linux应用！这是微软史上最为惊人的一次尝试,从此，Linux与Windows将不再有界限！');

-- --------------------------------------------------------

--
-- 表的结构 `think_windows`
--

CREATE TABLE `think_windows` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '系统名字',
  `upbanben` varchar(100) NOT NULL COMMENT '更新版本',
  `winbanben` varchar(100) NOT NULL COMMENT '系统版本',
  `jianname` varchar(200) NOT NULL COMMENT '简称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_windows`
--

INSERT INTO `think_windows` (`ID`, `name`, `upbanben`, `winbanben`, `jianname`) VALUES
(1, '创意者', 'windows10', 'chuangyizhe', 'Win10'),
(2, '周年更新', 'windows10', 'zhounian', 'Win10'),
(3, 'Win8.1正式版', 'windows8', 'win8.1', 'Win8.1'),
(4, 'Win8正式版', 'windows8', 'win8', 'Win8'),
(5, 'Win7正式版', 'windows7', 'win7', 'Win7'),
(6, '秋季创意者', 'windows10', 'qiujichuangyizhe', 'Win10'),
(7, 'Windows101903', 'Windows10', '1903', 'Win10');

-- --------------------------------------------------------

--
-- 表的结构 `think_winnews`
--

CREATE TABLE `think_winnews` (
  `id` int(11) NOT NULL,
  `title1` varchar(500) NOT NULL COMMENT 'win新闻标题',
  `introduce1` varchar(500) NOT NULL COMMENT 'win新闻介绍',
  `photo1` varchar(500) NOT NULL COMMENT 'win专业版图片',
  `title2` varchar(500) NOT NULL COMMENT 'win专业版标题',
  `introduce2` varchar(500) NOT NULL COMMENT 'win专业版介绍',
  `photo2` varchar(500) NOT NULL COMMENT 'win教育版图片',
  `title3` varchar(500) NOT NULL COMMENT 'win教育版标题',
  `introduce3` varchar(500) NOT NULL COMMENT 'win教育版介绍',
  `photo3` varchar(500) NOT NULL COMMENT 'win企业版图片',
  `title4` varchar(500) NOT NULL COMMENT 'win企业版标题',
  `introduce4` varchar(500) NOT NULL COMMENT 'win企业版介绍'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `think_winnews`
--

INSERT INTO `think_winnews` (`id`, `title1`, `introduce1`, `photo1`, `title2`, `introduce2`, `photo2`, `title3`, `introduce3`, `photo3`, `title4`, `introduce4`) VALUES
(1, 'Windows 10 创意者', '随着微软不断地努力完善Windows10操作系统以及Office2016办公软件，这款最新一代的操作系统以及新版的办公软件均已逐渐经成为主流。继“一周年更新”之后，微软正式发布官方原版Windows10创意者更新版系统光盘镜像ISO的下载，版本号 1703，Build 15063。创意者更新不仅修复Bug，还带来很多新特性！比如高分屏高DPI效果优化、3D画板、性能更好的游戏模式、防蓝光、垃圾清理等新功能……', '/os/public/index/images/icon1.png', '专业版(Pro)', '包含大量高级功能，适合高端用户群体使用。其主要面向一些技术人员和中小企业，内置了Windows 10增强的技术，其主要体现在安全性和一些适合技术人员的组件，如Bitlocker驱动器加密、安全启动，设备保护，远程访问服务，组策略，域名连接。Windows10 Pro还整合了“云技术”，更方便的在不同电脑中同步数据。', '/os/public/index/images/icon2.png', '教育版(Education)', '教育版是基于企业版构建，面向学校教师和学生的版本。并提供许多学校所需的企业级可管理性和安全功能。通过移动设备管理(MDM)简化管理，快速、轻松地升级设备，与现有课堂基础架构的兼容性很强，提供特定于教育的默认设置，包括删除了 Cortana。这些默认设置禁用提示、技巧和建议以及 Windows 商店建议。', '/os/public/index/images/icon3.png', '企业版(Enterprise)', '针对企业用户推出的版本，提供批量授权。主要面向大中型企业,其包括了Windows 10 所有的功能，还针对企业用户增加了相应的功能，如部署和管理PC，Windows To Go，虚拟化和先进的安全性等功能。但需要注意的是一般用户无法从Windows 7 和Windows 8 中直接升级到Windows 10 企业版。');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `think_admin`
--
ALTER TABLE `think_admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `think_book`
--
ALTER TABLE `think_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_bookshuangji`
--
ALTER TABLE `think_bookshuangji`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_fedora`
--
ALTER TABLE `think_fedora`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_foot`
--
ALTER TABLE `think_foot`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `think_index`
--
ALTER TABLE `think_index`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_mac`
--
ALTER TABLE `think_mac`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_movie`
--
ALTER TABLE `think_movie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_order`
--
ALTER TABLE `think_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_question`
--
ALTER TABLE `think_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_raspbain`
--
ALTER TABLE `think_raspbain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_redhat`
--
ALTER TABLE `think_redhat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_shiyan`
--
ALTER TABLE `think_shiyan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_shoucang`
--
ALTER TABLE `think_shoucang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_soft`
--
ALTER TABLE `think_soft`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_softshoucang`
--
ALTER TABLE `think_softshoucang`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `think_ubuntu`
--
ALTER TABLE `think_ubuntu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_user`
--
ALTER TABLE `think_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_video`
--
ALTER TABLE `think_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_videobook`
--
ALTER TABLE `think_videobook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_videobookshuangji`
--
ALTER TABLE `think_videobookshuangji`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_videoshuangji`
--
ALTER TABLE `think_videoshuangji`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_videotype`
--
ALTER TABLE `think_videotype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_win`
--
ALTER TABLE `think_win`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_win7`
--
ALTER TABLE `think_win7`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_win8`
--
ALTER TABLE `think_win8`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_win10`
--
ALTER TABLE `think_win10`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `think_windows`
--
ALTER TABLE `think_windows`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `think_winnews`
--
ALTER TABLE `think_winnews`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `think_admin`
--
ALTER TABLE `think_admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_book`
--
ALTER TABLE `think_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- 使用表AUTO_INCREMENT `think_bookshuangji`
--
ALTER TABLE `think_bookshuangji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `think_fedora`
--
ALTER TABLE `think_fedora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_foot`
--
ALTER TABLE `think_foot`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_index`
--
ALTER TABLE `think_index`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_mac`
--
ALTER TABLE `think_mac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_movie`
--
ALTER TABLE `think_movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_order`
--
ALTER TABLE `think_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- 使用表AUTO_INCREMENT `think_question`
--
ALTER TABLE `think_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `think_raspbain`
--
ALTER TABLE `think_raspbain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_redhat`
--
ALTER TABLE `think_redhat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_shiyan`
--
ALTER TABLE `think_shiyan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `think_shoucang`
--
ALTER TABLE `think_shoucang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `think_soft`
--
ALTER TABLE `think_soft`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- 使用表AUTO_INCREMENT `think_softshoucang`
--
ALTER TABLE `think_softshoucang`
  MODIFY `ID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_ubuntu`
--
ALTER TABLE `think_ubuntu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_user`
--
ALTER TABLE `think_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `think_video`
--
ALTER TABLE `think_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- 使用表AUTO_INCREMENT `think_videobook`
--
ALTER TABLE `think_videobook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `think_videobookshuangji`
--
ALTER TABLE `think_videobookshuangji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `think_videoshuangji`
--
ALTER TABLE `think_videoshuangji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `think_videotype`
--
ALTER TABLE `think_videotype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `think_win`
--
ALTER TABLE `think_win`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- 使用表AUTO_INCREMENT `think_win7`
--
ALTER TABLE `think_win7`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_win8`
--
ALTER TABLE `think_win8`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_win10`
--
ALTER TABLE `think_win10`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `think_windows`
--
ALTER TABLE `think_windows`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `think_winnews`
--
ALTER TABLE `think_winnews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
