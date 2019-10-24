<%-- 
    Document   : Welcome
    Created on : Dec 31, 2017, 2:33:59 PM
    Author     : Ke
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
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
try{    
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
}catch(Exception e){
    e.printStackTrace();
}
%>            
            
        </ul>
    </div>

    <div id="content">
        <h2>News</h2>
        <div class="article">
            <h2>SAS Winter Sale</h2>
            <p>
                20% off in winter season!
            </p>
        </div>
        <div class="article">
            <h2>Finnair Christmas Sale</h2>
            <p>
                50% off during Christmas!
            </p>
        </div>
        <div class="article">
            <h2>Lufthansa Christmas Sale</h2>
            <p>
                Half of the price during Christmas!
            </p>
        </div>
        <div class="article">
            <h2>Version 2.0 Completed on 2018-01-25</h2>
            
        </div>
    </div>


    
    <div id="footer">
        <p>&copy; NA_FRS 2017 All rights reserved.</p>
    </div>

</body>
</html>
