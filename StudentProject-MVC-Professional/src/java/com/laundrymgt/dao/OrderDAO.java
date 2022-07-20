/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.laundrymgt.dao;

import com.laundrymgt.beans.Order;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Admin
 */
public class OrderDAO 
{
    static Connection con=null;
    static PreparedStatement pst=null,pst2=null,pst3=null,ps1=null,ps=null;
    static ResultSet rs=null;
    
     //------------------------START----------------------------------- 
 /**
 *
 * @author sibin
 * @date : 08.06.2017
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
    public static ArrayList<Order> retrieveCustomer(Order order)throws SQLException
    {
         ArrayList<Order> orders=new ArrayList<Order>();
         
         con=dbConnection();
         
         try{
            pst=con.prepareStatement("select C_ID,C_NAME from customer");
            
            System.out.println("select C_ID,C_NAME from customer");
                     
       
            rs=pst.executeQuery();                
            while(rs.next()){                
                 Order ord=new Order();
                 
                 ord.setCid(rs.getInt(1));
                 ord.setCname(rs.getString(2));
                 orders.add(ord);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
           finally{
    	  con.close();
      }
        System.out.println("hello-------------------------------------------");
        return orders;
         
    }
    //---------------------------END-------------------------------------
    
  //---------------------------START-------------------------------------
    
     public static boolean insertOrder(Order order)throws SQLException
     {
         boolean flag=false; 
         con=dbConnection(); 
         int omids=0;
         String status="progress";
         try
         {
              pst=con.prepareStatement("insert into ORDER_MAIN(C_ID,OM_DATE,OM_TIME)values(?,?,?)");
              
              System.out.println("insert into ORDER_MAIN(C_ID,OM_DATE,OM_TIME)values(?,?,?)");
              
              pst.setInt(1,order.getCid());
              
              pst.setString(2,order.getOmdate());
              
              pst.setString(3, order.getOmtime());
              
           
              
              pst.executeUpdate();
              
              omids=retLastOmID();
              
              
              ps=con.prepareStatement("insert into ORDER_status(om_id,os_status,os_date)values(?,?,?)");
              System.out.println("insert into ORDER_status(om_id,os_status,OS_DATE)values(?,?,?)");
              
              ps.setInt(1,omids);
              ps.setString(2, status);
              ps.setString(3,order.getOmdate());
              
              ps.executeUpdate();
                
              flag=true;
              
         }
         catch(Exception e){
             e.printStackTrace();
         }
         finally
         {
             con.close();
         }
         return flag;
     }
   // --------------------------------END-----------------------------------------------------
     
     //-------------------------------START---------------------------------------------------
     
     
     public static int retLastOmID() throws SQLException{
         int om_ids=0;
         con=dbConnection(); 
         try{
             pst2=con.prepareStatement("select max(om_id) from order_main");
             System.out.println("select max(om_id) from order_main");
             rs=pst2.executeQuery();
             while(rs.next()){
                 om_ids=rs.getInt(1);
             }
             
         }
         catch(Exception e){
             e.printStackTrace();
         }
         return om_ids;
     }
     
     
     
        // --------------------------------END-----------------------------------------------------
     
     
     //-------------------------------START---------------------------------------------------
    
     public static ArrayList<Order> retrieveCustomerOrder()throws SQLException
    {
         ArrayList<Order> orders=new ArrayList<Order>();
         
         con=dbConnection();
         
         try{
      pst=con.prepareStatement("select o.om_id,c.c_name,o.om_date,o.om_time from order_main o,customer c where o.c_id=c.c_id and o.om_id=(select max(om_id)from order_main)");
            
            System.out.println("select o.om_id,c.c_name,o.om_date,o.om_time from order_main o,customer c where o.c_id=c.c_id and o.om_id=(select max(om_id)from order_main);");
                     
       
            rs=pst.executeQuery();                
            while(rs.next()){                
                 Order ord=new Order();
                 System.out.println("hello--------------rs.... order main-----------------------------");
                 ord.setOmid(rs.getInt(1));
                 ord.setCname(rs.getString(2));
                 ord.setOmdate(rs.getString(3));
                 ord.setOmtime(rs.getString(4));
                 orders.add(ord);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
           finally{
    	  con.close();
      }
        System.out.println("hello--------------inside order main-----------------------------");
        return orders;
         
    }
    // --------------------------------END----------------------------------------------------------
     //--------------------------------START---------------------------------------------------------
     
      public static ArrayList<Order> retrieveItems(){
          
           ArrayList<Order> orders=new ArrayList<Order>();
       
               
         
         try{
              con=dbConnection();
            pst=con.prepareStatement("select ITEM_ID,ITEM_NAME from ITEM");
            
            System.out.println("select ITEM_ID,ITEM_NAME from ITEM");
            
            rs=pst.executeQuery();
            
            while(rs.next()){
               Order ord=new Order();
               
               ord.setItemid(rs.getInt(1));
               ord.setItemname(rs.getString(2));
               
               orders.add(ord);
            }
         }
         catch(SQLException e){
              e.printStackTrace();
         }
         
         
         return orders;
     }

     
     //--------------------------------END-----------------------------------------------------------
      
      //--------------------------------START--------------------------------------------------------
      
      public static boolean insertOrderSub(Order order)throws SQLException{
     
         boolean flag=false; 
         con=dbConnection();
         
         try
         {
             System.out.println("-------om_id-----item id-------"+order.getOmid()+""+order.getItemid());
              pst=con.prepareStatement("insert into ORDER_SUB_ITEMS(OM_ID,ITEM_ID,QUANTITY,PRICE)values(?,?,?,?)");
              
              System.out.println("insert into ORDER_SUB_ITEMS(OM_ID,ITEM_ID,QUANTITY,PRICE)"
                      + "values("+order.getOmid()+","+order.getItemid()+","
                      + ""+order.getOsquantity()+","+order.getOsprice());
              
             
              pst.setInt(1,order.getOmid());
              pst.setInt(2,order.getItemid());
              pst.setFloat(3,order.getOsquantity());
              pst.setFloat(4,order.getOsprice());
              
              pst.executeUpdate();
              
              //-----------------------------END PST1---------
              
              pst2=con.prepareStatement("insert into D_ORDER_SUB_ITEMS(D_OM_ID,D_ITEM_ID,D_QUANTITY,D_PRICE)values(?,?,?,?)");
              
              System.out.println("insert into D_ORDER_SUB_ITEMS(D_OM_ID,D_ITEM_ID,D_QUANTITY,D_PRICE)values(?,?,?,?)");
              
              
              pst2.setInt(1,order.getOmid());
              pst2.setInt(2,order.getItemid());
              pst2.setFloat(3,order.getOsquantity());
              pst2.setFloat(4,order.getOsprice());
              
              pst2.executeUpdate();
                
              flag=true;
              
         }
         catch(SQLException e)
         {
             e.printStackTrace();
         }
         
          finally{
    	  con.close();
         }
         return flag;
      
      }
      
      //---------------------------------END----------------------------------------------------------
      
      //--------------------------------STATRT--------------------------------------------------------
      
      public static boolean truncateInvoice()throws SQLException{
          
         boolean flag=false; 
         con=dbConnection();
         
         try{
             
             pst=con.prepareStatement("truncate table dummy_order_sub_items");
             System.out.println("truncate table dummy_order_sub_items");
              pst.executeUpdate();
             
         }
         catch(SQLException e)
         {
             e.printStackTrace();
         }
         finally{
    	  con.close();
         }
         
         return flag;
      }
      
      
      //--------------------------------END------------------------------------------------------------
      
      //--------------------------------START-----------------------------------------------------------
      
  /*    public static ArrayList<Order> retrieveOrderSubDetailes()throws SQLException{
          
          ArrayList<Order> orders=new ArrayList<Order>();
          
          con=dbConnection();
          try{
              
             pst=con.prepareStatement("select ");
              
          }
          catch(SQLException e)
          {
              e.printStackTrace();
          }
      }*/
      
      //----------------------------------END-----------------------------------------------------------
      
      //-------------------------------------START-----------------------------------------------
      public static int retOmid()throws SQLException{
          
            con=dbConnection();
            int omid=0;
          try{
              
             pst=con.prepareStatement("select max(om_id) from order_main");
             
              System.out.println("select max(om_id) from order_main");
              rs=pst.executeQuery();
              
              while(rs.next()){
                 omid=rs.getInt(1);
              }
          
          }
          catch(SQLException e)
          {
              e.printStackTrace();
          }
          finally{
              con.close();
          }
          return omid;
          
      }
      //------------------------------------------END----------------------------------
      
      public static void insertOrderSubItem(Order order)throws SQLException{
         boolean flag=false; 
         con=dbConnection(); 
        
         try
         {
             int iid=order.getItemid();
             float iprice=retItemPrice(iid);
             
             float total=iprice*order.getOsquantity();
             
              pst=con.prepareStatement("insert into ORDER_SUB_ITEMS(OM_ID,ITEM_ID,QUANTITY,PRICE)values(?,?,?,?)");
              
              System.out.println("insert into ORDER_SUB_ITEMS(OM_ID,ITEM_ID,QUANTITY,PRICE)values(?,?,?,?)");
              
              pst.setInt(1,order.getOmid());
              
              pst.setInt(2,order.getItemid());
              
              pst.setFloat(3, order.getOsquantity());
              
              pst.setFloat(4, total);
              
              pst.executeUpdate();
              //--------------------------------------------pst End
              pst2=con.prepareStatement("insert into D_ORDER_SUB_ITEMS(D_OM_ID,D_ITEM_ID,D_QUANTITY,D_PRICE)values(?,?,?,?)");
              
              System.out.println("insert into D_ORDER_SUB_ITEMS(D_OM_ID,D_ITEM_ID,D_QUANTITY,D_PRICE)values(?,?,?,?)");
              
              pst2.setInt(1,order.getOmid());
              
              pst2.setInt(2,order.getItemid());
              
              pst2.setFloat(3, order.getOsquantity());
              
              pst2.setFloat(4, total);
              
              pst2.executeUpdate();
              
                
              flag=true;
              
         }
         catch(SQLException e){
             
             e.printStackTrace();
         }
         
             
         
     }  
     //---------------------------------------END--------------------------------------
         
         public static float retItemPrice(int iid) throws SQLException{
             con=dbConnection();
            float pitem=0.0f;
          try{
              
             pst=con.prepareStatement("select ITEM_PRICE from item where ITEM_ID="+iid+"");
             
              System.out.println("select ITEM_PRICE from item where ITEM_ID="+iid+"");
              rs=pst.executeQuery();
              
              while(rs.next()){
                 pitem=rs.getFloat(1);
              }
          
          }
          catch(SQLException e)
          {
              e.printStackTrace();
          }
          finally{
              con.close();
          }
          return pitem;
         }
     //-----------------------------------------End  
         
           public static ArrayList<Order> retLastOrder()throws SQLException{
		ArrayList<Order> order=new ArrayList<Order>();
		con=dbConnection();
			    	            
		try{
			//pst=con.prepareStatement(" SELECT * FROM order_main ORDER BY om_id DESC LIMIT 1");
			/*pst=con.prepareStatement("SELECT o.om_id,c.c_name,o.om_date,o.om_time FROM "
                                + "customer c,order_main o WHERE c.c_id = o.c_id and "
                                + "o.om_id = (select max(om_id) from order_main o where o.c_id = c.c_id)");
			  	                        
			               System.out.println("SELECT o.om_id,c.c_name,o.om_date,o.om_time FROM "
                                + "customer c,order_main o WHERE c.c_id = o.c_id and "
                                + "o.om_id = (select max(om_id) from order_main o where o.c_id = c.c_id)");
                         */
                        pst=con.prepareStatement("SELECT o.om_id,c.c_name,o.om_date,o.om_time FROM "
                                + "customer c,order_main o WHERE c.c_id = o.c_id and "
                                + "o.om_id = (select max(om_id) from order_main)");
			  	                        
			               System.out.println("SELECT o.om_id,c.c_name,o.om_date,o.om_time FROM "
                                + "customer c,order_main o WHERE c.c_id = o.c_id and "
                                + "o.om_id = (select max(om_id) from order_main)");
                        
			    	               rs=pst.executeQuery();                
			    	               while(rs.next()){                
			    	                    Order invoice=new Order();
			    	                    invoice.setOmid(rs.getInt(1));
			    	                    invoice.setCname(rs.getString(2));		    	                   	
                                                    invoice.setOmdate(rs.getString(3));
                                                    invoice.setOmtime(rs.getString(4));
			    	   	         order.add(invoice);
			    	               }
			    	           }
			    	           catch(SQLException e){
			    	               e.printStackTrace();
			    	           }
			    	              finally{
			    	       	  con.close();
			    	         }
			    	       
			    	           return order;
			    	            
			    	       }
             //--------------------------------END---------------------------------
         
         
         //--------------------------------START---------------------------------
             
             
              public static float getPrice(Order orderb)throws SQLException{
                   con=dbConnection(); 
                    float _price=0.0f;
                    try{
                            pst=con.prepareStatement( "select item_price from item where item_id=?");  
                            pst.setInt(1,orderb.getItemid());
                            rs=pst.executeQuery();
                            while(rs.next()){
                                _price=rs.getFloat(1);
                            }
                         }
			 catch(SQLException sqlexception){
			            sqlexception.printStackTrace();
			 }  
			 
			  
			return _price; 
                        
                    }
           
            
             //-----------------------------END----------------------------------
             
             //--------------------------------START---------------------------------

             public static void addInvoice(Order orderb) throws SQLException{
			        con=dbConnection(); 
			       
			        try{  
			        	float _price=getPrice(orderb);
                                        float _qty=orderb.getOsquantity();
                                        float _total=_price*_qty;

			        	pst=con.prepareStatement( "insert into  order_sub_items(om_id,item_id,"
                                        + "osi_quantity,osi_price,osi_total) values (?,?,?,?,?)");  
			      	                          System.out.println("insert into  order_sub_items(om_id,item_id,"
                                        + "osi_quantity,osi_price,osi_total) values (?,?,?,?,?)");   

                                        pst.setInt(1,orderb.getOmid());
                                        pst.setInt(2,orderb.getItemid());
                                        pst.setFloat(3,_qty);
                                        pst.setFloat(4,_price);
                                        pst.setFloat(5,_total);

                                        pst.executeUpdate();  
                                     
                                     
                                     ps=con.prepareStatement( "insert into  dummy_order_sub_items(om_id,item_id,"
                                        + "quantity,price,total) values (?,?,?,?,?)");  
			      	  
                                    System.out.println("insert into  dummy_order_sub_items(om_id,item_id,"
                                        + "quantity,price,total) values (?,?,?,?,?)");  
                                        ps.setInt(1,orderb.getOmid());
                                        ps.setInt(2,orderb.getItemid());
                                        ps.setFloat(3,_qty);
                                        ps.setFloat(4,_price);
                                        ps.setFloat(5,_total);

                                       

                                        ps.executeUpdate();  
			            
			              
			        }
			        catch(SQLException sqlexception){
			            sqlexception.printStackTrace();
			        }  
			        finally{
			            con.close();
			        }
			  
			
			  
			    }  
             //---------------------------------END-----------------------------  
           
             public static ArrayList<Order> retLastOrderItems()throws SQLException{
		ArrayList<Order> order=new ArrayList<Order>();
              
            
             
              con=dbConnection();
			    	            
			    	             try{
			    	               pst=con.prepareStatement("select d.item_id,i.item_name,d.quantity,"
                                                       + "d.price,d.total  from item i, "
                                                       + "dummy_order_sub_items d "
                                                       + "where d.item_id=i.item_id");
                                               
			    	              System.out.println("select d.item_id,i.item_name,d.quantity,"
                                                       + "d.price,d.total  from item i, "
                                                       + "dummy_order_sub_items d "
                                                       + "where d.item_id=i.item_id");
			    	                        
			    	          
			    	               rs=pst.executeQuery();                
			    	               while(rs.next()){                
			    	                    Order invoice=new Order();
                                                    
			    	                    invoice.setItemid(rs.getInt(1));
			    	                    invoice.setItemname(rs.getString(2));
                                                    invoice.setOsquantity(rs.getFloat(3));
                                                    invoice.setOsprice(rs.getFloat(4)); 
                                                    invoice.setTotal(rs.getFloat(5));        
			    	                  
			    	   	         order.add(invoice);
			    	               }
			    	           }
			    	           catch(SQLException e){
			    	               e.printStackTrace();
			    	           }
			    	              finally{
			    	       	  con.close();
			    	         }
			    	       
			    	           return order;
			    	            
			    	       }
             //--------------------------------END---------------------------------
             public static float retTotal(int omids)throws SQLException{
                 con=dbConnection();
                 float _total=0.0f;
                  try{
                      pst=con.prepareStatement("SELECT SUM(osi_total)FROM ORDER_SUB_ITEMS where om_id=?");
                      System.out.println("SELECT SUM(osi_total)FROM ORDER_SUB_ITEMS where om_id=?");
                      pst.setInt(1, omids);
                       rs=pst.executeQuery(); 
                       while(rs.next()){
                           _total=rs.getFloat(1);
                           System.out.println("in dao-=----total"+_total);
                       }
                   }
		   catch(SQLException e){
			   e.printStackTrace();
		   }
		   finally{
			    con.close();
		    }
		    return _total;
			    	            
        }
          //--------------------------------END---------------------------------     
            public static String retStatus(int omids)throws SQLException{
                 con=dbConnection();
                String _status="Not a Valid ID";
               // String _status=null;
                  try{
                      pst=con.prepareStatement("SELECT os_status from order_status where om_id=?");
                      System.out.println("SELECT os_status from order_status where om_id=?");
                      pst.setInt(1, omids);
                       rs=pst.executeQuery(); 
                       while(rs.next()){
                           _status=rs.getString(1);
                           System.out.println("in dao-=----_status"+_status);
                       }
                   }
		   catch(SQLException e){
			   e.printStackTrace();
		   }
		   finally{
			    con.close();
		    }
		    return _status;
			    	            
        }
          //--------------------------------END---------------------------------  
       
            
         //-----------------------------START---------------------------------------
         public static boolean updateOrderStatus(Order order)throws SQLException{
         boolean flag=false; 
         con=dbConnection(); 
        
         try{
            
             
              pst=con.prepareStatement("update ORDER_STATUS set os_status=?,OS_DATE=? where OM_ID=?");              
              System.out.println("update ORDER_STATUS set os_status=?,OS_DATE=? where OM_ID=?");              
              pst.setString(1,order.getOmstatus());
              pst.setString(2,order.getOmdate());              
              pst.setInt(3, order.getOmid());
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
        //---------------------------------------END--------------------------------------      
         
      //--------------------------------START---------------------------------
           
           public static ArrayList<Order> reportOrderDetails(Order orders)throws SQLException{
		ArrayList<Order> order=new ArrayList<Order>();
              
		con=dbConnection();
			    	            
		try{
			
         pst=con.prepareStatement("SELECT o.om_id,c.c_name,o.om_date,o.om_time,"
                  + "(SELECT SUM(osi_total)FROM ORDER_SUB_ITEMS s where o.om_id=s.om_id) as total "
                  + "from customer c,order_main o WHERE c.c_id = o.c_id "
                  + "and o.om_date between ? and ? order by o.om_date desc");
			  	                        
		System.out.println("SELECT o.om_id,c.c_name,o.om_date,o.om_time,"
                  + "(SELECT SUM(osi_total)FROM ORDER_SUB_ITEMS s where o.om_id=s.om_id) as total "
                  + "from customer c,order_main o WHERE c.c_id = o.c_id "
                  + "and o.om_date between ? and ? order by o.om_date desc");
               
                    pst.setString(1,orders.getOfdate());
                    System.out.println(""+orders.getOfdate());
                    pst.setString(2,orders.getOtodate());              
             
			    	               rs=pst.executeQuery();                
			    	               while(rs.next()){                
			    	                    Order invoice=new Order();
			    	                    invoice.setOmid(rs.getInt(1));
			    	                    invoice.setCname(rs.getString(2));		    	                   	
                                                    invoice.setOmdate(rs.getString(3));
                                                    invoice.setOmtime(rs.getString(4));
                                                    invoice.setTotal(rs.getFloat(5));
			    	   	         order.add(invoice);
			    	               }
			    	           }
			    	           catch(SQLException e){
			    	               e.printStackTrace();
			    	           }
			    	              finally{
			    	       	  con.close();
			    	         }
			    	       
			    	           return order;
			    	            
			    	       }
             //--------------------------------END---------------------------------
         
         //-----------------------------------START--------------------------------------  
           
           public static boolean deleteOrder(Order order)throws SQLException{//Step 6:  function here
               boolean flag=false; 
               con=dbConnection(); 
             
                try{
                        ps1=con.prepareStatement("delete from dummy_order_sub_items where om_id=?");
                	System.out.println("delete from dummy_order_sub_items where om_id=?");
                	ps1.setInt(1,order.getOmid());
          
                	ps1.executeUpdate();
                	ps=con.prepareStatement("delete from order_sub_items where om_id=?");
                	System.out.println("delete from order_sub_items where om_id=?");
                	ps.setInt(1,order.getOmid());
          
                	ps.executeUpdate();
                    pst2=con.prepareStatement("delete from order_status where om_id=?");
                      System.out.println("delete from order_status where om_id=?");
                      pst2.setInt(1,order.getOmid());
                      pst2.executeUpdate();
                       pst3=con.prepareStatement("delete from bill where om_id=?");
                      System.out.println("delete from bill where om_id=?");
                      pst3.setInt(1,order.getOmid());
                      pst3.executeUpdate();
                    pst=con.prepareStatement("delete from order_main where om_id=?");
                    
                    System.out.println("delete from order_main where om_id=?");
                             
                   
                       pst.setInt(1,order.getOmid());//Step 7: calling getter() from getter/setter class
                       
                  
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
           
           public static boolean deleteOrderItem(int id)throws SQLException{//Step 6:  function here
               boolean flag=false; 
               con=dbConnection(); 
             
                try{
                	pst=con.prepareStatement("delete from order_sub_items where osi_id=?");
                	
                	pst.setInt(1,id);
          
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
         //-----------------------------START---------------------------------------
           public static boolean updateOrderMain(Order order)throws SQLException{
           boolean flag=false; 
           con=dbConnection(); 
          
           try{
              
               
                pst=con.prepareStatement("update ORDER_MAIN set C_ID=?,OM_DATE=?where OM_ID=?");              
                System.out.println("update ORDER_MAIN set C_ID=?,OM_DATE=? where OM_ID=?");              
                pst.setInt(1,order.getCid());
                pst.setString(2,order.getOmdate());
                pst.setInt(3, order.getOmid());
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
   //---------------------------------------END--------------------------------------      
           //-----------------------------START---------------------------------------
           public static boolean updateOrderItem(Order order)throws SQLException{
           boolean flag=false; 
           con=dbConnection(); 
          
           try{
              
               System.out.println("2");
                pst=con.prepareStatement("update ORDER_SUB_ITEMS set OSI_QUANTITY=?,OSI_PRICE=?,OSI_TOTAL=? where OSI_ID=?");              
                System.out.println("update ORDER_SUB_ITEMS set OSI_QUANTITY=?,OSI_PRICE=? and OSI_TOTAL=? where OSI_ID=?");              
                pst.setFloat(1,order.getOsquantity());
                pst.setFloat(2,order.getOsprice());
                pst.setFloat(3,order.getTotal());
                pst.setInt(4, order.getOsid());
                System.out.println("3");
                pst.executeUpdate();
                System.out.println("4");
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
   //---------------------------------------END--------------------------------------      
           
         
           public static ArrayList<Order> retOrderItems(Order order)throws SQLException{
       		ArrayList<Order> orders=new ArrayList<Order>();
                     
                   
                    
                     con=dbConnection();
       			    	            
       			    	             try{
       			    	               pst=con.prepareStatement("select d.item_id,i.item_name,d.osi_id,d.osi_quantity,"
                                                              + "d.osi_price,d.osi_total  from item i, "
                                                              + "order_sub_items d "
                                                              + "where d.item_id=i.item_id and d.om_id=?");
       			    	               pst.setInt(1, order.getOmid());
                                                      
       			    	              System.out.println("select d.item_id,i.item_name,d.osi_id,d.osi_quantity,"
                                                              + "d.osi_price,d.osi_total  from item i, "
                                                              + "order_sub_items d "
                                                              + "where d.item_id=i.item_id and d.om_id="+order.getOmid());
       			    	                        
       			    	          
       			    	               rs=pst.executeQuery();                
       			    	               while(rs.next()){                
       			    	                    Order invoice=new Order();
                                                           
                                                        invoice.setItemid(rs.getInt(1));
                                                        invoice.setItemname(rs.getString(2));
                                                        invoice.setOsid(rs.getInt(3));
                                                        invoice.setOsquantity(rs.getFloat(4));
                                                        invoice.setOsprice(rs.getFloat(5)); 
                                                        invoice.setTotal(rs.getFloat(6));        
       			    	                  
                                                         orders.add(invoice);
       			    	               }
       			    	           }
       			    	           catch(SQLException e){
       			    	               e.printStackTrace();
       			    	           }
       			    	              finally{
       			    	       	  con.close();
       			    	         }
       			    	       
       			    	           return orders;
       			    	            
       			    	       }
                    //--------------------------------END---------------------------------  
           public static Order retOrderItem(int id)throws SQLException{
       		Order order=new Order();
                     
                   
                    
                     con=dbConnection();
       			    	            
       			    	             try{
       			    	               pst=con.prepareStatement("select d.item_id,i.item_name,d.osi_id,d.osi_quantity,"
                                                              + "d.osi_price,d.osi_total  from item i, "
                                                              + "order_sub_items d "
                                                              + "where d.item_id=i.item_id and d.osi_id=?");
       			    	               pst.setInt(1, id);
                                                      
       			    	              System.out.println("select d.item_id,i.item_name,d.osi_id,d.osi_quantity,"
                                                              + "d.osi_price,d.osi_total  from item i, "
                                                              + "order_sub_items d "
                                                              + "where d.item_id=i.item_id and d.osi_id="+id);
       			    	                        
       			    	          
       			    	               rs=pst.executeQuery();                
       			    	               while(rs.next()){                
       			    	                   
                                                           
       			    	                   order.setItemid(rs.getInt(1));
       			    	                    order.setItemname(rs.getString(2));
                                                    order.setOsid(rs.getInt(3));
                                                           order.setOsquantity(rs.getFloat(4));
                                                           order.setOsprice(rs.getFloat(5)); 
                                                           order.setTotal(rs.getFloat(6));        
       			    	                  
       			    	   	        
       			    	               }
       			    	           }
       			    	           catch(SQLException e){
       			    	               e.printStackTrace();
       			    	           }
       			    	              finally{
       			    	       	  con.close();
       			    	         }
       			    	       
       			    	           return order;
       			    	            
       			    	       }
                    //--------------------------------END---------------------------------  
         
         
 public static int retCustid(String name)throws SQLException
    {
         int id=0; 
         
         con=dbConnection();
         
         try{
            pst=con.prepareStatement("select C_ID from customer where C_NAME=?");
            pst.setString(1, name);
            System.out.println("select C_ID from customer where C_NAME="+name);
                     
       
            rs=pst.executeQuery();                
            while(rs.next()){                
                 
                 id=rs.getInt(1);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
           finally{
    	  con.close();
      }
        System.out.println("hello-------------------------------------------");
        return id;
         
    }
    //---------------------------END-------------------------------------
         
       
         
        //-------------------------------START---------------------------------------------------
     
      public static ArrayList<Order> retCustomerOrders()throws SQLException
     {
          ArrayList<Order> orders=new ArrayList<Order>();
          
          con=dbConnection();
          
          try{
       pst=con.prepareStatement("select o.om_id,c.c_name,o.om_date,o.om_time from order_main o,customer c where o.c_id=c.c_id ");
             
             System.out.println("select o.om_id,c.c_name,o.om_date,o.om_time from order_main o,customer c where o.c_id=c.c_id ");
                      
        
             rs=pst.executeQuery();                
             while(rs.next()){                
                  Order ord=new Order();
                  System.out.println("hello--------------rs.... order main-----------------------------");
                  ord.setOmid(rs.getInt(1));
                  ord.setCname(rs.getString(2));
                  ord.setOmdate(rs.getString(3));
                  ord.setOmtime(rs.getString(4));
                  orders.add(ord);
             }
         }
         catch(SQLException e){
             e.printStackTrace();
         }
            finally{
     	  con.close();
       }
         System.out.println("hello--------------inside order main-----------------------------");
         return orders;
          
     }
     // --------------------------------END---------------------------------------------------------- 
        
       //-------------------------------START---------------------------------------------------
      
      public static Order retCustomerOrder(int id)throws SQLException
     {
          Order ord=new Order();
          
          con=dbConnection();
          
          try{
       pst=con.prepareStatement("select o.om_id,c.c_name,o.om_date,o.om_time from order_main o,customer c where o.c_id=c.c_id and o.om_id=?");
            pst.setInt(1, id); 
             System.out.println("select o.om_id,c.c_name,o.om_date,o.om_time from order_main o,customer c where o.c_id=c.c_id and o.om_id="+id);
                      
        
             rs=pst.executeQuery();                
             while(rs.next()){                
                  System.out.println("hello--------------rs.... order main-----------------------------");
                  ord.setOmid(rs.getInt(1));
                  ord.setCname(rs.getString(2));
                  ord.setOmdate(rs.getString(3));
                  ord.setOmtime(rs.getString(4));
                  
             }
         }
         catch(SQLException e){
             e.printStackTrace();
         }
            finally{
     	  con.close();
       }
         System.out.println("hello--------------inside order main-----------------------------");
         return ord;
          
     }
     // --------------------------------END----------------------------------------------------------
      
      
     //--------------------------------START---------------------------------
           
           public static ArrayList<Order> reportOrderMainDetailsMore(int oid)throws SQLException{
		ArrayList<Order> order=new ArrayList<Order>();
              
		con=dbConnection();
			    	            
		try{
			
         pst=con.prepareStatement("SELECT o.om_id,c.c_name,o.om_date,o.om_time from "
                 + "customer c, order_main o  where o.om_id="+oid+" and o.c_id=c.c_id");
			  	                        
		System.out.println("SELECT o.om_id,c.c_name,o.om_date,o.om_time from "
                 + "customer c, order_main o  where o.om_id="+oid+" and o.c_id=c.c_id");
               
                               
             
			    	               rs=pst.executeQuery();                
			    	               while(rs.next()){                
			    	                    Order invoice=new Order();
			    	                    invoice.setOmid(rs.getInt(1));
			    	                    invoice.setCname(rs.getString(2));		    	                   	
                                                    invoice.setOmdate(rs.getString(3));
                                                    invoice.setOmtime(rs.getString(4));
                                                   
			    	   	         order.add(invoice);
			    	               }
			    	           }
			    	           catch(SQLException e){
			    	               e.printStackTrace();
			    	           }
			    	              finally{
			    	       	  con.close();
			    	         }
			    	       
			    	           return order;
			    	            
			    	       }
             //--------------------------------END--------------------------------- 
      
      //--------------------------------START---------------------------------
           
           public static ArrayList<Order> reportOrderSubDetailsMore(int oid)throws SQLException{
		ArrayList<Order> order=new ArrayList<Order>();
              
		con=dbConnection();
			    	            
		try{
			
         pst=con.prepareStatement("SELECT i.item_id,it.item_name,i.osi_quantity,"
                 + "i.osi_price,i.osi_total from order_sub_items i , "
                 + "item it where i.om_id="+oid+" and i.item_id=it.item_id");
			  	                        
		System.out.println("SELECT i.item_id,it.item_name,i.osi_quantity,"
                 + "i.osi_price,i.osi_total from order_sub_items i , "
                 + "item it where i.om_id="+oid+" and i.item_id=it.item_id");
               
                               
             
			    	               rs=pst.executeQuery();                
			    	               while(rs.next()){                
			    	                    Order invoice=new Order();
			    	                    invoice.setItemid(rs.getInt(1));
			    	                    invoice.setItemname(rs.getString(2));		    	                   	
                                                    invoice.setOsquantity(rs.getFloat(3));
                                                    invoice.setOsprice(rs.getFloat(4));
                                                    invoice.setTotal(rs.getFloat(5));
                                                   
			    	   	         order.add(invoice);
			    	               }
			    	           }
			    	           catch(SQLException e){
			    	               e.printStackTrace();
			    	           }
			    	              finally{
			    	       	  con.close();
			    	         }
			    	       
			    	           return order;
			    	            
			    	       }
             //--------------------------------END--------------------------------- 
      
       public static float reportOrderSubDetailsMoreGandTotal(int oid)throws SQLException{ 
            float gandTotal=0.0f;
            con=dbConnection();

                      try{
      
                             pst=con.prepareStatement("select sum(osi_total) from ORDER_SUB_ITEMS where om_id="+oid+"");
			  	                        
                              System.out.println("select sum(osi_total) from ORDER_SUB_ITEMS where om_id="+oid+"");
                                rs=pst.executeQuery();                
			    	while(rs.next()){ 
                                    gandTotal=rs.getFloat(1);
                                }         
                            }
			     catch(SQLException e){
			    	    e.printStackTrace();
			    }
			    finally{
			    	con.close();
			    }
			    	       
			    return gandTotal;
			    	            
	}
             //--------------------------------END--------------------------------- 
      
      
      //--------------------------------START---------------------------------
           
           public static ArrayList<Order> lastOrderMainDetails()throws SQLException{
		ArrayList<Order> order=new ArrayList<Order>();
              
		con=dbConnection();
			    	            
		try{
			
         pst=con.prepareStatement("SELECT o.om_id,c.c_name,o.om_date,o.om_time from customer c, order_main o "
                 + " where o.om_id=(select max(om_id) from order_main) and o.c_id=c.c_id");
			  	                        
		System.out.println("SELECT o.om_id,c.c_name,o.om_date,o.om_time from customer c, order_main o "
                 + " where o.om_id=(select max(om_id) from order_main) and o.c_id=c.c_id");
               
                               
             
			    	               rs=pst.executeQuery();                
			    	               while(rs.next()){                
			    	                    Order invoice=new Order();
			    	                    invoice.setOmid(rs.getInt(1));
			    	                    invoice.setCname(rs.getString(2));		    	                   	
                                                    invoice.setOmdate(rs.getString(3));
                                                    invoice.setOmtime(rs.getString(4));
                                                   
			    	   	         order.add(invoice);
			    	               }
			    	           }
			    	           catch(SQLException e){
			    	               e.printStackTrace();
			    	           }
			    	              finally{
			    	       	  con.close();
			    	         }
			    	       
			    	           return order;
			    	            
			    	       }
             //--------------------------------END--------------------------------- 
      
      
         //--------------------------------START---------------------------------
           
           public static ArrayList<Order> lastOrderSubDetails(int oid)throws SQLException{
		ArrayList<Order> order=new ArrayList<Order>();
              
		con=dbConnection();
			    	            
		try{
			
         pst=con.prepareStatement("SELECT i.item_id,it.item_name,i.osi_quantity,"
                 + "i.osi_price,i.osi_total from order_sub_items i , "
                 + "item it where i.om_id="+oid+" and i.item_id=it.item_id");
			  	                        
		System.out.println("SELECT i.item_id,it.item_name,i.osi_quantity,"
                 + "i.osi_price,i.osi_total from order_sub_items i , "
                 + "item it where i.om_id="+oid+" and i.item_id=it.item_id");
               
                               
             
			    	               rs=pst.executeQuery();                
			    	               while(rs.next()){                
			    	                    Order invoice=new Order();
			    	                    invoice.setItemid(rs.getInt(1));
			    	                    invoice.setItemname(rs.getString(2));		    	                   	
                                                    invoice.setOsquantity(rs.getFloat(3));
                                                    invoice.setOsprice(rs.getFloat(4));
                                                    invoice.setTotal(rs.getFloat(5));
                                                   
			    	   	         order.add(invoice);
			    	               }
			    	           }
			    	           catch(SQLException e){
			    	               e.printStackTrace();
			    	           }
			    	              finally{
			    	       	  con.close();
			    	         }
			    	       
			    	           return order;
			    	            
			    	       }
             //--------------------------------END---------------------------------   
           
            public static float lastOrderSubDetailsGandTotal(int oid)throws SQLException{ 
            float gandTotal=0.0f;
            con=dbConnection();

                      try{
      
                             pst=con.prepareStatement("select sum(osi_total) from ORDER_SUB_ITEMS where om_id="+oid+"");
			  	                        
                              System.out.println("select sum(osi_total) from ORDER_SUB_ITEMS where om_id="+oid+"");
                                rs=pst.executeQuery();                
			    	while(rs.next()){ 
                                    gandTotal=rs.getFloat(1);
                                }         
                            }
			     catch(SQLException e){
			    	    e.printStackTrace();
			    }
			    finally{
			    	con.close();
			    }
			    	       
			    return gandTotal;
			    	            
	}
             //--------------------------------END--------------------------------- 
           
     }  
   
            
            
            
            
            
            
            
            
            
            
            
            
            
            

        
    
         
         
             
    

