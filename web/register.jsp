<%-- 
    Document   : register
    Created on : 1 Jan, 2023, 8:45:51 PM
    Author     : Grissna
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%!
           int ageInNumber;
           private static final String Email_REGEX="^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*[\\.[a-z]]{2,}$";
                
        %>
        <%
            String fname=request.getParameter("name");
            String laname=request.getParameter("lname");
            String email=request.getParameter("email");
            String pass=request.getParameter("password");
            String cpas=request.getParameter("cpass");
            String gender=request.getParameter("gender");
            String game=request.getParameter("gm");
            String age=request.getParameter("age");
            
        try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app","app");
        out.println("Connection generated <br>");
        PreparedStatement pst = conn.prepareStatement("insert into formula values(?,?,?,?,?,?,?,?)");
        out.println("Connection successful <br>");
        pst.setString(1, fname);
        pst.setString(7, laname);
        pst.setString(4, email);
        pst.setString(8, pass);
        pst.setString(3, cpas);
        pst.setString(6, gender);
        pst.setString(5, game);
        pst.setString(2, age);
        
        int i = pst.executeUpdate();
        if (i > 0) {
            response.sendRedirect("login.html");
        }
        } catch (Exception e) {
        e.printStackTrace();

    }
%>
    </body>
</html>
