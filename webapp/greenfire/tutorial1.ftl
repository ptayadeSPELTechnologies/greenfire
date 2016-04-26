<!DOCTYPE html>
<html lang="en-US">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script> 
    <script src="/greenfire/js/skulpt_modified.js" type="text/javascript"></script> 
    <script src="/greenfire/js/skulpt-stdlib.js" type="text/javascript"></script> 
    <script src = "/greenfire/js/mespeak.js" type="text/javascript"></script>

    <script>

function getSolution(id){

      console.log("Get solution");
      // parse the index from the name of link clicked; for example, tutorial1 has index 1.
          //console.log("linkname" +linkname.substr(17,19));
      // put the filenumber in the name 
         var index = "1-"+id;
     	 var datafile1 = "/greenfire/xml_files/practice_exercise" + index + "solution.xml";
  	
  			          //read data from practice_exerciseX-Xsolution.xml file
  			          // this problem will be displayed in editor
		      $.ajax({
		         type: "GET",
		         url: datafile1,
		         dataType: "xml",
		         success: function(xml){
		            console.log(datafile1);
				        var data = $(xml).find('Data').text();
				        console.log(data);
				        $("#loquacious"+id).val(data);
		            },
		            error: function() {
		            	alert("An error occurred while processing XML file.");
		            }
		   });
     }
</script>
	<style type="text/css">
		h2 , h4 {
			text-transform: uppercase;
		}



		.editor{
			padding-top:60px;
			padding-bottom:420px !important;
		}
		.horizontalloq{
			float: left;
			width: 100%;
			background-color: #f5f5f5;
			border: 1px solid #ccc;
			border-radius: 4px;
			padding-left: 5%;
			padding-top: 2%;
		}

		.message{

			padding-left: 5%;
			padding-right: 5%;
			height:100%;
			float: right;
		}

		.horizontalLoqTable{
			width: 100%;
		}
        
	</style>

	<div class="col-lg-8" >
		<div >
		<!--
			<div style="top:-45px; position:relative; float:right; padding-right:2%;">
            <h3 style="color:#888888">Feedback Level</h3>
            <nav class="horizontal">
	            <ul style="color:white;" >
	              <li style="width: 100px;">Low  &nbsp;&nbsp;    </li>
	              <li style="width: 100px;">&nbsp; &nbsp; &nbsp;&nbsp; Medium   &nbsp;&nbsp;  </li>
	              <li style="width: 100px;">&nbsp; &nbsp; &nbsp;&nbsp;High</li>
	            </ul>
         	</nav>
              <div class="bootstrap-switch bootstrap-switch-wrapper bootstrap-switch-on bootstrap-switch-animate" style="width: 102px;"><div class="bootstrap-switch-container" style="width: 150px; margin-left: 0px;"><span class="bootstrap-switch-handle-on bootstrap-switch-primary" style="width: 50px;">ON</span><span class="bootstrap-switch-label" style="width: 50px;">&nbsp;</span><span class="bootstrap-switch-handle-off bootstrap-switch-default" style="width: 50px;">OFF</span><input type="radio" name="radio2" checked="" data-radio-all-off="true" class="switch-radio2"></div></div>
              <div class="bootstrap-switch bootstrap-switch-wrapper bootstrap-switch-off bootstrap-switch-animate" style="width: 102px;"><div class="bootstrap-switch-container" style="width: 150px; margin-left: -50px;"><span class="bootstrap-switch-handle-on bootstrap-switch-primary" style="width: 50px;">ON</span><span class="bootstrap-switch-label" style="width: 50px;">&nbsp;</span><span class="bootstrap-switch-handle-off bootstrap-switch-default" style="width: 50px;">OFF</span><input type="radio" name="radio2" data-radio-all-off="true" class="switch-radio2"></div></div>
              <div class="bootstrap-switch bootstrap-switch-wrapper bootstrap-switch-off bootstrap-switch-animate" style="width: 102px;"><div class="bootstrap-switch-container" style="width: 150px; margin-left: -50px;"><span class="bootstrap-switch-handle-on bootstrap-switch-primary" style="width: 50px;">ON</span><span class="bootstrap-switch-label" style="width: 50px;">&nbsp;</span><span class="bootstrap-switch-handle-off bootstrap-switch-default" style="width: 50px;">OFF</span><input type="radio" name="radio2" data-radio-all-off="true" class="switch-radio2"></div></div>
            </div>
        -->
        <h1 class="tutorialHeading" > <!--<img class='tutorialIconImage' > -->TUTORIAL 1: OBJECTS AND CLASSES </h1>

			

				<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 1

				  //////////////////////////////////////////////////////////////////////-->
			 <div class="tutorial-section">

				<a href="#part1" id="tutorial1part1ID">
					<h2 class="part"><img class='numberIconImage' src='../images/numberIcons/one.png' > PART 1: Introduction to Object and Classes</h2>
				</a>

					<p longdes="first part of tutorial 1 text that explains the concept of objects and classes" id="part1">
						As Merscythe proceeds on his adventures, he is going to encounter doors, vaults, and many other objects. How can these objects be controlled? Hidden away in the new world that Merscythe is about to enter is a library with classes. A <dfn>class</dfn> is used to create an object and control it.
						Let us examine the program in more detail. The first line is: 
						<pre id="part2" class="pre">from Door import Door</pre>
						This line is telling us that the library has a class called <code>Door</code> that we want to use in this program. This statement creates an object of class <code>Door</code> with the name <var>treedoor</var>:
						<pre id="part3" class="pre">treedoor = Door()</pre>
						The name of the object must be on the left hand side of the equals sign, and the name of the class on the right hand side of the equals sign. The class name is followed by parentheses. 
					</p>

			</div> <!-- End of tutorial section -->

					<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

			<div class="exercise-section">

				<div class="exercise-single">

					<a href="#part2" id="next2" class="part">
						<h4 class="exercise"> <img class='exerciseIconImage' > Practice Exercise 1-1: Creating an object </h4>
					</a>

						<p>
							The class <code>ScienceFacts</code> contains interesting facts and numbers. This is a custom class because it is not built into the Python programming language. Create an object of this class called <var>science</var>. 
						</p>

						<!--  ****  editor  **** -->
						<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr>
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</p></th>
											<th style=" padding-left:10px;float:left; width:400px;"></th>

										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(1)'  id='loquacious1' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td > 
                                            
												<img id='happyDog1'  style='width:128px;height:128px;' src='../images/TutorialAnimation/dogs/waitingDog1.png' alt="a dog image" >
                                            
                                                </br>
                                                </br>
												<input type="button" onclick="getSolution(1)" value="Show Answer">
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(1); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick="reset(1)" class='button'>Reset</button> 
												<button type='button' onclick='updateEditor(1); sayitMod(1)' class='button'>Say</button> 
												<button type='button' onclick='updateEditor(1); overviewMod(1)' class='button'>Overview</button> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												<p id='dvContent'></p>
											</td>
										</tr> 
										<tr >
											<td >
												<div id='output1' style='overflow:scroll; height:100px;'>
												</div>
                                                <br>
                                                <a href="#loquacious1">Go back to Exercise 1-1</a>
                                                
											</td>
										</tr>
										<tr>
											<td>
												<div id='mycanvas'></div> 
											</td>
										</tr>  
									</table> 
								</form> 
							</div>
                           
						</div> <!-- End of exercise-single -->           

					<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

					<div class="exercise-single">

					<a href="#part3" id="next3">
                    <h4 class="exercise"><img class='exerciseIconImage' > Practice Exercise 1-2: Creating an object </h4>
					</a>

						<p>
							The custom class <code>Elevator</code> contains methods to control elevators. Create an object of this class called <var>elevator1</var>. 
						</p>

						<!--  ****  editor  **** -->

						<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr >
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(2)' id='loquacious2' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
                                            <img id='happyDog2' style='width:128px;height:128px;' src='../images/TutorialAnimation/dogs/waitingDog2.png' alt="a dog image">
												 </br></br>
                                                 <input type="button" onclick="getSolution(2)" value="Show Answer">
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(2); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick='reset(2);' class='button'>Reset</button> 
												<button type='button' onclick='updateEditor(2); sayitMod(2)' class='button'>Say</button> 
												<button type='button' onclick='updateEditor(2); overviewMod(2)' class='button'>Overview</button> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												<p id='dvContent'></p>
											</td>
										</tr> 
										<tr >
											<td >
												<div id='output2' style='overflow:scroll; height:100px;'>
												</div>
                                                <br>
                                                <a href="#loquacious2">Go back to Exercise 1-2</a>
											</td>
										</tr>
										<tr>
											<td>
												<div id='mycanvas'></div> 
											</td>
										</tr>  
									</table> 
								</form> 
							</div>
						</div>

					</div> <!-- End of exercise-single -->  
				</div> <!-- End of Exercise section -->   

		<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 2

				  //////////////////////////////////////////////////////////////////////-->

			<div class="tutorial-section">

				<a href="#part4" id="next4">
					<h2 class="part"><img class='numberIconImage' src='../images/numberIcons/two.png' > Part 2: Introduction to Methods</h2>
				</a>

					<p longdes="second part of tutorial 1 text that explains the concept of methods" id="part2">
						These objects can be programmed with behaviors using the Python programming language. What do we mean by behaviors? Around your room, there may be doors, windows, books, balls, and other objects. Each object has specific behaviors that indicate how it is used. For example, doors and windows can open and close, and balls can roll and bounce.

						Merscythe has come across a simple door object that has two behaviors: open and close. A behavior is also called a method. A <dfn>method</dfn> describes the operations that the object can perform. The method name must be followed by a pair of parentheses. For example, the class called <code>Door</code> has a method called <code>open()</code> that can be used to open doors, and another method called <code>close()</code> that can be used to close doors. The door is programmed to close via the following line of code:
						<pre id="part4" class="pre">treedoor.close()</pre>
						Here, the object’s name is <var>treedoor</var> and its behavior is <code>close</code>. In Python, a dot is placed between the name of the object and the behavior. In his adventures, Merscythe will need to use his skill and ingenuity to program and control other types of objects. 
					</p>
					
			</div> <!-- End of tutorial section -->

		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

			<div class="exercise-section">

				<div class="exercise-single">
					<a href="#part5" id="next5" class="part">
						<h4 class="exercise"><img class='exerciseIconImage' > Practice Exercise 1-3: Calling a method  </h4>
					</a>

						<p>
							The custom class <code>ScienceFacts</code> contains a method <code>display_speed_of_light</code> that prints out the speed of light in meters per second. Write a program to display this value.  
						</p>

						<!--  ****  editor  **** -->

						<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr >
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(3)' id='loquacious3' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
                                            <img id='happyDog3' style='width:128px;height:128px;' src='../images/TutorialAnimation/dogs/waitingDog3.png' alt="a dog image">
												</br></br>
                                                <input type="button" onclick="getSolution(3)" value="Show Answer">
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(3); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick='' class='button'>Reset</button> 
												<button type='button' onclick='updateEditor(3); sayitMod(3)' class='button'>Say</button> 
												<button type='button' onclick='updateEditor(3); overviewMod(3)' class='button'>Overview</button> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												<p id='dvContent'></p>
											</td>
										</tr> 
										<tr >
											<td >
												<div id='output3' style='overflow:scroll; height:100px;'>
												</div>
                                                <br>
                                                <a href="#loquacious3">Go back to Exercise 1-3</a>
											</td>
										</tr>
										<tr>
											<td>
												<div id='mycanvas'></div> 
											</td>
										</tr>  
									</table> 
								</form> 
							</div>
						</div>
					</div> <!-- End of exercise-single -->     


		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->	


				<div class="exercise-single">

					<a href="#part6" id="next6">
						<h4 class="exercise"><img class='exerciseIconImage' > Practice Exercise 1-4: Calling a method </h4>
					</a>

						<p>
							The custom class <code>ScienceFacts</code> contains a method <code>display_age_of_earth</code> that prints out the age of earth. Write a program to display this value.  
						</p>


						<!--  ****  editor  **** -->

						<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr >
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(4)' id='loquacious4' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
                                            <img id='happyDog4' style='width:128px;height:128px;' src='../images/TutorialAnimation/dogs/waitingDog4.png' alt="a dog image">
												 </br></br>
                                                 <input type="button" onclick="getSolution(4)" value="Show Answer">
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(4); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick='' class='button'>Reset</button> 
												<button type='button' onclick='updateEditor(4); sayitMod(4)' class='button'>Say</button> 
												<button type='button' onclick='updateEditor(4); overviewMod(4)' class='button'>Overview</button> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												<p id='dvContent'></p>
											</td>
										</tr> 
										<tr >
											<td >
												<div id='output4' style='overflow:scroll; height:100px;'>
												</div>
                                                <br>
                                                <a href="#loquacious4">Go back to Exercise 1-4</a>
											</td>
										</tr>
										<tr>
											<td>
												<div id='mycanvas'></div> 
											</td>
										</tr>  
									</table> 
								</form> 
							</div>
						</div>

					</div> <!-- End of exercise-single -->  

				</div> <!-- End of Exercise section -->     

		<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 2

			//////////////////////////////////////////////////////////////////////-->

			<div class="tutorial-section">

				<a href="#part7" id="next7">
					<h2 class="part"><img class='numberIconImage' src='../images/numberIcons/three.png' > Part 3: Names for methods and objects</h2>
				</a>

					<p longdes="third part of tutorial 1 text that explains how to create names for methods and objects" id="part7">
						Note that <var>treedoor</var> is a single word and there is no space between the words tree and door. In the Python programming language, it is also common to create new words using an underscore, so the word <var>treedoor</var> could also be written as <var>tree_door</var>. The case of the letters in each word is important. The name <var>treedoor</var> is written using lower case letters only - changing the case of any letter in this word will result in an error in the program and it will not run.  The class name <code>Door</code> starts with an uppercase letter, so you should follow this convention in the program.  
					</p>

			</div> <!-- End of tutorial section -->

		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->	

			<div class="exercise-section">

				<div class="exercise-single">

					<a href="#part8" id="next8">
						<h4 class="exercise"><img class='exerciseIconImage' > Practice Exercise 1-5: Calling a method </h4>
					</a>

					<p>
						The method <code>display_time_light_travels</code> in custom class <code>ScienceFacts</code> displays the time it takes for light to travel from the Sun to the Earth. Write a program that calls this method.  
					</p>


				  <!--  ****  editor  **** -->

					<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr >
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(5)' id='loquacious5' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
                                            <img id='happyDog5' style='width:128px;height:128px;' src='../images/TutorialAnimation/dogs/waitingDog5.png' alt="a dog image">
												</br> </br> 
                                                 <input type="button" onclick="getSolution(5)" value="Show Answer">
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(5); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick='' class='button'>Reset</button> 
												<button type='button' onclick='updateEditor(5); sayitMod(5)' class='button'>Say</button> 
												<button type='button' onclick='updateEditor(5); overviewMod(5)' class='button'>Overview</button> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												<p id='dvContent'></p>
											</td>
										</tr> 
										<tr >
											<td >
												<div id='output5' style='overflow:scroll; height:100px;'>
												</div>
                                                <br>
                                                <a href="#loquacious5">Go back to Exercise 1-5</a>
											</td>
										</tr>
										<tr>
											<td>
												<div id='mycanvas'></div> 
											</td>
										</tr>  
									</table> 
								</form> 
							</div>
						</div>
					</div> <!-- End of exercise-single -->     

		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->	

				<div class="exercise-single">

					<a href="#part9" id="next9">
						<h4 class="exercise"><img class='exerciseIconImage' > Practice Exercise 1-6: Calling a method </h4>
					</a>

					<p>
						The custom class <code>ScienceFacts</code> contains a method <code>display_age_of_earth</code> that prints out the age of earth. Write a program to display this value.  
					</p>


					<!--  ****  editor  **** -->

					<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr >
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(6)' id='loquacious6' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
                                            <img id='happyDog6' style='width:128px;height:128px;' src='../images/TutorialAnimation/dogs/waitingDog6.png' alt="a dog image">
                                            </br></br>
												 <input type="button" onclick="getSolution(6)" value="Show Answer">
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(6); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick='' class='button'>Reset</button> 
												<button type='button' onclick='updateEditor(6); sayitMod(6)' class='button'>Say</button> 
												<button type='button' onclick='updateEditor(6); overviewMod(6)' class='button'>Overview</button> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												<p id='dvContent'></p>
											</td>
										</tr> 
										<tr >
											<td >
												<div id='output6' style='overflow:scroll; height:100px;'>
												</div>
                                                <br>
                                                <a href="#loquacious6">Go back to Exercise 1-6</a>
											</td>
										</tr>
										<tr>
											<td>
												<div id='mycanvas'></div> 
											</td>
										</tr>  
									</table> 
								</form> 
							</div>
						</div>
					</div> <!-- End of exercise-single -->     


		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->	

				<div class="exercise-single">

					<a href="#part10" id="next10">
						<h4 class="exercise" ><img class='exerciseIconImage' > Practice Exercise 1-7: Calling a method </h4>
					</a>

					<p>
						The custom class <code>Door</code> has a method called <code>lock</code>. Write a program that uses this method.   
					</p>

					<!--  ****  editor  **** -->

					<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr >
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(7)' id='loquacious7' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
                                            <img id='happyDog7' style='width:128px;height:128px;' src='../images/TutorialAnimation/dogs/waitingDog7.png' alt="a dog image">
                                            </br></br>
                                            <input type="button" onclick="getSolution(7)" value="Show Answer">
												
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(7); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick='' class='button'>Reset</button> 
												<button type='button' onclick='updateEditor(7); sayitMod(7)' class='button'>Say</button> 
												<button type='button' onclick='updateEditor(7); overviewMod(7)' class='button'>Overview</button> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												<p id='dvContent'></p>
											</td>
										</tr> 
										<tr >
											<td >
												<div id='output7' style='overflow:scroll; height:100px;'>
												</div>
                                                <br>
                                                <a href="#loquacious7">Go back to Exercise 1-7</a>
											</td>
										</tr>
										<tr>
											<td>
												<div id='mycanvas'></div> 
											</td>
										</tr>  
									</table> 
								</form> 
							</div>
						</div>
					</div> <!-- End of exercise-single -->    
				</div> <!-- End of Exercise section -->   

		<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 4

				  //////////////////////////////////////////////////////////////////////-->

			<div class="tutorial-section">

				<a href="#part11" id="next11">
					<h2 class="part"><img class='numberIconImage' src='../images/numberIcons/four.png' > Part 4: Correcting errors and running your program </h2>
				</a>

				<p longdes="fourth part of tutorial 1 text that explains some reasons for errors in your program" id="part11">
					This brings us to the last line of the program, which will cause the treedoor to close when the program is run:
					<code>treedoor.close()</code>

					What should Merscythe change this statement to? After the program is changed, you will need to run the program to see the changes in action. The program will not run if it contains errors. For example, if you forget to add the dot between the words treedoor and close, mistype these words, or make other mistakes, the error messages will be read out when the program is run. You will need to correct the errors and rerun the program. After you have written or modified the program in the editor, run the program. The output of the program will be displayed on the screen and read aloud. If the output is correct, the next chapter will be unlocked so that Merscythe can continue on his adventures.  
				</p>

			</div> <!-- End of tutorial section -->

		<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 5

		//////////////////////////////////////////////////////////////////////-->

			<div class="tutorial-section">

				<a href="#part12" id="next12">
					<h2 class="part"><img class='numberIconImage' src='../images/numberIcons/five.png' > Part 5: Using comments your program </h2>
				</a>
				<p longdes="fifth part of tutorial 1 text that explains how you can use comments in your program" id="part12">
					A <dfn>comment</dfn> consists of text that is not part of the program but is used to explain the purpose of the program or a statement of code. It starts with the hash symbol # and extends to the end of the line.  It is good programming practice to add meaningful comments to your program to make it easier to understand.  
				</p>

			</div> <!-- End of tutorial section -->

		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->	

		<div class="exercise-section">

			<div class="exercise-single">

				<a href="#part13" id="next13">
					<h4 class="exercise" ><img class='exerciseIconImage' > Practice Exercise 1-8: Using comments </h4>
				</a>

				<p>
					In this exercise, insert comments in the following program.

				<!--<pre id="part13" class="pre">from Door import Door

				treedoor = Door()
				treedoor.close()</pre>-->

				</p>

				<!--  ****  editor  **** -->

				<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr>
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(8)' id='loquacious8' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
                                            <img id='happyDog8' style='width:128px;height:128px;' src='../images/TutorialAnimation/dogs/waitingDog8.png' alt="a dog image">
                                            </br></br>
                                            <input type="button" onclick="getSolution(8)" value="Show Answer">
												 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(8); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick='' class='button'>Reset</button> 
												<button type='button' onclick='updateEditor(8); sayitMod(8)' class='button'>Say</button> 
												<button type='button' onclick='updateEditor(8); overviewMod(8)' class='button'>Overview</button> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												<p id='dvContent'></p>
											</td>
										</tr> 
										<tr >
											<td >
												<div id='output8' >
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div id='mycanvas' style='overflow:scroll; height:100px;' ></div> 
                                                <br>
                                                <a href="#loquacious8">Go back to Exercise 1-8</a>
											</td>
										</tr>  
									</table> 
								</form> 
							</div>
					</div> <!-- End of exercise-single -->   
				</div> <!-- End of Exercise section -->    

		<!-- //////////////////////////////////////////////////////////////////////
							TUTORIAL End

				  //////////////////////////////////////////////////////////////////////-->
				
         <div style="width: 500px;">
                </br>
				This concludes the tutorial.
                </br>
                </br>

				<nav class="vertical" id="bottomnav" alt="end of tutorial 1 navigation menu">
					<ul alt="end of tutorial 1 navigation menu">
						<li>
							<a  id="next3">Click to go to previous tutorial</a>
						</li>
						<li alt="link to the next tutorial">
							<a href="tutorial2" id="next11">Click to go to next tutorial</a>
						</li>				
						<li alt="link to the book">
							<a href="book1" id="next12">Click to go the Book</a>
						</li>
					</ul>
				</nav>
                
                    </div>
				<input type="hidden" value="1" id="current"/>
				<form name= 'solution'>
		           <input type=hidden id='desiredoutput' value=''/>
		           <input type=hidden id='clickedLinkName' value=''/>
		           <input type=hidden id='testingOutput' value=''/>
		           <textarea  style="display:none"  id='loquacious' ></textarea>
		           <input type=hidden id='editorNumber' value=''/>
		           <textarea style="display:none" id="output" onchange="printOutput()"></textarea>
		        </form>
                
                
            
			</div>
		</div>
	</div>
		<!--- for web accessibility-->
<!--<script src="/greenfire/js/access.js"></script>-->


<p id="practiceQuestion1" style="display: none;"></p>
<p id="practiceQuestion2" style="display: none;"></p>
<p id="practiceQuestion3" style="display: none;"></p>
<p id="practiceQuestion4" style="display: none;"></p>
<p id="practiceQuestion5" style="display: none;"></p>
<p id="practiceQuestion6" style="display: none;"></p>
<p id="practiceQuestion7" style="display: none;"></p>
<p id="practiceQuestion8" style="display: none;">from Door import Door

treedoor = Door()
treedoor.close()

</p>

</div>
</section>

<script type="text/javascript">

function updateEditor(i){
	document.getElementById("editorNumber").value=i;
	        document.getElementById("loquacious").value=document.getElementById("loquacious"+i).value;
	document.getElementById("clickedLinkName").value='practice_exercise1-'+i;
}

function reset(i){
   
     document.getElementById("happyDog"+i).src="../images/TutorialAnimation/dogs/waitingDog"+i+".png";

}


function sayitMod(i){
	var data=document.getElementById("loquacious"+i).value;
	sayit(data);
}

function overviewMod(i){
	var element=document.getElementById("loquacious"+i);
	overview(element);
}

function Running(){

		var no=document.getElementById("editorNumber").value;
		document.getElementById("output"+no).innerHTML="Running...";
}

function printOutput(){

		var no=document.getElementById("editorNumber").value;
		document.getElementById("output"+no).innerHTML=document.getElementById("output").value;
}

function focusAlert(i) {
   updateEditor(i);
}

$("#textarea").on('change keyup paste', function() {
   	printOutput();
});

</script>
    <script src = "/greenfire/js/loquacious_with_testing.js" type="text/javascript"></script> 
    <script src = "/greenfire/js/checker_tutorial.js" type="text/javascript"></script> 

    

