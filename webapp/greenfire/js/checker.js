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

function checkit() { 
	console.log("In function checkit");
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
				//console.log("Your program is incorrect. Create an object of the Door class in your program.");
				document.getElementById("status").innerHTML="Your program is incorrect. Try again!";    
				meSpeak.speak("Your program is incorrect. Try again!");

			} 
			else if (userCode1.match(/open\s*\(\s*\)/) == null) {
				passedCheck = false;
				//console.log("Your program is incorrect. Use the open method of class Door in your program.");
				document.getElementById("status").innerHTML="Your program is incorrect. Try again!";  
				meSpeak.speak("Your program is incorrect. Try again!");
			}
			else {
				passedCheck = true;
				console.log("Hurrah! Your program is correct. Chapter 2 will be unlocked.");
				meSpeak.speak("Hurrah! Your program is correct. Chapter 2 will be unlocked.");
				document.getElementById("status").innerHTML="Hurrah! Your program is correct. Chapter 2 will be unlocked.";    
				chapter_unlocked = 2;
				loadNextChapter();
				}
		}
		 else {
			passedCheck = false;
			console.log("Sorry, the output of your program is incorrect. The correct output is 'Opened door'.");
			document.getElementById("status").innerHTML="Sorry, the output of your program is incorrect. The correct output is 'Opened door'.";
			meSpeak.speak("Sorry, the output of your program is incorrect. The correct output is 'Opened door'.");
			//console.log("Hint: The Door class two methods open and close for opening and closing a door, respectively.");
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
			loadNextChapter();
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
	   	            		 
	   	            		loadNextChapter();
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
				console.log("Hurrah! Your program is correct. Chapter 5 will be unlocked.");
				chapter_unlocked = 2;
				loadNextChapter();
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
 				console.log("Hurrah! Your program is correct. Chapter 6 will be unlocked.");
 				chapter_unlocked = 6;
 				loadNextChapter();
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
  				loadNextChapter();
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
 	   	            		 
 	   	            		loadNextChapter();
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
}
    
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


 
