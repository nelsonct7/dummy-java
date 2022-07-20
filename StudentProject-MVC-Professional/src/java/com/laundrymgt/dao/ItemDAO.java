/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.laundrymgt.dao;

import com.laundrymgt.beans.Item;

import java.io.*;
import java.util.*;
import java.sql.*;

public class ItemDAO {
    
   static Connection con=null;
   static PreparedStatement pst=null;
  static ResultSet rs;
 static ArrayList al;
 
      
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
    
    
   public static boolean getItem( Item item)throws SQLException{//Step 6:  function here
       boolean flag=false; 
       con=dbConnection(); 
     
        try{
            pst=con.prepareStatement("select * from item" 
                    + " where item_name=? and item_price=?");
            
            System.out.println("select * from item" 
                    + " where item_name=? and item_price=?");
                     
            pst.setString(1,item.getItemname());//Step 7: calling getter() from getter/setter class
		//Step 10: setting getter values to corresponding query
            pst.setFloat(2,item.getItemprice());//Step 7: calling getter() from getter/setter class
                //Step 10: setting getter values to corresponding   
            System.out.println("am here --------get  value---------"+item.getItemname());
            System.out.println("am here --------get  value---------"+item.getItemprice()); 
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
 //------------------------------------------END---------------------------------------- 
    
    
   
  //------------------------START-----------------------------------   
    /**
 *
 * @author bini
 * @date : 10.08.2016
 * @version : 1.0
 * @purpose : check
 * @param :

 */
    
    
   public static boolean insertItem( Item item)throws SQLException{//Step 6:  function here
       boolean flag=false; 
       con=dbConnection(); 
     
        try{
            pst=con.prepareStatement("insert into item(item_name,item_price)values(?,?)");
            
            System.out.println("insert into item(item_name,item_price)values(?,?)");
                     
            pst.setString(1,item.getItemname());//Step 7: calling getter() from getter/setter class
		//Step 10: setting getter values to corresponding query
            pst.setFloat(2,item.getItemprice());//Step 7: calling getter() from getter/setter class
                //Step 10: setting getter values to corresponding   
            System.out.println("am here --------get  value---------"+item.getItemname());
            System.out.println("am here --------get  value---------"+item.getItemprice()); 
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
   
    
   public static ArrayList<Item> listItems()throws SQLException{//Step 6:  function here
        ArrayList<Item> items=new ArrayList<Item>();
       
       con=dbConnection(); 
        
     
        try{
            pst=con.prepareStatement("select * from item");
            
            System.out.println("select * from item");
                     
       
            rs=pst.executeQuery();                
            while(rs.next()){                
                 Item it=new Item();
                 it.setItemid(rs.getInt(1));
                 it.setItemname(rs.getString(2));
		 it.setItemprice(rs.getFloat(3));
	         items.add(it);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
         finally{
    	  con.close();
      }
    
        return items;
 } 
 //------------------------------------------END---------------------------------------- 
    
   //-----------------------------------START--------------------------------------
   
    
   public static ArrayList<Item>  getItemDetails(Item ite)throws SQLException{//Step 6:  function here
        ArrayList<Item> items=new ArrayList<Item>();
       
       con=dbConnection(); 
        
     
        try{
            pst=con.prepareStatement("select * from item where item_id=?");
            pst.setInt(1,ite.getItemid());
            rs=pst.executeQuery();                
            while(rs.next()){                
                 Item it=new Item();
                 it.setItemid(rs.getInt(1));
                 it.setItemname(rs.getString(2));
		 it.setItemprice(rs.getFloat(3));
	         items.add(it);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
         finally{
    	  con.close();
      }
    
        return items;
 } 
 //------------------------------------------END---------------------------------------- 
    
    //-----------------------------------START--------------------------------------  
   
   public static boolean updateItem( Item item)throws SQLException{//Step 6:  function here
       boolean flag=false; 
       con=dbConnection(); 
     
        try{
            pst=con.prepareStatement("update item set item_name=?, item_price=? where item_id=?");
            
            System.out.println("update item set item_name=?, item_price=? where item_id=?");
                     
            pst.setString(1,item.getItemname());//Step 7: calling getter() from getter/setter class
		//Step 10: setting getter values to corresponding query
            pst.setFloat(2,item.getItemprice());//Step 7: calling getter() from getter/setter class
                //Step 10: setting getter values to corresponding   
               pst.setInt(3,item.getItemid());//Step 7: calling getter() from getter/setter class
               
          
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
   
   public static boolean deleteItem( Item item)throws SQLException{//Step 6:  function here
       boolean flag=false; 
       con=dbConnection(); 
     
        try{
            pst=con.prepareStatement("delete from item where item_id=?");
            
            System.out.println("delete from item where item_id=?");
                     
           
               pst.setInt(1,item.getItemid());//Step 7: calling getter() from getter/setter class
               
          
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
   
   
   
}
