<%-- 
    Document   : payment
    Created on : Jan 4, 2018, 4:22:13 PM
    Author     : Ke
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
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
        <%
            String fareResult = session.getAttribute("finalPrice").toString();
        %>
    </div>
    <form name="frm" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">


        <div id="content">
            <h2>Thank you for choosing us!  </h2>

            <div class="article">
                Your ticket price is: <%=fareResult%> USD
            </div>
            <div>                        

                <tr>
                    <td>

                        <script src="https://www.paypalobjects.com/api/checkout.js"></script>

                        <div id="paypal-button-container"></div>
                        <script>
                            paypal.Button.render({

                                env: 'sandbox', // sandbox | production

                                // PayPal Client IDs - replace with your own
                                // Create a PayPal app: https://developer.paypal.com/developer/applications/create
                                client: {
                                    sandbox: 'AZDxjDScFpQtjWTOUtWKbyN_bDt4OgqaF4eYXlewfBP4-8aqX3PiV8e1GWU6liB2CUXlkA59kJXE7M6R',
                                    production: 'AYaC9sA6CB2iN2AboKLPapTvT_jm6fj1MkW4QuP1oFVEtUWQS1duGTMH_6QpYo7PHOSN36SxNrc3Y4_o'
                                },

                                // Show the buyer a 'Pay Now' button in the checkout flow
                                commit: true,
                                // payment() is called when the button is clicked
                                payment: function (data, actions) {

                                    // Make a call to the REST api to create the payment


                                    return actions.payment.create({
                                        payment: {
                                            transactions: [
                                                {
                                                    amount: {total: '<%=fareResult%>', currency: 'USD'}
                                                }
                                            ]
                                        }
                                    });
                                },
                                // onAuthorize() is called when the buyer approves the payment
                                onAuthorize: function (data, actions) {
                                    // Make a call to the REST api to execute the payment
                                    return actions.payment.execute().then(function () {
                                        window.alert('Payment Complete!');
                                        window.location.href="customerinfo.jsp";
                                    });
                                }

                            }, '#paypal-button-container');
                            /**/
                        </script>
                    </td>
                    <td>

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
