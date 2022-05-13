<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人主页</title>
    
    <script src="../import/jquery-3.6.0.js"></script>
    <script src="Personcal.js"></script>
</head>

<body>
    <%
        if(session.isNew()){//是的话，置status为未登录,并扔回登录界面
            session.setAttribute("status",0);
            session.setAttribute("msg","您还未登录！");
            response.sendRedirect("login.jsp");
        }
        //判断是否已登录
        if((int)session.getAttribute("status")==0){
            session.setAttribute("msg","您还未登录！");
            response.sendRedirect("login.jsp");
        }
        String username = new String((String)session.getAttribute("username"));

    %>
    <div id="username">
        <%= username%>
    </div>
</body>
</html>