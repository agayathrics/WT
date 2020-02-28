<%@ page language="java" contentType="text/html"%>
<%@ page import ="java.sql.*,java.util.*,java.io.*" %>
<%
    out.println("hello");
    String username = request.getParameter("username");   
    String password = request.getParameter("password");
    out.println(username+ " "+password);

    try{
 
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        out.println("1");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nasa","root",""); 
        out.println("2");   
        Statement s=conn.createStatement();
        ResultSet rs = s.executeQuery("Select * from login where user='"+username+"' and pass='"+password+"'");                        
        if(rs.next())           
           out.println("Valid login credentials");        
        else
           out.println("Invalid login credentials");            
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again"+e.getMessage());      
      out.println(e.toString());
   }      
%>