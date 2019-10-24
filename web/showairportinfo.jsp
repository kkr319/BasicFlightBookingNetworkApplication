<%-- 
    Document   : showairportinfo
    Created on : Jan 2, 2018, 8:40:47 PM
    Author     : Ke
--%>

<%@page import="java.util.StringTokenizer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Airport Search</title>
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

    </div>
    <form name="frm" action="routeUpdate" method="post">
        <div id="content">
            <h2>Selected Airport Information: </h2>

            <div class="article">
                <%  
            String SearchResult = session.getAttribute("searchRouteResult").toString();
            StringTokenizer tokens = new StringTokenizer(SearchResult, ",");
            String code = "", airport="", lattitude="", longitude="";
            if(tokens.hasMoreTokens()) code = tokens.nextToken();
            if(tokens.hasMoreTokens()) airport = tokens.nextToken();
            if(tokens.hasMoreTokens()) lattitude = tokens.nextToken();
            if(tokens.hasMoreTokens()) longitude = tokens.nextToken();
        %>
       Code:  <%=code%><br/>
       Airport: <%=airport%><br/>
       Latitude: <%=lattitude%> <br/>
       Longitude: <%=longitude%>

            </div>
    </form>
</div>

<div id="footer">
    <p>&copy; NA_FRS 2017 All rights reserved.</p>
</div>

</body>
</html>
