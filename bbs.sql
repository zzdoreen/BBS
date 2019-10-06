/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50511
Source Host           : localhost:3306
Source Database       : bbs

Target Server Type    : MYSQL
Target Server Version : 50511
File Encoding         : 65001

*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1', 'iUOoOdMAl7FsB1Kig37hmg==');

-- ----------------------------
-- Table structure for `module`
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '版块名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='版块';

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', '数据库讨论区');
INSERT INTO `module` VALUES ('2', 'Web开发讨论区');
INSERT INTO `module` VALUES ('3', 'Java技术讨论区');

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `view_count` int(11) DEFAULT '0' COMMENT '查看总数',
  `reply_count` int(11) DEFAULT '0' COMMENT '回复数量',
  `systime` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `topic_id` int(11) DEFAULT NULL COMMENT '话题id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='帖子';

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('8', 'Eclipse小版版规', '为维护版面秩序，提高本版帖子的质量，特制订此规则。\r\n\r\n基本准则：没百度过的不要来问,没认真读完一本Java基础书的不要来问。\r\n\r\n以下行为是严禁的：\r\n    1. 作业贴，直接求代码的，贴一大段不知所谓的代码让人给找错的\r\n    2. “急”，“跪求”，“冰天雪地旋转365度跪求”\r\n    3. 破解，注册码相关的\r\n    4. 倒分\r\n    5. 灌水\r\n违反以上规定直接删贴，屡犯的关小黑屋。\r\n\r\n怎么定义“作业贴”：\r\n1. 直接复制粘贴题目，任何自己的理解都没有\r\n2. 明确表示“不想知道原理”，“没时间看书”，“明天就要交”\r\n\r\n回帖也请注意节操，为了点分就替别人做作业的，请自重。 另外，发作业贴的人本身也是没什么节操，多数也是不结贴的~！\r\n\r\n鼓励的做法：\r\n    1. 提问前先Baidu,Google\r\n    2. 帖子标题简单描述一下自己的问题，至少说明什么相关的问题\r\n    3. 问题解决后贴出解决方案\r\n    4. 分享自己的心得\r\n\r\n\r\n本版讨论话题范围：\r\n    1. Eclipse使用相关的问题\r\n    2. Eclipse插件开发相关的问题\r\n    3. SWT/JFACE\r\n\r\n不符合上面范围的帖子，版主会移到相关的版面；版主水平有限，无法判断哪个版面合适的，直接移到非技术区。\r\n\r\n此贴请勿回复。', '8', '4', now(), '1', '6');
INSERT INTO `post` VALUES ('10', 'Eclipse版FAQ', '以前整理在GoogleDoc上，但由于众所周知的原因，很多不会翻墙的人访问起来有困难，最近CSDN推出了CSDN CODE，所以迁移过来并重新整理了一下。\r\n\r\nhttps://code.csdn.net/dollyn/eclipse_faq', '13', '6', now(), '1', '6');
INSERT INTO `post` VALUES ('11', '面试题总结 —— JAVA高级工程师', '面试题总结——JAVA高级工程师\r\n近期考虑换工作的问题，于是投简历面试，面试5家公司的高级Java工程师，有4家给了我offer，想着总结一下面试经验，方便最近正在寻求机会的你们\r\n\r\n一、无笔试题\r\n\r\n不知道是不是职位原因还是没遇到，面试时，都不需要做笔试题，而是填张个人信息表格，或者直接面试\r\n\r\n\r\n二、三大框架方面问题\r\n\r\n1、Spring 事务的隔离性，并说说每个隔离性的区别\r\n解答：Spring事务详解\r\n\r\n\r\n2、Spring事务的传播行为，并说说每个传播行为的区别\r\n解答：Spring事务详解\r\n\r\n\r\n3、hibernate跟Mybatis/ ibatis 的区别，为什么选择？\r\n解答：Hibernate与Mybatis的比较\r\n\r\n\r\n4、Struts跟Spring mvc的优缺点，让你选会如何选\r\n解答：Spring MVC 与 Struts的区别\r\n\r\n\r\n5、简单说说Spring 事务机制\r\n解答：Spring事务机制\r\n\r\n\r\n6、Spring 4.0新特性\r\n解答：Spring4新特性\r\n\r\n\r\n\r\n三、负载均衡、集群相关\r\n1、weblogic 负载均衡的原理和集群的配置\r\n解答：a、WEBLOGIC负载均衡原理    b、负载均衡和集群的配置（参考）\r\n\r\n\r\n2、Nginx+Tomcat+Redis实现负载均衡、资源分离、session共享 \r\n解答：配置参考\r\n\r\n\r\n3、nginx配置文件详解——nginx.conf\r\n解答：Nginx配置文件详细说明\r\n\r\n\r\n\r\n四、项目优化相关\r\n1、web如何项目优化\r\n解答：这个我整理过一次，web项目性能优化（整理）\r\n\r\n\r\n2、单例模式有几种？ 如何优化？\r\n解答：单例模式的7中用法\r\n\r\n\r\n3、简单说说线程池的原理和实现\r\n解答：线程原理及实现\r\n\r\n\r\n\r\n\r\n\r\n五、并发和安全方面\r\n1、项目并发如何处理？（我们是web项目）\r\n解答：高并发量网站解决方案，另外，还有数据库乐观锁，数据库读写分离、使用消息队列、多用存储过程等等\r\n\r\n\r\n2、简单说说功能权限存在的水平权限漏洞和垂直权限漏洞的场景和解决办法（因为我们目前权限级别就是功能权限）\r\n解答：\r\nA、水平权限漏洞，如下图\r\n\r\n\r\n\r\n假设机构有 用户A和用户B 两个用户，其中A有1、2和3权限 ，  用户B有 2 和3 的权限，这时候假设用户B 知道1，并给自己添加1的权限，这时候就是水平权限漏洞。\r\n目前解决办法：1、限制入口，让用户B无法编辑自己的权限   2、对用户B无法进行向上扩展。最根本的解决办法是深入到数据权限\r\n解答：水平权限漏洞和解决办法\r\n\r\n\r\nB、垂直权限漏洞\r\n解答：垂直权限漏洞案例和解决方案\r\n\r\n\r\n3、平台上的图片如何防盗链\r\n解答：http下载防盗链原理：http协议的字段referer记录来实现\r\n\r\n\r\n4、如何区分上传的图片是不是木马？\r\n解答：1、看上传的图片后缀  2、如何后缀是篡改的，那么每个文件有个魔术数字  文件上传-魔术数字\r\n\r\n\r\n5、消息队列的原理和实现\r\n解答：1、消息队列原理     2、深入浅出 消息队列 ActiveMQ\r\n\r\n\r\n\r\n\r\n\r\n六、数据库方面\r\n1、mysql查询字段区不区分大小写？\r\n解答：不区分，哪怕值也不区分（我当时还反问了，区不区分大小的应用含义有哪些，面试官没说得出来）\r\n\r\n\r\n2、简单说说数据库集群和负载均衡、分布式（我不懂这块）\r\n解答：数据库负载均衡和集群参考 ，参考2\r\n\r\n\r\n3、存储过程的结构和优点\r\n解答：大概结构  \r\n存储过程的优缺点\r\n\r\n\r\n4、触发器的原理和作用\r\n解答：参考\r\n\r\n\r\n\r\n\r\n\r\n\r\n大体就这些，还有一些忘了，等记起来再补充，或者其他兄弟姐妹们遇到了，也可以私聊或者回复给我，希望能帮助到大家~', '16', '5', now(), '1', '5');
INSERT INTO `post` VALUES ('12', '面试总结——Java高级工程师（二）', '时运不济，才到16年10月份，公司资金紧张，不得已又出去面试，面试了大概四家公司，只有一家offer ，被打击的体无完肤。 多说无益，下面是面试中提到的面试题和我的个人解答\r\n一、Java底层基础题\r\n1、SpringMVC的原理以及返回数据如何渲染到jsp/html上？\r\n答：Spring MVC的核心就是 DispatcherServlet ， 一个请求经过 DispatcherServlet ，转发给HandlerMapping ,然后经反射，对应 Controller及其里面方法的@RequestMapping地址，最后经ModelAndView和ViewResoler返回给对应视图  。  具体可参考：Spring MVC的工作原理\r\n\r\n2、一个类对象属性发生改变时，如何让调用者知道？\r\n答：Java event时间监听  ，即在set方法改变属性时，触发 ，这种模式也可以理解为观察者模式，具体查看：观察者模式简单案例和说明\r\n\r\n3、重写equals为何要重写hashCode？\r\n答：判断两个对象是否相等，比较的就是其hashCode, 如果你重载了equals，比如说是基于对象的内容实现的，而保留hashCode的实现不变，那么很可能某两个对象明明是“相等”，而hashCode却不一样。  hashcode不一样，就无法认定两个对象相等了\r\n\r\n4、谈谈你对JVM的理解？\r\n答： Java语言的一个非常重要的特点就是与平台的无关性。而使用Java虚拟机是实现这一特点的关键。Java编译器只要面向JVM，生成JVM能理解的代码或字节码文件。Java源文件经编译成字节码程序，通过JVM将每一条指令翻译成不同平台机器码，通过特定平台运行。\r\nJVM执行程序的过程 ：I.加载。class文件   ，II.管理并分配内存  ，III.执行垃圾收集\r\n\r\nJRE（java运行时环境）由JVM构造的java程序的运行环境 \r\n\r\n\r\n具体详情：JVM原理和调优\r\n\r\n5、Mysql的事物隔离级别？\r\n答：Mysql的事物隔离级别 其实跟 Spring的事物隔离级别一样，都是1、Read Uncommitted（读取未提交内容）， 2、Read Committed（读取提交内容），3、Repeatable Read（可重读），4、Serializable（可串行化）    具体参照：mysql事物隔离级别\r\n\r\n6、Spring的原理\r\n答：Spring的核心是IOC和AOP  ，IOC是依赖注入和控制反转， 其注入方式可分为set注入、构造器注入、接口注入等等。IOC就是一个容器，负责实例化、定位、配置应用程序中的对象及建立这些对象间的依赖。简单理解就是：JAVA每个业务逻辑处理至少需要两个或者以上的对象协作进行工作，但是每个对象在使用它的合作对象的时候，都需要频繁的new 对象来实现，你就会发现，对象间的耦合度高了。而IOC的思想是：Spring容器来管理这些，对象只需要处理本身业务关系就好了。至于什么是控制反转，就是获得依赖对象的方式反转了。\r\nAOP呢，面向切面编程，最直接的体现就是Spring事物管理。至于Spring事物的相关资料，就不细说了，参考：Spring注解式事物管理\r\n\r\n7、谈谈你对NIO的理解\r\n答：IO是面向流，NIO是面向缓冲 ，这里不细讲了，具体参照：Java NIO和IO的区别\r\n\r\n8、ArrayList和LinkedList、Vector的区别？\r\n答：总得来说可以理解为：.\r\n     1.ArrayList是实现了基于动态数组的数据结构，LinkedList基于链表的数据结构。 \r\n     2.对于随机访问get和set，ArrayList觉得优于LinkedList，因为LinkedList要移动指针。 \r\n     3.对于新增和删除操作add和remove，LinedList比较占优势，因为ArrayList要移动数据\r\nVector和ArrayList类似,但属于强同步类，即线程安全的，具体比较参照：比较ArrayList、LinkedList、Vector\r\n\r\n9、随便说说几个单例模式，并选择一种线程安全的\r\n答：单例的类别：懒汉、饿汉、枚举、静态内部类、双重校验锁 等等 ， 选择线程安全我选最后一种，双重校验锁。  具体实现方式参照：Java：单例模式的七种写法\r\n\r\n10、谈谈红黑树\r\n答：算法和数据结构一直是我薄弱之处，这方面说自己补吧，成效不大，这里我就推荐一个：红黑树\r\n\r\n11、举例说说几个排序，并说明其排序原理\r\n答：这里我就不细说了，大家自己看看 Java实现几种常见的排序算法\r\n\r\n12、Mysql索引的原理\r\n答：索引的作用大家都知道，就是加快查询速度，但是原理，我说不上来，这里直接看吧：Mysql索引工作原理\r\n\r\n13、序列化的原理和作用\r\n答：Serialization（序列化）是一种将对象以一连串的字节描述的过程；反序列化deserialization是一种将这些字节重建成一个对象的过程，主要用于HTTP或者WebService接口传输过程中对象参数的传播，具体可参看：Java序列化机制和原理\r\n\r\n二、并发及项目调优\r\n1、说说线程安全的几种实现方式？\r\n答：什么是线程安全？ 我的理解是这样的，一个对象被多个线程同时访问，还能保持其内部属性的顺序性及同步性，则认定为线程安全。实现线程安全的三种方式：被volatile、synchronized等关键字修饰，或者使用java.util.concurrent下面的类库。  至于前两者的关系，参考：synchronized和volatile的用法区别\r\n\r\n2、方法内部，如何实现更好的异步？\r\n答：我们知道异步其实就是让另一个线程去跑，那么如何创建线程？  第一种直接new Thread ，第二种new 一个实现Runnable接口的实现类。 第三种，通过线程池来管理创建等 ，这里说到更好的实现异步，那就是说我们在方法内部避免频繁的new 线程，就可以考虑线程池了。 那么线程池如何创建？ 这里可以new 一个线程池，但是需要考虑单例，或者在程序初始启东时，就创建一个线程池，让他跑着，然后在具体方法的时候，通过线程池来创建线程，实现异步\r\n\r\n\r\n3、项目中为何要用缓存？如何理解nginx + tomcat + redis 集群缓存？\r\n答1：最直接的表现就是减轻数据库的压力。避免因为数据读取频繁或过大而影响数据库性能，降低程序宕机的可能性\r\n答2：nginx常用做静态内容服务和代理服务器，直面外来请求转发给后面的应用服务。nginx本身也能做缓存，比如静态页面的缓存什么的。而tomcat是应用服务器，处理JAVA WEB程序功能等等 。你也可以这么理解，假设把用户的请求当做是一条河流，那么nginx就相当于一个水利工程，tomcat相当于一条条分流的支流，而redis 相当于支流旁边的一个个水库。 当你洪水来了，nginx根据你每条支流的承受力度分发不同的水流量，在确保程序正常运行的情况下，分发给每条支流(tomcat）不同的水流量。而redis相当于一个个支流的水库，存储水源，降低压力，让后面的水量平稳。\r\n\r\n\r\n4、日常项目中，如果你接手，你准备从哪些方面调优？\r\n答：这个呢首先是了解哪些需要优化，需要优化肯定是项目性能遭遇瓶颈或者猜测即将遭遇了，我们才会去考虑优化。那么怎么优化？\r\na、扩容 ，扩容的理解，就是扩充服务器并行处理的能力，简单来说就是加服务器，增加处理请求的能力，例如增加nginx 、tomcat等应用服务器的个数，或者物理服务器的个数，还有加大服务器带宽等等，这里考虑的是硬件方面\r\nb、调优 ，调优，包括系统调优和代码调优 。 系统调优就是说加快处理速度，比如我们所提到的CDN、ehcache、redis等缓存技术，消息队列等等，加快服务间的响应速度，增加系统吞吐量，避免并发，至于代码调优，这些就需要多积累了，比如重构、工厂等， 数据库调优的话这个我不是很懂，只知道索引和存储过程，具体参考：Mysql数据库调优21个最佳实践  ，其他数据库调优方面就各位自己找找吧\r\n\r\n5、谈谈你对分布式的理解\r\n答：个人理解：分布式就是把一个系统/业务 拆分成多个子系统/子业务 去协同处理，这个过程就叫分布式，具体的演变方式参考：Java分布式应用技术架构介绍\r\n\r\n6、Redis实现消息队列\r\n答：Redis实现消息队列     、参考2\r\n\r\n7、另总结多线程相关面试题50道\r\n\r\n8、分享一个调优工具和方案：如何利用 JConsole观察分析Java程序的运行，进行排错调优\r\n\r\n之前的面试总结：面试题总结——JAVA高级工程师\r\n之前的技术问答：技术问答 也提到了一些面试的经验和知识点\r\n\r\n三、手写代码题（包含sql题）\r\n1、假设商户表A（id , city ）  ,交易流水表B （aid, amount , time）   这里的time代表交易时间，  请用sql写出查询每个城市每个月的销售业绩（答案可在评论里回复）\r\n\r\n2、假设有一个数组 A ，int[] A = { 1 , 3 , -1 ,0 , 2 , 1 , -4 , 2 , 0 ,1 ...  N};   原来是需要查出大于0的数组，但是由于传参错误或者其他原因，导致查出0和负数了，现在要求在不使用新数组和新集合的情况下（即只使用这个A数组，因数组数据比较大，且只能用一次循环） 实现正数放到数组的前面，小于等于0的数放到数组的末尾（答案可在评论里回复）\r\n\r\n总结：\r\n        暂时就先总结这些，后续再补充吧，面试题千变万化，不变的是知识点和技术根本。基础很重要，故不积跬步，无以至千里；不积小流，无以成江海。学好基础，把握好技术的原理，然后去实践，这样才能深入了解一门技术，学不可以已！\r\n        另外，面试过程中，保持自信，不会的咱大胆的说不会，没啥好丢脸的，不会不是说你真的不会，也许是忘了，也许是没注意到，记住面试题目，回来自己补充资料和相关的信息，相信你肯定会越来越从容，要记住不是为了面试而面试，而是为了未来的工作而面试，如果能一直保持这个状态，没有什么事情拿不下的。\r\n        拿我自己来说，很多不会，关键在于你愿不愿意去学，愿不愿意去付诸行动。加油吧，希望各位看官都能找到心仪的工作', '6', '3', now(), '1', '5');
INSERT INTO `post` VALUES ('13', '面试总结——Java高级工程师（三）', '面试前面也总结了一和二， 这第三篇可能更偏向于是内心的独白篇和面试技巧总结吧.....\r\n\r\n一、独白\r\n     之前也面试别人，现在轮到自己找工作，怎么说呢，每个面试官的看法不一样，面试的方式就不一样，比如我面试别人我喜欢问项目中他用到了那些，然后针对用到的技术去问一些问题，或者说对于某些场景的一些技术实现方案是我特别喜欢问的，比如当你的接口服务数据被人截包了，你如何防止数据恶意提交？    相对来说，Java的底层和基础会问的少一点，当然问的少不是代表不问，而是说侧重点在于你的所做过的项目和你的设计思路如何。当然，懂基础和底层更好，这样能让你知其然，更知其所以然，写出来的代码和程序更具有健壮性和可维护性。所以说，基础还是很重要的。\r\n     现在轮到自己出去面试，怎么说呢，其实还是挺紧张的，原以为自己不会因此紧张或者焦虑，实际上，还是有的，在没找到合适的工作的时候，甚至晚上有点睡不着觉，总觉着有什么事压在心头，睡觉都不安心。既然睡不着，那还是看看资料吧，我有个习惯，睡前看点问题，第二天早上就能想到答案，睡前记点资料，第二天早上就能记得特别深刻，不说废话了，直接进入正题吧。\r\n\r\n二、面试技巧\r\n1、背熟你的简历\r\n原因：面试的第一个问题，一般都是让你简单介绍下你自己，或者介绍一下你最近的项目，而一个面试者，如果连自己的简历都无法熟知，对里面提到的项目、技术都无法描述清楚的话，我想没有哪家公司会接受这样的，哪怕你是超级人才，你自我表述不行，估计也会为此头疼，所以，切记：一定要背好自己的简历，不要求你能全部记下，至少要熟记你最近所待过的两家公司，这两家公司里面你做过的项目，你负责的模块，项目里面用到的技术以及相对应的技术实现方案（这个尤为重要）。\r\n\r\n2、深入了解并熟记部分Java基础知识\r\n原因：大部分公司无论面试初级还是高级，无论是笔试还是面试，都会问到一系列基础题，这些基础题大概涵括 jvm、字符串、集合、线程等等，如果说每一个让你死记硬背你肯定记不住，那么就是理解中记忆了，拿jvm来说 ，如果让你谈谈你对jvm的理解， 那么你首先得知道JVM有哪些结构组成，每个结构用来做什么的，然后考虑一个Java对象从创建到回收，如何途径JVM这些结构的。如果你从这些方面来综合记忆，相信事半功倍，并且你理解的更透彻。 至于如果让你谈集合，举例List集合下面ArryList、LinkedList、Vector等集合的区别，那么同样的方法，你需要理解每一个的结构组成是什么，你才能知道他有什么作用，这样你在平时的用法上会更精炼，而且在面试过程中，也不至于哑口无言。\r\n\r\n3、保持自信心和沉重冷静的心态\r\n原因：面试过程中，自信是少不了的，相信你可以， 面试的路上可以自己对自己说一句： I belive I can !    反正我就是这么做的，自我的心里暗示吧，其实面对面试官的时候，你自信的状态也会让面试官觉得你是个很有底气的人，至少从感觉上会给你打个高分。另外还有就是保持沉重冷静，如果是让你提供技术方案或者说说某个技术原理，没必要一紧张一咕噜的什么都说，你可以对面试官说：我先想想，然后自己组装记忆中的知识，组装下语言，有条理的说出来，这样能更好的表现你的才能，不是吗？   面试谁都会紧张，我也会紧张，有时候明明记得的知识点忘了，没关系，大胆的说忘了，或者直接说不知道。 要记住，有部分不知道没关系，如果全都知道，那你应该是CTO级别了（开个玩笑）。\r\n\r\n4、尽量记住面试过程中你回答不出来或者回答存在不妥的问题\r\n原因：面试失败了没关系，毕竟每个公司的要求不一样，问的问题和你擅长的方面可能有所出入，但是请记住一点：面试过程中那些你回答不出来问题，或者你自己感觉回答不太准确的问题，自己记下来，如果不会的，你可以当场问问面试官有没有好的解答，如果面试官不愿意告诉你（一般是基础方面面试官就懒得答你），那么你就自己回家慢慢查资料，如果是某些特定的技术，也可以自己写写案例什么的，毕竟知识点就那么多，问题百变，原理不变，面试也是一个学习知识的过程，让你了解大部分公司目前需要或者要求的技术。这次不知道，下次就知道了\r\n\r\n5、去面试之前，最好先了解你要去面试公司的情况（包括产品、项目情况）\r\n原因：俗话说，知己知彼，百战不殆，面试就是一场战斗，你需要了解你面试公司基本情况，包括岗位要求，这样你就能大概知道你需要面试的这家公司的技术要求情况。 为何让你去了解这家公司的主营产品和项目呢，就是让你大概了解这家公司的一个技术架构的情况，包括你可能对他们的一种实现方式提出质疑和疑惑，相信面试官很愿意帮你解答这些问题的。这样你既图了表现，也学到了知识，何乐而不为。\r\n\r\n6、合理安排你的面试时间（如果有多家公司的面试机会，尽量把你想去的公司放到最后去面试）\r\n原因：估计很多人都不理解这个，可能大部分的人对于如何安排面试时间比较迷茫，随意安排。可是这里有个技巧，如果同时有多个面试机会，你把你最想去的公司放到最末尾去面试，这样你经历过了前面的这些公司筛选，如果成功了是个机会，如果没成功，也是为最后做铺垫。  不过这里就需要考虑两点：1、你需要记住你投简历的公司和基本情况（这说明你不是海投的）    2、如果记不住，那么可以先应答一个时间，后续了解公司信息之后，通过邮件或者其他方式与其约定，调整面试时间。而且建议安排一天的面试公司不要超过两家，最好的是上午一家，下午一家，这样你能有充足的时间调整状态。\r\n\r\n\r\n三、面试题基础总结\r\n1、 JVM结构原理、GC工作机制详解\r\n答：具体参照：JVM结构、GC工作机制详解     ，说到GC，记住两点：1、GC是负责回收所有无任何引用对象的内存空间。 注意:垃圾回收回收的是无任何引用的对象占据的内存空间而不是对象本身，2、GC回收机制的两种算法，a、引用计数法  b、可达性分析算法（  这里的可达性，大家可以看基础2 Java对象的什么周期），至于更详细的GC算法介绍，大家可以参考：Java GC机制算法\r\n2、Java对象的生命周期\r\n答：创建阶段 、 应用阶段 、不可见阶段 、不可达阶段 、收集阶段 、终结阶段、 对象空间重新分配阶段等等，具体参照：Java 对象的生命周期\r\n\r\n3、Map或者HashMap的存储原理\r\n答：HashMap是由数组+链表的一个结构组成，具体参照：HashMap的实现原理\r\n\r\n4、当数据表中A、B字段做了组合索引，那么单独使用A或单独使用B会有索引效果吗？（使用like查询如何有索引效果）\r\n答：看A、B两字段做组合索引的时候，谁在前面，谁在后面，如果A在前，那么单独使用A会有索引效果，单独使用B则没有，反之亦然。同理，使用like模糊查询时，如果只是使用前面%，那么有索引效果，如果使用双%号匹配，那么则无索引效果\r\n\r\n5、数据库存储日期格式时，如何考虑时区转换问题？\r\n答：使用TimeStamp ,  原因参照：Java编程中遇到的时区转换问题\r\n\r\n6、Java Object类中有哪些方法？\r\n答：Object有哪些方法\r\n\r\n7、HTTP协议，GET和POST 的区别\r\n答：浅谈HTTP中GET和POST的区别\r\n\r\n\r\n四、线程、设计模式、缓存方面\r\n1、SimpleDataFormat是非线程安全的，如何更好的使用而避免风险呢\r\n答：关于SimpleDateFormat安全的时间格式化线程安全问题\r\n\r\n2、如何看待设计模式，并简单说说你对观察者模式的理解\r\n答：1、设计模式有神马用     2、观察者模式类图及实现\r\n\r\n3、集群环境中，session如何实现共享\r\n答：1、Java集群之session共享    2、session多服务器共享方案，还有一种方案就是使用一个固定的服务器专门保持session，其他服务器共享\r\n\r\n4、分布式、集群环境中，缓存如何刷新，如何保持同步？\r\n答：A、缓存如何刷新？ 1、定时刷新  2、主动刷新覆盖   ，每个缓存框架都有自带的刷新机制，或者说缓存失效机制，就拿Redis和 Ehcache举例， 他们都有自带的过期机制，另外主动刷新覆盖时，只需获取对应的key进行数据的覆盖即可\r\nB、缓存如何保持同步？  这个redis有自带的集群同步机制，即复制功能，具体参考：基于Redis分布式缓存实现      ，Ehcache也有分布式缓存同步的配置，只需要配置不同服务器地址即可，参照：Ehcache分布式缓存同步\r\n\r\n5、一条sql执行过长的时间，你如何优化，从哪些方面？\r\n答：1、查看sql是否涉及多表的联表或者子查询，如果有，看是否能进行业务拆分，相关字段冗余或者合并成临时表（业务和算法的优化）\r\n2、涉及链表的查询，是否能进行分表查询，单表查询之后的结果进行字段整合\r\n3、如果以上两种都不能操作，非要链表查询，那么考虑对相对应的查询条件做索引。加快查询速度\r\n4、针对数量大的表进行历史表分离（如交易流水表）\r\n5、数据库主从分离，读写分离，降低读写针对同一表同时的压力，至于主从同步，mysql有自带的binlog实现 主从同步\r\n6、explain分析sql语句，查看执行计划，分析索引是否用上，分析扫描行数等等\r\n7、查看mysql执行日志，看看是否有其他方面的问题\r\n个人理解：从根本上来说，查询慢是占用mysql内存比较多，那么可以从这方面去酌手考虑\r\n\r\n五、设计方案相关\r\n面试还会问到一些关于设计方案相关的问题，比如\r\n1、你的接口服务数据被人截包了，你如何防止数据恶意提交？\r\n答：我们可以在接口传输参数里面设置一个业务编号，这个编号用来区分是否重复提交。这样即使数据被抓包了，对方也无法区分每个字段你的含义，这时，这个业务编号的作用就来了\r\n\r\n2、假设服务器经常宕机，你从哪些方面去排查问题？\r\n答：这个就留个各位看官补充了，可评论回复\r\n\r\n\r\n     面试技巧就补充这些，后面如果记得什么在补充，如果有其他小伙伴有其他建议，也可以在评论回复，其他面试问题还包括算法、数据结构、http协议等等，这些等待大家自己去补充学习了，Spring的原理，Spring mvc的原理问的也挺多的，大家有时间可以看看之前的面试总结——高级JAVA工程（一）和面试总结——高级JAVA工程师（二）   。\r\n总而言之该看的还是得看，还学的还是得学。再次强调，基础很重要！面试技巧同样很重要，还是那句话：祝愿各位看官都能找到心仪的工作吧~~\r\n    另外，奉劝大家不要频繁跳槽，这些知识点能提升固然好，不要盲目跳槽，找工作很累的，而且没有哪家公司喜欢频繁跳槽的员工', '4', '2', now(), '1', '5');
INSERT INTO `post` VALUES ('14', '请问为什么这题输出的是“good and gbc”而不是“test ok and gbc', 'public class Example {\r\n    String str = new String(\"good\");\r\n    char[] ch = { \'a\', \'b\', \'c\' };\r\n    public static void main(String args[]) {\r\n        Example ex = new Example();\r\n        ex.change(ex.str, ex.ch);\r\n        System.out.print(ex.str + \" and \");\r\n        System.out.print(ex.ch);\r\n    }\r\n    public void change(String str, char ch[]) {\r\n    str = \"test ok\";\r\n    ch[0] = \'g\';\r\n    }\r\n}', '5', '2', now(), '1', '4');
INSERT INTO `post` VALUES ('15', '关于表单提交的post问题请教各位大佬！', '在form表单中提交的method是post，但是http协议返回的请求行的method为GET，这是什么原因导致的呢？', '2', '1', now(), '3', '4');
INSERT INTO `post` VALUES ('16', '双层for中,内层for的x++不废弃吗?', '<span style=\"font-size: 18px;\">for(int i=1;i<=5;i++){\r\n        for(int j=1;j<=i;j++)\r\n           {\r\n         \r\n        System.out.print(j);\r\n        }\r\n            System.out.println();\r\n       }</span>', '3', '1', now(), '3', '4');
INSERT INTO `post` VALUES ('17', ' 如何快速接手一个历史项目？？？？求助', '第一次遇到这种情况，javaweb项目，大概看了看用了分布式，有好多模块，运营端和app端\r\n1、原开发人员全部离职\r\n2、没有任何交接文档可参考\r\n3、数据库没有结构关系图，64个表，数据库部分表和字段没有注释\r\n4、业务逻辑不清醒（还有个原需求人员没有离职）\r\n5、。。。。目前就我一个开发。。尴尬\r\n6、项目中用了不少不太懂的技术和模式。\r\n那么问题来了。。。现在需要在一个月内搞定他，重现开发主要业务功能，历史的主流程因为合作结束要废弃。。大概看了一下30%以上的代码要改。。。。没有任何参考。。怎么搞。。。！！', '5', '2', now(), '3', '3');
INSERT INTO `post` VALUES ('18', 'java服务器主动消息推送', '各位，我现在有一个场景：\r\n后台mq监听或任务等，产生了一个消息，需要主动 实时 的推送到web端展示，请问需怎么实现。\r\n网上百度知道 websocket，但是这个好像不能实现后台服务器主动推送，也听过dwz，但是这个适用于h5等没有jsp页面的应用吗？\r\n希望大家能给我指指路，有代码样例就最好了。\r\n注:不考虑web轮询，goeasy（这个能实现需求，不想用）\r\n\r\n程序环境：spring boot  +java8+h5（ng-js）', '2', '1', now(), '3', '3');
INSERT INTO `post` VALUES ('19', 'java网站，tomcat运行一段时间后会自动停止', '\r\nkuangerren  T1\r\n结帖率：94.74%\r\njavatomcat java+oracle开发一个网站，tomcat服务运行一段时间后总是出现自动停止现象，一直找不到原因。今天查看日志发现以下内容，估计与tomcat服务停止有点关系，但又看不太懂，哪位高手帮忙分析一下，不胜感激', '4', '1', now(), '3', '3');
INSERT INTO `post` VALUES ('20', '一个简单的css问题 请问下', '<!doctype html>\r\n<html lang=\"en\">\r\n <head>\r\n  <meta charset=\"UTF-8\">\r\n  <title>Document</title>\r\n </head>\r\n <body>\r\n<style>\r\n.dbufc_1{width:100%;margin:0 auto;max-width:640px;position:fixed;bottom:0;}\r\n.dbufc_1 ul li{width:30%;float:left;}\r\n.dbufc_1 ul li img{width:100%;}\r\n.dbufc_1 ul li:nth-child(2){width:40%;}\r\n</style>\r\n  <div class=\"dbufc_1\">\r\n<ul>\r\n<li><a href=\"javascript:void(0);\" onclick=\"openZoosUrl();return false;\"><img src=\"http://www.ncwseo.com/images/101.jpg\"></a></li>\r\n<li><a href=\"tel:0830-2277815\"><img src=\"http://www.ncwseo.com/images/102.jpg\"></a></li>\r\n<li><a href=\"javascript:void(0);\" onclick=\"openZoosUrl();return false;\"><img src=\"http://www.ncwseo.com/images/103.jpg\"></a></li>\r\n</ul>\r\n  </div>\r\n\r\n </body>\r\n</html>', '9', '4', now(), '4', '2');
INSERT INTO `post` VALUES ('21', '前端css中内联元素的一个问题', '内联元素始终不能紧靠代码块，当我改为内联块元素时就能紧靠，请问这是内联元素的bug嘛', '4', '1', now(), '4', '2');
INSERT INTO `post` VALUES ('22', 'div内如何快速布局元素位置', '一个div内包含的多种不同内容，多个不同属性元素，比如p段落、span包裹的内容、超链接、图片、按钮等等，怎样才能快速布局达到你想要的某个元素快速到达你想要的位置呢', '1', '0', now(), '5', '2');
INSERT INTO `post` VALUES ('23', '用Java语言来绘制Bezier曲线', '用Java语言来绘制Bezier曲线，控制节点数增删 \r\n\r\n贝塞尔曲线基函数。。。', '3', '1', now(), '5', '6');
INSERT INTO `post` VALUES ('24', '请问为什么这题输出的是“good and gbc”而不是“test ok and gbc” ', 'public class Example {\r\n    String str = new String(\"good\");\r\n    char[] ch = { \'a\', \'b\', \'c\' };\r\n    public static void main(String args[]) {\r\n        Example ex = new Example();\r\n        ex.change(ex.str, ex.ch);\r\n        System.out.print(ex.str + \" and \");\r\n        System.out.print(ex.ch);\r\n    }\r\n    public void change(String str, char ch[]) {\r\n    str = \"test ok\";\r\n    ch[0] = \'g\';\r\n    }\r\n}', '6', '2', now(), '5', '6');
INSERT INTO `post` VALUES ('25', 'Java后台，用easyui的数据表格datagrid数据怎么导出到excel里啊', '怎么把datagrid中的数据导出到excel表中？', '4', '1', now(), '5', '6');
INSERT INTO `post` VALUES ('26', 'https协议的程序，想获取一个登录过程的各个阶段的响应时间，比如DNS解析时间等', '一个https协议的程序，在做性能测试的时候，研发需要知道登录过程各个阶段的耗时，比如DNS解析时间，服务器返回第一个自己的时间等等，大家有什么好的方法么？curl可以获取一个登录页面的各个阶段的响应时间，但是我想要的是整个登录过程的。。。求大神们指点迷津。。', '7', '2', now(), '5', '6');
INSERT INTO `post` VALUES ('27', '一个复杂的关系多表关系检索，请大侠指导', '场景：\r\n有一个学习记录表 A 记录了 学习的用户编号 和 学习的内容编号\r\ntable a ( userid , lecid )\r\n\r\n有一个表 B 记录了 用户的分类情况，包含用户编号和 分类编号\r\ntable b （userid , qid)\r\n\r\n有一个表 c 记录了 用户和 其他用户的关联关系表， 包括 用户编号 和 被关联的用户编号\r\ntable c （userid ， ruid ）\r\n\r\n现在希望 通过 表 b 中 分类编号  qid ， 检索出 表 b 中 所有的 userid  以及 和 表 b 中检索出的  userid 关联的  表 c 中 ruid  在 表 a 中的 学习记录', '5', '1', now(), '6', '1');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '回复内容',
  `systime` datetime DEFAULT NULL COMMENT '创建时间',
  `post_id` int(11) DEFAULT NULL COMMENT '帖子id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='回复表';

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '11112', now(), '6', '1');
INSERT INTO `reply` VALUES ('2', 'sdfsdf', now(), '5', '1');
INSERT INTO `reply` VALUES ('3', '是的方法', now(), '5', '1');
INSERT INTO `reply` VALUES ('4', '放松放松的方式', now(), '7', '1');
INSERT INTO `reply` VALUES ('5', '正式开始JAVA之旅，首页留名', now(), '8', '1');
INSERT INTO `reply` VALUES ('6', 'good,支持下，为什么当时用google code，这种被墙的站访问确实蛋疼，github也挺不错', now(), '10', '1');
INSERT INTO `reply` VALUES ('7', '时间比较早了，当时还没有github 这个说来惭愧，一直没怎么更新过', now(), '10', '1');
INSERT INTO `reply` VALUES ('8', '占个沙发。。。。。', now(), '11', '1');
INSERT INTO `reply` VALUES ('9', '占个沙发。。。。。', now(), '12', '1');
INSERT INTO `reply` VALUES ('10', '占个沙发。。。。。', now(), '13', '1');
INSERT INTO `reply` VALUES ('11', '支持下，小白确实不会翻墙', now(), '10', '3');
INSERT INTO `reply` VALUES ('12', '支持!希望多推荐一些好插件', now(), '8', '3');
INSERT INTO `reply` VALUES ('13', '话说刚才粗略浏览了下，发现工作才两年不到的之前面试也会问到里面一些问题', now(), '11', '3');
INSERT INTO `reply` VALUES ('14', ' 诚心请教  我是刚出来小白 能告诉我一些面试 的流程 和简历的指导吗？', now(), '12', '3');
INSERT INTO `reply` VALUES ('15', '不错,我喜欢你说的话,问题是需要自己去看,去写,去实践的', now(), '13', '3');
INSERT INTO `reply` VALUES ('16', '简单来说 你可以理解为把change方法先理解成有返回值的方法，但是你没有接收返回值，所以值没有发生改变,所以还是good and abc', now(), '14', '3');
INSERT INTO `reply` VALUES ('17', '下周还能不能活着还是一回事。。。哎，感觉希望渺茫。。外勤经理说下周要带着需求来帮我开发。。。。。尴尬', now(), '17', '3');
INSERT INTO `reply` VALUES ('18', '棒棒的', now(), '10', '4');
INSERT INTO `reply` VALUES ('19', '支持支持', now(), '8', '4');
INSERT INTO `reply` VALUES ('20', '好高端', now(), '11', '4');
INSERT INTO `reply` VALUES ('21', '不知道说啥', now(), '12', '4');
INSERT INTO `reply` VALUES ('22', '一二三四一二三四像首歌', now(), '11', '4');
INSERT INTO `reply` VALUES ('23', '哇呕!真心不会', now(), '16', '4');
INSERT INTO `reply` VALUES ('24', '都没有人回答,看看你的人品', now(), '15', '4');
INSERT INTO `reply` VALUES ('25', '哎呦喂!我是打酱油的', now(), '14', '4');
INSERT INTO `reply` VALUES ('26', '你这个是可以用websocket来写的，碰巧我最近才写了一个例子，是用户调我服务器接口，服务器将接口数据推送到HTML页面，跟你这个是差不多的', now(), '18', '4');
INSERT INTO `reply` VALUES ('27', '哇!好难得样子', now(), '19', '4');
INSERT INTO `reply` VALUES ('28', '尽力尝试着去弄吧，首先把心态静下来。自己给自己定一个计划，按照计划来熟悉项目。   至于什么一个月内，尽自己最大的能力吧，想着能搞定。 但是如果事实真的弄不完的话，罪不在你。  追求问心无愧。如果公司 因为这个问责你的话，那你就可以考虑换家公司了', now(), '17', '4');
INSERT INTO `reply` VALUES ('29', '考虑一下 css3 transform  里面的scale , 横向扩大1.1 .', now(), '20', '4');
INSERT INTO `reply` VALUES ('30', '第一可以调整图片本身的尺寸 第二可以使用height强制将图片拉伸 建议使用第一种  因为第二种会使图片看起来很奇怪不美观', now(), '20', '4');
INSERT INTO `reply` VALUES ('31', '自己回复太尴尬了', now(), '20', '4');
INSERT INTO `reply` VALUES ('32', '好\r\n', now(), '20', '5');
INSERT INTO `reply` VALUES ('33', '发代码看看。。', now(), '21', '5');
INSERT INTO `reply` VALUES ('34', '啦啦', now(), '26', '6');
INSERT INTO `reply` VALUES ('35', '拿到数据，使用poi、jxl之类的工具将数据写入到excel就好了。', now(), '25', '6');
INSERT INTO `reply` VALUES ('36', 'str作为基本类型，在传递时实际上是复制了一份这个参数传递给过去，所以在change方法改变str的内容不会改变成员变量的内容；\r\n在传递char[]数组时，把char[]数组当做对象来处理，是传递ch的地址（实际上这里存在地址的复制），所以在内存中成员变量ch和change()方法中的局部变量ch所指向的内存是同一块，这时操作change方法中的ch就是操作成员变量ch。', now(), '24', '6');
INSERT INTO `reply` VALUES ('37', '我用chrome不会出现这样的情况呀~\r\n可能是浏览器差异哦,比如vertical-align:top你设置下试试?', now(), '23', '6');
INSERT INTO `reply` VALUES ('38', '在body里写一个margin:0px;就好了', now(), '10', '6');
INSERT INTO `reply` VALUES ('39', '我的天', now(), '8', '6');
INSERT INTO `reply` VALUES ('40', '好样的', now(), '11', '6');
INSERT INTO `reply` VALUES ('41', '发代码看看。。', now(), '26', '7');
INSERT INTO `reply` VALUES ('42', '在Java里面参数传递都是按值传递”这句话的意思是：按值传递是传递的值的拷贝，按引用传递其实传递的是引用的地址值，所以统称按值传递，在Java里面只有基本类型和按照下面这种定义方式的String是按值传递，其它的都是按引用传递', now(), '24', '7');
INSERT INTO `reply` VALUES ('43', '简单来说 你可以理解为把change方法先理解成有返回值的方法，但是你没有接收返回值，所以值没有发生改变,所以还是good and abc', now(), '10', '7');
INSERT INTO `reply` VALUES ('44', 'String类型是个final类，所有一旦被复制就改变不了了，今天刚看final时学到的', now(), '27', '7');

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '话题名称',
  `intro` varchar(255) DEFAULT NULL COMMENT '介绍',
  `module_id` int(11) DEFAULT NULL COMMENT '版块id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='话题';

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', 'MySQl', null, '1');
INSERT INTO `topic` VALUES ('2', 'HTML', null, '2');
INSERT INTO `topic` VALUES ('3', 'JSP', null, '2');
INSERT INTO `topic` VALUES ('4', 'Java SE', null, '3');
INSERT INTO `topic` VALUES ('5', 'Java EE', null, '3');
INSERT INTO `topic` VALUES ('6', 'eclipse', null, '3');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'iUOoOdMAl7FsB1Kig37hmg==', '酋长大人', '1258');
INSERT INTO `users` VALUES ('2', '2', 'ag3OB0a0vnwiWexZ+52IfQ==', '李二', '17');
INSERT INTO `users` VALUES ('3', '3', 'NjjgOp1OACitB8VC4USUuA==', '张三', '18');
INSERT INTO `users` VALUES ('4', '4', 'Rp5HH1zNHMyclTIwOl2AQw==', '李四', '12');
INSERT INTO `users` VALUES ('5', '5', '02a1tlHsEtht3kgi24sRlA==', '王五', '9');
INSERT INTO `users` VALUES ('6', '6', '3yh1Vyflq7p5wC6rSMNTng==', '赵六', '4');
