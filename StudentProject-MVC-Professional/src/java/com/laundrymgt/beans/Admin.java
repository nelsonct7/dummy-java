/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.laundrymgt.beans;


public class Admin {
    /// LOGIN ///
   /**
        *
        * @author Bini
        * @Date 02.01.2017
        * @version 1.0
        * @purpose Login
 */
    private String username;
    private String password;
    
    ///....END.....///

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
