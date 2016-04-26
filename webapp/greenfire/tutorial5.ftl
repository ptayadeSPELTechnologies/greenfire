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
         var index = "5-"+id;
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
			padding-top:60px;
		}



		.editor{
			padding-top:60px;
			padding-bottom:420px !important;
		}
		.horizontalloq{
			float: left;
			width: 80%;
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
    
<div class="col-lg-10" >
        <h1 style="position:absolute; top: -50px; padding-bottom: 30px;"><img class='tutorialIconImage'> TUTORIAL 5: METHODS THAT RETURN DATA</h1>
   <div id="main" >
   
   			<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 1

			//////////////////////////////////////////////////////////////////////-->
                  
    <a href="#part1" id="tutorial5part1"><h2><img class='numberIconImage' src='../images/numberIcons/one.png' > Part 1: A few methods that return information</h2></a>
		  <p longdes="first part of tutorial 5 that describes methods that return information" id="part1">
In the previous tutorial, you learned how to give arguments to methods. In this tutorial, you will learn about methods that return useful information back to the program. When Merscythe looks around the beautiful Argenglass tower, he wishes to get more information about the tower. He gets his Codue out and examines the methods in the <code>Tower</code> class. This class has the following methods: <code>get_area()</code>, <code>get_material()</code>, and <code>get_number_of_occupants()</code></br>
A description is included for each method in the class. The <code>get_area()</code> method returns a number that is the size of the tower in square feet. The <code>get_material()</code> method gives the material that the tower is made of, and method <code>get_number_of_occupants()</code> returns the number of inhabitants in the tower currently. 
    </p>
    
    	<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 2

			//////////////////////////////////////////////////////////////////////-->
     <a href="#part2" id="tutorial5part2"><h2><img class='numberIconImage' src='../images/numberIcons/two.png' > Part 2: Using data returned by methods</h2></a>
		  <p longdes="second part of tutorial 5 that describes how to use the data returned by methods" id="part2">   
Merscythe writes a program to check the area first:
<pre id="part12" class="pre">from Tower import Tower 
tower_room = Tower() 
area = tower_room
get_area() 
print area</pre>
Remember that <var>tower_room</var> is a type of <code>Tower</code>, so you must include the first two lines in this program. When the program is run, the <code>get_area()</code> method returns the size of the tower back to the program and stores it in the variable called <var>area</var>. The <code>print</code> statement then displays this number on the screen. Test this program and then modify it to  use the <code>get_material()</code> method. Something inexplicable happens when Merscythe uses the <code>get_number_of_occupants()</code> method as shown below:
<pre id="part12" class="pre">from Tower import Tower 
tower_room = Tower() 
num_occupants = tower_room.get_number_of_occupants() 
print num_occupants</pre>
The variable <var>num_occupants</var> stores the value returned by the class <code>Tower</code>'s <code>get_number_of_occupants()</code> method. When Merscythe runs this program, he is puzzled to see that the value printed on the screen is 4. However, there are only 3 people in the tower: Loog, Herv, and Merscythe himself. After the explosion, when Merscythe and Herv are looking for Loog, Merscythe runs the program again and notices that the value printed out is 2. Merscythe wonders if someone was hiding in the tower previously and may have played a role in kidnapping Loog.</p>

        <!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 5-1: Using the <code>input</code> function</h4></a>
<p>
Write a statement that uses the <code>input</code> function to prompt the user to enter a date as follows: 

Enter today’s date

The <code>input</code> function returns the data typed in by the user. Store this data into a variable called <var>curr_date</var> and display it using a <code>print</code> statement.
</p>

                    <!--  ****  editor  **** -->
						<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr>
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</p></th>
											<th style=" padding-left:10px;float:left; width:400px;"><input type="button" onclick="getSolution(1)" value="Show Answer"></th>

										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(1)'  id='loquacious1' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
												
												<div class='message' id='status1' style='overflow:scroll; '>
												</div> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(1); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick='' class='button'>Reset</button> 
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

        <!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
        
<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 5-2: Displaying data returned by the <code>range</code> function</h4></a>
<p>
The <code>range</code> function returns the generated list. Write a statement to generate the sequence 100, 101, 102, 103 using function <code>range</code> and store the data returned by the function into a list called <var>seq</var>. Display the list using the <code>print</code> function.
</p>

 <!--  ****  editor  **** -->

						<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr >
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"><input type="button" onclick="getSolution(2)" value="Show Answer"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(2)'  id='loquacious2' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
												<div class='message' id='status2' style='overflow:scroll; '>
												</div> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(2); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick='' class='button'>Reset</button> 
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


        <!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
        
<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 5-3: Displaying result returned by the factorial method</h4></a>
<p>
The <code>factorial</code> method in the <code>math</code> class returns the <code>factorial</code> of the argument given to the method. Using this method, write a statement to store the factorial of 5 in the variable <var>five_factorial</var>. Then display the value of this variable using the <code>print</code> function. 
</p>

<!--  ****  editor  **** -->

						<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr >
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"><input type="button" onclick="getSolution(3)" value="Show Answer"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(3)'  id='loquacious3' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
												<div class='message' id='status3' style='overflow:scroll; '>
												</div> 
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

        <!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
        
<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 5-4: </h4></a>
<p>
</p>

 <!--  ****  editor  **** -->

						<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr >
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"><input type="button" onclick="getSolution(4)" value="Show Answer"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(4)'  id='loquacious4' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
												<div class='message' id='status4' style='overflow:scroll; '>
												</div> 
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

        <!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
    

<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 5-5: </h4></a>
<p>
</p>

 <!--  ****  editor  **** -->

					<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr >
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"><input type="button" onclick="getSolution(5)" value="Show Answer"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(5)'  id='loquacious5' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
												<div class='message' id='status5' style='overflow:scroll; '>
												</div> 
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

	<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 3

			//////////////////////////////////////////////////////////////////////-->
   <a href="#part2" id="tutorial5part3"><h2><img class='numberIconImage' src='../images/numberIcons/three.png' > Part 3: Methods that return <code>True</code> or <code>False</code></h2></a>
		  <p longdes="second part of tutorial 5 that describes how to use the data returned by methods" id="part2">  
In the previous tutorials, you have used methods that don't return a value. For example, the open and close methods of class Door perform actions but don't return any value. There are other types of methods that return only one of two values: True or False. Here, <code>True</code> and <code>False</code> are keywords in Python. Note that they are spelled as starting with an uppercase letter and all letters are in lowercase. To see why these methods are useful, we will look at two methods in the <code>Elevator</code> class: <code>at_top</code> and <code>at_bottom</code>. The <code>at_top method</code> returns the value <code>True</code> if the elevator is at the topmost floor; otherwise, it returns the value <code>False</code>. This is helpful in determining if the elevator has reached the top floor. Analogously, the <code>at_bottom</code> method is used to determine if the elevator is at the bottom floor. For example, the following code displays "At top floor" if the elevator has reached the top floor. 
<pre id="part12" class="pre">from GlassElevator import GlassElevator 
glass_elevator = GlassElevator() 
glass_elevator.go_to_floor(target_floor=10) 
if glass_elevator.at_top():    
    print 'at top floor' 
else:    
    print 'not at top floor'</pre>
The condition in the <code>if</code> statement is <code>glass_elevator.at_top()</code>. If the elevator is at the top floor, the value returned by the <code>at_top()</code> method is <code>True</code>, and the action in the <code>if</code> clause will be executed. What happens when you run the program? What happens if you change the argument in the <code>go_to_floor()</code> method to 100? </p>

	<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 4

			//////////////////////////////////////////////////////////////////////-->
   <a href="#part2" id="tutorial5part4"><h2><img class='numberIconImage' src='../images/numberIcons/four.png' > Part 4: Additional practice</h2></a>
		  <p longdes="second part of tutorial 5 that describes how to use the data returned by methods" id="part2">  

        <!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
        
<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 5-6: Comparing values returned by methods</h4></a>
<p>
G-forces are the forces you experience when riding a roller-coaster or even when stationary. These forces are created by acceleration of an object. A stationary object experiences a g-force of 1g, which is force due to gravity with a value of 9.8 m/s2. The method g_forces in the custom class ScienceFacts returns the typical value of g-forces in an object such as a rocket or roller coaster. This method takes one text argument such as “Roller coaster”, “rocket”, or “free fall elevator”. Write a program to compare the g-forces experienced in a roller coaster and a freely falling elevator, and display the text “Roller coaster” or “Elevator” depending on whichever one has greater g-forces.
</p>

<!--  ****  editor  **** -->

					<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr >
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"><input type="button" onclick="getSolution(6)" value="Show Answer"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(6)'  id='loquacious6' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
												<div class='message' id='status6' style='overflow:scroll; '>
												</div> 
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
                    
        <!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
        
<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 5-7: Calling a method as an argument to a method</h4></a>
<p>
A telescope is used for viewing distant objects. It consists of a tube with two glass lenses. The first lens in the front of the tube gathers light rays and focuses it near the back of the tube. A second lens at the end of the tube magnifies the image being viewed. This type of telescope is called a refractor. A different type of telescope, known as reflector, uses a mirror,  instead of a lens,  to gather light. In the custom class <code>ScienceFacts</code>, the method <code>display_telescope_facts()</code> provides interesting facts about different types of telescopes, and takes the name of a telescope as argument. The method <code>get_telescope_name()</code> stores names of famous telescopes and returns a randomly selected name. Write a program that use both methods to display information about a telescope. Run the program several times. 
</p>

<!--  ****  editor  **** -->

					<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr >
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"><input type="button" onclick="getSolution(7)" value="Show Answer"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(7)'  id='loquacious7' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
												<div class='message' id='status7' style='overflow:scroll; '>
												</div> 
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


        <!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
        
<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 5-8: The <code>str</code> function</h4></a>
<p>
The <code>str</code> function takes a numeric value as argument and returns a text representation of the number. This is especially useful when you want to display a variable that stores a number using the <code>print</code> function. For example, assume that variable <var>num</var> stores a number. To display this value, you can use this statement <samp>print ‘The number is’ +str(num)</samp>. After the numeric value is converted to string, you can display it with the other text in the <code>print</code> statement. The method <code>speed_of_light</code> in the custom class <code>ScienceFacts</code> returns the speed of light in meters per second. In this problem, use this method in a <code>print</code> statement to display the speed of light with the following text before it: <samp>The speed of light is</samp>.
</p>

 <!--  ****  editor  **** -->

				<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr>
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"><input type="button" onclick="getSolution(8)" value="Show Answer"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(8)'  id='loquacious8' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
												<div class='message' id='status8' style='overflow:scroll; '>
												</div> 
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
												<div id='output8' style='overflow:scroll; height:100px;'>
												</div>
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

        <!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
        
<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 5-9: The <code>Ugc</code> class</h4></a>
<p>
Time below ground is not the same as time above ground. Merscythe comes to this realization when observes the hands on a watch in Loog’s house moving much faster than those on his own watch. The custom class <code>Ugc</code> represents the underground clock. The method <code>convert_to_local_time_hours</code> in this class takes three arguments in the order hour, minute, and second and returns the local time in hours. Write a program that displays the time below ground when the time above ground is 5 hours, 3 minutes, and 10 seconds.
</p>

    <!--  ****  editor  **** -->

				<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr>
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"><input type="button" onclick="getSolution(9)" value="Show Answer"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(9)'  id='loquacious9' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
												<div class='message' id='status9' style='overflow:scroll; '>
												</div> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(9); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick='' class='button'>Reset</button> 
												<button type='button' onclick='updateEditor(9); sayitMod(9)' class='button'>Say</button> 
												<button type='button' onclick='updateEditor(9); overviewMod(9)' class='button'>Overview</button> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												<p id='dvContent'></p>
											</td>
										</tr> 
										<tr >
											<td >
												<div id='output9' style='overflow:scroll; height:100px;'>
												</div>
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


        <!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
        
<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 5-10: A puzzle</h4></a>
<p>
The class <code>Ugc</code> contains a method called <code>convert_to_local_hours()</code> that takes the above ground time in the order hour, minute, and seconds as arguments, and returns the hour in local time. The method <code>convert_to_local_minutes()</code> is similar except it returns the minutes. Write a program that prints out the number of hours of time below ground that are in an hour of time above ground.
</p>

            <!--  ****  editor  **** -->

				<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr>
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"><input type="button" onclick="getSolution(10)" value="Show Answer"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(10)'  id='loquacious10' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
												<div class='message' id='status10' style='overflow:scroll; '>
												</div> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(10); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick='' class='button'>Reset</button> 
												<button type='button' onclick='updateEditor(10); sayitMod(10)' class='button'>Say</button> 
												<button type='button' onclick='updateEditor(10); overviewMod(10)' class='button'>Overview</button> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												<p id='dvContent'></p>
											</td>
										</tr> 
										<tr >
											<td >
												<div id='output10' style='overflow:scroll; height:100px;'>
												</div>
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
	
				<!-- //////////////////////////////////////////////////////////////////////
							TUTORIAL End

				  //////////////////////////////////////////////////////////////////////-->
				</br>
				<a href="#part18" id="next18">This concludes the tutorial.</a>

				<nav class="vertical" id="bottomnav" alt="end of tutorial 1 navigation menu">
					<ul alt="end of tutorial 1 navigation menu">
						<li>
							<a href="#part3" id="next3">Click to go to next practice exercises for this tutorial</a>
						</li>
						<li alt="link to the next tutorial">
							<a href="tutorial3" id="next11">Click to go to next tutorial</a>
						</li>				
						<li alt="link to the book">
							<a href="tutorial2" id="next12">Click to go Back to the book</a>
						</li>
					</ul>
				</nav>
				<input type="hidden" value="5" id="current"/>
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
				<!--- for web accessibility---->
	<script src="/greenfire/js/access.js"></script>
    
<p id="practiceQuestion1" style="display: none;"></p>
<p id="practiceQuestion2" style="display: none;"></p>
<p id="practiceQuestion3" style="display: none;"></p>
<p id="practiceQuestion4" style="display: none;"></p>
<p id="practiceQuestion5" style="display: none;"></p>
<p id="practiceQuestion6" style="display: none;"></p>
<p id="practiceQuestion7" style="display: none;"></p>
<p id="practiceQuestion8" style="display: none;"></p>
<p id="practiceQuestion9" style="display: none;"></p>
<p id="practiceQuestion10" style="display: none;"></p>
<p id="practiceQuestion11" style="display: none;"></p>

<script type="text/javascript">

function updateEditor(i){
	document.getElementById("editorNumber").value=i;
	document.getElementById("loquacious").value=document.getElementById("loquacious"+i).value;
	document.getElementById("clickedLinkName").value='practice_exercise5-'+i;
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
		alert("this");
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