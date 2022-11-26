<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Model.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Member member = (Member) session.getAttribute("user");
    if(member==null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>
<html>
<head>
    <title>Chi tiết đơn hàng</title>
</head>
<body>
    <div>
        <p style="color:red;font-weight: bold">
            chào mừng : <span style="color:green">${user.username} </span></p>
    </div>
    <h1>Chi tiết đơn hàng</h1>
    <div >
        <p style="font-weight: bold; color:red">Tên khách hàng:
            <span style="color:blue">${Order.customer.name} </span>
        </p>
    </div>
    <div>
        <p style="font-weight: bold; color:red">Số điện thoại:
            <span style="color:blue">${Order.customer.phonenumber}</span>
        </p>
    </div>
    <div>
        <p style="font-weight: bold; color:red">Địa chỉ:
            <span style="color:blue">${Order.customer.address}</span>
        </p>
    </div>
<c:choose>
    <c:when test="${not empty Order.inforPaymentonline}">
        <p style="font-weight: bold; color:red">Hình thức thanh toán
            <span style="color:blue">Thanh toán trực tuyến</span>
        </p>
    </c:when>
    <c:otherwise>
        <p style="font-weight: bold; color:red">Hình thức thanh toán
            <span style="color:blue">Thanh toán khi nhận hàng</span>
        </p>
    </c:otherwise>
</c:choose>
    <div>
        <p style="font-weight: bold; color:red">Ngày nhận hàng:
            <span style="color:blue">${Order.orderDate}</span>
        </p>

    </div>
    <div>
        <c:choose>
            <c:when test="${Order.statusOrder.equals('picking')}">
                <div>
                    Đã nhận hàng thành công từ kho
                </div>
            </c:when>
            <c:when test="${Order.statusOrder.equals('delivering')}">
                <div>
                    Đang vận chuyển
                </div>
            </c:when>
            <c:when test="${Order.statusOrder.equals('success')}">
                <div>
                    Giao hàng thành công
                </div>
            </c:when>
            <c:when test="${Order.statusOrder.equals('unsuccess1')}">
                <div>
                    Giao hàng thật bại lần 1
                </div>
            </c:when>
            <c:when test="${Order.statusOrder.equals('unsuccess2')}">
                <div>
                    Giao hàng thật bại lần 2
                </div>
            </c:when>

            <c:when test="${Order.statusOrder.equals('cancel')}">
                <div>
                    Đã hủy
                </div>
            </c:when>


        </c:choose>
    </div>

    <table border="2">
        <tr>
            <th>STT</th>
            <th>Tên sản phẩm</th>
            <th>Giá tiền</th>
            <th>Số lượng</th>
            <th>Tổng tiền</th>
        </tr>

        <c:set var="count" value="0" scope="page" />
        <c:forEach var="p" items="${listProduct}">
            <tr>
                <td>${count + 1}</td>
                <td>${p.product.name}</td>
                <td>${p.unitPrice}</td>
                <td>${p.quanity}</td>
                <td>${p.unitPrice * p.quanity}</td>
            </tr>
            <c:set var="count" value="${count + 1}" scope="page"/>
        </c:forEach>
    </table >

    <div>
        <p style="font-weight: bold; color:red">Số tiền tạm tính:
            <span style="color:blue">${Order.costTemp}</span>
        </p>
    </div>
    <div>
        <p style="font-weight: bold; color:red">Số tiền vận chuyển:
            <span style="color:blue">${Order.costShip}</span>
        </p>
    </div>
    <div>
        <p style="font-weight: bold; color:red">Số tiền được giảm:
            <span style="color:blue">${Order.costDiscount}</span>
        </p>
    </div>
    <div>
        <p style="font-weight: bold; color:red">Số tiền cần thanh toán
            <span style="color:blue">${Order.costTotal}</span>
        </p>
    </div>

    <form action="doDetailOrder.jsp" method="post" id="statusForm">
        <select name="listStatus" form="statusForm">
            <option value="picking">Đã nhận hàng từ kho</option>
            <option value="delivering">Đang vận chuyển</option>
            <option value="success">Giao hàng thành công</option>
            <option value="unsucess1">Giao hàng không thành công lần 1</option>
            <option value="unsucess2">Giao hàng không thành công lần 2</option>
            <option value="cancel">Đã hủy</option>
        </select>
        <input type="submit" value="Cập nhập">
    </form>
</body>
</html>
