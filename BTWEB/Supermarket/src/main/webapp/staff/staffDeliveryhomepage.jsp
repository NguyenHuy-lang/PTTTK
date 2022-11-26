<%@ page import="com.Model.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Member member = (Member) session.getAttribute("user");
    if(member==null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>
<html>
<head>
    <title>Giao diện trang chủ của nhân viên vận chuyển</title>
</head>
<body>
    <div>
        <p style="color:red;font-weight: bold">
            chào mừng : <span style="color:green">${user.username}</span></p>
    </div>
    <form action="doOrderDelivery.jsp" method="get">
        <input type="submit" value="Xem danh sách đơn hàng">
    </form>
</body>
</html>
