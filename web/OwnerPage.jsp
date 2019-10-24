<%-- 
    Document   : OwnerPage
    Created on : Jan 25, 2018, 4:43:03 PM
    Author     : Ke
--%>

<%@page import="hibernate.Owner"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Owner Page</title>
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
                if (request.getSession().getAttribute("alUsername") == null) {
            %>
            <a href="airlinelogin.jsp">Login</a>
            <%
                }
            %>          
            <a href="https://www.klart.se/">Weather</a>     
            <%
                if (request.getSession().getAttribute("alUsername") != null) {
            %>

            <% if (request.getSession().getAttribute("userType").equals("owner")) {%>   
            <% } else { %>
           
            <% } %>

            <a href="./logout" style="float:right;">Logout</a>
            <%
                }
            %>            

        </ul>
    </div>


    <div id="content">
        <form name="frm" action="routeUpdate" method="post">
            <%  List rlst = (List) session.getAttribute("ownerlist");
                for (int i = 0; i < rlst.size(); i++) {
                    Owner owner = (Owner) rlst.get(i);
            %>
                        <table>
                            <tr>
                                <td>ID: </td>
                                <td>
                                    <input type="text" name="ownerID" id="ownerID" value="<%=owner.getId()%>"readonly>
                                </td>
                                <td> Traveller ID: </td>
                                <td>
                                    <input type="text" name="travelID" id="travelID" value="<%=owner.getTravellerId()%>"readonly>
                                </td>
                                <td> Airline:  </td>
                                <td>
                                    <input type="text" name="owneraline" id="owneraline" value="<%=owner.getAirlineName()%>"readonly>

                                </td>
                                <td> Income:  </td>
                                <td>
                                    <input type="text" name="ownerincome" id="ownerincome" value="<%=owner.getIncome()%>"readonly>
                                </td>                               
                            </tr>

                        </table>                       
                                    
            <% }
            %>
  </div>  
    <div id="footer">
        <p>&copy; NA_FRS 2017 All rights reserved.</p>
    </div>

</body>
</html>
