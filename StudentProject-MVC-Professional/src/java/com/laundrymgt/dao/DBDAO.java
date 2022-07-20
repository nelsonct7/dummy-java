/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.laundrymgt.dao;

import java.sql.*;
import java.io.*; // for Serializable interface

public class DBDAO implements Serializable{ //Serialization, in broad terms, is the way Java provides developers to persist the state of any object to a persistent store.
                                                //If a developer wants that for some reason instance of his coded class should be persisted to a backing store, then the class needs to be declared as implementing Serializable.
        private  static Connection dbCon;  
	private  static String dbURL;
	private  static  String dbDriver; 
	private  static String userName;
	private  static  String passWord;
    
    //-------------------------------------------------------------------------	
	public DBDAO(){  	    
		 super();   	       
        }
 //-----------------------------------------------------------------------
        private static  void  dbInit(){
		   
	    try{
                    dbDriver="oracle.jdbc.driver.OracleDriver";	  
                    dbURL="jdbc:oracle:thin:@localhost:1521:xe";
                    userName="laundry";	
                   //userName="bini";
                    passWord="laundry"; 
                 // passWord="bini";
	    }
	     catch (Exception e){	    	
	    	e.printStackTrace();
	    }
	  
	}
//-----------------------------------------------------------------------
	public  static void connect() throws ClassNotFoundException,SQLException { 
	          dbInit();
	          Class.forName(dbDriver); 
	          dbCon = DriverManager.getConnection(dbURL,userName,passWord); 
	          setDbCon(dbCon);	    
        }
//------------------------------------------------------------

	public static Connection getDbCon(){
		return dbCon;
	}
	
	public static void setDbCon(Connection con){
		dbCon=con;
	}
	public static void close() throws SQLException{ 
	        dbCon.close(); 
	}
    
}
