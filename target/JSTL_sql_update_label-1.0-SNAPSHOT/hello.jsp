<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_sql_update_label
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/8
  Time(创建时间)： 20:02
  Description(描述)：
  JSTL <sql:update> 标签用于更新数据库中的数据，它可以是 SQL UPDATE、INSERT 或 DELETE 语句。
JSP <sql:update> 标签语法如下：
<sql:update var="varname" [dataSource="dataSource"] [scope="page|session|request|application"] sql="sqlUpdate" />
其中：
[ ]：[ ]中的内容为可选项；
var：用来存储所影响行数的变量；
dataSource：连接的数据源；
scope：设定参数 var 的有效范围，默认为 page；
sql：更新的 SQL 语句，可以是 INSERT、UPDATE、DELETE 语句。
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--
var：代表数据源的变量；
driver：注册的 JDBC 驱动；mysql8.0:com.mysql.jdbc.Driver
url://地址:端口号/数据库名
user：连接数据库时使用的用户名；
password：连接数据库时使用的密码；
dataSource：已经存在的数据源；
scope：设定参数 var 的有效范围，默认为 page
--%>
<sql:setDataSource var="student" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/student"
                   user="root" password="20010713"/>

<%--
var：代表SQL查询的结果；
dataSource：连接的数据源；
maxRows：设置最多可存放的记录条数；
scope：设定参数 var 的有效范围，默认为 page；
sql：查询的 SQL 语句；
startRow：开始查询的行数。
--%>
<sql:query var="result" dataSource="${student}">
    SELECT * FROM information;
</sql:query>
查询：
<br>
<table border="1">
    <tr>
        <th>no</th>
        <th>name</th>
        <th>sex</th>
        <th>age</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.no}"/></td>
            <td><c:out value="${row.name}"/></td>
            <td><c:out value="${row.sex}"/></td>
            <td><c:out value="${row.age}"/></td>
        </tr>
    </c:forEach>
</table>
<br/>

插入：INSERT INTO information VALUES (10, '张二蛋', '男', 27);
<br/>
<%--
var：用来存储所影响行数的变量；
dataSource：连接的数据源；
scope：设定参数 var 的有效范围，默认为 page；
sql：更新的 SQL 语句，可以是 INSERT、UPDATE、DELETE 语句。
--%>
<sql:update dataSource="${student}" var="result">
    INSERT INTO information VALUES (10, '张二蛋', '男', 27);
</sql:update>


<sql:query var="result" dataSource="${student}">
    SELECT * FROM information;
</sql:query>
<br>
<table border="1">
    <tr>
        <th>no</th>
        <th>name</th>
        <th>sex</th>
        <th>age</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.no}"/></td>
            <td><c:out value="${row.name}"/></td>
            <td><c:out value="${row.sex}"/></td>
            <td><c:out value="${row.age}"/></td>
        </tr>
    </c:forEach>
</table>
<br/>

更新张二蛋的信息：
<br/>
<br/>
<%--
var：用来存储所影响行数的变量；
dataSource：连接的数据源；
scope：设定参数 var 的有效范围，默认为 page；
sql：更新的 SQL 语句，可以是 INSERT、UPDATE、DELETE 语句。
--%>
<sql:update dataSource="${student}" var="result">
    update information set age=26,sex='女' where name='张二蛋';
</sql:update>

<sql:query var="result" dataSource="${student}">
    SELECT * FROM information;
</sql:query>

<table border="1">
    <tr>
        <th>no</th>
        <th>name</th>
        <th>sex</th>
        <th>age</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.no}"/></td>
            <td><c:out value="${row.name}"/></td>
            <td><c:out value="${row.sex}"/></td>
            <td><c:out value="${row.age}"/></td>
        </tr>
    </c:forEach>
</table>
<br/>

删除张二蛋：
<br/>
<%--
var：用来存储所影响行数的变量；
dataSource：连接的数据源；
scope：设定参数 var 的有效范围，默认为 page；
sql：更新的 SQL 语句，可以是 INSERT、UPDATE、DELETE 语句。
--%>
<sql:update dataSource="${student}" var="result">
    delete from information where name='张二蛋';
</sql:update>


<sql:query var="result" dataSource="${student}">
    SELECT * FROM information;
</sql:query>
<br>
<table border="1">
    <tr>
        <th>no</th>
        <th>name</th>
        <th>sex</th>
        <th>age</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.no}"/></td>
            <td><c:out value="${row.name}"/></td>
            <td><c:out value="${row.sex}"/></td>
            <td><c:out value="${row.age}"/></td>
        </tr>
    </c:forEach>
</table>
<br/>
</body>
</html>
