<%--
  Created by IntelliJ IDEA.
  User: Dell service
  Date: 11/18/2022
  Time: 10:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String fail = request.getParameter("error");
  boolean checkLogin = fail != null && fail.equalsIgnoreCase("fail");
%>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%--    <link rel="stylesheet" href="./css/login.css">--%>
  <title>Registration</title>
</head>
<body>
  <form method="post" action="doLogin.jsp">
    <div>Username
    <input type="text" name="username">
    </div>
    <div>Password
      <input type="password" name="password">
    </div>
    <div>
      <input type="submit" value="login">
    </div>
  </form>

  <%
    if(checkLogin) {
  %>
      <div>
        <span>Username or password is wrong</span>
      </div>
  <%
    }
  %>

  <a href="registration.jsp">Đăng ký</a>
</body>
</html>
