<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Model.DeliveryOrder" %>
<%@ page import="com.Model.DetailInCart" %>
<%@ page import="com.DAO.OrderDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getParameter("listStatus") == null) {
        String position = request.getParameter("position");
        Integer index = Integer.parseInt(position);
        ArrayList<DeliveryOrder> filter = (ArrayList<DeliveryOrder>) session.getAttribute("filter");
        ArrayList<DetailInCart> detailInCart = filter.get(index).getDetailInCart();
        session.setAttribute("listProduct", detailInCart);
        session.setAttribute("Order", filter.get(index));
    }
    if(request.getParameter("listStatus") != null) {
        String status = request.getParameter("listStatus");
        DeliveryOrder order = (DeliveryOrder) session.getAttribute("Order");
        order.setStatusOrder(status);
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.UpdateOrder(order);
    }
    response.sendRedirect(request.getContextPath() + "/staff/detailOrder.jsp");
%>