/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import hibernate.Airplanes;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.StringTokenizer;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessions.airlineBusiness;

/**
 *
 * @author Ke
 */
@WebServlet(name = "routeUpdate", urlPatterns = {"/routeUpdate"})
public class routeUpdate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    airlineBusiness airlinebusiness = new airlineBusiness();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String Code, fromAP, toAP, airplaneID, seats, price, active;
        String schCode, schfromAP, schtoAP, schairplaneID, schseats, schprice, schactive;
        HttpSession httpsession = request.getSession(false);

        /*
        Enumeration<String> params = request.getParameterNames(); 
        while(params.hasMoreElements()){
         String paramName = params.nextElement();
         System.out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
        }

        System.out.println("Session Exists: "+httpsession);
        
       /*
        Enumeration keys = httpsession.getAttributeNames();
        while (keys.hasMoreElements())
        {
          String key = (String)keys.nextElement();
          System.out.println("Session Parameter Name - "+key+", Value - "+httpsession.getValue(key));
        }

        /**/
        String AirlineName = httpsession.getAttribute("alName").toString();

        String adButton = request.getParameter("add");
        String mdfButton = request.getParameter("modify");
        String delButton = request.getParameter("delete");

        Code = request.getParameter("code");
        fromAP = request.getParameter("fromAP");
        toAP = request.getParameter("toap");
        airplaneID = request.getParameter("airplane");
        seats = request.getParameter("seats");
        price = request.getParameter("price");
        active = request.getParameter("activestatus");

        
        schCode = request.getParameter("schcode");
        schfromAP = request.getParameter("schfromAP");
        schtoAP = request.getParameter("schtoap");
        schairplaneID = request.getParameter("schairplane");
        schseats = request.getParameter("schseats");
        schprice = request.getParameter("schprice");
        schactive = request.getParameter("schactivestatus");
        
        System.out.println("mdfButton: "+mdfButton+" , delButton: "+delButton+", adButton: "+adButton);


        
try{        
        if (mdfButton == null && delButton == null && adButton.equalsIgnoreCase("add")) {
            int apID = Integer.parseInt(airplaneID);
            float fltprice = Float.parseFloat(price);
            int intseats = Integer.parseInt(seats);
            int status = Integer.parseInt(active);

            String result = airlinebusiness.routeAdd(AirlineName, Code, fromAP, toAP, apID, fltprice, intseats, status);
            if (result.equalsIgnoreCase("yes")) {
                RequestDispatcher rd = request.getRequestDispatcher("airlineOPSuc.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("airlinebusiness.jsp");
                rd.forward(request, response);
            }

        }
        if (delButton == null && adButton == null && mdfButton.equalsIgnoreCase("modify")) { 

            int schapID = Integer.parseInt(schairplaneID);
            float schfltprice = Float.parseFloat(schprice);
            int schintseats = Integer.parseInt(schseats);
            int schstatus = Integer.parseInt(schactive);
            String result = airlinebusiness.modify(AirlineName, schCode, schfromAP, schtoAP, schapID, schfltprice, schintseats, schstatus);
            if (result.equalsIgnoreCase("yes")) {
                RequestDispatcher rd = request.getRequestDispatcher("airlineOPSuc.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("airlinebusiness.jsp");
                rd.forward(request, response);
            }

        }
        int schsinttatus = Integer.parseInt(schactive);
        if (mdfButton == null && delButton.equalsIgnoreCase("delete") && adButton == null) {
            
            if (schsinttatus != 1) {
                String result = airlinebusiness.delete(schCode);
                if (result.equalsIgnoreCase("yes")) {
                    RequestDispatcher rd = request.getRequestDispatcher("airlineOPSuc.jsp");
                    rd.forward(request, response);
                }
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("airlinebusiness.jsp");
                rd.forward(request, response);
            }

        }
}catch(Exception e){
    RequestDispatcher rd = request.getRequestDispatcher("airlinebusiness.jsp");
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
