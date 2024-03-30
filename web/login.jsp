<%-- 
    Document   : login
    Created on : 5 Jan, 2023, 6:06:10 PM
    Author     : Grissna
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%     
               String email = request.getParameter("email");
               String pass = request.getParameter("lpass");
               try {
                     Class.forName("org.apache.derby.jdbc.ClientDriver");
                     Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app","app");
                     Statement st = conn.createStatement();
                     ResultSet rs = st.executeQuery("select email, password from formula");
                     if(rs.next()){
                         if(email.equals(rs.getString("email")) & pass.equals(rs.getString("password")))
                         {
                             response.sendRedirect("F1.jsp");
                         }else{
                             out.println("email or password wrong");
                         }
                     }
               }
               catch(
                     Exception e){
                   out.println(e);
               } 
        %>
               
    </body>
</html>
