<%-- 
    Document   : airline
    Created on : Dec 31, 2017, 3:03:11 PM
    Author     : Ke
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
        <h2>Please Input Login Details</h2>
        <div class="article">
            <table>        
                <tr>
                    <td><INPUT TYPE="radio" name="tcommand" value="airline"/>Airline</td>
                    <td><INPUT TYPE="radio" name="tcommand" value="customer"/>Customer        <INPUT TYPE="radio" name="tcommand" value="owner"/>Owner</td>                 
                </tr>
                <tr>
                    <td> Username:</td>
                    <td>
            <input type="text" name="alusername" id="alusernmae"
                    </td>
                   </tr>
                   <tr>
                       <td>
                           Password:
                       </td>
                       <td>
                           <input type="password" name="alpassword" id="alpassword">
                       </td>
                   </tr>                
                   <tr>
                       <td>
                           
                       </td>
                       <td>
                           <button type="submit" name="allogin" value="submit">Log in</button>
                       </td>
                     
                   </tr>
                   <tr>
                       <td>
                           
                       </td>
                       <td>
                           <a href="register.jsp">Don't have an account? Register here!</a>
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
