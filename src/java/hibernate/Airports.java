package hibernate;
// Generated Jan 25, 2018 5:49:05 PM by Hibernate Tools 4.3.1



/**
 * Airports generated by hbm2java
 */
public class Airports  implements java.io.Serializable {


     private String code;
     private String airportname;
     private String latitude;
     private String longitude;

    public Airports() {
    }

    public Airports(String code, String airportname, String latitude, String longitude) {
       this.code = code;
       this.airportname = airportname;
       this.latitude = latitude;
       this.longitude = longitude;
    }
   
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    public String getAirportname() {
        return this.airportname;
    }
    
    public void setAirportname(String airportname) {
        this.airportname = airportname;
    }
    public String getLatitude() {
        return this.latitude;
    }
    
    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }
    public String getLongitude() {
        return this.longitude;
    }
    
    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }




}


