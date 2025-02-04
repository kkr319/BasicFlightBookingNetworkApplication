package hibernate;
// Generated Jan 25, 2018 5:49:05 PM by Hibernate Tools 4.3.1

/**
 * Traveller generated by hbm2java
 */
public class Traveller implements java.io.Serializable {

    private Integer id;
    private String name;
    private String passnumber;
    private String emailaddress;
    private String phonenumber;
    private String airlines;
    private String fcitycode;
    private String tcitycode;
    private String traveldate;
    private int routeid;
    private int chilnum;
    private int infnum;

    public Traveller() {
    }

    public Traveller(String name, String passnumber, String emailaddress, String phonenumber, String airlines, String fcitycode, String tcitycode, String traveldate, int routeid, int chilnum, int infnum) {
        this.name = name;
        this.passnumber = passnumber;
        this.emailaddress = emailaddress;
        this.phonenumber = phonenumber;
        this.airlines = airlines;
        this.fcitycode = fcitycode;
        this.tcitycode = tcitycode;
        this.traveldate = traveldate;
        this.routeid = routeid;
        this.chilnum = chilnum;
        this.infnum = infnum;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassnumber() {
        return this.passnumber;
    }

    public void setPassnumber(String passnumber) {
        this.passnumber = passnumber;
    }

    public String getEmailaddress() {
        return this.emailaddress;
    }

    public void setEmailaddress(String emailaddress) {
        this.emailaddress = emailaddress;
    }

    public String getPhonenumber() {
        return this.phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getAirlines() {
        return this.airlines;
    }

    public void setAirlines(String airlines) {
        this.airlines = airlines;
    }

    public String getFcitycode() {
        return this.fcitycode;
    }

    public void setFcitycode(String fcitycode) {
        this.fcitycode = fcitycode;
    }

    public String getTcitycode() {
        return this.tcitycode;
    }

    public void setTcitycode(String tcitycode) {
        this.tcitycode = tcitycode;
    }

    public String getTraveldate() {
        return this.traveldate;
    }

    public void setTraveldate(String traveldate) {
        this.traveldate = traveldate;
    }

    public int getRouteid() {
        return this.routeid;
    }

    public void setRouteid(int routeid) {
        this.routeid = routeid;
    }

    public int getChilnum() {
        return this.chilnum;
    }

    public void setChilnum(int chilnum) {
        this.chilnum = chilnum;
    }

    public int getInfnum() {
        return this.infnum;
    }

    public void setInfnum(int infnum) {
        this.infnum = infnum;
    }

    public String toString() {
        return id + "," + name + ","  + "," + passnumber + "," + emailaddress + "," + phonenumber + "," + fcitycode + "," +airlines+ "," + tcitycode + "," + traveldate + ","+ routeid + ","+ chilnum + ","+ infnum;
    }

}
