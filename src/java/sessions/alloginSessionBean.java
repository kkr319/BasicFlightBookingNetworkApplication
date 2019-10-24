/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import hibernate.Users;
import java.io.Serializable;
import java.util.Iterator;
import java.util.List;
import javax.ejb.Stateful;
import org.hibernate.HibernateException;
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
public class alloginSessionBean {

    //private int count = 0;
    
    //Login need to match 3 factors, type (owner,airline,customer), username, password
    public boolean validLogin(String type, String uName, String uPass){
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        String query = "SELECT f FROM Users f WHERE f.type = ? AND f.username = ? AND f.password = ?";
        Query dBquery = session.createQuery(query);
        dBquery.setParameter(0, type);//set type variable
        dBquery.setParameter(1, uName);//set username variable
        dBquery.setParameter(2, uPass);//set password variable
        int count = dBquery.list().size();
        if (count == 1) {
            return true;
        } else {
            return false; 
        }
    }
    //register 
    public boolean register(String type, String username, String password){
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tr = session.beginTransaction();
        Users users = new Users(type, username, password);
        session.save(users);
        tr.commit();
        session.close();       
        return true;
    }
  

}
