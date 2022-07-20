/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.laundrymgt.beans;

/**
 *
 * @author Admin
 */
public class Customer {
    private int cid;
    private String ctype;
    private String cname;
    private String caddress;
    private String mobile;
    private String cemail;

    /**
     * @return the ctype
     */
    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    
    
    public String getCtype() {
        return ctype;
    }

    /**
     * @param ctype the ctype to set
     */
    public void setCtype(String ctype) {
        this.ctype = ctype;
    }

    /**
     * @return the cname
     */
    public String getCname() {
        return cname;
    }

    /**
     * @param cname the cname to set
     */
    public void setCname(String cname) {
        this.cname = cname;
    }

    /**
     * @return the caddress
     */
    public String getCaddress() {
        return caddress;
    }

    /**
     * @param caddress the caddress to set
     */
    public void setCaddress(String caddress) {
        this.caddress = caddress;
    }

    /**
     * @return the cmobile
     */
    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

   

    /**
     * @return the cemail
     */
    public String getCemail() {
        return cemail;
    }

    /**
     * @param cemail the cemail to set
     */
    public void setCemail(String cemail) {
        this.cemail = cemail;
    }

    
  
}
