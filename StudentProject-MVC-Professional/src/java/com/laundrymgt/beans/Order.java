/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.laundrymgt.beans;

/**
 *
 * @author Admin
 */
public class Order 
{

    
    private int omid;
    private int cid;
    private String omdate;
    private String omtime;
    private String omstatus;
    
    private String ofdate;
    private String otodate;
    
    private int osid;
    private int itemid;
    private float osquantity;
    private float osprice;
    private String cname;
    private String itemname;
    
    private float total;
   

    
    
    public float getTotal() {
        return total;
    }

    
    public void setTotal(float total) {
        this.total = total;
    }
    
    
    public int getOmid() {
        return omid;
    }

    public void setOmid(int omid) {
        this.omid = omid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    
    
    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getOmdate() {
        return omdate;
    }

    public void setOmdate(String omdate) {
        this.omdate = omdate;
    }

    public String getOmtime() {
        return omtime;
    }

    public void setOmtime(String omtime) {
        this.omtime = omtime;
    }

    public String getOmstatus() {
        return omstatus;
    }

    public void setOmstatus(String omstatus) {
        this.omstatus = omstatus;
    }

    public int getOsid() {
        return osid;
    }

    public void setOsid(int osid) {
        this.osid = osid;
    }

    public int getItemid() {
        return itemid;
    }

    public void setItemid(int itemid) {
        this.itemid = itemid;
    }

    public float getOsquantity() {
        return osquantity;
    }

    public void setOsquantity(float osquantity) {
        this.osquantity = osquantity;
    }

    public float getOsprice() {
        return osprice;
    }

    public void setOsprice(float osprice) {
        this.osprice = osprice;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname;
    }
    
    
    /**
     * @return the ofdate
     */
    public String getOfdate() {
        return ofdate;
    }

    /**
     * @param ofdate the ofdate to set
     */
    public void setOfdate(String ofdate) {
        this.ofdate = ofdate;
    }

    /**
     * @return the otodate
     */
    public String getOtodate() {
        return otodate;
    }

    /**
     * @param otodate the otodate to set
     */
    public void setOtodate(String otodate) {
        this.otodate = otodate;
    }

    
}
