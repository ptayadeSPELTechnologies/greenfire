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

public class LoadChapter {

	public static String doGet(HttpServletRequest request, HttpServletResponse response) throws IOException  {
	      // Set the response message's MIME type
	      response.setContentType("text/html;charset=UTF-8");
	      // Allocate a output writer to write the response message into the network socket
	      PrintWriter out  = response.getWriter();
	      
	      String path="hot-deploy/greenfire/webapp/greenfire/xml_files/";
	      
	     try{

	     	String paramName = "lastPageNumber";
			String start = request.getParameter(paramName);
			int prev=Integer.parseInt(start);
	    	 
	    	 LocalDispatcher dispather=(LocalDispatcher) request.getAttribute("dispatcher");
	    	 
	    	 GenericDelegator delegator= (GenericDelegator) request.getAttribute("delegator");
	    	 
	    	 Map field=(Map) UtilMisc.toMap("userID","01");
	  
	    	 GenericValue values=delegator.findOne("MercytheUser",false ,field);
	    	    
	    	 //out.println("This event is working " + values.toString());
	    	 
	    	 
	    	 //check if the program is correct
	    	 
	    	 boolean solution=true;
	    	 
	    	 String html="";
	    	 
	    	 int chapter_unlocked=Integer.parseInt(values.get("chaptersUnlocked").toString());
	    	 
	    	 if(solution && chapter_unlocked<9){
	    		 
	    	     
	    	    	 
	    	    	 chapter_unlocked=chapter_unlocked+1;
	    	    	 String chap=""+chapter_unlocked;
	    	    	 values.set("chaptersUnlocked", chap);
	    	    	 values.store();
	    	     
		    	 
		    		
		    	 File inputFile = new File(path+"chapter"+chapter_unlocked+".xml");
		    	 DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		         DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		    	 Document  doc = dBuilder.parse(inputFile);
		    	 doc.getDocumentElement().normalize();
		         System.out.println("Root element:" + doc.getDocumentElement().getNodeName());
		         String title = doc.getElementsByTagName("Title").item(0).getTextContent();
		         NodeList nList = doc.getElementsByTagName("Data");
		         String str=nList.item(0).getTextContent();
		         String[] arr=str.split("</break>");
		         str="<div class='title2'>"+title+"";
		         
		        /* str+="<audio controls>"
	  					+"<source src='' type='audio/wav' />"
	  					+"<p>Your user agent does not support the HTML5 Audio element.</p>"+
					"</audio>"+*/
				str+="<input type='hidden' id='ch"+chapter_unlocked+"' value='"+prev+"'/></div>";
	            prev=arr.length+1+prev;
		        		 
		         for (int temp = 0; temp < arr.length; temp++) {
		        	 str+=" <div>"+
		        			 "<div class='title'>Chapter: "+chapter_unlocked+" </div><div><p>"+
		        			 arr[temp]+
		        			 "</div></div>";
		         }
		        		         		         
		         html+=str;
		                 

   	 
		   	 /*
		   	  * Code for reading the question, if all chapters are unlocked do not read the chapter
		   	  */
		   	  if(chapter_unlocked<8){
		   		 
		    	 File questionFile = new File(path+"question"+chapter_unlocked+".xml");
		         doc = dBuilder.parse(questionFile);
		         doc.getDocumentElement().normalize();
		         System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
		         
		         
		         //get title
		         title = doc.getElementsByTagName("Title").item(0).getTextContent();
		         
		         //add title to the main question title heading
		         str="";
				if(chapter_unlocked==7)
		          str="<div class='title2'>Last Question</div>";

		      	if(chapter_unlocked==3)
		          str="<div class='title2'>Third Question</div>";
		         
		         
		         str+="<div class='question'>"; //page opening div / main div
		         
		         	//Add question title to top right corner of book
		         	str+="<div class='title3'>"+title+"</div>";
		        
		         	//Add question content to page

			        
		         	str+="<div class='qtextdiv'>"+doc.getElementsByTagName("Data").item(0).getTextContent()+"</div>";
		         	//str+="<div class='white seperator'></br> </div></br>";
		         	if(chapter_unlocked==6 || chapter_unlocked==7){
		         		str+="</div><div class='question'>";
		         	}
		         	str+="<a href='tutorial"+chapter_unlocked+"' >For more help go to tutorial "+chapter_unlocked+"</a>";

		         	str+="<div class='qdiv'> "+doc.getElementsByTagName("ExpectedOutput").item(0).getTextContent()+"</div>";
		         	//str+="<div class='white seperator'></br> </div></br>";
		         	str+="<div class='qdiv'>"+doc.getElementsByTagName("Code").item(0).getTextContent()+"</div></br>";
		         	str+="<input type='hidden' id='questionPageNumber' value='"+prev+"'/>";
		         	str+="<input type='hidden' id='chapterunlock' value='"+chapter_unlocked+"'/>";
	
		        str+="</div>"; //end of page opening div
		        		
		        html+=str; //append to html
		        
		      
		         // writing question code loquacious
		   
		   	   File code = new File(path+"question_examples.xml");
			         doc = dBuilder.parse(code);
			         doc.getDocumentElement().normalize();
			         

			   String codeData=doc.getElementsByTagName("Data").item(chapter_unlocked-1).getTextContent();
			 //main page div     
		      str="<div class='editor'>";

			       // "<div class='title'>Code: "+chapter_unlocked+" </div>";  //add code title to left hand corner
		        
		    	//code for loquacious    
		    	
			    	str+="<div class='miniLoq'>"+
	               "<form>"+
	               "<table class='miniLoqTable' align='center' border='0' class='loq'>"+
	                 "<tr>"+
	                    " <th class='bar1' ><p class='logo'>Loquacious</p></th>"+
	                 "</tr>"+
	                 "<tr>"+
	                     "<td class='bar' align='center'>"+
	                       "<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' id='loquacious' cols='45' rows='12' class='locbox'>"+codeData+"</textarea>"+
	                     "</td>"+
	                 "</tr>"+
	                 "<tr>"+
	                     "<td class='bar'>"+
	                     "</br>"+
	                       "<button type='button' onclick='runit();' class='button'>Run</button> "+
	                       "<button type='button' onclick='' class='button'>Reset</button> "+
	                       "<button type='button' onclick='sayitMod()' class='button'>Say</button> "+
	                       "<button type='button' onclick='overview()' class='button'>Overview</button> "+
	                     "</td>"+
	                 "</tr>"+
	                 "<tr>"+
	                     "<td class='bar'>"+
	                       "<p id='dvContent'></p>"+
	                     "</td>"+
	                 "</tr> "+
	                 "<tr>"+
	                     "<td class='bar'>"+
	                       "<div class='message' id='status' style='overflow:scroll; height:100px;'></div> "+
	                     "</td>"+
	                 "</tr> "+
	                 "<tr >"+
	                     "<td >"+
	                       "<div id='output' style='overflow:scroll; height:100px;'>"+
	                       "</div>"+
	                     "</td>"+
	                 "</tr> "+
	                 "<tr>"+
	                     "<td>"+
	                       "<div id='mycanvas'></div> "+
	                     "</td>"+
	                 "</tr>  "+  
	                "</table>  "+ 
	               "</form> "+
	             "</div></div>";
			    	    html+=str;
		   	  }
   	 
			   	 str=  
			   "<form name= 'solution'>"+
			      "<input type=hidden id='desiredoutput' value=''/>"+
			      "<input type=hidden id='clickedLinkName' value='question"+chapter_unlocked+"'/>"+
			      "<input type=hidden id='testingOutput' value=''/>"+
			  " </form>"+
			      "<input type=hidden id='chapterunlock' value='"+chapter_unlocked+"'/>";
			   	html+=str;
			   	
			   	out.println(html);
				    	 
	    	 }
	    	 
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         out.close();  // Always close the output writer
	      }
	    return "success";
	}
	
}
