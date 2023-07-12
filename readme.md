# 个人博客系统

## 基于Spring+Spring MVC+Mybatis(Maven方式构建)

### 如何使用

```
$ git clone https://github.com/10ng1000/void-blog

$ cd Blog-System

$ mvn clean compile

$ mvn clean package

$ mvn clean install

$ mvn jetty:run

http://localhost:8080
http://localhost:8080/admin 
```

### 版本信息

| 工具         | 版本号    |
| ---------- | ------ |
| Java       | 8      |
| MySql      | 5.7    |
| Spring     | 4.2.2  |
| Spring MVC | 2.19.1 |
| Mybatis    | 3.4.4  |

### 数据库设计

##### 系统管理员信息表（admin）

* <u>id：管理员ID</u>

* username：用户名

* password：密码

* link：个人链接

* email：个人邮箱

##### 登录信息表（admin_login_log）

* <u>id：日志ID</u>

* admin_id：管理员ID

* date：登录日期

* ip：登录ip

##### 文章信息表（article）

* <u>id：文章ID</u>

* title：标题

* keywords：关键字

* desci：描述

* pic：图片地址

* content：内容

* click：点击量

* time：文章发布时间

* catalog_id：分类ID

##### 栏目信息表（catalog）

* <u>id：栏目ID</u>

* name：栏目名称

##### 评论信息表（comment）

* <u>id：评论ID</u>

* article_id：文章ID

* content：评论内容

* date：评论日期

* name：留言者昵称

* email：留言者邮箱

* parent_id：父评论ID

### 小组分工

郝歆雨（20202241239）：数据库设计，评论功能模块，前端界面设计，相关文档编写 

阮雨婷（20202241099）：数据库设计，类别功能模块，前端界面设计，相关文档编写

桑静茹（20202241303）：用户登录模块，配置文件相关，前端界面设计，相关文档编写

林一龙（20202241431）：代码框架搭建，文章管理模块，代码调试，相关文档编写

### 项目进度

![VoidBlog进度甘特图](https://github.com/10ng1000/void-blog/assets/95556180/27fde6cd-1148-4bae-aed4-7d81eea89f69)


### 详细文档

见大连理工大学本科生课程设计报告书
