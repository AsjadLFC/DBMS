<%-- 
    Document   : showaddjava
    Created on : Apr 15, 2015, 8:56:45 PM
    Author     : programmercore
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
    String image = request.getParameter("show_image");
    String name = request.getParameter("show_name");
    int episodes = Integer.parseInt(request.getParameter("show_episodes"));   
    String airdate = request.getParameter("show_airdate");
    String status = request.getParameter("show_status"); 
    String synopsis = request.getParameter("show_synopsis");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/MYANIMELISTBORN",
            "root", "I'm insane");
    String sql = "insert into Shows (Status,Airdate,Title,Synopsis,Episodes) values (?,?,?,?,?)";
    PreparedStatement prepstmt = con.prepareStatement(sql);
    
    
    SimpleDateFormat formatter = new SimpleDateFormat("mm/dd/yyyy"); // your template here
    java.util.Date dateStr = formatter.parse(airdate);
    java.sql.Date dateDB = new java.sql.Date(dateStr.getTime());
    prepstmt.setString(1, status);
    prepstmt.setDate(2, dateDB);
    prepstmt.setString(3, name);
    prepstmt.setString(4, synopsis);
    prepstmt.setInt(5, episodes);
    
    prepstmt.executeUpdate();
    
%><c:redirect url="profilepage.jsp"></c:redirect>