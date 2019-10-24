/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import hibernate.Traveller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessions.airlineBusiness;
import sessions.cusInfo;
import sessions.ownserSessionBean;

/**
 *
 * @author Ke
 */
@WebServlet(name = "cusInfoServlet", urlPatterns = {"/cusInfoServlet"})
public class cusInfoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    cusInfo cusinfo = new cusInfo();
    airlineBusiness airlinebus = new airlineBusiness();
    ownserSessionBean ownerSB = new ownserSessionBean();
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String cusname, cuspassnumber, cusemail, cusphonenumber, cusaline, cusfrom, custo, custdate, cusrouteid, cuschild, cusinfant, cusadult, cusseats, fare;
        cusname = request.getParameter("name");
        cuspassnumber = request.getParameter("passportnumber");
        cusemail = request.getParameter("emailaddress");
        cusphonenumber = request.getParameter("phonenumber");

        HttpSession qhttpsession = request.getSession(false);
        cusaline = qhttpsession.getAttribute("schdAirline").toString();
        cusfrom = qhttpsession.getAttribute("schdfrom").toString();
        custo = qhttpsession.getAttribute("schdto").toString();
        custdate = qhttpsession.getAttribute("atradate").toString();
        cusrouteid = qhttpsession.getAttribute("schdrouteid").toString();
        cuschild = qhttpsession.getAttribute("children").toString();
        cusinfant = qhttpsession.getAttribute("infants").toString();
        cusseats = qhttpsession.getAttribute("schdseats").toString();
        cusadult = qhttpsession.getAttribute("adults").toString();

        fare = qhttpsession.getAttribute("finalPrice").toString();    
        int itrouteid = Integer.parseInt(cusrouteid);
        int inChildren = Integer.parseInt(cuschild);
        int ininfant = Integer.parseInt(cusinfant);
        int incusseats = Integer.parseInt(cusseats);
        int inadults = Integer.parseInt(cusadult);

        int finaSeats = incusseats - inadults - inChildren - ininfant;
        //Filling "traveller"'s table
        String result = cusinfo.cusInfoAdd(cusname, cuspassnumber, cusemail, cusphonenumber, cusaline, cusfrom, custo, custdate, itrouteid, inChildren, ininfant);
        //If booking made, seats should be decreased
        String mdResult = airlinebus.modifySeats(itrouteid, finaSeats);
        String body = "Thank you for chosing us: " + cusname
                + "\n\n Your travel information: \n \nPassport Number: "
                + cuspassnumber + " \n Email Address: " + cusemail
                + " \nPhone Number: " + cusphonenumber + "\n You are flying with: " + cusaline + "\n You are flying from: "
                + cusfrom + " To: " + custo + " \nOn: " + custdate + "\n You have: " + cuschild + " children, " + cusinfant + " infants"
                + "\n Your Ticket's price: " + fare + " USD" + "\n\n\n We wish you a pleasant journey!";   
        String mailResult = cusinfo.sendemail(cusemail, body);
        RequestDispatcher rd = request.getRequestDispatcher("ownerServlet");
        rd.forward(request, response);
        /*
        Enumeration keys = qhttpsession.getAttributeNames();
        while (keys.hasMoreElements())
        {
          String key = (String)keys.nextElement();
          System.out.println("Session Parameter Name - "+key+", Value - "+qhttpsession.getValue(key));
        }
        /**/

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
