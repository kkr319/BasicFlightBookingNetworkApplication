/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import hibernate.Airplanes;
import hibernate.Airports;
import hibernate.Routes;
import java.util.List;
import javax.ejb.Stateful;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
/**
 *
 * @author Ke
 */
@Stateful
public class airlineBusiness {
  
    public List<Airplanes> searchAirplane(){
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();

        String query = "SELECT c FROM Airplanes c";
        Query dBquery = session.createQuery(query);
        //dBquery.setParameter(0, "Airbus 380");//set username variable
        List<Airplanes> list = dBquery.list();
        for (Airplanes c : list) {
            System.out.println("**********" + c.getAirplanename()+ "********" );
        }
        return list;
    }
    public List<Airports> searchAirports(){
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();

        String query = "SELECT f FROM Airports f";
        Query dBquery = session.createQuery(query);
        //dBquery.setParameter(0, "Airbus 380");//set username variable
        List<Airports> list = dBquery.list();
        for (Airports f : list) {
            System.out.println("**********" + f.getCode()+ "********" );
        }
        return list;
    }
    
       public String routeAdd(String Airline, String code, String from, String to,int planeID,Float price,int booked,int status) {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();
        
        //System.out.println("planeID+" , airline: "+Airline+", code: "+code+", from: "+from+", to: "+to+", price: "+price+", booked: "+booked+", activestatus: "+status );

        Routes routes = new Routes( Airline, code, from,to, planeID, price, booked, status );
        session.save(routes);
        tr.commit();
        session.close();
        return "yes";
    }
      public List<Routes> searchRoutes(String Airline){
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();

        String query = "SELECT f FROM Routes f WHERE f.airline = ?";
        Query dBquery = session.createQuery(query);
        dBquery.setParameter(0, Airline);//set username variable
        List<Routes> list = dBquery.list();
        for (Routes f : list) {
            System.out.println("**********" + f.getAirline()+ "********" );
        }
        return list;
    }
      public String modify(String airline, String code, String fromap, String toap,int airplaneid,Float price,int booked,int activestatus) {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction t = session.beginTransaction();
        Query query = session.createQuery("Update Routes set airline = :airline, code = :code, fromap = :fromap, toap = :toap, airplaneid = :airplaneid, price = :price, booked = :booked, activestatus = :activestatus where code = :code ");      
        query.setParameter("airline", airline);
        query.setParameter("code", code);
        query.setParameter("fromap", fromap);
        query.setParameter("toap", toap);
        query.setParameter("airplaneid", airplaneid);
        query.setParameter("price", price);
        query.setParameter("booked", booked);
        query.setParameter("activestatus", activestatus);

        System.out.println("ModifyQuery: " + query.toString());
        int result = query.executeUpdate();      
        t.commit();
        if (result == 1) {
            return "yes";
        } else {
            return "no";
        }
    }
        public String delete(String fcode) {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction t = session.beginTransaction();
        Query query = session.createQuery("DELETE FROM Routes WHERE code = ?");        
        //System.out.println("DeletQuery: [" + acode + "] :" + query.toString());
        query.setParameter(0, fcode);
        int result = query.executeUpdate();
        t.commit();
        if (result == 1) {
            return "yes";
        } else {
            return "no";
        }
    }
        //Once booking is made, the corresponding seats of the route will be decreased
        public String modifySeats(int routeid,int seats) {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction t = session.beginTransaction();
        Query query = session.createQuery("Update Routes set booked = :booked where id = :id ");      
        query.setParameter("id", routeid);
        query.setParameter("booked", seats);
        System.out.println("ModifyQuery: " + query.toString());
        int result = query.executeUpdate();      
        t.commit();
        if (result == 1) {
            return "yes";
        } else {
            return "no";
        }
    }       
}
