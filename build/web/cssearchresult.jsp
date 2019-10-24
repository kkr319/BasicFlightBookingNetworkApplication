<%-- 
    Document   : cssearchresult
    Created on : Jan 22, 2018, 4:27:20 PM
    Author     : Ke
--%>

<%@page import="com.sun.xml.wss.util.DateUtils"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="hibernate.Routes"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Search Result</title>
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

    <form name="frm" action="cstmBServlet" method="post" style="width: 100%; height: auto;">
        <div id="menu">
            <ul>
                <a href="welcome.jsp">Home</a>
            </ul>
        </div>        
        <!-------------------------- SEARCH RESULTS STARTED ----------------------------------------------->
        <div id="content">
           
            <%  List rlst = (List) session.getAttribute("searchedroutelist");
                for (int i = 0; i < rlst.size(); i++) {
                    Routes routes = (Routes) rlst.get(i);                   
            %>
            
            <div id="menu">
                <form name="sfrm<%=i%>" action="cstmBServlet" method="post" style="width: 100%; height: auto;">
                    <div class="article">
                        <table>
                            <tr>
                                <td>
                                    Airline
                                </td>
                                <td>
                                    <input type="text" name="schdairline" id="schdairline" value="<%=routes.getAirline()%>"readonly>
                                </td>
                                <td> Route Code</td>
                                <td>
                                    <input type="text" name="schdcode" id="schdcode" value="<%=routes.getCode()%>"readonly>
                                </td>
                                <td> From </td>
                                <td>
                                    <input type="text" name="schdfromAP" id="departure" value="<%=routes.getFromap()%>"readonly>

                                </td>
                                <td> To </td>
                                <td>
                                    <input type="text" name="schdtoap" id="destination" value="<%=routes.getToap()%>"readonly>
                                </td>
                                <td> Airplane </td>
                                <td>
                                    <input type="text" name="schdairplane" id="airplaneoptions" value="<%=routes.getAirplaneid()%>"readonly>

                                </td>                                
                                <td> Price </td>
                                <td>
                                    <input type="text" name="schdprice" id="price" value="<%=routes.getPrice()%>"readonly>
                                </td>

                            </tr>

                        </table>

                        <tr>
                            <td>
                                <button type="submit" name="csbook" value="csbook" onclick="{
                                            document.frm.hdnbt.value = this.value;
                                            document.frm.submit();
                                        }">Book</button>
                            </td> 
                        </tr>
                    </div>
                    <input type="hidden" name="routeid" value="<%=routes.getId()%>">
                    <input type="hidden" name = "csseats" value="<%=routes.getBooked()%>">
                </form>
            </div>
            <% }
            %>
            <!-------------------------- SEARCH RESULTS FINISHED ----------------------------------------------->
            <div id="footer">
                <p>&copy; NA_FRS 2017 All rights reserved.</p>
            </div>

            </body>
            </html>
