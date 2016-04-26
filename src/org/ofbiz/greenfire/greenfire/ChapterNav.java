package org.ofbiz.greenfire.greenfire;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.entity.GenericDelegator;
import org.ofbiz.entity.GenericEntityException;
import org.ofbiz.entity.GenericValue;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class ChapterNav {
	public static String doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ParserConfigurationException, SAXException, GenericEntityException {
	      // Set the response message's MIME type
	      response.setContentType("text/html;charset=UTF-8");
	      // Allocate a output writer to write the response message into the network socket
	      
	      String path="hot-deploy/greenfire/webapp/greenfire/xml_files/";
	      PrintWriter out = response.getWriter();
	      File inputFile = new File(path+"progress.xml");
	         DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	         DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
	         Document doc = dBuilder.parse(inputFile);
	         doc.getDocumentElement().normalize();
	         System.out.println("Root element:" + doc.getDocumentElement().getNodeName());
	         String chapter_unlocked_str = doc.getElementsByTagName("Data").item(0).getTextContent();
	         
	         GenericDelegator delegator= (GenericDelegator) request.getAttribute("delegator");
	    	 
	    	 Map<?,?> field=(Map<?,?>) UtilMisc.toMap("userID","01");
	  
	    	 GenericValue values=delegator.findOne("MercytheUser",false ,field);
	    	    
	    	 //out.println("This event is working " + values.toString());
	    	 
	    	 
	
	    	 
	    	 String html="";
	    	 
	    	 int chapter_unlocked=Integer.parseInt(values.get("chaptersUnlocked").toString());
	      //int chapter_unlocked=Integer.parseInt(chapter_unlocked_str);
	 
	      // Write the response message, in an HTML page
	     
	      
	     html+= "<div class='btn-group btn-group-justified'>";
                      
	      int[] page={0,5,9,15,19,27,35,41,49,57};
	      try {	
	    	 for(int i=1;i<chapter_unlocked+1;i++){
	    		 html+="<A href='#/page/"+page[i]+"' onClick='audio()' class='btn btn-success unlocked'>Chapter "+i+"</A>";

	    		 
	    	 }
	    	 if(chapter_unlocked<8)
	    	 html+="<a href='#/page/"+page[chapter_unlocked+1]+"' onClick='audio()' class='btn btn-danger '>Question "+chapter_unlocked+"</a>";

	         out.println(html);

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         out.close();  // Always close the output writer
	      }
	    return "success";
	}
}