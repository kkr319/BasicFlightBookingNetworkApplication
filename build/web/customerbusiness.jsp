<%-- 
    Document   : customerbusiness
    Created on : Jan 1, 2018, 10:03:06 PM
    Author     : Ke
--%>

<%@page import="hibernate.Airports"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Business</title>
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
            <a href="welcome.jsp">Home</a>
        </ul>
    </div>



    <form action="cstmBServlet" method="post">
        <div id="content">

            <script type="text/javascript">
                function onDestinationChange() {
                    if (document.getElementById("csdeparture").value == document.getElementById("csdestination").value) {
                        alert("Departure And Destination Can't be same");
                        document.getElementById("csdestination").value = "0";
                    }
                }


                function onTimeChange() {
                    var today = new Date();
                    var selectedDate = new Date(document.getElementById("cstraveldate").value); 
                    console.log(selectedDate);
                    var days = 1000*60*60*24;
                    var diff = Math.floor((today-selectedDate)/days);
                    console.log(diff);
                    if (diff>0) {
                        alert("Departure time cannot be earlier than today");
                        document.getElementById("cstraveldate").value = "";
                    }
                }
            </script>

            <h2>Please Input Both Airport Codes</h2>
            <div class="article">
                <table>                   
                    <tr>
                        <td> From </td>
                        <td>
                            <Select name="csfromAP" id="csdeparture">
                                <option value="0">From Airport Code</option>
                                <%
                                    List csaplst = (List) session.getAttribute("airportslist");

                                    for (int i = 0; i < csaplst.size(); i++) {
                                        Airports csaports = (Airports) csaplst.get(i);
                                        String code = csaports.getCode();
                                %>
                                <option value="<%=code%>"><%=code%></option>
                                <%
                                        System.out.println("******" + code);
                                    }
                                %>
                        </td>
                        <td>
                            To: 
                        </td>
                        <td>
                            <Select name="cstoap" id="csdestination" onchange="onDestinationChange();">
                                <option value="0">To Airport Code</option>
                                <%
                                    for (int i = 0; i < csaplst.size(); i++) {
                                        Airports aports = (Airports) csaplst.get(i);
                                        String code = aports.getCode();
                                %>
                                <option value="<%=code%>"><%=code%></option>
                                <%
                                        System.out.println("******" + code);
                                    }
                                %>
                        </td>
                        <td>
                            Travel Date: 
                        </td>
                        <td>
                            <input type="date" name="cstraveldate" id="cstraveldate" onchange="onTimeChange();">                                 
                        </td>                       
                        <td>
                            Adults: 
                        </td>
                        <td>
                            <Select name="csadults">
                                <option value="1">1 adult</option>
                                <option value="2">2 adults</option>
                                <option value="3">3 adults</option>
                                <option value="4">4 adults</option>
                                <option value="5">5 adults</option>
                                <option value="6">6 adults</option>
                            </select>
                        </td>
                        <td>
                            Children:
                        </td>
                        <td>
                            <Select name="cschildren">
                                <option value="0">No Children</option>
                                <option value="1">1 child</option>
                                <option value="2">2 children</option>
                                <option value="3">3 children</option>
                                <option value="4">4 children</option>
                                <option value="5">5 children</option>
                                <option value="6">6 children</option>

                            </select>
                        </td>
                        <td>
                            Infants: 
                        </td>
                        <td>
                            <Select name="csinfants">
                                <option value="0">No Infants</option>
                                <option value="1">1 infant</option>
                                <option value="2">2 infants</option>
                                <option value="3">3 infants</option>
                                <option value="4">4 infants</option>
                                <option value="5">5 infants</option>
                                <option value="6">6 infants</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>

                        </td>
                        <td>
                            <button type="submit" name="rsearch" value="submit">Search</button>
                        </td>
                    </tr>
                </table>
            </div>
    </form>
</div>

<div id="footer">
    <p>&copy; NA_FRS 2017 All rights reserved.</p>
</div>

</body>
</html>
