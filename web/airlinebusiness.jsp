<%-- 
    Document   : airlinebusiness
    Created on : Dec 31, 2017, 5:16:23 PM
    Author     : Ke
--%>

<%@page import="hibernate.Routes"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="hibernate.Airports"%>
<%@page import="hibernate.Airplanes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Airline Business</title>
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




    <form name="frm" action="routeUpdate" method="post" style="width: 100%; height: auto;">
        <div id="menu">
            <ul>
                <a href="welcome.jsp">Home</a>
            </ul>
        </div>
        <div id="content">
            <h2>Please Update Route Information: 
                <%
                    HttpSession httpsession = request.getSession(false);
                    String AName = httpsession.getAttribute("alName").toString();
                %>
                <%= AName%></h2>

            <div class="article">
                <table>
                    <tr>
                        <td> Route Code</td>
                        <td>
                            <input type="text" name="code" id="code">
                        </td>
                        <td> From </td>
                        <td>


                            <script type="text/javascript">
                                airplaneseats = [];
                                function selectSeats() {
                                    document.getElementById("seats").value = airplaneseats[document.getElementById("airplaneoptions").value];
                                }

                                function onDestinationChange() {
                                    if (document.getElementById("departure").value == document.getElementById("destination").value) {
                                        alert("Departure And Destination Can't be same");
                                        document.getElementById("destination").value = "0";
                                    }
                                }
                            </script>

                            <Select name="fromAP" id="departure">
                                <option value="0">From Airport Code</option>
                                <%
                                    List aplst = (List) session.getAttribute("airportslist");

                                    for (int i = 0; i < aplst.size(); i++) {
                                        Airports aports = (Airports) aplst.get(i);
                                        String code = aports.getCode();
                                %>
                                <option value="<%=code%>"><%=code%></option>
                                <%
                                        System.out.println("******" + code);
                                    }
                                %>
                        </td>
                        <td> To </td>
                        <td>
                            <Select name="toap" id="destination" onchange="onDestinationChange();">
                                <option value="0">To Airport Code</option>
                                <%
                                    for (int i = 0; i < aplst.size(); i++) {
                                        Airports aports = (Airports) aplst.get(i);
                                        String code = aports.getCode();
                                %>
                                <option value="<%=code%>"><%=code%></option>
                                <%
                                        System.out.println("******" + code);
                                    }
                                %>
                        </td>
                        <td> Airplane </td>
                        <td>

                            <Select name="airplane" id="airplaneoptions" onchange="selectSeats();">                       
                                <option value="0">Select Airplane</option>
                                <%
                                    List lst = (List) session.getAttribute("airplanelist");

                                    for (int i = 0; i < lst.size(); i++) {
                                        Airplanes aplanes = (Airplanes) lst.get(i);
                                %>
                                <option value="<%=aplanes.getId()%>"><%=aplanes.getAirplanename()%></option>
                                <script>airplaneseats[<%=aplanes.getId()%>] = <%=aplanes.getSeats()%>;</script>
                                <%
                                        System.out.println("******" + aplanes.getAirplanename());
                                    }

                                %>

                        </td>
                        <td> Seats </td>
                        <td>
                            <input type="text" name="seats" id="seats" value="">
                        </td>
                        <td> Price </td>
                        <td>
                            <input type="text" name="price" id="price">
                        </td>
                        <td> Active/Inactive </td>
                        <td>
                            <Select name="activestatus">
                                <option value="1">Active</option>
                                <option value="0">Inactive</option>
                            </select>
                        </td>

                    </tr>

                </table>

                <tr>
                    <td>
                        <button type="submit" name="add" value="add" onclick="{
                                    document.frm.hdnbt.value = this.value;
                                    document.frm.submit();
                                }">Add</button>
                    </td>
                </tr>


            </div>

            <input type="hidden" name="routeid" value="0">

            </form>
        </div>

        <!-------------------------- SEARCH RESULTS STARTED ----------------------------------------------->
        <div id="content">
                <%    List rlst = (List) session.getAttribute("routelist");

                    for (int i = 0; i < rlst.size(); i++) {
                        Routes routes = (Routes) rlst.get(i);
                %>

                <div id="menu">
                    <form name="frm<%=i%>" action="routeUpdate" method="post" style="width: 100%; height: auto;">
                    <div class="article">
                        <table>
                            <tr>
                                <td> Route Code</td>
                                <td>
                                    <input type="text" name="schcode" id="code" value="<%=routes.getCode()%>">
                                </td>
                                <td> From </td>
                                <td>
                                    <input type="text" name="schfromAP" id="departure" value="<%=routes.getFromap()%>">

                                </td>
                                <td> To </td>
                                <td>
                                    <input type="text" name="schtoap" id="destination" value="<%=routes.getToap()%>">
                                </td>
                                <td> Airplane </td>
                                <td>
                                    <input type="text" name="schairplane" id="airplaneoptions" value="<%=routes.getAirplaneid()%>">

                                </td>
                                <td> Seats </td>
                                <td>
                                    <input type="text" name="schseats" id="seats" value="<%=routes.getBooked()%>">
                                </td>
                                <td> Price </td>
                                <td>
                                    <input type="text" name="schprice" id="price" value="<%=routes.getPrice()%>">
                                </td>

                                <td> Active </td>
                                <td>
                                    <input type="text" name="schactivestatus" id="activestatus" value="<%=routes.getActivestatus()%>">
                                    
                                </td>
                            </tr>

                        </table>

                        <tr>
                            <td>
                                <button type="submit" name="modify" value="modify" onclick="{
                                            document.frm.hdnbt.value = this.value;
                                            document.frm.submit();
                                        }">Modify</button>
                            </td> 

                            <td>
                                <button type="submit" name="delete" value="delete" onclick="{
                                            document.frm.hdnbt.value = this..value;
                                            document.frm.submit();
                                        }">Delete</button>
                            </td>
                        </tr>
                    </div>
                    <input type="hidden" name="routeid" value="<%=routes.getId()%>">
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
