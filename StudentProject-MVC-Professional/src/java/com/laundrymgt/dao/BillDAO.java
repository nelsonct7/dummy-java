/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.laundrymgt.dao;

import com.laundrymgt.beans.Bill;

import java.io.*;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Bini
 */


public class BillDAO {
    static Connection con=null;
    static PreparedStatement pst=null;
    static ResultSet rs;
 
      
 //------------------------START----------------------------------- 
 /**
 *
 * @author bini
 * @date : 24.08.2017
 * @version : 1.0
 * @purpose :
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
 * @purpose : check
 * @param :

 */
    
  
   public static boolean insertBill( Bill bill)throws SQLException{
       boolean flag=false; 
       con=dbConnection();
    
        try{
            pst=con.prepareStatement("insert into bill(om_id,b_paid,b_date)values(?,?,?)");
            
            System.out.println("insert into bill(om_id,b_paid,b_date)values(?,?,?)");
                     
           pst.setInt(1,bill.getOmid());//Step 7: calling getter() from getter/setter class
		//Step 10: setting getter values to corresponding query
            pst.setFloat(2,bill.getPaid());//Step 7: calling getter() from getter/setter class
                //Step 10: setting getter values to corresponding 
            
            pst.setString(3,bill.getBdate());
           
            
            
            System.out.println("am here --------get  value---------"+bill.getOmid());
         
           pst.executeUpdate();
                flag=true;
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        finally{ 
                    con.close();
                }
    
        return flag;
 } 
       

 //------------------------------------------END---------------------------------------- 

     //-----------------------------------START--------------------------------------
   
   
   public static ArrayList<Bill>  listBills()throws SQLException{//Step 6:  function here
        ArrayList<Bill> bills=new ArrayList<Bill>();
       
       con=dbConnection(); 
        
     
        try{
            pst=con.prepareStatement("select b_id,om_id,b_paid,b_date from bill");
            rs=pst.executeQuery();                
            while(rs.next()){                
                 Bill bill=new Bill();
                 bill.setBid(rs.getInt(1));
                 bill.setOmid(rs.getInt(2));
                 bill.setPaid(rs.getFloat(3));
		         bill.setBdate(rs.getString(4));
	         bills.add(bill);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
         finally{
    	  con.close();
      }
    
        return bills;
 } 
 //------------------------------------------END---------------------------------------- 
 //-----------------------------------START--------------------------------------
   
   
   public static Bill  retBill(int id)throws SQLException{//Step 6:  function here
       Bill bill=new Bill();
       bill.setBid(id);
       con=dbConnection(); 
        
     
        try{
            pst=con.prepareStatement("select om_id,b_paid,b_date  from bill where b_id=?");
            
            pst.setInt(1, bill.getBid());
            rs=pst.executeQuery();                
            while(rs.next()){                
                 bill.setOmid(rs.getInt(1));
                 bill.setPaid(rs.getFloat(2));
		         bill.setBdate(rs.getString(3));
	 
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
         finally{
    	  con.close();
      }
    
        return bill;
 } 
 //------------------------------------------END---------------------------------------- 

   //-----------------------------------START--------------------------------------  
 
 public static boolean deleteBill( Bill bill)throws SQLException{//Step 6:  function here
     boolean flag=false; 
     con=dbConnection(); 
   
      try{
          pst=con.prepareStatement("delete from bill where b_id=?");
          
          System.out.println("delete from bill where b_id=?");
                   
         
             pst.setInt(1,bill.getBid());//Step 7: calling getter() from getter/setter class
             
        
         pst.executeUpdate();
              flag=true;
          
      }
      catch(SQLException e){
          e.printStackTrace();
      }
       finally{ 
                  con.close();
              }
		
      return flag;
} 
//------------------------------------------END---------------------------------------- 
 //-----------------------------------START--------------------------------------  
 
 public static boolean updateBill( Bill bill)throws SQLException{//Step 6:  function here
     boolean flag=false; 
     con=dbConnection(); 
     System.out.println(bill.getBid());
   
      try{
          pst=con.prepareStatement("update bill set om_id=?,b_paid=?,b_date=? where b_id=?");
          
          System.out.println("update bill set om_id=?,b_paid=?,b_date=? where b_id=?");
                   
          pst.setInt(1,bill.getOmid());//Step 7: calling getter() from getter/setter class
          pst.setFloat(2,bill.getPaid());//Step 7: calling getter() from getter/setter class
              //Step 10: setting getter values to corresponding   
             pst.setString(3,bill.getBdate());//Step 7: calling getter() from getter/setter class
             pst.setInt(4,bill.getBid());//Step 7: calling getter() from getter/setter class
        
         pst.executeUpdate();
              flag=true;
          
      }
      catch(SQLException e){
          e.printStackTrace();
      }
       finally{ 
                  con.close();
              }
		
      return flag;
} 
//------------------------------------------END---------------------------------------- 
 
 
         
         //--------------------------------START---------------------------------
           
           public static ArrayList<Bill> reportBillDetails(Bill bill)throws SQLException{
		ArrayList<Bill> billz=new ArrayList<Bill>();
              
		con=dbConnection();
			    	            
		try{
			
         pst=con.prepareStatement("SELECT b_id,om_id,b_paid,b_date from bill where b_date"
                 + " between ? and ? order by b_date desc");
			  	                        
		System.out.println("SELECT b_id,om_id,b_paid,b_date from bill where b_date"
                 + " between ? and ? order by b_date desc");
               
                    pst.setString(1,bill.getBfdate());
                    System.out.println(""+bill.getBfdate());
                    System.out.println(""+bill.getBtodate());
                    pst.setString(2,bill.getBtodate());              
             
			    	               rs=pst.executeQuery();                
			    	               while(rs.next()){                
			    	                    Bill blz=new Bill();
			    	                    blz.setBid(rs.getInt(1));
			    	                    blz.setOmid(rs.getInt(2));		    	                   	
                                                    blz.setPaid(rs.getFloat(3));
                                                    blz.setBdate(rs.getString(4));
                                                  
			    	   	         billz.add(blz);
			    	               }
			    	           }
			    	           catch(SQLException e){
			    	               e.printStackTrace();
			    	           }
			    	              finally{
			    	       	  con.close();
			    	         }
			    	       
			    	           return billz;
			    	            
			    	       }
             //--------------------------------END---------------------------------
 
}
