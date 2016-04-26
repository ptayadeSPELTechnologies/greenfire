package org.ofbiz.greenfire.greenfire;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.entity.GenericDelegator;
import org.ofbiz.entity.GenericValue;

public class DatabaseQuery {

	public static String doGet(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		// Set the response message's MIME type
	      response.setContentType("text/html;charset=UTF-8");
	      // Allocate a output writer to write the response message into the network socket
	      PrintWriter out  = response.getWriter();
	  try{    
	      GenericDelegator delegator= (GenericDelegator) request.getAttribute("delegator");
	      
	      // Map<?, ?> fieldCreate=(Map<?, ?>) UtilMisc.toMap("userID","01","userName","tom","userEmail","tom@xyz.com","chaptersUnlocked","1");
		  
	     // delegator.create("MercytheUser", fieldCreate);
	    	 
	      Map<?, ?> field=(Map<?, ?>) UtilMisc.toMap("userID","01");
	  
	      GenericValue values=delegator.findOne("MercytheUser",false ,field);
	    	    
	      String html="";
	    	 
	      int chapter_unlocked=Integer.parseInt(values.get("chaptersUnlocked").toString());
	      
	      out.println("Chapter unlocked : "+chapter_unlocked);
	      
	      values.set("chaptersUnlocked", "1");
	      values.store();
	      
	      out.println("Chapter unlocked : "+Integer.parseInt(values.get("chaptersUnlocked").toString()));

		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    out.close();  // Always close the output writer
		}
		return "success";
	} 
}
