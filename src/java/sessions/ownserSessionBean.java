/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import hibernate.Owner;
import hibernate.Traveller;
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
public class ownserSessionBean {
    
    //find the last booking
    public List<Traveller> fdtravellerID() {

        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        String query = "FROM Traveller ORDER BY id DESC";
        Query dBquery = session.createQuery(query);
        dBquery.setMaxResults(1);
        //dBquery.setParameter(0, id);//set username variable
        List<Traveller> list = dBquery.list();
        for (Traveller f : list) {
            System.out.println("**********" + f.toString());
        }
        return list;
    }
    
    //filling owner table with data
    public String recordOwner(int travellerID, String alineName, double income) {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();
        Owner owner = new Owner(travellerID, alineName,income);
        session.save(owner);
        tr.commit();
        session.close();
        return "yes";
    }
    public double getComission(double fare){
        double comission = fare*0.2;
        return comission;
    }
    
    //Find information in owner table and used to diplay on OwerPage.jsp
     public List<Owner> getOwnerStuff(){
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();

        String query = "SELECT o FROM Owner o";
        Query dBquery = session.createQuery(query);
        List<Owner> list = dBquery.list();
        for (Owner c : list) {
            System.out.println("**********" + c.getIncome()+ "********" );
        }
        return list;
    }
}
