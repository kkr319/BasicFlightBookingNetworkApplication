<%-- 
    Document   : airlineOPSuc
    Created on : Jan 3, 2018, 2:44:01 PM
    Author     : Ke
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Airline Operation</title>
    </head>
      <body>
        <style>
            body {
                font-family: Verdana,sans-serif;
                font-size: 0.9em;
            }

            div#header, div#footer {
                padding: 10px;
                color: white;
                background-color: red;
            }

            div#content {
                margin: 5px;
                padding: 10px;
                background-color: lightgrey;
            }

            div.article {
                margin: 5px;
                padding: 10px;
                background-color: white;
            }

            div#menu ul {
                padding: 0;
            }

            div#menu ul li {
                display: inline;
                margin: 5px;
            }
        </style>
    </head>
<body>
    <div id="header">
        <h1>Welcome to ABC Flight Reservation System</h1>
    </div>

    <div id="menu">
        <ul>
<%
if(request.getSession().getAttribute("alUsername") == null){
%>
            <a href="airlinelogin.jsp">Login</a>
<%
}
%>          
       <a href="https://www.klart.se/">Weather</a>     
<%
if(request.getSession().getAttribute("alUsername") != null){
%>

<% if(request.getSession().getAttribute("userType").equals("customer")) {%>
            <a href="customerbusiness.jsp">Customer Business</a>
<% } else { %>
            <a href="airlinebusiness.jsp">Airline Business</a>
<% } %>

            <a href="./logout" style="float:right;">Logout</a>
<%
}
%>            
            
        </ul>
    </div>

    <form name="frm" action="routeUpdate" method="post">
        <div id="content">
            <h2>Operation Successfully Completed! </h2>
    </form>
</div>

<div id="footer">
    <p>&copy; NA_FRS 2017 All rights reserved.</p>
</div>

</body>
</html>
