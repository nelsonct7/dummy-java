<%@ page language="java" import="java.util.ArrayList,
com.laundrymgt.beans.Order,
com.laundrymgt.dao.OrderDAO,
java.sql.*, java.util.*, java.io.*,
java.awt.Color,
java.text.SimpleDateFormat,
com.lowagie.text.Paragraph,
com.lowagie.text.Chapter,
com.lowagie.text.Font,
com.lowagie.text.List,
com.lowagie.text.Table,
com.lowagie.text.Image,
com.lowagie.text.*,
com.lowagie.text.pdf.*,
com.lowagie.text.pdf.PdfPTable,
com.lowagie.text.pdf.PdfPCell,
com.lowagie.text.pdf.PdfWriter" %>


<%

    Document document = new Document(PageSize.A4, 30, 30, 80, 50);
    try
    {
            response.setContentType("application/pdf");
            PdfWriter pdfWriter=PdfWriter.getInstance(document, response.getOutputStream());

            BaseFont bf_helv = BaseFont.createFont(BaseFont.HELVETICA, "Cp1252", false);
            BaseFont bf_times = BaseFont.createFont(BaseFont.TIMES_ROMAN, "Cp1252", false);
            BaseFont bf_courier = BaseFont.createFont(BaseFont.COURIER, "Cp1252", false);

            Font red = FontFactory.getFont(FontFactory.TIMES_ROMAN, 8,Font.BOLD, new Color(0xFF, 0x00, 0x00));

            SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
                Font fonts = FontFactory.getFont(FontFactory.TIMES_ROMAN, 12, Font.NORMAL);
                Font boldFont = FontFactory.getFont(FontFactory.TIMES_ROMAN, 11,Font.BOLD);
                Font normalFont = FontFactory.getFont(FontFactory.TIMES_ROMAN, 12,Font.NORMAL);
                Font headHeader =FontFactory.getFont(FontFactory.TIMES_ROMAN, 16,Font.BOLD);
                Font headFont = FontFactory.getFont(FontFactory.TIMES_ROMAN, 14,Font.BOLD);
                Font noteFont = FontFactory.getFont(FontFactory.TIMES_ROMAN,9,Font.NORMAL);
                String dots = "";
                String dots1 = "------------------------------------------------------------------------------------------------------------";

        HeaderFooter footer = new HeaderFooter(
                   new Phrase("Page: ", new Font(bf_times)), true);
            footer.setBorder(Rectangle.NO_BORDER);
            footer.setAlignment(Element.ALIGN_CENTER);
            document.setFooter(footer);
            

            HeaderFooter header = new HeaderFooter(
                        new Phrase("Arkay Industries Pvt Ltd ", new Font(headHeader)), false);
            header.setAlignment(Element.ALIGN_CENTER);
            document.setHeader(header);

            document.open();

 

  ArrayList<Order>orderz =OrderDAO.lastOrderMainDetails();
  int omid=0;
			
			  PdfPTable table1 = new PdfPTable(2);
              table1.setWidthPercentage(100f);

                PdfPCell cell;

                cell = new PdfPCell(new Paragraph("\nORDER DETAILS \n\n",headFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell.setBorder(0);
                cell.setColspan(2);

                table1.addCell(cell);
                
        
                cell = new PdfPCell(new Paragraph(dots,headFont));
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                cell.setBorder(0);
                cell.setColspan(2);

                table1.addCell(cell);
                     
            Table table = new Table(4);
            table.setWidth(96f);
            table.setBorderWidth(0);
            table.setBorderColor(new Color(0,0,0));
            table.setPadding(2);
            table.setSpacing(0);

            table.addCell(new Phrase("Order ID",boldFont));
            table.addCell(new Phrase("Customer Name",boldFont));
            table.addCell(new Phrase("Order Date",boldFont));
			table.addCell(new Phrase("Order Time",boldFont));
			

			 for(Order invoicezz : orderz){
				 omid=invoicezz.getOmid();
				 table.addCell(new Phrase(String.valueOf(invoicezz.getOmid()),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11))); 
				
				 table.addCell(new Phrase(invoicezz.getCname(),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11))); 

				 table.addCell(new Phrase(invoicezz.getOmdate(),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11))); 
				 table.addCell(new Phrase(invoicezz.getOmtime(),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11))); 
			
            }
			
			Table table4 = new Table(6);
            table4.setWidth(96f);
            table4.setBorderWidth(0);
            table4.setBorderColor(new Color(0,0,0));
            table4.setPadding(2);
            table4.setSpacing(0);

            table4.addCell(new Phrase("",boldFont));
			
			
			
			//------------------------second	
		 ArrayList<Order>orderzz =OrderDAO.lastOrderSubDetails(omid);
			
             
                     
            Table table2 = new Table(6);
            table2.setWidth(96f);
            table2.setBorderWidth(0);
            table2.setBorderColor(new Color(0,0,0));
            table2.setPadding(2);
            table2.setSpacing(0);

            table2.addCell(new Phrase("SI No",boldFont));
            table2.addCell(new Phrase("Item ID",boldFont));
            table2.addCell(new Phrase("Item Name",boldFont));
			table2.addCell(new Phrase("Quantity",boldFont));
			table2.addCell(new Phrase("Price",boldFont));
			table2.addCell(new Phrase("Total",boldFont));
			

			    int i=1;
   			for(Order invoicezzz : orderzz){
				 table2.addCell(new Phrase(String.valueOf(i),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11))); 
				
				 table2.addCell(new Phrase(String.valueOf(invoicezzz.getItemid()),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11))); 
				 table2.addCell(new Phrase(invoicezzz.getItemname(),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11))); 
				 table2.addCell(new Phrase(String.valueOf(invoicezzz.getOsquantity()),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11))); 
				 
				  table2.addCell(new Phrase(String.valueOf(invoicezzz.getOsprice()),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11)));
				  
				   table2.addCell(new Phrase(String.valueOf(invoicezzz.getTotal()),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11)));
				 
				 
			i++;
            }	
			
			 Table table3 = new Table(6);
            table3.setWidth(96f);
            table3.setBorderWidth(0);
            table3.setBorderColor(new Color(0,0,0));
            table3.setPadding(2);
            table3.setSpacing(0);

            table3.addCell(new Phrase("",boldFont));
            table3.addCell(new Phrase("",boldFont));
            table3.addCell(new Phrase("",boldFont));
			table3.addCell(new Phrase("",boldFont));
			table3.addCell(new Phrase("",boldFont));
			table3.addCell(new Phrase("Grand Total",boldFont));
			
		 float gTotal =OrderDAO.lastOrderSubDetailsGandTotal(omid);	
			
			 table3.addCell(new Phrase("",FontFactory.getFont(FontFactory.TIMES_ROMAN, 11))); 
				
				 table3.addCell(new Phrase("",FontFactory.getFont(FontFactory.TIMES_ROMAN, 11)));  
				  table3.addCell(new Phrase("",FontFactory.getFont(FontFactory.TIMES_ROMAN, 11)));  
				  table3.addCell(new Phrase("",FontFactory.getFont(FontFactory.TIMES_ROMAN, 11)));  
				 
				  table3.addCell(new Phrase("",FontFactory.getFont(FontFactory.TIMES_ROMAN, 11))); 
				  
				   table3.addCell(new Phrase(String.valueOf(gTotal),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11)));
			
			
			
			
				                     
 			document.add(table1);
            document.add(table);
			document.add(table4);
			document.add(table2);
			document.add(table3);
			
       }
       catch(DocumentException de)
       {
          System.err.println(de.getMessage());
       }
       catch(Exception e)
       {
            System.err.println(e.getMessage());
        }

    document.close();


%>