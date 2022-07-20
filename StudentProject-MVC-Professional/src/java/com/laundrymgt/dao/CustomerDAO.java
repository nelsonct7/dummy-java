/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.laundrymgt.dao;

import com.laundrymgt.beans.Customer;


import java.io.*;
import java.sql.*;
import java.util.ArrayList;


public class CustomerDAO {
    
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
			 System.out.println("class not found e:"+e.getMessage()) ; 
		   }
		catch(SQLException e){
			System.out.println(e.getMessage());
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
    
    
   public static boolean insertCustomer( Customer customer)throws SQLException{//Step 6:  function here
       boolean flag=false; 
       con=dbConnection(); 
     
        try{
            pst=con.prepareStatement("insert into customer(C_TYPE,C_NAME,C_ADDRESS,C_MOBILE,C_EMAIL)values(?,?,?,?,?)");
            
            System.out.println("insert into customer(C_TYPE,C_NAME,C_ADDRESS,C_MOBILE,C_EMAIL)values(?,?,?,?,?)");
                     
            pst.setString(1,customer.getCtype());//Step 7: calling getter() from getter/setter class
		//Step 10: setting getter values to corresponding query
            pst.setString(2,customer.getCname());//Step 7: calling getter() from getter/setter class
                //Step 10: setting getter values to corresponding 
            
            pst.setString(3,customer.getCaddress());
            pst.setString(4,customer.getMobile());
            pst.setString(5,customer.getCemail());
            
            
            System.out.println("am here --------get  value---------"+customer.getCname());
         
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
     
   public static boolean getCustomer(Customer customer)throws SQLException{//Step 6:  function here
       boolean flag=false; 
       con=dbConnection(); 
     
        try{
            pst=con.prepareStatement("select * from customer" 
                    + " where C_NAME=? and C_EMAIL=?");
            
            System.out.println("select * from items" 
                    + " where C_NAME=? and C_EMAIL=?");
                     
            pst.setString(1,customer.getCname());//Step 7: calling getter() from getter/setter class
		//Step 10: setting getter values to corresponding query
            pst.setString(2,customer.getCemail());//Step 7: calling getter() from getter/setter class
                //Step 10: setting getter values to corresponding   
            System.out.println("am here --------get  value---------"+customer.getCname());
            System.out.println("am here --------get  value---------"+customer.getCemail()); 
            rs=pst.executeQuery();                
            while(rs.next()){
                
                flag=true;
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    
        finally{ 
                    con.close();
                }
		return flag;
 } 
    //----------------------------------------------------------------------------------------
   
    public static ArrayList<Customer> listCustomer()throws SQLException{
         ArrayList<Customer> customers=new ArrayList<Customer>();
          
         con=dbConnection();
         
          try{
            pst=con.prepareStatement("select * from customer");
            
            System.out.println("select * from customer");
                     
       
            rs=pst.executeQuery();                
            while(rs.next()){                
                 Customer customer=new Customer();
                 customer.setCid(rs.getInt(1));
                 customer.setCtype(rs.getString(2));
                 customer.setCname(rs.getString(3));
                 customer.setCaddress(rs.getString(4));
                 customer.setMobile(rs.getString(5));             
                 customer.setCemail(rs.getString(6));
                
	         customers.add(customer);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
           finally{
    	  con.close();
      }
    
        return customers;
         
    }
    //---------------------------------------------------------------------------------------------
    
    public static ArrayList<Customer>getCustomerDetails(Customer customer)throws SQLException
    {//Step 6:  function here
        ArrayList<Customer> customers=new ArrayList<Customer>();
       
       con=dbConnection(); 
        
     
        try{
            pst=con.prepareStatement("select * from CUSTOMER where C_ID=?");
            pst.setInt(1,customer.getCid());
            rs=pst.executeQuery();                
            while(rs.next()){                
                 Customer cu=new Customer();
                 cu.setCid(rs.getInt(1));
                 cu.setCtype(rs.getString(2));
                 cu.setCname(rs.getString(3));
                 cu.setCaddress(rs.getString(4));
		 cu.setMobile(rs.getString(5));
                 cu.setCemail(rs.getString(6));
	         customers.add(cu);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
         finally{
    	  con.close();
      }
    
        return customers;
 }
     //-----------------------------------START--------------------------------------  
   
   public static boolean updateCustomer( Customer customer)throws SQLException{//Step 6:  function here
       boolean flag=false; 
       con=dbConnection(); 
     
        try{
            pst=con.prepareStatement("update CUSTOMER set C_TYPE=?, C_NAME=?, C_ADDRESS=?, C_MOBILE=?, C_EMAIL=? where C_ID=?");
            System.out.println("hello------------------------------------------------------");
            System.out.println("update CUSTOMER set C_TYPE=?, C_NAME=?, C_ADDRESS=?, C_MOBILE=?, C_EMAIL=? where C_ID=?");
         
            pst.setString(1,customer.getCtype());//Step 7: calling getter() from getter/setter class
		//Step 10: setting getter values to corresponding query
           pst.setString(2,customer.getCname());//Step 7: calling getter() from getter/setter class
                //Step 10: setting getter values to corresponding   
           pst.setString(3,customer.getCaddress());//Step 7: calling getter() from getter/setter class
           
           pst.setString(4,customer.getMobile());
           
           pst.setString(5,customer.getCemail());
           
           pst.setInt(6,customer.getCid());
               
          
           pst.executeUpdate();
           
              System.out.println("am here..........................................");
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
   public static boolean deleteCustomer ( Customer customer)throws SQLException
   {
        boolean flag=false; 
       con=dbConnection(); 
       
        try{
            pst=con.prepareStatement("delete from CUSTOMER where C_ID=?");
            
            System.out.println("delete from CUSTOMER where C_ID=?");
                     
           
               pst.setInt(1,customer.getCid());//Step 7: calling getter() from getter/setter class
               
          
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
}
