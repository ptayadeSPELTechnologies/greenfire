/**
@Author Priyanka Tayade
Date Created: 02/26/2016

--------
Modified on:
Purpose:
Modified by:

*/

      function loadChapter(){
          
            $.ajax({
                type: "GET",
                url: "book",
                dataType: "html",
                success: function(html){

                    $('#mybook').booklet("add", "end",  html);
                
                  },
                  error: function() {
                    //alert("An error occurred while processing XML file.");
                  }  
              }); 
            
      }
      
      function loadNavigationBar(){

        	$.ajax({
                  type: "GET",
                  url: "chapternav",
                  dataType: "html",
                  success: function(html){

                  	     document.getElementById("chapterNavBar").innerHTML=html;
                  
                    },
                    error: function() {
                      //alert("An error occurred while processing XML file.");
                    }                  
                });      		
      }

    

      function load() {

            loadChapter();      

		    loadNavigationBar();  
      } 

      window.onload = load;  

