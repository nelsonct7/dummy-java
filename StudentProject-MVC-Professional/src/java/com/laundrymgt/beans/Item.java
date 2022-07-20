/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.laundrymgt.beans;


public class Item {
    /// ITEM ///
   /**
        *
        * @author Bini
        * @Date 02.01.2017
        * @version 1.0
        * @purpose Login
 */
    private int  itemid;
    private String itemname;
    private float itemprice;
    
    ///....END.....///

    /**
     * @return the itemname
     */
    public String getItemname() {
        return itemname;
    }

    /**
     * @param itemname the itemname to set
     */
    public void setItemname(String itemname) {
        this.itemname = itemname;
    }

    /**
     * @return the itemprice
     */
    public float getItemprice() {
        return itemprice;
    }

    /**
     * @param itemprice the itemprice to set
     */
    public void setItemprice(float itemprice) {
        this.itemprice = itemprice;
    }

    public int getItemid() {
        return itemid;
    }

    public void setItemid(int itemid) {
        this.itemid = itemid;
    }

    
   
    
}
