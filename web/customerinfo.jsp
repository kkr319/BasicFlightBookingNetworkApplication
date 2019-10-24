<%-- 
    Document   : customerinfo
    Created on : Jan 4, 2018, 10:28:50 PM
    Author     : Ke
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Info</title>
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
    <form name="frm" action="cusInfoServlet" method="post">
        <div id="content">
            <h2>Please Input Personal Information :</h2>

            <div class="article">
                <table>
                    <tr>
                        <td> Name: </td>
                        <td>
                            <input type="text" name="name" id="name"
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Passport Number:
                        </td>
                        <td>
                            <input type="text" name="passportnumber" id="passportnumber"
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email Address:
                        </td>
                        <td>
                            <input type="text" name="emailaddress" id="emailaddress"
                        </td>
                    </tr><tr>
                        <td>
                            Phone Number: 
                        </td>
                        <td>
                            <input type="text" name="phonenumber" id="phonenumber"
                        </td>
                    </tr>
                </table>
                <tr>
                    <td>
                        <button type="submit" name="store" value="store"  >Submit</button>
                    </td>
                </tr>

            </div>
    </form>
</div>

<div id="footer">
    <p>&copy; NA_FRS 2017 All rights reserved.</p>
</div>

</body>
</html>
