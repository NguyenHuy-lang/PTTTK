<%@ page import="com.DAO.OrderDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Model.Product" %>
<%@ page import="com.DAO.ProductDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>Giao diện mua sắm</div>
    <table border="2">
        <tr>
            <th>STT</th>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Giá sản phẩm</th>
            <th>Miêu tả</th>
            <th>Dường dẫn ảnh</th>
            <th>Loại sản phẩm</th>
        </tr>
        <c:set var="count" value="0" scope="page" />
        <c:forEach var="p" items="${getAllProduct}">
            <tr>
                <td>${count + 1}</td>
                <td>${p.ID}</td>
                <td>${p.name}</td>
                <td>${p.cost}</td>
                <td>${p.description}</td>
                <td>${p.imgPath}</td>
                <td>${p.categoryProduct.name}</td>
            </tr>
            <c:set var="count" value="${count + 1}" scope="page"/>
        </c:forEach>
    </table>
</body>
</html>
