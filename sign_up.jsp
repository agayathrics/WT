<%@ page language="java" contentType="text/html"%>
<%@ page import ="java.sql.*,java.util.*,java.io.*" %>
<%
    out.println("hello");
    String username = request.getParameter("username");   
    String password = request.getParameter("password");
    String email=request.getParameter("email");

    try{
 
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nasa","root","");   
        Statement s=conn.createStatement();
        int check = s.executeUpdate("insert into login values ('"+username+"','"+password+"','"+email+"')");                        
        if(check!=0)           
           out.println("submitted successfully");        
        else
           out.println("Failed to meet the requirments");            
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again"+e.getMessage());      
      out.println(e.toString());
   }      
%>