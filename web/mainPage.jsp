<%-- 
    Document   : mainPage
    Created on : Jun 6, 2023, 7:15:45 PM
    Author     : Asus
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file='components/allCss.jsp' %>
        <style>
               * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
             
        }

        body {
            font-family: Arial, sans-serif;
             
            
           
        }
        .ele{
             background-color: #99DBF5;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
        }

        .header {
            margin-bottom: 20px;
        }

        .header h1 {
            font-size: 36px;
            color: #333;
            margin-bottom: 10px;
        }

        .header p {
            font-size: 18px;
            color: #666;
        }

        .cta {
            margin-top: 40px;
        }

        .cta a {
            display: inline-block;
            padding: 12px 24px;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            font-size: 20px;
            border-radius: 4px;
        }

        .cta a:hover {
            background-color: #666;
        }

        .footer {
            margin-top: 40px;
            font-size: 14px;
            color: #666;
        }
        </style>
    </head>
    <body class="ele">
        <%@include file='navbar.jsp' %>
        <hr>
         <div class="container">
        <div class="header">
            <h1>Welcome, ${userObj.fullName}</h1>
            <p>Find your Doctor and Book your Appointment!</p>
        </div>

        <div class="cta">
            <a href="user_appointment.jsp"><i class="fa-solid fa-check"></i> Book Appointment Now</a>
        </div>

        <div class="footer">
            <p>&copy; 2023 Your Company. All rights reserved.</p>
        </div>
    </div>
    </body>
</html>
