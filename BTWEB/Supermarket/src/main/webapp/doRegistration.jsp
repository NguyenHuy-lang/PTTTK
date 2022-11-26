<%@ page import="com.Model.Member" %>
<%@ page import="com.DAO.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String fullname = request.getParameter("fullname");
    String address = request.getParameter("address");
    String gender = request.getParameter("gender");
    String phonenumber = request.getParameter("phonenumber");

    Member member = new Member(1, username, password, fullname, address, gender, phonenumber);

    MemberDAO memberDAO = new MemberDAO();
    boolean userAccepted = memberDAO.checkRegistration(member);
    if (userAccepted == true) {
        boolean registration = memberDAO.registration(member);
        if(registration == true) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    } else {
        response.sendRedirect(request.getContextPath() + "/registration.jsp?error=fail");
    }
%>

