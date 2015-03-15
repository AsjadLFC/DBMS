<%-- 
    Document   : registration
    Created on : Feb 1, 2015, 4:00:49 PM
    Author     : programmercore
--%>

<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("user_name");   
    String pwd = request.getParameter("user_pass");
    String email = request.getParameter("user_id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8080/DBMS",
            "root", "I'm insane");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into members(User_Name, email, pass) values ('" + user + "','" + email + "','" + pwd);
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
%>