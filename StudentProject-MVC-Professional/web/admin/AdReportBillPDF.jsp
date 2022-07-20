<%@ page language="java" import="java.util.ArrayList,
com.laundrymgt.beans.Bill,
com.laundrymgt.dao.BillDAO,
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

 String fdate=(String) session.getAttribute("bfromdate");
 String tdate=(String) session.getAttribute("btodate");
 
                   
			 Bill bill=new Bill();
				
				bill.setBfdate(fdate);
				bill.setBtodate(tdate);
                                   ArrayList<Bill>bills =BillDAO.reportBillDetails(bill);

              PdfPTable table1 = new PdfPTable(2);
              table1.setWidthPercentage(100f);

                PdfPCell cell;

                cell = new PdfPCell(new Paragraph("\nBILL DETAILS \n\n",headFont));
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

            table.addCell(new Phrase("Bill ID",boldFont));
            table.addCell(new Phrase("Order ID",boldFont));
			table.addCell(new Phrase("Paid Date",boldFont));
            table.addCell(new Phrase("Paid Amount",boldFont));
			
			

     
			 
				for(Bill bilz : bills){
				 table.addCell(new Phrase(String.valueOf(bilz.getBid()),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11))); 
				
				 table.addCell(new Phrase(String.valueOf(bilz.getOmid()),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11))); 
				 
				 table.addCell(new Phrase(bilz.getBdate(),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11)));
				 
				 table.addCell(new Phrase(String.valueOf(bilz.getPaid()),FontFactory.getFont(FontFactory.TIMES_ROMAN, 11))); 
				 
				 

             
           
            
            }
			 document.add(table1);
            document.add(table);
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