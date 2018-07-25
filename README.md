Apollo（配置中心）
================

[![Build Status](https://travis-ci.org/ctripcorp/apollo.svg?branch=master)](https://travis-ci.org/ctripcorp/apollo)
[![GitHub release](https://img.shields.io/github/release/ctripcorp/apollo.svg)](https://github.com/ctripcorp/apollo/releases)
[![Coverage Status](https://coveralls.io/repos/github/ctripcorp/apollo/badge.svg?branch=master)](https://coveralls.io/github/ctripcorp/apollo?branch=master)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
<a href="https://scan.coverity.com/projects/ctripcorp-apollo">
  <img alt="Coverity Scan Build Status" src="https://img.shields.io/coverity/scan/8244.svg"/>
</a>
[![codecov.io](https://codecov.io/github/ctripcorp/apollo/coverage.svg?branch=master)](https://codecov.io/github/ctripcorp/apollo?branch=master)

Apollo（阿波罗）是携程框架部门研发的分布式配置中心，能够集中化管理应用不同环境、不同集群的配置，配置修改后能够实时推送到应用端，并且具备规范的权限、流程治理等特性，适用于微服务配置管理场景。

服务端基于Spring Boot和Spring Cloud开发，打包后可以直接运行，不需要额外安装Tomcat等应用容器。

Java客户端不依赖任何框架，能够运行于所有Java运行时环境，同时对Spring/Spring Boot环境也有较好的支持。

.Net客户端不依赖任何框架，能够运行于所有.Net运行时环境。

## PostgreSQL适配

基于[apollo v0.10.2](https://github.com/ctripcorp/apollo/tree/v0.10.2)对PostgreSQL做了适配，主要内容：

* 提供了pg风格的建表SQL: `scripts/sql/pg-configdb.sql`与`scripts/sql/pg-portaldb.sql`
  * 统一使用小写+下划线命名
  * 字符串全部使用`TEXT`
  * 某些状态字段使用`BOOLEAN`
* 对全部`@Entity`及部分`Repository`进行相应适配
  * 表名字段名映射
  * `SEQUENCE`映射
  * 部分实体字段`int` -> `boolean`
  * 部分HQL调整
  * 部分SQL调整
* Mysql Driver替换为PostgreSQL Driver(版本:42.2.4)
* 加入`hibernate.dialect`与`hibernate.temp.use_jdbc_metadata_defaults`配置(使CockroachDB可用)
* 去掉`spring.datasource.initSQL=set names utf8mb4`

使用[PostgreSQL 9.5](https://www.postgresql.org/)与[CockroachDB 2.0.3](https://www.cockroachlabs.com/)手动测试通过,如发现Bug,请在issue中提出.

### 未做工作项
* 单元测试调整
* Docker测试
