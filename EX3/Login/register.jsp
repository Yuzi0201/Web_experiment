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
    <title>红色长廊注册</title>
    <link rel="stylesheet" href="input.css">
    <link rel="stylesheet" href="register.css">
    <link rel="stylesheet" href="https://www.bootcss.com/p/buttons/css/buttons.css">
    <script src="../import/jquery-3.6.0.js"></script>
    <script src="register.js"></script>
    
</head>

<body>
    <header>
        <img src="../img/GZHU.png" alt="">
        <span>注册 广州大学党史红色长廊</span>
    </header>
    <%
    /**
    * 判断request域中是否有错误信息：（第一次进入登录页面的时候，没有错误信息）
    * * 如果有错误信息：显示错误信息
    */
    String msg = "";
    String username="";
    //判断是否是第一次进入页面
    if(session.isNew()){//是的话，置status为未登录
        session.setAttribute("status",0);
    }
    //判断是否已登录
    if((int)session.getAttribute("status")==1){
        session.setAttribute("msg","您已经登录了！");
    }
    if(session.getAttribute("msg") != null){
        // 有错误信息：显示错误信息:
        msg = (String)session.getAttribute("msg");
        session.removeAttribute("msg");
    }
    if(session.getAttribute("username") != null){
        username = (String)session.getAttribute("username");
    }

    out.print("<div id=\"message\" style=\"display:none\">"+msg+"</div>");
    out.print("<div id=\"preusername\" style=\"display:none\">"+username+"</div>");
    %>
    <div id="loginframe">
        <form action="registercheck.jsp" method="POST">
            <div>
                <input class="gate" id="username" name="username" type="text" placeholder="Enter username:" required maxlength="10"/>
                <label for="username">用户名</label>
            </div>
            <div>
                <input class="gate" id="password" name="password" type="password" placeholder="Enter password,more than 8 characters:" required minlength="8"/>
                <label for="password">密码</label>
            </div>
            <div>
                <input class="gate" id="Re_password" type="password" placeholder="Repeat password,the same as above:" onblur="checkpwd()"/>
                <label for="password">重复密码</label>
            </div>
            <input type="submit" id="register" class="button button-glow button-border button-rounded button-caution" value="注 册" onclick="return checkpwd()">
            <div id="login">
                <span>已有账号？点此</span>
                <a href="./login.jsp">登录</a>
            </div>

        </form>
    </div>
    <div id="backtomain"><button class="button button-glow button-border button-rounded button-primary"
            onclick="window.location.href='../display.jsp'">返回首页</button></div>
</body>
</html>