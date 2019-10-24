/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import static com.sun.xml.bind.util.CalendarConv.formatter;
import hibernate.Routes;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;
import static java.util.concurrent.TimeUnit.DAYS;
import javafx.util.Duration;
import javax.mail.internet.ParseException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessions.customerBusiness;

/**
 *
 * @author Ke
 */
@WebServlet(name = "cstmBServlet", urlPatterns = {"/cstmBServlet"})
public class cstmBServlet extends HttpServlet {

    customerBusiness cusbusiness = new customerBusiness();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String csfrom, csto, tradate, adults, children, infants;
        float basefare = 0;
        float finalfare = 0;

        //getting variables from customerbusiness.jsp      
        csfrom = request.getParameter("csfromAP");
        csto = request.getParameter("cstoap");
        tradate = request.getParameter("cstraveldate");
        adults = request.getParameter("csadults");
        children = request.getParameter("cschildren");
        infants = request.getParameter("csinfants");

        //System.out.println("nnnnnnnnnnnn" + tradate + ".....");
        if (adults != null && children != null && infants != null) {
            int intadults = Integer.parseInt(adults);
            int intchilren = Integer.parseInt(children);
            int intinfants = Integer.parseInt(infants);

            //getting dates'difference between the travel date and today's date.
            LocalDate today = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate tdate = LocalDate.parse(tradate, formatter);

            int tdiff = tdate.getDayOfYear() - today.getDayOfYear();

            List<Routes> listroute = cusbusiness.csSearch(csfrom, csto);
            System.out.println(listroute.toString());
            if (listroute.toString() == "[]") {
                RequestDispatcher rd = request.getRequestDispatcher("csresultno.jsp");
                rd.forward(request, response);
                //for calculating fare, child and infant get discount for 50% and 90% off respectively. If booking is made 10 days earlier, customer get 10% off. 

            } else {
                float chiDisc = Float.parseFloat("0.5");
                float infDisc = Float.parseFloat("0.1");
                float timeDisc = Float.parseFloat("0.9");

                for (int i = 0; i < listroute.size(); i++) {
                    Routes routes = (Routes) listroute.get(i);
                    basefare = routes.getPrice();
                    if (tdiff <= 10) {
                        finalfare = basefare * intadults + (basefare * intchilren * chiDisc) + (basefare * intinfants * infDisc);
                        routes.setPrice(finalfare);
                    } else if (tdiff > 10) {
                        finalfare = (basefare * intadults + (basefare * intchilren * chiDisc) + (basefare * intinfants * infDisc)) * timeDisc;
                        routes.setPrice(finalfare);
                    }
                }
                HttpSession xhttpsession = request.getSession(true);
                xhttpsession.setAttribute("searchedroutelist", listroute);
                xhttpsession.setAttribute("atradate", tradate);
                xhttpsession.setAttribute("adults", adults);
                xhttpsession.setAttribute("children", children);
                xhttpsession.setAttribute("infants", infants);
                RequestDispatcher rd = request.getRequestDispatcher("cssearchresult.jsp");
                rd.forward(request, response);
            }
            // This will be invoked once customer has slected its route, new information will be acquired
        } else {
            String schdAirline, schdCode, schdfrom, schdto, schdprice, schdrouteid,schdseats;

            schdprice = request.getParameter("schdprice");
            System.out.println("000" + schdprice);
            request.getSession().setAttribute("finalPrice", schdprice);
            RequestDispatcher rd = request.getRequestDispatcher("payment.jsp");
            rd.forward(request, response);

            schdAirline = request.getParameter("schdairline");
            schdCode = request.getParameter("schdcode");
            schdfrom = request.getParameter("schdfromAP");
            schdto = request.getParameter("schdtoap");
            schdrouteid = request.getParameter("routeid");
            schdseats = request.getParameter("csseats");

            HttpSession qhttpsession = request.getSession(true);
            qhttpsession.setAttribute("schdAirline", schdAirline);
            qhttpsession.setAttribute("schdCode", schdCode);
            qhttpsession.setAttribute("schdfrom", schdfrom);
            qhttpsession.setAttribute("schdto", schdto);
            qhttpsession.setAttribute("schdrouteid", schdrouteid);
            qhttpsession.setAttribute("schdseats", schdseats);
            rd = request.getRequestDispatcher("cusInfoServlet");
            rd.forward(request, response);
        }
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
