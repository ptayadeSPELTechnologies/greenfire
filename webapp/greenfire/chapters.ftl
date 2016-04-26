<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <link rel="stylesheet" type="text/css" href="../styles/chapter.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script> 
    <a href="#" id="chapter1" class="link">Chapter 1</a>
    <a href="#" id="chapter2" class="link">Chapter 2</a>
    <a href="#" id="chapter3" class="link">Chapter 3</a>
    <a href="#" id="chapter4" class="link">Chapter 4</a>
    <a href="#" id="chapter5" class="link">Chapter 5</a>
    <a href="#" id="chapter6" class="link">Chapter 6</a>
    <a href="#" id="chapter7" class="link">Chapter 7</a>
    <a href="#" id="chapter8" class="link">Chapter 8</a>
	</head>
	
	<body>
	     <div class="title" >       
    		<h3>Merscythe: Adventures with the Codue</h3>
    	</div>
    	<div class="audio" style="height:100;">
    	
    		<audio src="../audio/CHAPTER 1c_04.wav"  controls loop autoplay></audio>
    		
    	</div>
	<div id="dvContent" style="background-color: #e5e5ff;  
	padding: 80px 80px 80px 80px; 
	border-radius: 25px;
    padding: 20px; 

	">
	
	</div>
	
	<script>
		$(document).ready(function(){
		   // determine which chapter link has been clicked
		   /*$(".link").click(function(e) {
		     console.log("in here");
		      e.preventDefault();
	    	  e.stopPropagation();
		     //$("#dvContent").html("<ul>hi</ul>");
		        $("#dvContent").load("/greenfire/html_files/chapter1.html");
		   });*/
		     
		    $(".link").click(function(e) {
		      var linkname = $(this).attr("id");
	    	  e.preventDefault();
	    	  e.stopPropagation();
	    	  console.log("clicked");
	    	  console.log(linkname);

	          $("#dvContent").html("<ul></ul>");
               var datafile = "/greenfire/xml_files/" + linkname + ".xml";
  			  // read data from chapter#.xml
  			$.ajax({
    			  type: "GET",
    			  url: datafile,
    			  dataType: "xml",
    			  success: function(xml){
      				  var title = $(xml).find('Title').text();
      				  var data = $(xml).find('Data').text();
      				  $("<li></li>").html(title + ", " + data).appendTo("#dvContent ul");
  			      },
  			      error: function() {
    			      alert("An error occurred while processing XML file.");
  			      }
  			  }); 
  		  }); 
	  });               
	</script>
	</body>
</html>