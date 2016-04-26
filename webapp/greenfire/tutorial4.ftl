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
         var index = "4-"+id;
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
		<h1 style="position:absolute; top: -50px; padding-bottom: 30px;"><img class='tutorialIconImage' > TUTORIAL 4: PROVIDING ARGUMENTS TO METHODS</h1>

			<div id="main" >
            
            		<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 1

				  ///////////////////////////////////////////////////////////////////////////-->
                  
                  <a href="#part1" id="tutorial4part1">
					<h2><img class='numberIconImage' src='../images/numberIcons/one.png' > Part 1: Using arguments to move the glass elevator</h2>
				</a>


		  <p longdes="first part of tutorial 4 that explains why arguments are given to methods" id="part1">
          
      As you have already seen, in Merscythe's new world objects are controlled using methods. For example, doors are opened and closed using the methods <code>open()</code> and <code>close()</code> of the <code>Door</code> class, alarms are enabled and disabled through the methods <code>enable()</code> and <code>disable()</code> of the <code>Alarm</code> class. In this part of the story, Merscythe has to program an elevator. The class <code>GlassElevator</code>, which is one word, contains several methods, including the <code>go_to_floor()</code> method that dispatches the elevator to the desired floor. However, Merscythe encounters a problem when  he uses this method:</br>
<pre id="part2" class="pre">glass_elevator = GlassElevator()
glass_elevator.go_to_floor()</pre>
The problem is that method <code>go_to_floor()</code> has not been provided the number of the destination floor, and so the elevator does not know which floor to go to. Luckily, this problem can be resolved easily by specifying the floor number within the parentheses. For example, this statement sends the elevator to floor 5:</br>
<code>glass_elevator.go_to_floor(5)</code></br>
The value 5 is called an argument to the method. <dfn>Arguments</dfn> are values that are given to methods and used within the method to perform the desired action. To go to a different floor, Merscythe would need to change this argument to the target floor number.</p>

			<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

 <a href="#part3" id="next3"><h4><img class='exerciseIconImage' > Practice Exercise 4-1: Method with one argument</h4></a>
            <p>
The custom class <code>ScienceFacts</code> has a method <code>display_animal_facts</code> that displays information about some animals, such as capybara, prairie dog, and armadillo. It takes the type of the animal as argument. Write a program to display information about the capybara. 
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
						</div></br>

            
                 <!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 2

				  //////////////////////////////////////////////////////////////////////-->

    <a href="#part4" id="next4"><h2><img class='numberIconImage' src='../images/numberIcons/two.png' > Part 2: Defining methods with parameters</h2></a>
		  <p longdes="second part of tutorial 4 that explains parameters" id="part4">
Note that you can only give arguments to methods that are defined with parameters. A parameter is a variable in the method's definition that is a placeholder for any argument. The method <code>go_to_floor</code> is defined in the following manner in the class <code>GlassElevator</code>:</br>
<code>def go_to_floor(target_floor)</code></br>
The keyword <code>def</code>, spelled d-e-f, tells us that this is the definition of the method <code>go_to_floor()</code>. This method takes one parameter called <var>target_floor</var>, which is the number of the destination floor. The argument 5 gets copied into this parameter <var>target_floor</var> in the method's definition when the program is run. The method contains programming statements that tell the elevator how to move to the target floor. To keep things simple, we will not discuss any of the code within this method for now.</br>
Unlike method <code>go_to_floor</code>, the method <code>open</code> in class <code>Door</code> does not take any parameters, and is defined as follows:</br>
<code>def open()</code></br>
This is not entirely true, because all methods have at least one parameter called <code>self</code>. However, you don't need to understand why this parameter is needed until you are ready to start writing classes on your own, so we will ignore this parameter for now.</br>

			<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
            
<a href="#part8" id="next8"><h4><img class='exerciseIconImage' > Practice Exercise 4-2: Method with one argument</h4></a>
    <p>
The custom class <code>ScienceFacts</code> has a method <code>display_animal_facts()</code> that displays information about some animals. In this problem, you are given the additional information about the parameter in the method definition:</br>
<code>def display_animal_facts(name)</code></br>
  

Write a program to display information about the armadillo; however, in the method give the parameter name along with the argument. 
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
						</div></br>
                        

			<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

 <a href="#part5" id="next5"><h4><img class='exerciseIconImage' > Practice Exercise 4-3: Method with one argument</h4></a>
            <p>
Python has a built-in class called <code>math</code> that has many methods, such as <code>factorial</code>, <code>floor</code>, and <code>fsum</code>, to perform mathematical operations. For example, the factorial of number 5 is given by the product of all numbers from 1 to 5. The <code>factorial</code> method takes one argument, which is the number whose factorial is to be determined. You can use this method as follows to find the factorial of 5:</br>

<code>math.factorial(5)</code></br>


Write a program to calculate the factorial of 10 using this method and display it. 
            <p>
            
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
						</div></br>
            
                 
            		<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 3

				  ///////////////////////////////////////////////////////////////////////////-->
                  
<a href="#part6" id="next6"><h2><img class='numberIconImage' src='../images/numberIcons/three.png' > Part 3: Methods with two or more arguments</h2></a>
		  <p longdes="third part of tutorial 4 that explains how to use methods that take two or more arguments" id="part6">

To summarize what we have discussed so far, when the definition of a method in a class contains one parameter, you will invoke that method with one argument in your program. Methods can be defined with more than one parameter, and we discuss these next.
Suppose that the method <code>go_to_floor</code> in the <code>GlassElevator</code> class had been defined with two parameters to allow the programmer to control the speed of the elevator:</br>
<code>def go_to_floor(target_floor, speed)</code></br>
The first parameter in this method's definition is the target floor and the second parameter is the elevator's speed in miles/hour. The order of arguments given to the method in the program must correspond to the order of the parameters in the method's definition. The glass elevator can be programmed to move to the negative 10th floor at a whopping speed of 100 miles per hour as follows:</br>
<code>glass_elevator.go_to_floor(-10, 100)</code></br>
 The first number, negative 10, corresponds the first parameter, <var>target_floor</var>, and the second argument of 100 corresponds to the second parameter called <var>speed</var>. </p>
 
      
            		<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 4

				  ///////////////////////////////////////////////////////////////////////////-->
 
 <a href="#part7" id="next7"><h2><img class='numberIconImage' src='../images/numberIcons/four.png' > Part 4: Order of arguments in methods</h2></a>
		  <p longdes="fourth part of tutorial 4 that explains why the order of arguments is important in methods" id="part7">

 What would happen if the order of the arguments was reversed accidentally? The target floor would be set to 100 and the speed to -10. The results could be disastrous! So make sure that you give the arguments in the correct order to any method. To avoid making mistakes, you can also specify the name of each parameter explicitly when you use the method in the program. For example,</br>
<code>glass_elevator.go_to_floor(target_floor=-10, speed=100)</code></br>
Now, when you give the name of the parameter, you can change the order of the arguments and there will not be any ill-effects. Therefore, the following is correct as well:</br>
<code>glass_elevator.go_to_floor(speed=100, target_floor=-10)</code></br>


		
  			<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
  
<a href="#part9" id="next9"><h4><img class='exerciseIconImage' > Practice Exercise 4-4: Method with two arguments</h4></a>
   <p>
The <code>pow(x, y)</code>  method in the <code>math</code> class returns the value of the first argument <var>x</var> raised to the power of the second argument <var>y</var>. Write a program to display the value of 10.5 raised to the power of 3. 
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
						</div></br>

     
            		<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 5

				  ///////////////////////////////////////////////////////////////////////////-->


 <a href="#part10" id="tutorial4part5"><h2><img class='numberIconImage' src='../images/numberIcons/five.png' > Part 5: Giving arguments to functions</h2></a>
		  <p longdes="fifth part of tutorial 4 that explains how to give arguments to functions" id="part10">

You've seen that classes contain methods and have also learnt about functions such as <code>input()</code> and <code>print</code> that can perform other types of operations. What is the difference between a function and a method? A method is associated with a class, so it is used to control an object. On the other hand, a function is not associated with any specific object and is more general. Any method can be written as a function, but it is less intuitive to do so. After all, we don't want a door to move like an elevator or sound an alarm. So it's a good idea to make <code>go_to_floor()</code> a method in the <code>GlassElevator</code> class and <code>enable()</code> a method in the <code>Alarm</code> class. On the other hand, <code>input()</code> and <code>print</code> are not associated with specific classes because all programs may need to use them; therefore, these are functions.</p> 

    			<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
                
<a href="#part11" id="next11"><h4><img class='exerciseIconImage' > Practice Exercise 4-5: Function with two arguments</h4></a>
      <p>
The <code>divmod(x, y)</code> function is a built-in function that takes two arguments <var>x</var> and <var>y</var>, and returns their integer quotient and remainder. Use this function, write a program to display the quotient and remainder when 500 is divided by 24. 
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
					</div></br>


			<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
            
<a href="#part12" id="next12"><h4><img class='exerciseIconImage' > Practice Exercise 4-6: Function with one argument</h4></a>
        <p>
We revisit the <code>input</code> function here. This function takes some text as argument and displays that text on the screen when the program is run. It also reads the data typed in by the user. Using function <code>input</code>, write a statement that displays the following text on the screen: </br>
<samp>Enter today’s date </samp>
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
					</div></br>
        
        			<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
                    
<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 4-7: Function with two arguments</h4></a>
        <p>
A built-in function in Python is <code>range()</code> that is used for generating a sequence of numbers. This function can take 1, 2, or even 3 arguments. For example, <code>range(5, 10)</code> generates a list of numbers starting at 5 and ending at 9. The second argument to the function will never be a part of the sequence. Write a statement using <code>range</code> to generate the list 10, 11, 12, 13, 14 and display it. 
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
					</div></br>
        
        			<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

<a href="#part14" id="next14"><h4><img class='exerciseIconImage' > Practice Exercise 4-8: Function with any number of arguments</h4></a>
        <p>
Similar to methods, <dfn>variadic</dfn> functions can take any number of arguments. An example is the <code>print</code> function. This function can be used both with and without parenthesis. For example, in the following <code>print</code> statement, the variables <var>name1</var> and <var>name2</var> are substituted with their values when the program is run:</br>
    
<code>print name1, “is the commander of the “, name2, “said Loog”</code></br>

As an exercise, assign the correct values to the variables <var>name1</var> and <var>name2</var> before the <code>print</code> statement is called and run the program.
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

		
				<!-- //////////////////////////////////////////////////////////////////////
							TUTORIAL End

				  //////////////////////////////////////////////////////////////////////-->
				</br>
				<a href="#part17" id="next17">This concludes the tutorial.</a>

				<nav class="vertical" id="bottomnav" alt="end of tutorial 4 navigation menu">
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
				<input type="hidden" value="4" id="current"/>
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
	</div></br>
    
		<!--- for web accessibility-->
<!--<script src="/greenfire/js/access.js"></script>-->


<p id="practiceQuestion1" style="display: none;"></p>
<p id="practiceQuestion2" style="display: none;"></p>
<p id="practiceQuestion3" style="display: none;"></p>
<p id="practiceQuestion4" style="display: none;"></p>
<p id="practiceQuestion5" style="display: none;"></p>
<p id="practiceQuestion6" style="display: none;"></p>
<p id="practiceQuestion7" style="display: none;"></p>
<p id="practiceQuestion8" style="display: none;"></p>

<script type="text/javascript">

function updateEditor(i){
	document.getElementById("editorNumber").value=i;
	document.getElementById("loquacious").value=document.getElementById("loquacious"+i).value;
	document.getElementById("clickedLinkName").value='practice_exercise4-'+i;
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

    