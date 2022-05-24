<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>

<%
String username = new String((request.getParameter("username")).getBytes("ISO-8859-1"),"UTF-8");
String password = new String(request.getParameter("password"));

//加载驱动程序 
String driverName="com.mysql.cj.jdbc.Driver"; 
//数据库信息
String userName="root"; 
//密码 
String userPasswd=System.getenv("MYSQL_ROOT_PASSWORD"); 
//数据库名 
String dbName="hongdb"; 
//表名 
String tableName="users"; 
//将数据库信息字符串连接成为一个完整的url
 
String url="jdbc:mysql://database/"+dbName+"?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8&user="+userName+"&password="+userPasswd; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
Connection conn=DriverManager.getConnection(url); 
Statement stmt = conn.createStatement(); 
String sql="SELECT * FROM "+tableName+" where username=\""+username+"\""; 
ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
<h1>使用 POST 方法读取数据</h1>
<ul>
<li><p><b>用户名:</b>

   <%=username%>
</p></li>
<li><p><b>密码:</b>
   <%= password%>
</p></li>
</ul>
<div>
<% 
if(rs.next()){//已有账号，返回错误
   session.setAttribute("msg","账号已存在，请登录！");
   session.setAttribute("username",username);
   response.sendRedirect("register.jsp");
}
else{//没有账号，注册
   stmt.executeUpdate("INSERT INTO `hongdb`.`users` (`username`, `password`) VALUES ('"+username+"', '"+password+"');");
   session.setAttribute("msg","注册成功，请登录！");
   session.setAttribute("username",username);
   response.sendRedirect("login.jsp");
}
%>
</div>
</body>
</html>