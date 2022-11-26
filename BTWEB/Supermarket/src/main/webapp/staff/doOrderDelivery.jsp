<%@ page import="com.Model.StaffDelivery" %>
<%@ page import="com.Model.DeliveryOrder" %>
<%@ page import="com.DAO.OrderDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  OrderDAO orderDAO = new OrderDAO();
  StaffDelivery staffDelivery = (StaffDelivery) session.getAttribute("user");
  ArrayList<DeliveryOrder> listDeliveryOrder = orderDAO.getAllOrderOfDelivery(staffDelivery);
  session.setAttribute("listDeliveryOrder", listDeliveryOrder);
  response.sendRedirect(request.getContextPath() + "/staff/orderDelivery.jsp");
%>
