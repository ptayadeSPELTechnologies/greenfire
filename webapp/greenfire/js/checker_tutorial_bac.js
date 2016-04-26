/* ----------------------------------------------------------------------------
Copyright 2015 SPEL Technologies, Inc. All Rights Reserved.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ----------------------------------------------------------------------- */
        
/**
* This function checks a python program with the solution or output.It
* gets the output from the element for output. It then
* compares this output with the desired output and checks if they match or not.
*
* @method checkit
*/             
/* function checkit() { 
    preload();
    var prog = document.getElementById("loquacious").value;

    	
    var prog = prefix.
    Sk.configure({output:outf, read:builtinRead}); 
    (Sk.TurtleGraphics || (Sk.TurtleGraphics = {})).target = 'mycanvas';
           
     var myPromise = Sk.misceval.asyncToPromise(function() {
         return Sk.importMainWithBody("<stdin>", false, prog, true);
     }); 
           		
     //var myPromise = Sk.importMainWithBody("<stdin>", false, prog, true);
           
     myPromise.then(function(mod) {
             // speak out the output of the program
             var mypre = document.getElementById("output"); 
             //mypre.innerHTML += text; 
             spokenWord=punct(mypre.innerHTML);
             spokenWord=spokenWord.replace("\n", " , ");
            // console.log(spokenWord);
             meSpeak.speak("The program output is, "+spokenWord); 
         },
         function(err) {
             // speak out the first error in the program
             str = err.toString();
             meSpeak.speak(punct(str));
             console.log(str);
                 
             // extract the number of the line that has error
             var substr = str.match(/line \d+/); 
             //console.log(substr);
             var lineNum = substr[0].replace(/\D/g, '');      
            // console.log("This line has error " +lineNum);
                 
             // position cursor on line with error
             setCursorPosition(document.getElementById('loquacious'), lineNum);
          });
     
    var mypre = document.getElementById("output").innerHTML; 
    console.log("In function checkit: the output is");
    console.log(mypre);
    console.log("In function checkit: the desired output is");
    var desired = document.getElementById("desiredoutput").value; 
    console.log(desired);
   if (mypre === desired) {
        var result = "Congratulations! You did it. The next chapter will be unlocked.";
    }
    else {
    	var result = "Sorry, your program is incorrect. Modify it and run again.";
    }
    	
   meSpeak.speak(result);
                                    
} */

function loadAndUpdate(xml,unlockChapterNumber) {
	    var xmlDoc = xml.responseXML; 
	    
	    xmlDoc.getElementsByTagName("book")[0].childNodes[0].nodeValue=""+unlockChapterNumber;
	    alert(xmlDoc.getElementsByTagName("Data")[0].childNodes[0].nodeValue);

}

function unlockChapters(unlockChapterNumber){
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	    if (xhttp.readyState == 4 && xhttp.status == 200) {
	    	loadAndUpdate(xhttp,unlockChapterNumber);
	    }
	};
	xhttp.open("GET", "/greenfire/xml_files/progress.xml", true);
	xhttp.send();
}

function printProgConsoleOuput(){

		var no=document.getElementById("editorNumber").value;
		document.getElementById("output"+no).innerHTML=document.getElementById("output").value;
}

function checkit() { 
	console.log("In function checkit");
	//printProgConsoleOuput();
    preload();
    var userCode1 = document.getElementById("loquacious").value;
    var clickedLink = document.getElementById("clickedLinkName").value;
    //var desired = document.getElementById("desiredoutput").value; 
    //console.log(desired);
    console.log("clickedLink" +clickedLink);
    //var clickedLink = "question1";
    var userCode = userCode1.replace(/\n/g, "\n    ");
    var chapter_unlocked = 1;
    var consoleOutput;
    var clickedLink, passedCheck = true;
    var code;
    (function($){
    	consoleOutput =  $('#output').text(); //get just the text
        code = $('#loquacious').text();
    })(jQuery);


	//consoleOutput = consoleOutput.trim() ;

	if (clickedLink == "question1") {
		console.log("checking question 1");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (consoleOutput.match(/Opened \s*door/) != null) {
			if (userCode1.match(/Door\s*\(\s*\)/) == null) {
				passedCheck = false;
				console.log("Your program is incorrect. Create an object of the Door class in your program.");
				document.getElementById("status").innerHTML="Your program is incorrect. Create an object of the Door class in your program.";    

			} 
			else if (userCode1.match(/open\s*\(\s*\)/) == null) {
				passedCheck = false;
				console.log("Your program is incorrect. Use the open method of class Door in your program.");
				document.getElementById("status").innerHTML="Your program is incorrect. Use the open method of class Door in your program.";    
			}
			else {
				passedCheck = true;
				console.log("Awesome! Your program is correct. Chapter 2 will be unlocked.");
				document.getElementById("status").innerHTML="Awesome! Your program is correct. Chapter 2 will be unlocked.";    
				chapter_unlocked = 2;
				}
		}
		 else {
			passedCheck = false;
			console.log("Sorry, the output of your program is incorrect. The correct output is 'Opened door'.");
			console.log("Hint: The Door class two methods open and close for opening and closing a door, respectively.");
		}
	}
	else if (clickedLink == "question2") {
		console.log("checking question 2");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (consoleOutput  == "Hello, Ari Access granted") {
			passedCheck = true;
			console.log("Good work! Your program is correct. Chapter 3 will be unlocked.");
			document.getElementById("status").innerHTML="Good work! Your program is correct. Chapter 3 will be unlocked.";    
			chapter_unlocked = 3;
		} else {
			passedCheck = false;
			console.log("Sorry, the output of your program is incorrect. The correct output is " +"Hello, Ari");
			console.log("Access granted");
			console.log("Hint: Check the name you are entering as input to the program.");	
			var myoutput="Sorry, the output of your program is incorrect. The correct output is " +"Hello, Ari</br>";
			 myoutput+="Access granted</br>";
			 myoutput+="Hint: Check the name you are entering as input to the program.";

			document.getElementById("status").innerHTML=myoutput;    

		}
	}
     else if (clickedLink == "question3") {
		console.log("checking question 3");
		consoleOutput = "'" + consoleOutput.trim().replace(/\n/g, " ")   + "'";
		
		var prog = 
			"run_number = 1 \n" +
			"consoleOutput = " + consoleOutput.trim() +" \n" +
			"def input(var): \n" +
			"    if run_number == 1: \n" +
			"        return 'Ari'  \n" +
			"    elif run_number == 2: \n" +
			"        return 'Merscythe' \n" +
			userCode1;
			
	        console.log(prog);
	        document.getElementById("testingOutput").value = "";
	        Sk.configure({output:outf_mod3, read:builtinRead}); 
	         var myPromise = Sk.misceval.asyncToPromise(function() {
	             return Sk.importMainWithBody("<stdin>", false, prog, true);
	         }); 
	        
	        myPromise.then(function(mod) {
	         	console.log("In function then");
	            // speak out the output of the program
	            var mypre = document.getElementById("output"); 
	            mypre.innerHTML += "Testing your program"; 
	            meSpeak.speak("Testing your program"); 
	            var mypre = document.getElementById("testingOutput").value; 
	        	testoutput = mypre.trim().replace(/\n/g, " ");
	            console.log("The output of tested program is: " +testoutput);
	            if (testoutput.match(/Hello, Ari \s*Access \s*denied/)  == null) {
	            	console.log("The output is incorrect.");
	            	console.log("If Ari's name is entered, the output should say: Access denied");
	            	console.log("Check the action in the if clause");
	            	
	    		var myoutput="The output is incorrect.</br>";
	   			 myoutput+="If Ari's name is entered, the output should say: Access denied</br>";
	   			 myoutput+="Hint: Check the action in the if clause";

	   			document.getElementById("status").innerHTML=myoutput;    
	   			
	            	passedCheck = false;
	            }
	            else {
	        		var prog = 
	        			"run_number = 2 \n" +
	        			"consoleOutput = " + consoleOutput.trim() +" \n" +
	        			"def input(var): \n" +
	        			"    if run_number == 1: \n" +
	        			"        return 'Ari'  \n" +
	        			"    elif run_number == 2: \n" +
	        			"        return 'Merscythe' \n" +
	        			userCode1;
	    	         Sk.configure({output:outf_mod3, read:builtinRead}); 
	    	         document.getElementById("testingOutput").value = "";
	   	             var myPromise1 = Sk.misceval.asyncToPromise(function() {
	   	                 return Sk.importMainWithBody("<stdin>", false, prog, true);
	   	             });
	   	             myPromise1.then(function(mod) {
	   	            	 var mypre = document.getElementById("testingOutput").value; 
	   	            	 testoutput = mypre.trim().replace(/\n/g, " ");
	   	            	 console.log("The output of tested program is: " +testoutput);
	   	            	 if (testoutput.match(/Hello, Merscythe \s*Access \s*granted \s*Opened \s*door/) == null) {
	   	            		 console.log("Sorry, the output of your program is incorrect.");
	   	            		 console.log("If Ari's name is not entered, the output should say: Access granted Opened door");
	   	            		 console.log("Check the code after the else clause in your program.");
	   	            		 
	   	  	    		var myoutput="Sorry, the output of your program is incorrect.</br>";
	   	  	    		myoutput+="If Ari's name is not entered, the output should say: Access granted Opened door</br>";
	   	  	    		myoutput+="Hint: Check the code after the else clause in your program.";

	   	  	    		document.getElementById("status").innerHTML=myoutput;  
	   	  	    		
	   	            		 passedCheck = false;
	   	            	 }
	   	            	 else {
	   	            		 console.log("The output is correct");
	   	            		 console.log("Good work!! Chapter 4 will be unlocked");
	   	            		 
	 	   	  	    		var myoutput="The output is correct.</br>";
		   	  	    		myoutput+="Good work!! Chapter 4 will be unlocked";
		   	  	    		document.getElementById("status").innerHTML=myoutput;  

		   	  	    		
	   	            		 passedCheck = true;
	   	            		//unlockChapters(4);
	   	            	 }	
	   	             },  function(err) {
	   		        	console.log("Error: In function err of question 3- should not reach here; check checker.js");
	   		         }); 
	            }
	            	
                //mypre.innerHTML += text; 
	        },
	        function(err) {
	        	console.log("Error: In function err of question 3- should not reach here; check checker.js");
	         });

	}
     else if (clickedLink == "question4") {
		console.log("checking question 4");
		
		consoleOutput = "'"+consoleOutput.replace(/\n/g, " ")+"'";
		console.log("consoleOutput is" +consoleOutput); 
		//console.log("desired output is" +desired); 
		if (consoleOutput.match("Arrived at floor -3")) {
			if (userCode1.match(/GlassElevator\s*\(\s*\)/) == null) {
				passedCheck = false;
				console.log("Your program is incorrect. Create an object of the GlassElevator class in your program.");
			} 
			else if (userCode1.match(/go_to_floor\s*\(/) == null) {
				passedCheck = false;
				console.log("Your program is incorrect. Use the go_to_floor method of class GlassElevator in your program.");
			}
			else {
				passedCheck = true;
				console.log("Awesome! Your program is correct. Chapter 5 will be unlocked.");
				chapter_unlocked = 2;
				}
		}
		 else {			 
			    if (userCode1.match(/go_to_floor\s*\(/) == null) {
					passedCheck = false;
					console.log("Your program is incorrect. Hint: use the go_to_floor method of class GlassElevator in your program. This method takes the destination floor number as argument.");
				}
			    else {
			    	passedCheck = false;
			    	console.log("Sorry, the output of your program is incorrect.");
			    	console.log("Check the destination floor number in the ");
			    }
		 }
     }
     else if (clickedLink == "question5") {
 		console.log("checking question 5");
 		
 		consoleOutput = "'"+consoleOutput.replace(/\n/g, " ")+"'";
 		console.log("consoleOutput is" +consoleOutput); 
 		//console.log("desired output is" +desired); 
 		if (consoleOutput.match("The object is a UFO")) {
 			if (userCode1.match(/Telescope\s*\(\s*\)/) == null) {
 				passedCheck = false;
 				console.log("Your program is incorrect. Create an object of the Telescope class in your program.");
 			} 
 			else if (userCode1.match(/in_focus\s*\(\s*\)/) == null) {
 				passedCheck = false;
 				console.log("Your program is incorrect. Use the in_focus method of class Telescope in your program.");
 			}
 			else if (userCode1.match(/identify\s*\(\s*\)/) == null) {
 				passedCheck = false;
 				console.log("Your program is incorrect. Use the identify method of class Telescope in your program.");
 			}
 			else {
 				passedCheck = true;
 				console.log("Awesome! Your program is correct. Chapter 6 will be unlocked.");
 				chapter_unlocked = 6;
 				}
 		}
 		 else {		
 			console.log("Your program is incorrect.")
 			if (userCode1.match(/Telescope\s*\(\s*\)/) == null) {
 				passedCheck = false;
 				console.log("Create an object of the Telescope class in your program.");
 			} 
 			if (userCode1.match(/in_focus\s*\(\s*\)/) == null) {
 				passedCheck = false;
 				console.log(" Use the in_focus method of class Telescope in your program.");
 			}
 			if (userCode1.match(/identify\s*\(\s*\)/) == null) {
 				passedCheck = false;
 				console.log(" Use the identify method of class Telescope in your program.");
 			}
 		 }
      }
     else if (clickedLink == "question6") {
  		console.log("checking question 6");
  	
  		consoleOutput = "'"+consoleOutput.replace(/\n/g, " ")+"'";
  		console.log("consoleOutput is" +consoleOutput); 
  		//console.log("desired output is" +desired); 
  		if (consoleOutput.match("Ariester main entrance unlocked")) {
  			if (userCode1.match(/Ship\s*\(\s*\)/) == null) {
  				passedCheck = false;
  				console.log("Your program is incorrect. Create an object of the Ship class in your program.");
  			} 
  			else if (userCode1.match(/is_entrance_locked\s*\(\s*\)/) == null) {
  				passedCheck = false;
  				console.log("Your program is incorrect. Use the in_focus method of class Ship in your program.");
  			}
  			else if (userCode1.match(/unlock_entrance\s*\(\s*/) == null) {
  				passedCheck = false;
  				console.log("Your program is incorrect. Use the unlock_entrance method of class Ship in your program.");
  			}
  			else {
  				passedCheck = true;
  				console.log("Great work! Your program is correct. Chapter 7 will be unlocked.");
  				chapter_unlocked = 7;
  				}
  		}
  		 else {		
  			console.log("Your program is incorrect.");
  			if (userCode1.match(/Ship\s*\(\s*\)/) == null) {
  				passedCheck = false;
  				console.log("Create an object of the Ship class in your program.");
  			} 
  			if (userCode1.match(/is_entrance_locked\s*\(\s*\)/) == null) {
  				passedCheck = false;
  				console.log("Check if the entrance is locked by using is_entrance_locked method of class Ship in your program.");
  			}
  			if (userCode1.match(/unlock_entrance\s*\(\s*/) == null) {
  				passedCheck = false;
  				console.log("Use the unlock_entrance method of class Ship in your program. This method takes a code as argument. The entrance will be unlocked only if this code is equal to the ship's secret code.");
  			}
  		 }
       } 
     else if (clickedLink == "question7") {
 		console.log("checking question 7");
 		consoleOutput = "'" + consoleOutput.trim().replace(/\n/g, " ")   + "'";
 		var re = /from \s*Ufo/;
 		userCode1 = userCode1.replace(re, "#from Ufo");
 		var re = /from \s*UfoTracker/;
 		userCode1 = userCode1.replace(re, "#from UfoTracker");
 		console.log("userCode1");
 		console.log(userCode1);
 		var prog = 
 			"import math \n" +
 			"from random import randint \n" +

     		"class Ufo: \n" +
 			 "  # initializes the ID, status and position of UFO \n" +
 			 "  def __init__(self, identification, status): \n" +
 			  "      self.__id = identification \n" +
 			  "      self.__stat = status \n" +
 			  "      self.__x = 10 \n" +
 			  "      self.__y = 20 \n" +
 			  "      self.__z = -60 \n" +
 			  "      if self.__stat != 'active' and self.__stat != 'inactive': \n" +
 			  "          raise ValueError('status can only have one of two values: active or inactive')  \n" +
 			  "  # Displays the id, status and position of the UFO \n" +
 			  "  def display(self): \n" +
 			  "      print 'Id: {id}'.format(id = self.__id) \n" +
 			  "      print 'Status {status}'.format(status = self.__stat) \n" +
 			  "      print 'Position x={x}, y={y}, z={z}'.format(x=self.__x, y=self.__y, z=self.__z) \n" +
 			  "  # Change the status of the UFO to 'active' or 'inactive' \n" +
 			  "  def set_status(self, status): \n" +
 			  "      self.__stat=status \n" +
 			  "      if self.__stat != 'active' and self.__stat != 'inactive': \n" +
 			  "          raise ValueError('status can only have one of two values: active or inactive') \n" +
 			  "  # Returns the status of the UFO (active, inactive) \n" +
 			  "  def get_status(self): \n" +
 			  "      return self.__stat \n" +

 			  "  # Returns the ID number of the UFO \n" +
 			  "  def get_id(self): \n" +
 			  "      return self.__id \n" +

 			  "  # Moves the UFO towards a target with position (new_x, new_y, new_z) \n" +
 			  "  def update_position(self, new_x, new_y, new_z): \n" +
 			  "      if self.__status == 'active': \n" +
 			  "          while new_x != self.__x or new_y != self.__y or new_z != self.__z: \n" +
 			  "              if new_x > self.x: \n" +
 			  "                  self.__x = self.__x + 1 \n" +
 			  "              elif new_x < self.__x: \n" +
 			  "                  self.__x = self.__x - 1 \n" +

 			  "              if new_y > self.y: \n" +
 			  "                  self.__y = self.__y + 1 \n" +
 			  "              elif new_y < self.__y: \n" +
 			  "                  self.__y = self.__y - 1 \n" +

 			  "              if new_z > self.__z: \n" +
 			  "                  self.__x = self.__x + 1 \n" +
 			  "              elif new_z < self.__z: \n" +
 			  "                  self.__x = self.__x - 1 \n" +


 			  "  # Get the x-coordinate of UFO's position \n" +
 			  "  def get_x(self): \n" +
 			  "      return self.__x \n" +

 			  "  # Get the y-coordinate of UFO's position \n" +
 			  "  def get_y(self): \n" +
 			  "      return self.__x \n" +

 			  "  # Get the z-coordinate of UFO's position \n" +
 			  "  def get_z(self): \n" +
 			  "      return self.__x \n" +

 			  "  # Returns true for an active ufo if its position from the coordinate (new_x, new_y, new_z) is less than range \n" +
 			  "  # Otherwise it returns false \n" +
 			  "  def is_within_range(self, new_x, new_y, new_z, range): \n" +
 			  "      distance = math.sqrt(math.pow(self.__x - new_x, 2) + math.pow(self.__y - new_y, 2) + math.pow(self.__z - new_z, 2)) \n" +
 			  "      if self.__stat == 'active' and distance < range: \n" +
 			  "          return True \n" +
 			  "      else: \n" +
 			  "          return False \n" +

 			  "class UfoTracker: \n" +
 			  "  TOTAL_UFOS = 1  # Total number of UFOs being tracked \n" +
 			  "  # Method to initialize the UfoTracker \n" +
 			  "  def __init__(self): \n" +
 			  "      self.__list = [] \n" +

 			  "      for i in range(self.TOTAL_UFOS): \n" +
 			  "          ufo = Ufo(i, 'active') \n" +
 			  "          self.__list.append(ufo) \n" +

 			  "      for j in range(len(self.__list)): \n" +
 			  "          obj = self.__list[j] \n" +
 			  "          #obj.display() \n" +

 			  "  # Method that returns a list containing all the UFOs \n" +
 			  "  def get_ufo_list(self): \n" +
 			  "      return self.__list \n" + 
 			  userCode1;
 			
 	        console.log(prog);
 	        document.getElementById("testingOutput").value = "";
 	        Sk.configure({output:outf_mod3, read:builtinRead}); 
 	         var myPromise = Sk.misceval.asyncToPromise(function() {
 	             return Sk.importMainWithBody("<stdin>", false, prog, true);
 	         }); 
 	        
 	        myPromise.then(function(mod) {
 	            // speak out the output of the program
 	            var mypre = document.getElementById("output"); 
 	            mypre.innerHTML += "Testing your program"; 
 	            meSpeak.speak("Testing your program"); 
 	            var mypre = document.getElementById("testingOutput").value; 
 	        	testoutput = mypre.trim().replace(/\n/g, " ");
 	            console.log("The output of tested program is: " +testoutput);
 	            if (testoutput != "Id: 0 Status active Position x=10, y=20, z=-60") {
 	            	console.log("The output is incorrect.");
 	            	if (userCode1.match(/tracker\s*=\s*UfoTracker\(\s*\)/) == null) {
 	     				console.log("Create an object of UfoTracker called tracker in your program.");
 	     			}
 	            	else if (userCode1.match(/ufo_list\s*=\s*tracker.get_ufo_list\(\s*\)/) == null) {
 	     				console.log("Use tracker.get_ufo_list() to read a list of UFOS. Store them in a variable called ufo_list.");
 	     			}
 	            	else if (userCode1.match(/is_within_range/) == null) {
 	     				console.log("Use the is_within_range method in your program of Ufo class to determine which UFOs are within range.");
 	     			}
 	            	else
 	            		console.log("Check the arguments to the is_within_range method. The first 3 arguments are the x, y, and z values of the Ariester's position, and the fourth argument is the range.")
 	            	passedCheck = false;
 	            }
 	            else {
 	        		var prog = 
 	        			"import math \n" +
 	        			"from random import randint \n" +

 	            		"class Ufo: \n" +
 	        			 "  # initializes the ID, status and position of UFO \n" +
 	        			 "  def __init__(self, identification, status): \n" +
 	        			  "      self.__id = identification \n" +
 	        			  "      self.__stat = status \n" +
 	        			  "      self.__x = 10 \n" +
 	        			  "      self.__y = 20 \n" +
 	        			  "      self.__z = 52 \n" +
 	        			  "      if self.__stat != 'active' and self.__stat != 'inactive': \n" +
 	        			  "          raise ValueError('status can only have one of two values: active or inactive')  \n" +
 	        			  "  # Displays the id, status and position of the UFO \n" +
 	        			  "  def display(self): \n" +
 	        			  "      print 'Id: {id}'.format(id = self.__id) \n" +
 	        			  "      print 'Status {status}'.format(status = self.__stat) \n" +
 	        			  "      print 'Position x={x}, y={y}, z={z}'.format(x=self.__x, y=self.__y, z=self.__z) \n" +
 	        			  "  # Change the status of the UFO to 'active' or 'inactive' \n" +
 	        			  "  def set_status(self, status): \n" +
 	        			  "      self.__stat=status \n" +
 	        			  "      if self.__stat != 'active' and self.__stat != 'inactive': \n" +
 	        			  "          raise ValueError('status can only have one of two values: active or inactive') \n" +
 	        			  "  # Returns the status of the UFO (active, inactive) \n" +
 	        			  "  def get_status(self): \n" +
 	        			  "      return self.__stat \n" +

 	        			  "  # Returns the ID number of the UFO \n" +
 	        			  "  def get_id(self): \n" +
 	        			  "      return self.__id \n" +

 	        			  "  # Moves the UFO towards a target with position (new_x, new_y, new_z) \n" +
 	        			  "  def update_position(self, new_x, new_y, new_z): \n" +
 	        			  "      if self.__status == 'active': \n" +
 	        			  "          while new_x != self.__x or new_y != self.__y or new_z != self.__z: \n" +
 	        			  "              if new_x > self.x: \n" +
 	        			  "                  self.__x = self.__x + 1 \n" +
 	        			  "              elif new_x < self.__x: \n" +
 	        			  "                  self.__x = self.__x - 1 \n" +

 	        			  "              if new_y > self.y: \n" +
 	        			  "                  self.__y = self.__y + 1 \n" +
 	        			  "              elif new_y < self.__y: \n" +
 	        			  "                  self.__y = self.__y - 1 \n" +

 	        			  "              if new_z > self.__z: \n" +
 	        			  "                  self.__x = self.__x + 1 \n" +
 	        			  "              elif new_z < self.__z: \n" +
 	        			  "                  self.__x = self.__x - 1 \n" +


 	        			  "  # Get the x-coordinate of UFO's position \n" +
 	        			  "  def get_x(self): \n" +
 	        			  "      return self.__x \n" +

 	        			  "  # Get the y-coordinate of UFO's position \n" +
 	        			  "  def get_y(self): \n" +
 	        			  "      return self.__x \n" +

 	        			  "  # Get the z-coordinate of UFO's position \n" +
 	        			  "  def get_z(self): \n" +
 	        			  "      return self.__x \n" +

 	        			  "  # Returns true for an active ufo if its position from the coordinate (new_x, new_y, new_z) is less than range \n" +
 	        			  "  # Otherwise it returns false \n" +
 	        			  "  def is_within_range(self, new_x, new_y, new_z, range): \n" +
 	        			  "      distance = math.sqrt(math.pow(self.__x - new_x, 2) + math.pow(self.__y - new_y, 2) + math.pow(self.__z - new_z, 2)) \n" +
 	        			  "      if self.__stat == 'active' and distance < range: \n" +
 	        			  "          return True \n" +
 	        			  "      else: \n" +
 	        			  "          return False \n" +

 	        			  "class UfoTracker: \n" +
 	        			  "  TOTAL_UFOS = 1  # Total number of UFOs being tracked \n" +
 	        			  "  # Method to initialize the UfoTracker \n" +
 	        			  "  def __init__(self): \n" +
 	        			  "      self.__list = [] \n" +

 	        			  "      for i in range(self.TOTAL_UFOS): \n" +
 	        			  "          ufo = Ufo(i, 'active') \n" +
 	        			  "          self.__list.append(ufo) \n" +

 	        			  "      for j in range(len(self.__list)): \n" +
 	        			  "          obj = self.__list[j] \n" +
 	        			  "          #obj.display() \n" +

 	        			  "  # Method that returns a list containing all the UFOs \n" +
 	        			  "  def get_ufo_list(self): \n" +
 	        			  "      return self.__list \n" + 
 	        			  userCode1;
 	        		
 	    	         Sk.configure({output:outf_mod3, read:builtinRead}); 
 	    	         document.getElementById("testingOutput").value = "";
 	   	             var myPromise1 = Sk.misceval.asyncToPromise(function() {
 	   	                 return Sk.importMainWithBody("<stdin>", false, prog, true);
 	   	             });
 	   	             
 	   	             myPromise1.then(function(mod) {
 	   	            	 var mypre = document.getElementById("testingOutput").value; 
 	   	            	 testoutput = mypre.trim().replace(/\n/g, " ");
 	   	            	 console.log("The output of tested program is: " +testoutput);
 	   	            	 if (testoutput != "") {
 	   	            		 console.log("Sorry, the output of your program is incorrect.");
 	   	            		 console.log("Check the arguments to method is_within_range in class Ufo. The first 3 arguments are the x, y, and z values of the Ariester's position, and the fourth argument is the range. ");
 	   	            		 console.log("Check the code after the else clause in your program.");
 	   	            		 passedCheck = false;
 	   	            	 }
 	   	            	 else {
 	   	            		 console.log("The output is correct");
 	   	            		 console.log("Good work!! Chapter 8 will be unlocked");
 	   	            		 
 	 	   	  	    		var myoutput="The output is correct.</br>";
		   	  	    		myoutput+="Good work!! Chapter 8 will be unlocked";
		   	  	    		document.getElementById("status").innerHTML=myoutput;  
		   	  	    		
 	   	            		 passedCheck = true;
 	   	            		 chapter_unlocked = 8;
 	   	            	 }	
 	   	             },  function(err) {
 	   		        	console.log("Error: In function err of question 7- should not reach here; check checker.js");
 	   		         }); 
 	            } 
 	            	
                 //mypre.innerHTML += text; 
 	        },
 	        function(err) {
 	        	console.log("Error: In function err of question 7- should not reach here; check checker.js");
 	         });

 	}
     else if (clickedLink == "practice_exercise1-1") {
    	 
    	 var str="";
  		console.log("checking practice exercise 1-1");
  		if (userCode1.match(/from \s*ScienceFacts \s*import \s*ScienceFacts/) == null) {
  			console.log("Your program is incorrect. Import the ScienceFacts class into your program.");
  			str="Your program is incorrect. Import the ScienceFacts class into your program.";
  		}
  		else if (userCode1.match(/ScienceFacts\s*\(\s*\)/) == null) {
 				console.log("Your program is incorrect. Create an object of class ScienceFacts.");
 				str="Your program is incorrect. Create an object of class ScienceFacts.";
 		 }
  		else if (userCode1.match(/science\s*=\s*ScienceFacts\s*\(\s*\)/) == null) {
  				console.log("Your program is incorrect. Create an object of ScienceFacts called science.");
  				str="Your program is incorrect. Create an object of ScienceFacts called science.";
  		 }
  		 else {
  	         console.log("Good work! Your program is correct.");
  	         str="Good work! Your program is correct.";
  		 }
	        var no = document.getElementById("editorNumber").value;
  			document.getElementById("output"+no).innerHTML+="<br/>"+str;
  			meSpeak.speak(str);
     }
	else if (clickedLink == "practice_exercise1-2") {
		 var str="";
		console.log("checking practice exercise 1-2");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/from \s*Elevator \s*import \s*Elevator/) == null) {
			str = "Your program is incorrect. Import the Elevator class into your program.";
	  		console.log("Your program is incorrect. Import the Elevator class into your program.");
	  		str="Your program is incorrect. Import the Elevator class into your program.";
	  	}
		else if (userCode1.match(/\s*=\s*Elevator\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Create an object of the Elevator class.";
			console.log("Your program is incorrect. Create an object of the Elevator class.");
			str="Your program is incorrect. Create an object of the Elevator class.";
		} 
		else if (userCode1.match(/elevator1\s*=\s*Elevator\s*\(\s*\)/) == null) {
				str = "Your program is incorrect. Create an object of Elevator called elevator1.";
				console.log("Your program is incorrect. Create an object of Elevator called elevator1.");
				str="Your program is incorrect. Create an object of Elevator called elevator1.";
		}
		else if (consoleOutput.match("Current floor: 0 \s*Total floors: 101") != null) {
			str = "Awesome! Your program is correct."
			console.log("Awesome! Your program is correct.");
			str="Awesome! Your program is correct.";
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
			str="Your program is incorrect. Check your program and correct the errors.";
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise1-3") {
		var str="";
		console.log("checking practice exercise 1-3");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/from \s*ScienceFacts \s*import \s*ScienceFacts/) == null) {
			str = "Your program is incorrect. Import the ScienceFacts class.";
	  		console.log("Your program is incorrect. Import the ScienceFacts class.");
	  		str="Your program is incorrect. Import the ScienceFacts class.";
	  	}
		else if (userCode1.match(/\s*=\s*ScienceFacts\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Create an object of the ScienceFacts class.";
			console.log("Your program is incorrect. Create an object of the ScienceFacts class.");
			str="Your program is incorrect. Create an object of the ScienceFacts class.";
		} 
		else if (userCode1.match(/display_speed_of_light\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Use the method display_speed_of_light of class ScienceFacts.";
			console.log("Your program is incorrect. Use the method display_speed_of_light of class ScienceFacts.");
			str="Your program is incorrect. Use the method display_speed_of_light of class ScienceFacts.";
		}
		else if (consoleOutput.match("299,792,458 meters per second") != null) {
			str = "Awesome! Your program is correct.";
			console.log("Awesome! Your program is correct.");
			str="Awesome! Your program is correct.";
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
			str="Your program is incorrect. Check your program and correct the errors.";
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise1-4") {
		var str="";
		console.log("checking practice exercise 1-4");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/from \s*ScienceFacts \s*import \s*ScienceFacts/) == null) {
			str = "Your program is incorrect. Import the ScienceFacts class into your program.";
	  		console.log("Your program is incorrect. Import the ScienceFacts class into your program.");
	  		str="Your program is incorrect. Import the ScienceFacts class into your program.";
	  	}
		else if (userCode1.match(/\s*=\s*ScienceFacts\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Create an object of the ScienceFacts class.";
			console.log("Your program is incorrect. Create an object of the ScienceFacts class.");
			str="Your program is incorrect. Create an object of the ScienceFacts class.";
		} 
		else if (userCode1.match(/display_age_of_earth\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Use the method display_age_of_earth of class ScienceFacts.";
			console.log("Your program is incorrect. Use the method display_age_of_earth of class ScienceFacts.");
			str="Your program is incorrect. Use the method display_age_of_earth of class ScienceFacts.";
		}
		else if (consoleOutput.match("around 4.6 billion years") != null) {
			str = "Awesome! Your program is correct.";
			console.log("Awesome! Your program is correct.");
			str="Awesome! Your program is correct.";
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
			str="Your program is incorrect. Check your program and correct the errors.";
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise1-5") {
		var str="";
		console.log("checking practice exercise 1-5");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/from \s*ScienceFacts \s*import \s*ScienceFacts/) == null) {
			str = "Your program is incorrect. Import the ScienceFacts class into your program.";
	  		console.log("Your program is incorrect. Import the ScienceFacts class into your program.");
	  		str="Your program is incorrect. Import the ScienceFacts class into your program.";
	  	}
		else if (userCode1.match(/\s*=\s*ScienceFacts\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Create an object of the ScienceFacts class.";
			console.log("Your program is incorrect. Create an object of the ScienceFacts class.");
			str="Your program is incorrect. Create an object of the ScienceFacts class.";
		} 
		else if (userCode1.match(/display_time_light_travels\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Use the method display_time_light_travels of class ScienceFacts.";
			console.log("Your program is incorrect. Use the method display_time_light_travels of class ScienceFacts.");
			str="Your program is incorrect. Use the method display_time_light_travels of class ScienceFacts.";
		}
		else if (consoleOutput.match("8 minutes and 17 seconds") != null) {
			str = "Awesome! Your program is correct.";
			console.log("Awesome! Your program is correct.");
			str="Awesome! Your program is correct.";
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
			str="Your program is incorrect. Check your program and correct the errors.";
		}

	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise1-6") {
		var str="";
		console.log("checking practice exercise 1-6");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/from \s*Door \s*import \s*Door/) == null) {
			str = "Your program is incorrect. Import the Door class into your program.";
	  		console.log("Your program is incorrect. Import the Door class into your program.");
	  		str="Your program is incorrect. Import the Door class into your program.";
	  	}
		else if (userCode1.match(/\s*=\s*Door\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Create an object of the Door class.";
			console.log("Your program is incorrect. Create an object of the Door class.");
			str="Your program is incorrect. Create an object of the Door class.";
		} 
		else if (userCode1.match(/knock\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Use the method knock of class Door.";
			console.log("Your program is incorrect. Use the method knock of class Door.");
			str="Your program is incorrect. Use the method knock of class Door.";
		}
		else if (consoleOutput.match("knock knock") != null) {
			str = "Awesome! Your program is correct.";
			console.log("Awesome! Your program is correct.");
			str="Awesome! Your program is correct.";
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
			str="Your program is incorrect. Check your program and correct the errors.";
		}

	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise1-7") {
		var str="";
		console.log("checking practice exercise 1-7");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/from \s*Door \s*import \s*Door/) == null) {
			str = "Your program is incorrect. Import the Door class into your program.";
	  		console.log("Your program is incorrect. Import the Door class into your program.");
	  		str="our program is incorrect. Import the Door class into your program.";
	  	}
		else if (userCode1.match(/\s*=\s*Door\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Create an object of the Door class.";
			console.log("Your program is incorrect. Create an object of the Door class.");
			str="Your program is incorrect. Create an object of the Door class.";
		} 
		else if (userCode1.match(/lock\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Use the method lock of class Door.";
			console.log("Your program is incorrect. Use the method lock of class Door.");
			str="Your program is incorrect. Use the method lock of class Door.";
		}
		else if (consoleOutput.match("Locked door") != null) {
			str = "Awesome! Your program is correct.";
			console.log("Awesome! Your program is correct.");
			str="Awesome! Your program is correct.";
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
			str="Your program is incorrect. Check your program and correct the errors.";
		}

	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise1-8") {
		var str="";
		console.log("Although there is no rule for what you should write in a comment, here are a few tips to keep in mind:");
		console.log("Comments should describe the purpose of the code. In addition, the comments should make the program easier to understand and maintain. Use comments generously in your programs.");

		var str="<p>Although there is no rule for what you should write in a comment, here are a few tips to keep in mind:</p>";
		str=str+"<p>Comments should describe the purpose of the code. In addition, the comments should make the program easier to understand and maintain. Use comments generously in your programs.</p>";
	    
		var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise2-1") {
		var str="";
		console.log("checking practice exercise 2-1");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/413/) == null) {
			str = "Your program is incorrect. Use the number 413 in your program.";
	  		console.log("Your program is incorrect. Use the number 413 in your program.");
	  		str="Your program is incorrect. Use the number 413 in your program.";
	  	}
		else if (userCode1.match(/num\s*=\s*413/) == null) {
			str = "Your program is incorrect. Store 413 into the variable num.";
	  		console.log("Your program is incorrect. Store 413 into the variable num.");
	  		str="Your program is incorrect. Store 413 into the variable num.";
	  	}
		else {
			str = "Your program is correct";
			console.log("Your program is correct");
		}
		
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise2-2") {
		var str="";
		console.log("checking practice exercise 2-2");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/Codue 0413/) == null) {
			str = "Your program is incorrect. Check the word is spelled as C o d u e space 0 4 1 3.";
	  		console.log("Your program is incorrect. Check the word is spelled as C o d u e space 0 4 1 3.");
	  	}
		else if ((userCode1.match(/=\s*\'\s*Codue 0413/) == null ) && (userCode1.match(/=\s*\"\s*Codue 0413/)== null)) {
			str = "Your program is incorrect. Store the value Codue 0413 into a variable.";
	  		console.log("Your program is incorrect. Store the value Codue 0413 into a variable.");
	  	}
		else {
			str = "Nice! Your program is correct";
			console.log("Nice! Your program is correct");
		}
		
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise2-3") {
		var str="";
		console.log("checking practice exercise 2-3");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/Merscythe/) == null) {
			str = "Your program is incorrect. Check the word is spelled as M e r s c y t h e.";
	  		console.log("Your program is incorrect. Check the word is spelled as M e r s c y t h e.");
	  	}
		else if ((userCode1.match(/=\s*\'\s*Merscythe/) == null) && (userCode1.match(/=\s*\"\s*Merscythe/)== null)) {
			str = "Your program is incorrect. Store the value Merscythe into a variable.";
	  		console.log("Your program is incorrect. Store the value Merscythe into a variable.");
	  	}
		else if ((userCode1.match(/name\s*=\s*\'\s*Merscythe/) == null) && (userCode1.match(/name\s*=\s*\"\s*Merscythe/)== null)) {
			str = "Your program is incorrect. Use a variable called name.";
	  		console.log("Your program is incorrect. Use a variable called name.");
	  	}
		else {
			str = "Your program is correct";
			console.log("Your program is correct");
		}
		
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise2-4") {
		var str="";
		console.log("checking practice exercise 2-4");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/Merscythe/) == null) {
			str = "Your program is incorrect. Check the word is spelled as M e r s c y t h e.";
	  		console.log("Your program is incorrect. Check the word is spelled as M e r s c y t h e.");
	  	}
		else if ((userCode1.match(/print\s*\'\s*Merscythe\s*\'/) == null) && (userCode1.match(/print\s*\"\s*Merscythe\s*\"/) == null)) {
			str = "Your program is incorrect.Use the print function to display the text.";
	  		console.log("Your program is incorrect.Use the print function to display the text.");
	  	}
		else {
			str = "Good job! Your program is correct";
			console.log("Good job! Your program is correct");
		}
		
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise2-5") {
		var str="";
		console.log("checking practice exercise 2-5");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/Ari's \s*Lab/) == null) {
			str = "Your program is incorrect. Check the word is spelled as A r i ' s space L a b.";
	  		console.log("Your program is incorrect. Check the word is spelled as A r i ' s space L a b.");
	  	}
		else if  ((userCode1.match(/print\s*\"\s*Ari's Lab\s*\"/) == null)) {
			str = "Your program is incorrect.Use the print function to display the text.";
	  		console.log("Your program is incorrect.Use the print function to display the text.");
	  	}
		else {
			str = "Your program is correct";
			console.log("Your program is correct");
		}
		
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise2-6") {
		var str="";
		console.log("checking practice exercise 2-6");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/num1/) == null) {
			str = "Your program is incorrect. Check the variable is spelled as n u m 1.";
	  		console.log("Your program is incorrect. Check the variable is spelled as n u m 1.");
	  	}
		else if  ((userCode1.match(/print s*num1/) == null)) {
			str = "Your program is incorrect.Use the print function to display the text.";
	  		console.log("Your program is incorrect.Use the print function to display the text.");
	  	}
		else {
			str = "Nice work! Your program is correct";
			console.log("Nice work! Your program is correct");
		}
		
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise2-7") {
		var str="";
		console.log("checking practice exercise 2-7");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/vial1/) == null) {
			str = "Your program is incorrect. Check the word is spelled as v i a l 1.";
	  		console.log("Your program is incorrect. Check the word is spelled as v i a l 1.");
	  	}
		else if (userCode1.match(/print/) == null) {
			str = "Your program is incorrect. Use the print function in your program.";
	  		console.log("Your program is incorrect. Use the print function in your program.");
	  	}
		else if (userCode1.match(/The \s*blue \s*liquid \s*is/) == null) {
			str = "Your program is incorrect. Check that the phrase after print matches 'The blue liquid is'.";
	  		console.log("Your program is incorrect. Check that the phrase after print matches 'The blue liquid is'.");
	  	}	
		else if ((userCode1.match(/print\s*\'\s*The \s*blue \s*liquid \s*is\s*\'/) == null) && (userCode1.match(/print\s*\"\s*The \s*blue \s*liquid \s*is\s*\"/) == null)) {
			str = "Your program is incorrect. Use the print function to display the text.";
	  		console.log("Your program is incorrect. Use the print function to display the text.");
	  	}
		else if ((userCode1.match(/print\s*\'\s*The \s*blue \s*liquid \s*is\s*\'\s*\+\s*vial1/) == null) && (userCode1.match(/print\s*\"\s*The \s*blue \s*liquid \s*is\"\s*\+\s*vial1/) == null)) {
			str = "Your program is incorrect. Append the text +vial1 at the end of the print statement.";
	  		console.log("Your program is incorrect. Append the text +vial1 at the end of the print statement.");
	  	}
		else {
			str = "Your program is correct";
			console.log("Your program is correct");
		}
		
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise2-8") {
		var str="";
		console.log("checking practice exercise 2-8");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/input\s*\(/) == null) {
			str = "Your program is incorrect. Use the input function to prompt user to type in some information.";
	  		console.log("Your program is incorrect. Use the input function to prompt user to type in some information.");
	  	}
		else if (userCode1.match(/user_data\s*=\s*input/) == null) {
			str = "Your program is incorrect. Read the data entered by user into the variable user_data.";
	  		console.log("Your program is incorrect. Read the data entered by user into the variable user_data.");
	  	}
		else if (userCode1.match(/print \s*user_data/) == null) {
			str = "Your program is incorrect. Display user_data using the print function.";
	  		console.log("Your program is incorrect. Display user_data using the print function.");
	  	}	
		else {
			str = "Good work! Your program is correct";
			console.log("Good work! Your program is correct");
		}
		
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise2-9") {
		var str="";
		console.log("checking practice_exercise2-9");
		consoleOutput = "'" + consoleOutput.trim().replace(/\n/g, " ")   + "'";
		
		var prog = 
			"consoleOutput = " + consoleOutput.trim() +" \n" +
			"def input(var): \n" +
			"        return 1000  \n" +
			userCode1;
			
	        console.log(prog);
	        document.getElementById("testingOutput").value = "";
	        Sk.configure({output:outf_mod3, read:builtinRead}); 
	         var myPromise = Sk.misceval.asyncToPromise(function() {
	             return Sk.importMainWithBody("<stdin>", false, prog, true);
	         }); 
	        
	        myPromise.then(function(mod) {
	         	console.log("In function then");
	            // speak out the output of the program
	            var mypre = document.getElementById("output"); 
	            mypre.innerHTML += "Testing your program"; 
	            //meSpeak.speak("Testing your program"); 
	            var mypre = document.getElementById("testingOutput").value; 
	        	testoutput = mypre.trim().replace(/\n/g, " ");

	            if (userCode1.match(/input\s*\(/) == null) {
	            		str = "Your program is incorrect. Use the input function to prompt user to type in some information.";
	        	  		console.log("Your program is incorrect. Use the input function to prompt user to type in some information.");
	        	}
	        	else if (userCode1.match(/num\s*=\s*input/) == null) {
	        			str = "Your program is incorrect. Read the data entered by user into the variable num.";
	        	  		console.log("Your program is incorrect. Read the data entered by user into the variable num.");
	        	}
	        	else if (userCode1.match(/print /) == null) {
	        			str = "Your program is incorrect. Display the result using the print function.";
	        	  		console.log("Your program is incorrect. Display the result using the print function.");
	        	}	
	            if (testoutput.match("10007.0")  == null) {
	            		str = "The output is incorrect. Remember to enclose the expression float(num)+2 within parenthesis before multiplying it by 10.";
	            		console.log("The output is incorrect. Remember to enclose the expression float(num)+2 within parenthesis before multiplying it by 10.");
	            }          
	            else {
	            		str = "You did it! Your program is correct";
	        			console.log("You did it! Your program is correct");
	            }
	            
	    	    var no = document.getElementById("editorNumber").value;
	    	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
	    		meSpeak.speak(str);
	        },
	        function(err) {
	        	console.log("Error: In function err of question 3- should not reach here; check checker.js");
	         });

	}
	else if (clickedLink == "practice_exercise2-10") {
		console.log("checking practice_exercise2-10");
		consoleOutput = "'" + consoleOutput.trim().replace(/\n/g, " ")   + "'";
		
		var prog = 
			"consoleOutput = " + consoleOutput.trim() +" \n" +
			"def input(var): \n" +
			"        return 1005  \n" +
			userCode1;
			
	        console.log(prog);
	        document.getElementById("testingOutput").value = "";
	        Sk.configure({output:outf_mod3, read:builtinRead}); 
	         var myPromise = Sk.misceval.asyncToPromise(function() {
	             return Sk.importMainWithBody("<stdin>", false, prog, true);
	         }); 
	        
	        myPromise.then(function(mod) {
	            // speak out the output of the program
	            var mypre = document.getElementById("output"); 
	            mypre.innerHTML += "Testing your program"; 
	            //meSpeak.speak("Testing your program"); 
	            var mypre = document.getElementById("testingOutput").value; 
	        	testoutput = mypre.trim().replace(/\n/g, " ");

	            if (userCode1.match(/input\s*\(/) == null) {
	            		str = "Your program is incorrect. Use the input function to prompt user to type in some information.";
	        	  		console.log("Your program is incorrect. Use the input function to prompt user to type in some information.");
	        	}
	        	else if (userCode1.match(/num\s*=\s*input/) == null) {
	        			str = "Your program is incorrect. Read the data entered by user into the variable num.";
	        	  		console.log("Your program is incorrect. Read the data entered by user into the variable num.");
	        	}
	        	else if (userCode1.match(/float\s*\(\s*num\s*\)\s*\%\s*10/) == null) {
	        			str = "Your program is incorrect. Check the expression to find the remainder - are you using the % operator correctly?";
	        			console.log("Your program is incorrect. Check the expression to find the remainder - are you using the % operator correctly?");
	        	}
	        	else if (userCode1.match(/print /) == null) {
	        			str = "Your program is incorrect. Display the result using the print function.";
	        	  		console.log("Your program is incorrect. Display the result using the print function.");
	        	}	
	        	else if (testoutput.match("5")  == null) {
	        			str = "The output is incorrect. Check that the expression uses the % operator.";
	            		console.log("The output is incorrect. Check that the expression uses the % operator.");
	            }          
	            else {
	            		str = "Good work!Your program is correct";
	        			console.log("Good work! Your program is correct"); 
	            }
	            
	    	    var no = document.getElementById("editorNumber").value;
	    	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
	    		meSpeak.speak(str);
	        },
	        function(err) {
	        	console.log("Error: In function err of question 3- should not reach here; check checker.js");
	         });

	}
	else if (clickedLink == "practice_exercise2-11") {
		console.log("checking practice_exercise2-11");
		consoleOutput = "'" + consoleOutput.trim().replace(/\n/g, " ")   + "'";
		
		var prog = 
			"consoleOutput = " + consoleOutput.trim() +" \n" +
			"def input(var): \n" +
			"        return 1015  \n" +
			userCode1;
			
	        console.log(prog);
	        document.getElementById("testingOutput").value = "";
	        Sk.configure({output:outf_mod3, read:builtinRead}); 
	         var myPromise = Sk.misceval.asyncToPromise(function() {
	             return Sk.importMainWithBody("<stdin>", false, prog, true);
	         }); 
	        
	        myPromise.then(function(mod) {
	            // speak out the output of the program
	            var mypre = document.getElementById("output"); 
	            mypre.innerHTML += "Testing your program"; 
	           // meSpeak.speak("Testing your program"); 
	            var mypre = document.getElementById("testingOutput").value; 
	        	testoutput = mypre.trim().replace(/\n/g, " ");

	            if (userCode1.match(/input\s*\(/) == null) {
	            		str = "Your program is incorrect. Use the input function to prompt user to type in some information.";
	        	  		console.log("Your program is incorrect. Use the input function to prompt user to type in some information.");
	        	}
	        	else if (userCode1.match(/\s*=\s*input\s*\(/) == null) {
	        			str = "Your program is incorrect. Read the data entered by user using the function input.";
	        	  		console.log("Your program is incorrect. Read the data entered by user using the function input.");
	        	}
	        	else if (userCode1.match(/\s*\%\s*100/) == null) {
	        			str = "Your program is incorrect. Check the expression to find the remainder - are you using the % operator correctly?";
	        			console.log("Your program is incorrect. Check the expression to find the remainder - are you using the % operator correctly?")
	        	}
	        	else if (userCode1.match(/print /) == null) {
	        			str = "Your program is incorrect. Display the instructions and result using the print function.";
	        	  		console.log("Your program is incorrect. Display the instructions and result using the print function.");
	        	}	
	        	else if (testoutput.match("15")  == null) {
	        			str = "The output is incorrect. Check that the expression uses the % operator.";
	            		console.log("The output is incorrect. Check that the expression uses the % operator.");
	            }          
	            else {
	            		str = "Excellent! Your program is correct";
	        			console.log("Excellent! Your program is correct"); 
	            }
	            
	    	    var no = document.getElementById("editorNumber").value;
	    	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
	    		meSpeak.speak(str);
	        },
	        function(err) {
	        	console.log("Error: In function err of question 3- should not reach here; check checker.js");
	         });

	}
	else if (clickedLink == "practice_exercise3-1") {
		console.log("checking practice exercise 3-1");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/var1\s*=\s*1015/) == null) {
			str = "Your program is incorrect. Set the value of var1 equal to 1015.";
	  		console.log("Your program is incorrect. Set the value of var1 equal to 1015.");
	  	}
		else if (userCode1.match(/if \s*var1\s*==\s*1015/) == null) {
			str = "Your program is incorrect. Check the if condition. Did you use two equals signs in the condition?";
			console.log("Your program is incorrect. Check the if condition. Did you use two equals signs in the condition?");
		} 
		else if (userCode1.match(/print \s*\'\s*equal\s*\'/) == null) {
			str = "Your program is incorrect. Display the word 'equal' using the print function.";
			console.log("Your program is incorrect. Display the word 'equal' using the print function.");
		}
		else if (consoleOutput.match("equal") == null) {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
		else {
			str = "Awesome! Your program is correct.";
			console.log("Awesome! Your program is correct.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise3-2") {
		console.log("checking practice exercise 3-2");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/var1\s*=\s*1015/) == null) {
			str = "Your program is incorrect. Set the value of var1 equal to 1015.";
	  		console.log("Your program is incorrect. Set the value of var1 equal to 1015.");
	  	}
		else if (userCode1.match(/if \s*var1\s*==\s*1015/) == null) {
			str = "Your program is incorrect. Check the if condition. Did you use two equals signs in the condition?";
			console.log("Your program is incorrect. Check the if condition. Did you use two equals signs in the condition?");
		} 
		else if (userCode1.match(/print \s*\'\s*equal\s*\'/) == null) {
			str = "Your program is incorrect. Display the word 'equal' using the print function.";
			console.log("Your program is incorrect. Display the word 'equal' using the print function.");
		}
		else if (userCode1.match(/print \s*\'\s*not equal\s*\'/) == null) {
			str = "Your program is incorrect. Display the word 'not equal' as the action in the else clause.";
			console.log("Your program is incorrect. Display the word 'not equal' as the action in the else clause.");
		}
		else if (consoleOutput.match("equal") == null) {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
		else {
			str = "Awesome! Your program is correct.";
			console.log("Awesome! Your program is correct.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise3-3") {
		console.log("checking practice exercise 3-3");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/if \s*5\s*==\s*10/) == null) {
			str = "Your program is incorrect. Check the condition 5 == 10.";
	  		console.log("Your program is incorrect. Check the condition 5 == 10.");
	  	}
		else if (userCode1.match(/print \s*\'\s*5 \s*is \s*equal \s*to \s*10\s*\'/) == null) {
			str = "Your program is incorrect. Display the text '5 is equal to 10' as the action in th if clause.";
			console.log("Your program is incorrect. Display the text '5 is equal to 10' as the action in the if clause.");
		} 
		else if (userCode1.match(/print \s*\'\s*5 \s*is \s*not \s*equal \s*to \s*10\s*\'/) == null) {
			str = "Your program is incorrect. Display the text '5 is not equal to 10 as the action for the else clause.";
			console.log("Your program is incorrect. Display the text '5 is not equal to 10 as the action for the else clause.");
		}
		else if (consoleOutput.match(/\s*5 \s*is \s*not \s*equal \s*to \s*10\s*/) == null) {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
		else {
			str = "Good job! Your program is correct.";
			console.log("Good job! Your program is correct.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise3-4") {
		console.log("checking practice exercise 3-4");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/if \s*thickness1\s*!=\s*thickness2/) == null) {
			str = "Your program is incorrect. Use the condition thickness1 is not equal to thickness2.";
	  		console.log("Your program is incorrect. Use the condition thickness1 is not equal to thickness2");
	  	}
		else if (userCode1.match(/if \s*thickness1\s*!=\s*thickness2\s*:/) == null) {
			str = "Your program is incorrect. Use the condition in the if clause.";
			console.log("Your program is incorrect. Use the condition in the if clause.");
		} 
		else if (userCode1.match(/if \s*thickness1\s*!=\s*thickness2\s*:\s*\n\s*print \s*\'\s*not \s*equal\s*'/) == null) {
			str = "Your program is incorrect. The action in the if clause should display 'not equal'.";
			console.log("Your program is incorrect. The action in the if clause should display 'not equal'.");
		} 
		else if (userCode1.match(/else\s*:/) == null) {
			str = "Your program is incorrect. Use an else clause.";
			console.log("Your program is incorrect. Use an else clause");
		}
		else if (userCode1.match(/else\s*:\s*\n\s*print \s*\'\s*\s*equal'/) == null) {
			str = "Your program is incorrect. The action in the else clause should display 'equal'.";
			console.log("Your program is incorrect. The action in the else clause should display 'equal'.");
		}
		else {
			str = "Nice work! Your program is correct.";
			console.log("Nice work! Your program is correct.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise3-5") {
		console.log("checking practice exercise 3-5");
		if (userCode1.match(/if \s*feldspar_percent\s*>\s*quartz_percent\s*:/) == null) {
			str = "Your program is incorrect. The condition must check if feldspar_percent is greater than quartz_percent.";
	  		console.log("Your program is incorrect. The condition must check if feldspar_percent is greater than quartz_percent.");
	  	}
		else if (userCode1.match(/if \s*feldspar_percent\s*>\s*quartz_percent\s*:\s*\n\s*print \s*\'\s*feldspar \s*is \s*greater\s*\'/) == null) {
			str = "Your program is incorrect. Display the text 'feldspar is greater' as the action in the if clause.";
			console.log("Your program is incorrect. Display the text 'feldspar is greater' as the action in the if clause.");
		} 
		else if (userCode1.match(/else\s*:/) == null) {
			str = "Your program is incorrect. Use an else clause.";
			console.log("Your program is incorrect. Use an else clause.");
		}
		else if (userCode1.match(/else\s*:\s*\n\s*print \s*\'\s*quartz \s*is \s*greater\s*\'/) == null) {
			str = "Your program is incorrect. Check the action in the else clause displays 'quartz is greater'.";
			console.log("Your program is incorrect. Check the action in the else clause displays 'quartz is greater'.");
		}
		else {
			str = "You did it! Your program is correct.";
			console.log("You did it! Your program is correct.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise3-6") {
		console.log("checking practice exercise 3-6");
		if (userCode1.match(/if \s*badwater_depth\s*>\s*dead_sea_depth\s*:/) == null) {
			str = "Your program is incorrect. The condition must check if badwater_depth is greater than dead_sea_depth.";
	  		console.log("Your program is incorrect. The condition must check if badwater_depth is greater than dead_sea_depth.");
	  	}
		else if (userCode1.match(/if \s*badwater_depth\s*>\s*dead_sea_depth\s*:\s*\n\s*print \s*\'\s*badwater \s*is \s*greater\s*\'/) == null) {
			str = "Your program is incorrect. Display the text 'badwater is greater' as the action in the if clause.";
			console.log("Your program is incorrect. Display the text 'badwater is greater' as the action in the if clause.");
		} 
		else if (userCode1.match(/else\s*:/) == null) {
			str = "Your program is incorrect. Use an else clause.";
			console.log("Your program is incorrect. Use an else clause.");
		}
		else if (userCode1.match(/else\s*:\s*\n\s*print \s*\'\s*dead \s*sea \s*is \s*greater\s*\'/) == null) {
			str = "Your program is incorrect. Check the action in the else clause displays 'dead sea is greater'.";
			console.log("Your program is incorrect. Check the action in the else clause displays 'dead sea is greater'.");
		}
		else {
			str = "Awesome! Your program is correct.";
			console.log("Awesome! Your program is correct.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise3-7") {
		console.log("checking practice exercise 3-7");
		if (userCode1.match(/if \s*num1\s*<\s*num2\s*:/) == null) {
			str = "Your program is incorrect. The condition must check if num1 is less than num2.";
	  		console.log("Your program is incorrect. The condition must check if num1 is less than num2.");
	  	}
		else if (userCode1.match(/if \s*num1\s*<\s*num2\s*:\s*\n\s*print \s*\'\s*true\s*\'/) == null) {
			str = "Your program is incorrect. Display the text 'badwater is greater' as the action in the if clause.";
			console.log("Your program is incorrect. Display the text 'badwater is greater' as the action in the if clause.");
		} 
		else {
			str = "Good work! Your program is correct.";
			console.log("Good work! Your program is correct.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise3-8") {
		console.log("checking practice exercise 3-8");
		if (userCode1.match(/if \s*dead_sea_depth\s*<\s*badwater_depth\s*:/) == null) {
			str = "Your program is incorrect. The condition must check if dead_sea_depth is less than badwater_depth.";
	  		console.log("Your program is incorrect. The condition must check if dead_sea_depth is less than badwater_depth.");
	  	}
		else if (userCode1.match(/if \s*dead_sea_depth\s*<\s*badwater_depth\s*:\s*\n\s*print \s*\'\s*true\s*\'/) == null) {
			str = "Your program is incorrect. Display the text 'true' as the action in the if clause.";
			console.log("Your program is incorrect. Display the text 'true' as the action in the if clause.");
		}
		else if (userCode1.match(/else\s*:/) == null) {
			str = "Your program is incorrect. Use an else clause.";
			console.log("Your program is incorrect. Use an else clause.");
		}
		else if (userCode1.match(/else\s*:\s*\n\s*print \s*\'\s*false\s*\'/) == null) {
			str = "Your program is incorrect. Check the action in the else clause displays 'false'.";
			console.log("Your program is incorrect. Check the action in the else clause displays 'false'.");
		}
		else {
			str = "Nice! Your program is correct.";
			console.log("Nice! Your program is correct.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise3-9") {
		console.log("checking practice exercise 3-9");
		if ((userCode1.match(/if \s*text1\s*==\s*\'\s*aficionado\s*\'\s*:/) == null) && (userCode1.match(/if \s*text1\s*!=\s*\'\s*aficionado\s*\'\s*:/) == null)) {
			str = "Your program is incorrect. The condition must check if text1 is equal to aficionado.";
	  		console.log("Your program is incorrect. The condition must check if text1 is equal to aficionado.");
	  	}
		else {
			str = "You did it! Your program is correct.";
			console.log("You did it! Your program is correct.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise3-10") {
		str = "no solution provided";
		console.log("no solution provided");
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise3-11") {
		console.log("checking practice exercise 3-11");
		if (userCode1.match(/if \s*age1\s*>=\s*age2\s*:/) == null) {
			str = "Your program is incorrect. The condition must check if age1 is greater than or equal to age2.";
	  		console.log("Your program is incorrect. The condition must check if age1 is greater than or equal to age2.");
	  	}
		else {
			str = "Good work! Your program is correct.";
			console.log("Good work! Your program is correct.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise3-12") {
		console.log("checking practice exercise 3-12");
		if (userCode1.match(/if \s*temp1\s*<=\s*temp2\s*:/) == null) {
			str = "Your program is incorrect. The condition must check if temp1 is less than or equal to temp2.";
	  		console.log("Your program is incorrect. The condition must check if temp1 is less than or equal to temp2.");
	  	}
		else {
			str = "Excellent! Your program is correct.";
			console.log("Excellent! Your program is correct.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise4-1") {
		console.log("checking practice exercise 4-1");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/from \s*ScienceFacts \s*import \s*ScienceFacts/) == null) {
			str = "Your program is incorrect. Import the ScienceFacts class into your program.";
	  		console.log("Your program is incorrect. Import the ScienceFacts class into your program.");
	  	}
		else if (userCode1.match(/\s*=\s*ScienceFacts\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Create an object of the ScienceFacts class.";
			console.log("Your program is incorrect. Create an object of the ScienceFacts class.");
		} 
		else if (userCode1.match(/display_animal_facts\s*\(/) == null) {
			str = "Your program is incorrect. Use the method display_animal_facts of class ScienceFacts.";
			console.log("Your program is incorrect. Use the method display_animal_facts of class ScienceFacts.");
		}
		else if (userCode1.match(/display_animal_facts\s*\(\s*\'capybara\'/) == null) {
			str = "Your program is incorrect. Use the argument 'capybara' in the display_animal_facts method.";
			console.log("Your program is incorrect. Use the argument 'capybara' in the display_animal_facts method.");
		}
		else if (consoleOutput.match("The capybara found in South America is the largest rodent in the world.") != null) {
			str = "Nice work! Your program is correct.";
			console.log("Nice work! Your program is correct.");
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise4-2") {
		console.log("checking practice exercise 4-2");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/from \s*ScienceFacts \s*import \s*ScienceFacts/) == null) {
			str = "Your program is incorrect. Import the ScienceFacts class into your program.";
	  		console.log("Your program is incorrect. Import the ScienceFacts class into your program.");
	  	}
		else if (userCode1.match(/\s*=\s*ScienceFacts\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Create an object of the ScienceFacts class.";
			console.log("Your program is incorrect. Create an object of the ScienceFacts class.");
		} 
		else if (userCode1.match(/display_animal_facts\s*\(/) == null) {
			str = "Your program is incorrect. Use the method display_animal_facts of class ScienceFacts.";
			console.log("Your program is incorrect. Use the method display_animal_facts of class ScienceFacts.");
		}
		else if (userCode1.match(/display_animal_facts\s*\(\s*name\s*=\s*\s*\'\s*capybara\s*\'/) == null) {
			str = "Your program is incorrect. Use the argument 'capybara' in the display_animal_facts method.";
			console.log("Your program is incorrect. Use the argument 'capybara' in the display_animal_facts method.");
		}
		else if (consoleOutput.match("The capybara found in South America is the largest rodent in the world.") != null) {
			str = "Awesome! Your program is correct.";
			console.log("Awesome! Your program is correct.");
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise4-3") {
		console.log("checking practice exercise 4-3");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/\s*import \s*math/) == null) {
			str = "Your program is incorrect. Import the math class into your program.";
	  		console.log("Your program is incorrect. Import the math class into your program.");
	  	} 
		else if (userCode1.match(/print/) == null) {
			str = "Your program is incorrect. Use the function print.";
			console.log("Your program is incorrect. Use the function print.");
		}
		else if (userCode1.match(/\s*factorial\s*\(/) == null) {
			str = "Your program is incorrect. Use the factorial method of the math class.";
			console.log("Your program is incorrect. Use the factorial method of the math class.");
		}
		else if (userCode1.match(/\s*factorial\s*\(\s*10\s*\)/) == null) {
			str = "Your program is incorrect. Use the argument 10 in the factorial method.";
			console.log("Your program is incorrect. Use the argument 10 in the factorial method.");
		}
		else if (consoleOutput.match("3628800") != null) {
			str = "Good job! Your program is correct.";
			console.log("Good job! Your program is correct.");
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise4-4") {
		console.log("checking practice exercise 4-4");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/\s*import \s*math/) == null) {
			str = "Your program is incorrect. Import the math class into your program.";
	  		console.log("Your program is incorrect. Import the math class into your program.");
	  	} 
		else if (userCode1.match(/print/) == null) {
			str = "Your program is incorrect. Use the function print.";
			console.log("Your program is incorrect. Use the function print.");
		}
		else if (userCode1.match(/\s*pow\s*\(/) == null) {
			str = "Your program is incorrect. Use the pow method of the math class.";
			console.log("Your program is incorrect. Use the pow method of the math class.");
		}
		else if (userCode1.match(/\s*pow\s*\(\s*10.5\s*\,\s*3\s*\)/) == null) {
			str = "Your program is incorrect. Use the arguments 10.5 and 3 in the pow method.";
			console.log("Your program is incorrect. Use the arguments 10.5 and 3 in the pow method.");
		}
		else if (consoleOutput.match("1157.625") != null) {
			str = "Awesome! Your program is correct.";
			console.log("Awesome! Your program is correct.");
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise4-5") {
		console.log("checking practice exercise 4-5");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/divmod/) == null) {
			str = "Your program is incorrect. Use the divmod function in your program.";
	  		console.log("Your program is incorrect. Use the divmod function in your program.");
	  	} 
		else if (userCode1.match(/divmod\s*\(\s*500\s*\,\s*24\s*\)/) == null) {
			str = "Your program is incorrect. Use the arguments 500 and 24 to function divmod";
			console.log("Your program is incorrect. Use the arguments 500 and 24 to function divmod");
		}
		else {
			str = "Your program is correct. Good work!";
			console.log("Your program is incorrect. Good work!");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	} else if (clickedLink == "practice_exercise4-6") {
		console.log("checking practice exercise 4-6");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/input/) == null) {
			str = "Your program is incorrect. Use the function input.";
			console.log("Your program is incorrect. Use the function input.");
		}
		else if (userCode1.match(/\s*input\s*\(\s*\"\s*Enter \s*today's \s*date\s*\"/) == null) {
			str = "Your program is incorrect. Use the argument \"Enter today's date\" in the function input.";
			console.log("Your program is incorrect. Use the argument \"Enter today's date\" in the function input.");
		}
		else {
			str = "Good work! Your program is correct.";
			console.log("Good work! Your program is correct.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise4-7") {
		console.log("checking practice exercise 4-7");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/range/) == null) {
			str = "Your program is incorrect. Use the function range.";
			console.log("Your program is incorrect. Use the function range.");
		}
		else if (userCode1.match(/\s*range\s*\(\s*10\s*\,\s*15\s*\)/) == null) {
			str = "Your program is incorrect. The range function should have the arguments 10 and 15.";
			console.log("Your program is incorrect. The range function should have the arguments 10 and 15.");
		}
		else if (userCode1.match(/print/) == null) {
			str = "Your program is incorrect. Use the print function to display the data.";
			console.log("Your program is incorrect. Use the print function to display the data.");
		}
		else if (consoleOutput.match("[10, 11, 12, 13, 14]") != null) {
			str = "Awesome! Your program is correct.";
			console.log("Awesome! Your program is correct.");
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise4-8") {
		console.log("checking practice exercise 4-8");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/name1\s*=/) == null) {
			str = "Your program is incorrect. Assign a value to variable name1.";
			console.log("Your program is incorrect. Assign a value to variable name1.");
		}
		else if (userCode1.match(/name2\s*=/) == null) {
			str = "Your program is incorrect. Assign a value to variable name2.";
			console.log("Your program is incorrect. Assign a value to variable name2.");
		}
		else if (consoleOutput.match("Verin is the commander of the Underground Force of Safety") != null) {
			str = "Good! Your program is correct.";
			console.log("Good! Your program is correct.");
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise5-1") {
		console.log("checking practice exercise 5-1");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/input/) == null) {
			str = "Your program is incorrect. Use the function input.";
			console.log("Your program is incorrect. Use the function input.");
		}
		else if (userCode1.match(/\s*input\s*\(\s*\"\s*Enter \s*today's \s*date\s*\"/) == null) {
			str = "Your program is incorrect. Use the argument \"Enter today's date\" in the function input.";
			console.log("Your program is incorrect. Use the argument \"Enter today's date\" in the function input.");
		}
		else if (userCode1.match(/curr_date\s*=\s*input\s*\(\s*\"\s*Enter \s*today's \s*date\s*\"/) == null) {
			str = "Your program is incorrect. Read the data returned by the input function into the variable curr_date.";
			console.log("Your program is incorrect. Read the data returned by the input function into the variable curr_date.");
		}
		else if (userCode1.match(/print\s*curr_date/) == null) {
			str = "Your program is incorrect. Using the print function, display the data stored in curr_date.";
			console.log("Your program is incorrect. Using the print function, display the data stored in curr_date.");
		}
		else {
			str = "Good work! Your program is correct.";
			console.log("Good work! Your program is correct.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise5-2") {
		console.log("checking practice exercise 5-2");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/range/) == null) {
			str = "Your program is incorrect. Use the function range.";
			console.log("Your program is incorrect. Use the function range.");
		}
		else if (userCode1.match(/\s*range\s*\(\s*100\s*\,\s*104\s*\)/) == null) {
			str = "Your program is incorrect. The range function should have the arguments 100 and 104.";
			console.log("Your program is incorrect. The range function should have the arguments 100 and 104.");
		}
		else if (userCode1.match(/print/) == null) {
			str = "Your program is incorrect. Use the print function to display the data.";
			console.log("Your program is incorrect. Use the print function to display the data.");
		}
		else if (consoleOutput.match("[100, 101, 102, 103]") != null) {
			str = "Excellent! Your program is correct.";
			console.log("Excellent! Your program is correct.");
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise5-3") {
		console.log("checking practice exercise 5-3");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/\s*import \s*math/) == null) {
			str = "Your program is incorrect. Import the math class into your program.";
	  		console.log("Your program is incorrect. Import the math class into your program.");
	  	} 
		else if (userCode1.match(/\s*factorial\s*\(/) == null) {
			str = "Your program is incorrect. Use the factorial method of the math class.";
			console.log("Your program is incorrect. Use the factorial method of the math class.");
		}
		else if (userCode1.match(/factorial\s*\(\s*5\s*\)/) == null) {
			str = "Your program is incorrect. Use the argument 5 in the factorial method.";
			console.log("Your program is incorrect. Use the argument 5 in the factorial method.");
		}
		else if (userCode1.match(/five_factorial\s*=\s*math\s*\.\s*factorial\s*\(\s*5\s*\)/) == null) {
			str = "Your program is incorrect. Assign the value returned by the factorial method to a variable five_factorial.";
			console.log("Your program is incorrect. Assign the value returned by the factorial method to a variable five_factorial.");
		}
		else if (userCode1.match(/print \s*five_factorial/) == null) {
			str = "Your program is incorrect. Display the value of variable five_factorial using the function print.";
			console.log("Your program is incorrect. Display the value of variable five_factorial using the function print.");
		}
		else if (consoleOutput.match("120") != null) {
			str = "Awesome! Your program is correct.";
			console.log("Awesome! Your program is correct.");
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise5-6") {
		console.log("checking practice exercise 5-6");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/from \s*ScienceFacts \s*import \s*ScienceFacts/) == null) {
			str = "Your program is incorrect. Import the ScienceFacts class into your program.";
	  		console.log("Your program is incorrect. Import the ScienceFacts class into your program.");
	  	}
		else if (userCode1.match(/\s*=\s*ScienceFacts\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Create an object of the ScienceFacts class.";
			console.log("Your program is incorrect. Create an object of the ScienceFacts class.");
		} 
		else if (userCode1.match(/g_forces\s*\(/) == null) {
			str = "Your program is incorrect. Use the method g_forces of class ScienceFacts.";
			console.log("Your program is incorrect. Use the method g_forces of class ScienceFacts.");
		}
		else if (userCode1.match(/g_forces\s*\(\s*\'Roller coaster\'/i) == null) {
			str = "Your program is incorrect. Use the argument 'Roller coaster' in the display_animal_facts method.";
			console.log("Your program is incorrect. Use the argument 'Roller coaster' in the display_animal_facts method.");
		}
		else if (userCode1.match(/g_forces\s*\(\s*\'free fall elevator\'/i) == null) {
			str = "Your program is incorrect. Use the argument 'free fall elevator' in the display_animal_facts method.";
			console.log("Your program is incorrect. Use the argument 'free fall elevator' in the display_animal_facts method.");
		}
		else if (consoleOutput.match("Roller coaster") != null) {
			str = "Good job! Your program is correct.";
			console.log("Good job! Your program is correct.");
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise5-7") {
		console.log("checking practice exercise 5-7");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/from \s*ScienceFacts \s*import \s*ScienceFacts/) == null) {
			str = "Your program is incorrect. Import the ScienceFacts class into your program.";
	  		console.log("Your program is incorrect. Import the ScienceFacts class into your program.");
	  	}
		else if (userCode1.match(/\s*=\s*ScienceFacts\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Create an object of the ScienceFacts class.";
			console.log("Your program is incorrect. Create an object of the ScienceFacts class.");
		} 
		else if (userCode1.match(/get_telescope_name\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Use the method get_telescope_name of class ScienceFacts to get the name of a telescope and store it in a variable.";
			console.log("Your program is incorrect. Use the method get_telescope_name of class ScienceFacts to get the name of a telescope and store it in a variable.");
		}
		else if (userCode1.match(/display_telescope_facts\s*\(/) == null) {
			str ="Your program is incorrect. Use the method display_telescope_facts with the name of the telescope as an argument.";
			console.log("Your program is incorrect. Use the method display_telescope_facts with the name of the telescope as an argument.");
		}
		else if ( (consoleOutput.match("Like the Hubble, the Kepler Space Telescope") != null) || (consoleOutput.match("The Keck observatory") != null) || (consoleOutput.match("The Hubble space telescope") != null) )  {
			str = "Excellent! Your program is correct."
			console.log("Excellent! Your program is correct.");
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise5-8") {
		console.log("checking practice exercise 5-8");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/from \s*ScienceFacts \s*import \s*ScienceFacts/) == null) {
			str = "Your program is incorrect. Import the ScienceFacts class into your program.";
	  		console.log("Your program is incorrect. Import the ScienceFacts class into your program.");
	  	}
		else if (userCode1.match(/\s*=\s*ScienceFacts\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Create an object of the ScienceFacts class.";
			console.log("Your program is incorrect. Create an object of the ScienceFacts class.");
		} 
		else if (userCode1.match(/print \s*\'\s*The \s*speed \s*of \s*light \s*is\s*\'/i) == null) {
			str = "Your program is incorrect. Use the print function to display the output.";
			console.log("Your program is incorrect. Use the print function to display the output.");
		}
		else if (userCode1.match(/str/) == null) {
			str = "Your program is incorrect. Use the str function to convert the value returned by the method speed_of_light into text.";
			console.log("Your program is incorrect. Use the str function to convert the value returned by the method speed_of_light into text.");
		}
		else if (consoleOutput.match("299792458") != null)  {
			str = "Awesome! Your program is correct.";
			console.log("Awesome! Your program is correct.");
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise5-9") {
		console.log("checking practice exercise 5-9");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/from \s*Ugc \s*import \s*Ugc/) == null) {
			str = "Your program is incorrect. Import the Ugc class into your program.";
	  		console.log("Your program is incorrect. Import the Ugc class into your program.");
	  	}
		else if (userCode1.match(/\s*=\s*Ugc\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Create an object of the Ugc class.";
			console.log("Your program is incorrect. Create an object of the Ugc class.");
		}
		else if (userCode1.match(/\s*convert_to_local_hours\s*\(\s*5\s*\,\s*3\s*\,\s*10\s*\)/) == null) {
			str = "Your program is incorrect. Use the convert_to_local_time method with arguments 5, 3 and 10.";
			console.log("Your program is incorrect. Use the convert_to_local_time method with arguments 5, 3 and 10.");
		}
		else if (userCode1.match(/print/i) == null) {
			str = "Your program is incorrect. Use the print function to display the output.";
			console.log("Your program is incorrect. Use the print function to display the output.");
		}
		else if (consoleOutput.match("The local time in hours is 1.2") != null)  {
			str = "Nice! Your program is correct.";
			console.log("Nice! Your program is correct.");
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise5-10") {
		console.log("checking practice exercise 5-10");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/from \s*Ugc \s*import \s*Ugc/) == null) {
			str = "Your program is incorrect. Import the Ugc class into your program.";
	  		console.log("Your program is incorrect. Import the Ugc class into your program.");
	  	}
		else if (userCode1.match(/\s*=\s*Ugc\s*\(\s*\)/) == null) {
			str = "Your program is incorrect. Create an object of the Ugc class.";
			console.log("Your program is incorrect. Create an object of the Ugc class.");
		}
		else if (userCode1.match(/\s*convert_to_local_hours\s*\(/) == null) {
			str = "Your program is incorrect. Use the convert_to_local_time method with arguments.";
			console.log("Your program is incorrect. Use the convert_to_local_time method with arguments.");
		}
		else if (userCode1.match(/print/i) == null) {
			str = "Your program is incorrect. Use the print function to display the output.";
			console.log("Your program is incorrect. Use the print function to display the output.");
		}
		else if (consoleOutput.match("24.0") != null)  {
			str = "You did it! Your program is correct.";
			console.log("You did it! Your program is correct.");
		}
		else {
			str = "Your program is incorrect. Check your program and correct the errors.";
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise6-1") {
		console.log("checking practice exercise 6-1");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/while/) == null) {
			console.log("Your program is incorrect. Use the while keyword.");
		}
		else if (userCode1.match(/while \s*i\s*<=\s*5\s*:/) == null) {
			console.log("Your program is incorrect. Check that the condition is i <= 5.");
		}
		else if (userCode1.match(/print/) == null) {
			console.log("Your program is incorrect. Use the print function to display the output.");
		}
		else if (consoleOutput == "0 1 2 3 4 5")  {
			console.log("Awesome! Your program is correct.");
		}
		else {
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise6-2") {
		console.log("checking practice exercise 6-2");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/while/) == null) {
			console.log("Your program is incorrect. Use the while keyword.");
		}
		else if (userCode1.match(/print/) == null) {
			console.log("Your program is incorrect. Use the print function to display the output.");
		}
		else if (consoleOutput == "0 2 4")  {
			console.log("Awesome! Your program is correct.");
		}
		else {
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise6-3") {
		console.log("checking practice exercise 6-3");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/while/) == null) {
			console.log("Your program is incorrect. Use the while keyword.");
		}
		else if (userCode1.match(/print/) == null) {
			console.log("Your program is incorrect. Use the print function to display the output.");
		}
		else if (consoleOutput == "1 3 5")  {
			console.log("Awesome! Your program is correct.");
		}
		else {
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
	else if (clickedLink == "practice_exercise6-3") {
		console.log("checking practice exercise 6-3");
		consoleOutput = consoleOutput.trim().replace(/\n/g, " ");
		if (userCode1.match(/while/) == null) {
			console.log("Your program is incorrect. Use the while keyword.");
		}
		else if (userCode1.match(/print/) == null) {
			console.log("Your program is incorrect. Use the print function to display the output.");
		}
		else if (consoleOutput == "1 3 5")  {
			console.log("Awesome! Your program is correct.");
		}
		else {
			console.log("Your program is incorrect. Check your program and correct the errors.");
		}
	    var no = document.getElementById("editorNumber").value;
	    document.getElementById("output"+no).innerHTML+="<br/>"+str;
		meSpeak.speak(str);
	}
   else if (clickedLink == "practice_exercise6-4") {
			console.log("checking practice exercise 6-4");
			consoleOutput = "'" + consoleOutput.trim().replace(/\n/g, " ")   + "'";
			if (userCode1.match(/while/) == null) {
				console.log("Your program is incorrect. Use the while keyword.");
			}
			else if (userCode1.match(/print/) == null) {
				console.log("Your program is incorrect. Use the print function to display the output.");
			}
			else if (consoleOutput == "1 3 5")  {
				console.log("Good work! Your program is correct.");
			}
			else {
				console.log("Your program is incorrect. Check your program and correct the errors.");
			}
			var no = document.getElementById("editorNumber").value;
	    	document.getElementById("output"+no).innerHTML+="<br/>"+str;
	    	meSpeak.speak(str);
		}
    else {
			passedCheck = false;
			console.log("Program error: invalid link name in checker.js - clickedLink does not match");
		}
	
    
	                                 
}



/**
* This function is used to load configuration and voice files.
* @method preload 
*/ 
function preload() {
    meSpeak.loadConfig('/greenfire/js/mespeak_config.json');
    meSpeak.loadVoice('/greenfire/js/voices/en/en.json');
}

function outf_mod3(text) {
	 // console.log("In outf_mod3");
	 // console.log("The text is" +text);
	 document.getElementById("testingOutput").value += text; 
}



/* 
consoleOutput = "'" +consoleOutput.trim() + "'";
 var prog = 
"import unittest \n" +
"consoleOutput = " + consoleOutput + " \n" +
"def unitUnderTest(): \n    " +
userCode +
"return consoleOutput \n" +
"expectedOutput = 'Opened door' \n" +
"class MyTest(unittest.TestCase): \n " +
"	    def test(self): \n" +
"	        self.assertEqual(unitUnderTest(), expectedOutput) \n" +
"if __name__ == '__main__': \n" +
"    unittest.main()";
       
        console.log(prog);
        Sk.configure({output:outf_mod, read:builtinRead}); 
         var myPromise = Sk.misceval.asyncToPromise(function() {
             return Sk.importMainWithBody("<stdin>", false, prog, true);
         }); 
        
        myPromise.then(function(mod) {
        	console.log("In function then");
            // speak out the output of the program
            var mypre = document.getElementById("output"); 
            //mypre.innerHTML += text; 
            spokenWord=punct(mypre.innerHTML);
            spokenWord=spokenWord.replace("\n", " , ");
           // console.log(spokenWord);
            meSpeak.speak("The program output is, "+spokenWord); 
        },
        function(err) {
        	console.log("In function err - should not reach here; check test unit");
            // speak out the first error in the program
            str = err.toString();
            meSpeak.speak(punct(str));
            console.log(str);
                
            // extract the number of the line that has error
            var substr = str.match(/line \d+/); 
            //console.log(substr);
            var lineNum = substr[0].replace(/\D/g, '');      
           // console.log("This line has error " +lineNum);
                
            // position cursor on line with error
            setCursorPosition(document.getElementById('loquacious'), lineNum);
         });
    	
   //meSpeak.speak(result); */

/*var prog = 
"import unittest \n" +
"run_number = 0 \n" +
"consoleOutput = " + consoleOutput.trim() +" \n" +
"def input(var): \n" +
"    if run_number == 1: \n" +
"        return 'Ari'  \n" +
"    elif run_number == 2: \n" +
"        return 'Merscythe' \n" +
"def unitUnderTest(): \n    " +
userCode +
"return" +consoleOutput +"\n" +
"expectedOutput =" +"'" +desired.trim()  +"'" +"\n" +
"class MyTest(unittest.TestCase): \n " +
"    def test1(self): \n" +
"        global run_number \n" +
"        run_number = 1 \n" +
"     def test2(self): \n" +
"        global run_number \n" +
"        run_number = 2 \n" +
"        self.assertEqual(unitUnderTest(), 'Hello, Ari Access denied Hello, Merscythe Access granted Opened door') \n" +
"if __name__ == '__main__': \n" +
"    unittest.main()";
≈var prog = 
"import unittest \n" +
"consoleOutput = " + consoleOutput.trim() +" \n" +
"def input(var): \n" +
"    return 'Ari'  \n" +
"def unitUnderTest(): \n    " +
userCode +
"return" +consoleOutput +"\n" +
"expectedOutput =" +"'" +desired.trim()  +"'" +"\n" +
"class MyTest(unittest.TestCase): \n " +
"    def test(self): \n" +
"        self.assertEqual(unitUnderTest(), expectedOutput) \n" +
"if __name__ == '__main__': \n" +
"    unittest.main()";*/


 
