<%@ page import="com.DAO.ProductDAO" %>
<%@ page import="com.Model.Product" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Dell service
  Date: 11/22/2022
  Time: 5:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  ProductDAO productDAO = new ProductDAO();
  ArrayList<Product> v = productDAO.getAllProduct();
  session.setAttribute("getAllProduct", v);
  response.sendRedirect(request.getContextPath() + "/customer/customerHomepage.jsp");
%>
