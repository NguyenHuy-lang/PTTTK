<%@ page import="com.Model.Member" %>
<%@ page import="com.DAO.MemberDAO" %>
<%@ page import="com.Model.Customer" %>
<%@ page import="com.Model.StaffDelivery" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    Member member = new Member();
    member.setUsername(username);
    member.setPassword(password);

    MemberDAO memberDAO = new MemberDAO();
    Object object = memberDAO.checkLogin(member);

    if(object != null) {
        if(object.getClass().toString().equals(new Customer().getClass().toString())){
            Customer customer = (Customer) object;
            session.setAttribute("user", customer);
            response.sendRedirect(request.getContextPath() + "/customer/doCustomerHomepage.jsp");

        } else {
            StaffDelivery staffDelivery = (StaffDelivery) object;
            session.setAttribute("user", staffDelivery);
            response.sendRedirect(request.getContextPath() + "/staff/staffDeliveryhomepage.jsp");
        }
    } else {
        response.sendRedirect(request.getContextPath() + "/login.jsp?error=fail");
    }
%>
