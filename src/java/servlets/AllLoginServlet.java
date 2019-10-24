/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import hibernate.Airplanes;
import hibernate.Airports;
import hibernate.Owner;
import hibernate.Routes;
import hibernate.Traveller;
import hibernate.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessions.airlineBusiness;
import sessions.alloginSessionBean;
import sessions.cusInfo;
import sessions.ownserSessionBean;

/**
 *
 * @author Ke
 */
@WebServlet(name = "AllLoginServlet", urlPatterns = {"/AllLoginServlet"})
public class AllLoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        alloginSessionBean algSB = new alloginSessionBean();

        airlineBusiness airlinebusiness = new airlineBusiness();
        cusInfo cusinfo = new cusInfo();
        ownserSessionBean ownerSB = new ownserSessionBean();

        String alUsername, alPassword;
        String regUname, regPass, regType;
        String cmdType;

        regType = request.getParameter("item");
        regUname = request.getParameter("regusername");
        regPass = request.getParameter("regpassword");

        alUsername = request.getParameter("alusername");
        alPassword = request.getParameter("alpassword");

        cmdType = request.getParameter("tcommand");

        System.out.println("****" + alUsername + "*****" + alPassword + "****" + cmdType);

        if (regType == null && regUname == null && regPass == null) {
            HttpSession httpsession = request.getSession(true);
            httpsession.setAttribute("alName", alUsername);
            httpsession.setAttribute("alPass", alPassword);
            ServletContext sc = getServletContext();

            try {
                System.out.println("*****Checking: " + algSB.validLogin(cmdType, alUsername, alPassword));
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }

            if (algSB.validLogin(cmdType, alUsername, alPassword)) {
                request.getSession(true).setAttribute("alUsername", alUsername);
                request.getSession(true).setAttribute("userType", cmdType);

                RequestDispatcher rd = null;
                if ("customer".equals(cmdType)) {
                    List<Airplanes> airplanes = airlinebusiness.searchAirplane();
                    List<Airports> airports = airlinebusiness.searchAirports();
                    List<Routes> routes = airlinebusiness.searchRoutes(alUsername);
                    HttpSession ahttpsession = request.getSession(true);
                    ahttpsession.setAttribute("airplanelist", airplanes);
                    ahttpsession.setAttribute("airportslist", airports);
                    ahttpsession.setAttribute("routelist", routes);
                    rd = request.getRequestDispatcher("customerbusiness.jsp");
                } else if ("airline".equals(cmdType)) {
                    List<Airplanes> airplanes = airlinebusiness.searchAirplane();
                    List<Airports> airports = airlinebusiness.searchAirports();
                    List<Routes> routes = airlinebusiness.searchRoutes(alUsername);
                    HttpSession ahttpsession = request.getSession(true);
                    ahttpsession.setAttribute("airplanelist", airplanes);
                    ahttpsession.setAttribute("airportslist", airports);
                    ahttpsession.setAttribute("routelist", routes);

                    rd = request.getRequestDispatcher("airlinebusiness.jsp");
                } else if ("owner".equals(cmdType)) {
                    List<Owner> owner = ownerSB.getOwnerStuff();
                    HttpSession ahttpsession = request.getSession(true);
                    ahttpsession.setAttribute("ownerlist", owner);
                    rd = request.getRequestDispatcher("OwnerPage.jsp");
                }
                //System.out.println("scsadsjalkdsajdaslkdjalksdj" + alUsername);
                rd.forward(request, response);
                System.out.println("good!");

            } else {
                System.out.println("bad!");
                RequestDispatcher rd = request.getRequestDispatcher("airlinelogin.jsp");
                rd.forward(request, response);
            }
        }
        if (alUsername == null && alPassword == null) {
            algSB.register(regType, regUname, regPass);
            RequestDispatcher rd = request.getRequestDispatcher("welcome.jsp");
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
