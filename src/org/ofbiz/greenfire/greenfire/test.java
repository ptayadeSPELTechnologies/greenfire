package org.ofbiz.greenfire.greenfire;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.entity.GenericDelegator;
import org.ofbiz.entity.GenericValue;
import org.ofbiz.service.LocalDispatcher;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

public class test {

	public static String doGet(HttpServletRequest request, HttpServletResponse response) throws IOException  {
	      // Set the response message's MIME type
	      response.setContentType("text/html;charset=UTF-8");
	      // Allocate a output writer to write the response message into the network socket
	      PrintWriter out  = response.getWriter();
	     try{

	     	String paramName = "myparam";
			String paramValue = request.getParameter(paramName);

			out.write(paramName);
			out.write(" = ");
			out.write(paramValue);
			out.write("n");
	    	 
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         out.close();  // Always close the output writer
	      }
	    return "success";
	}
	
}
