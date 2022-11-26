<%@ page import="com.Model.DeliveryOrder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Model.Member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%

    Member member = (Member) session.getAttribute("user");
    if(member==null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    String status = request.getParameter("status");
    System.out.println(status);
    ArrayList<DeliveryOrder> filter = new ArrayList<>();
    ArrayList<DeliveryOrder> all = (ArrayList<DeliveryOrder>) session.getAttribute("listDeliveryOrder");
    for (DeliveryOrder deliveryOrder : all) {
        if(deliveryOrder.getStatusOrder().equalsIgnoreCase(status)){
            filter.add(deliveryOrder);
        }
    }
    session.setAttribute("filter" , filter);
%>

<html>
<head>
    <title>Danh sách đơn hàng của nhân viên vận chuyển</title>
</head>
<body>
    <div>
        <p style="color:red;font-weight: bold">
            chào mừng : <span style="color:green">${user.username}</span></p>
    </div>
    <p style="font-weight: bold; color:red" >Trạng thái đơn hàng</p> <br>
    <div>
        <a href="orderDelivery.jsp?status=picking"> Đã lấy hàng từ kho </a><br>
        <a href="orderDelivery.jsp?status=delivering"> Đang vận chuyển đến cho khách hàng</a><br>
        <a href="orderDelivery.jsp?status=success">Giao hàng thành công</a><br>
        <a href="orderDelivery.jsp?status=unsuccess1">Giao hàng không thanh công lần</a><br>
        <a href="orderDelivery.jsp?status=unsuccess2">Giao hàng không thành công lần 2</a><br>
        <a href="orderDelivery.jsp?status=cancel">Đã hủy</a><br>

    </div>
    <div>
        <table border="2">
            <tr>
                <th>STT</th>
                <th>Mã đơn hàng</th>
                <th>Khách hàng</th>
                <th>Trạng thái đơn hàng</th>
                <th>Số tiền khách cần thanh toán</th>
            </tr>
            <c:set var="count" value="0" scope="page" />

            <c:forEach var="list" items="${filter}">
                <tr>
                    <td>${count + 1}</td>
                    <td>${list.ID}</td>
                    <td>${list.customer.name}</td>
                    <td>${list.statusOrder}</td>
                    <td>${list.costTotal}</td>
                    <td><a href="doDetailOrder.jsp?position=${count}">Xem chi tiết đơn hàng</a></td>
                </tr>
                <c:set var="count" value="${count + 1}" scope="page"/>
            </c:forEach>
        </table>
    </div>

</body>
</html>
