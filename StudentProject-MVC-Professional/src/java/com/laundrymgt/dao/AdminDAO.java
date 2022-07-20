/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.laundrymgt.dao;

import com.laundrymgt.beans.Admin;

import java.io.*;
import java.sql.*;

public class AdminDAO {
    
    static Connection con=null;
    static PreparedStatement pst=null;
    static ResultSet rs;
 
      
 //------------------------START----------------------------------- 
 /**
 *
 * @author bini
 * @date : 10.08.2016
 * @version : 1.0
 * @purpose :Establish a new Database connection
 * @param :

 */
        
   public static Connection dbConnection()throws SQLException{
     
		try{
                        DBDAO.connect();
                        con=DBDAO.getDbCon();
		     
                }
		catch(ClassNotFoundException  e){
			// System.out.println("class not found e:"+e.getMessage()) ; 
                        e.printStackTrace();
		   }
		catch(SQLException e){
			//System.out.println(e.getMessage());
                        e.printStackTrace();
                }
		return con;
	}
	

//------------------END-------------------------------------- 
    
   //------------------------START-----------------------------------   
    /**
 *
 * @author bini
 * @date : 10.08.2016
 * @version : 1.0
 * @purpose :Login check
 * @param :

 */
    
    
   public  static boolean getLogin( Admin admin)throws SQLException{//Step 6: login function here
       boolean flag=false; 
       con=dbConnection(); 
     
        try{
            pst=con.prepareStatement("select * from l_login" 
                    + " where l_username=? and l_password=? ");
            //  System.out.println("am here...............................");
            
            System.out.println("select * from l_login" 
                    + " where l_username=? and l_password=? ");
                     
            pst.setString(1,admin.getUsername());//Step 7: calling getter() from getter/setter class
		//Step 10: setting getter values to corresponding query
            pst.setString(2,admin.getPassword());//Step 7: calling getter() from getter/setter class
                //Step 10: setting getter values to corresponding   
         System.out.println("am here --------get username value---------"+admin.getUsername());
            System.out.println("am here --------get password value---------"+admin.getPassword()); 
            rs=pst.executeQuery();                
            while(rs.next()){
                
                flag=true;
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    
        return flag;
 } 
 //------------------------------------------END---------------------------------------- 
    
    public static boolean updatePassword(Admin admin)throws SQLException{
            boolean flag=false; 
            con=dbConnection(); 
            try{
                     pst=con.prepareStatement("update l_login set l_password=? ");
                     System.out.println("update l_login set l_password=? ");
                     System.out.println("--------------new password"+admin.getPassword());
                      pst.setString(1,admin.getPassword());
                      pst.executeUpdate();
                      flag=true;
            }
            catch(SQLException e){
            e.printStackTrace();
        }
    
        return flag;
            }
  //-----------------------------END----------------------------          
}
