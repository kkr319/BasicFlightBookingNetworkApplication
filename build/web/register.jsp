<%-- 
    Document   : register
    Created on : Jan 17, 2018, 12:58:47 PM
    Author     : Ke
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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
            <a href="https://www.klart.se/">Weather</a>
        </ul>
    </div>
    <form action="AllLoginServlet" method="post">
        <div id="content">
            <h2>Please Input Your Details</h2>
            <div class="article">
                <table>
                    <tr>
                        <td>
                            Type: 
                        </td>
                        <td>
                            <select name="item">
                                <option value="customer">Customer</option>
                                <option value="airline">Airline</option>
                            </select>
                        </td>

                    </tr>
                    <tr>
                        <td> Username:</td>
                        <td>
                            <input type="text" name="regusername" id="regusernmae"
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password:
                        </td>
                        <td>
                            <input type="password" name="regpassword" id="regpassword"
                        </td>
                    </tr>
                       <tr>
                         
                          <script type="text/javascript">

                                function passwordsOnchange() {
                                    if (document.getElementById("regpassword").value != document.getElementById("conpassword").value) {
                                        alert("Passwords Don't match, try again?");
                                        document.getElementById("regpassword").value = "";
                                        document.getElementById("conpassword").value = "";
                                    }
                                }
                            </script>
                         
                       <td>
                           Confirm Password:
                       </td>
                       <td>
                           <input type="password" name="conpassword" id="conpassword" onchange=" passwordsOnchange();">
                       </td>
                   </tr>
                    <tr>
                        <td>

                        </td>
                        <td>
                            <button type="submit" name="regRegister" value="submit">Register</button>
                        </td>

                    </tr>
                    <tr>
                        <td>

                        </td>
                        <td>


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
