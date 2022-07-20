/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.laundrymgt.beans;

/**
 *
 * @author Bini
 */
public class Bill {

  
    
    private int bid,omid;
    private float totalAmt,paid;
    private String bdate;
    
     private String bfdate;
    private String btodate;
    

    /**
     * @return the bid
     */
    public int getBid() {
        return bid;
    }

    /**
     * @param bid the bid to set
     */
    public void setBid(int bid) {
        this.bid = bid;
    }

    /**
     * @return the omid
     */
    public int getOmid() {
        return omid;
    }

    /**
     * @param omid the omid to set
     */
    public void setOmid(int omid) {
        this.omid = omid;
    }

    /**
     * @return the totalAmt
     */
    public float getTotalAmt() {
        return totalAmt;
    }

    /**
     * @param totalAmt the totalAmt to set
     */
    public void setTotalAmt(float totalAmt) {
        this.totalAmt = totalAmt;
    }

    /**
     * @return the paid
     */
    public float getPaid() {
        return paid;
    }

    /**
     * @param paid the paid to set
     */
    public void setPaid(float paid) {
        this.paid = paid;
    }

    /**
     * @return the bdate
     */
    public String getBdate() {
        return bdate;
    }

    /**
     * @param bdate the bdate to set
     */
    public void setBdate(String bdate) {
        this.bdate = bdate;
    }
    
      /**
     * @return the bfdate
     */
    public String getBfdate() {
        return bfdate;
    }

    /**
     * @param bfdate the bfdate to set
     */
    public void setBfdate(String bfdate) {
        this.bfdate = bfdate;
    }

    /**
     * @return the btodate
     */
    public String getBtodate() {
        return btodate;
    }

    /**
     * @param btodate the btodate to set
     */
    public void setBtodate(String btodate) {
        this.btodate = btodate;
    }
    
}
