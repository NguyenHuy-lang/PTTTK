<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String error = request.getParameter("error");
    boolean isFail = error != null && error.equalsIgnoreCase("fail");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    <link rel="stylesheet" href="./css/login.css">--%>
    <title>Registration</title>
</head>
<body>
    <div>
        <form action="doRegistration.jsp" method="post">
            <label>Username</label><br>
            <input type="text" name="username"><br><br>

            <label>Password</label> <br>
            <input type="password" name="password"><br><br>

            <label>Full name</label><br>
            <input type="text" name="fullname"><br><br>

            <label>Address</label><br>
            <input type="text" name="address"><br><br>
            <div>
                Gender <br>
                <input type="radio" name="gender" id="male" value="male">
                <label for="male">Male</label>
                <input type="radio" name="gender" id="female" value="male">
                <label for="female">Female</label>
            </div><br>
            <label>Phone number</label><br>
            <input type="text" name="phonenumber"><br><br>

            <input type="submit" value="Registration">
        </form><br>

        <%
            if (isFail) {
        %>
            <span style="color:red;font-weight: bold">Username is existed</span>
        <%
            }
        %>


    </div>
</body>
</html>
