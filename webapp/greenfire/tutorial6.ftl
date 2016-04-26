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
         var index = "6-"+id;
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
		<h1 style="position:absolute; top: -50px; padding-bottom: 30px;"><img class='tutorialIconImage' > TUTORIAL 6: THE <code> while</code> LOOP</h1>

			<div id="main" >
        
        <!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 1

				  //////////////////////////////////////////////////////////////////////-->
                  
                <a href="#part1" id="tutorial6part1">
					<h2><img class='numberIconImage' src='../images/numberIcons/one.png' > PART 1: Why loops are useful</h2>
				</a>
                  
		  <p longdes="first part of tutorial 6 that explains why loops are useful" id="part1">
      In this tutorial, you are going to learn when a loop is needed in a program and how to write it. There are two types of loops in Python, <code>for</code> and <code>while</code>. This tutorial will focus on the <code>while</code> loop.
A <dfn>loop</dfn> is used to perform tasks repeatedly. As an example, after Herv makes some soup for Merscythe and himself, he checks at intervals of one minute if it has cooled sufficiently to be served. So, Herv could do something like this:
<pre id="part2" class="pre">wait one minute
check if soup is hot
wait one minute</pre>
Herv continues to do this until the soup is no longer hot. Can you identify the condition and actions here? The condition is "soup is hot". As long as the condition is true, the action performed is to <samp>wait one minute</samp>. </p>

                <!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 2

				  //////////////////////////////////////////////////////////////////////-->

    <a href="#part3" id="tutorial6part2"><h2><img class='numberIconImage' src='../images/numberIcons/two.png' > Part 2: Basics of the <code>while</code> loop</h2></a>
		  <p longdes="second part of tutorial 6 that describes while loop basics" id="part3">
In programming, this process of checking the condition and performing an action repeatedly can be put into a loop:
<pre id="part4" class="pre">while soup is hot :
    wait one minute</pre>
The word <code>while</code> is a keyword in Python. A condition must follow this keyword. If the condition is <code>True</code>, the actions in the <code>while</code> clause will be executed. Otherwise, if the condition is <code>False</code>, the actions will be skipped and the loop will terminate. The actions are placed in the lines after the <code>while</code> statement and must be indented by a consistent number of spaces. This format is similar to that of the actions used in the <code>if</code> and <code>else</code> condition clauses. However, an <code>if</code> clause is executed only once whereas a <code>while</code> clause is executed repeatedly until the condition becomes <code>False</code>.</p> 

		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

<a href="#part5" id="next5"><h4><img class='exerciseIconImage' > Practice Exercise 6-1: A <code>while</code> loop to display numbers 0 to 5</h4></a>
<p>

Write a <code>while</code> loop that displays the numbers 0 to 5. Use a loop variable <var>i</var> that has an initial value of 0 and evaluate it using the following condition:
<code>i <= 5</code>
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

<a href="#part6" id="next6"><h4><img class='exerciseIconImage' > Practice Exercise 6-2: A <code>while</code> loop to display even numbers 0 to 5</h4></a>
<p>

Write a <code>while</code> loop that displays even numbers between 0 and 5.
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
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(2)' id='loquacious2' cols='70' rows='9' class='locbox'></textarea>
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


<a href="#part7" id="next7"><h4><img class='exerciseIconImage' > Practice Exercise 6-3: A <code>while</code> loop to display odd numbers 0 to 5</h4></a>
<p>

Write a <code>while</code> loop that displays odd numbers between 0 and 5. 
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
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(3)' id='loquacious3' cols='70' rows='9' class='locbox'></textarea>
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



                <!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 3

				  //////////////////////////////////////////////////////////////////////-->

    <a href="#part8" id="tutorial6part3"><h2><img class='numberIconImage' src='../images/numberIcons/three.png' > Part 3: Actions after loop ends</h2></a>
		  <p longdes="third part of tutorial 6 that explains the actions taken after a loop terminates" id="part8">

Suppose we would like to add an action <samp>drink soup</samp> to be executed when the condition becomes <code>False</code>. The loop can be modified as follows:
<pre id="part9" class="pre">while soup is hot :
    wait one minute
drink soup</pre>
The statement <samp>drink soup</samp> is not indented here. It would be incorrect to indent this statement because then it would become an action within the <code>while</code> clause and would be executed when the condition is <code>True</code>. </p> 


                <!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 4

				  //////////////////////////////////////////////////////////////////////-->

 <a href="#part10" id="tutorial6part4"><h2><img class='numberIconImage' src='../images/numberIcons/four.png' > Part 4: An infinite loop</h2></a>
		  <p longdes="fourth part of tutorial 6 that explains the pitfalls of infinite loops" id="part10">

You may be wondering what would happen if a condition was always <code>True</code>. For example, what would happen if the following program were run?
 <pre id="part11" class="pre">while True:
    print 'hi'</pre>
This will display an unending sequence of the word <samp>hi</samp> when the program is run because the condition is always true. This type of a loop is called an <dfn>infinite</dfn> loop because it never ends. You want to avoid creating an infinite loop in a program. </p> 

                    <!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 5

				  //////////////////////////////////////////////////////////////////////-->

 <a href="#part12" id="tutorial6part5"><h2><img class='numberIconImage' src='../images/numberIcons/five.png' > Part 5: Creating a condition that terminates the loop</h2></a>
		  <p longdes="fifth part of tutorial 6 that explains how to create a condition that terminates the loop" id="part12">

As another example, suppose that you would like to find the floor number of the highest floor that the glass elevator can reach. You could use the method <code>go_to_floor()</code> with the arguments as shown here:</br>
<code>glass_elevator.go_to_floor(1)</code></br>
Change the argument to the next floor number and run the program again. Continue this until the program displays the message "Floor does not exist". However, this process of changing the argument and re-running the program is tedious. Repetitious tasks can be performed within a loop. We can insert the <code>go_to_floor()</code> method within the loop, but need to decide what condition can terminate the loop. The loop must terminate when the elevator reaches the top floor. The <code>at_top()</code> method in the <code>GlassElevator</code> class can be used to create this condition. The method returns <code>True</code> if the elevator is at the top floor; otherwise, it returns <code>False</code>. The modified code for our program follows below:
<pre id="part13" class="pre">while glass_elevator.at_top() == False:
    glass_elevator.go_to_floor(1)</pre></br>
There is still a problem in this code. Although we have used a loop, the argument to the method <code>go_to_floor()</code> is 1.</p>


		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

<a href="#part14" id="next14"><h4><img class='exerciseIconImage' > Practice Exercise 6-4: Reading user input inside a <code>while</code> loop</h4></a>
<p>

Prompt a user to enter a <kbd>number</kbd> and read it into a variable called <var>num</var>. Using a <code>while</code> loop, repeat this process until the user enters an odd number. Hint: use the modulo operator in the condition to determine if the number is even.
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
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(4)' id='loquacious4' cols='70' rows='9' class='locbox'></textarea>
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

<a href="#part15" id="next15"><h4><img class='exerciseIconImage' > Practice Exercise 6-5:  Reading user input inside a <code>while</code> loop</h4></a>
<p>

Prompt a user to enter a <kbd>name</kbd> and read it into a variable called <var>new_name</var>. Using a <code>while</code> loop, repeat this process until the user enters the name <samp>Merscythe</samp>.
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
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(5)' id='loquacious5' cols='70' rows='9' class='locbox'></textarea>
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
							TUTORIAL PART 6

				  //////////////////////////////////////////////////////////////////////-->

 <a href="#part16" id="tutorial6part6"><h2><img class='numberIconImage' src='../images/numberIcons/six.png' > Part 6: Moving the glass elevator to the correct floor</h2></a>
		  <p longdes="sixth part of tutorial 6 that explains how to use a variable to track the floor number" id="part16">

We would like to change the floor number to the  values 1, 2, 3, and so on each time the loop is executed and so a variable must be used here.  Let's call this variable <var>next_floor</var>. The modified code looks like this:
<pre id="part17" class="pre">while glass_elevator.at_top() == False:
    glass_elevator.go_to_floor(next_floor)</pre></br>
There are two problems in this code. One problem is that the variable <var>next_floor</var> does not have a starting value. This can be corrected by assigning the variable <code>next_floor</code> the value 1 before the loop starts. The second problem is that the value of the variable is not changed to the next higher floor number each time the loop executes. To do this, add a one to the value in the variable <code>next_floor</code> as follows:</br>
<code>next_floor = next_floor + 1</code></br>
Note how the new value of <code>next_floor</code> is assigned back to the variable <code>next_floor</code>. It would be incorrect to write the statement as:</br>
<code>next_floor + 1</code> </br>
without the assignment because this would not update the value stored in the variable <code>next_floor</code>.
The complete program is shown below. 
<pre id="part18" class="pre">from GlassElevator import GlassElevator  
glass_elevator = GlassElevator()  
next_floor = 1 
while glass_elevator.at_top() == False:
    glass_elevator.go_to_floor(next_floor)     
    next_floor = next_floor + 1</pre>
    
Copy this program into the editor and run it to see how high the glass elevator can go.</p>

		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

<a href="#part19" id="next19"><h4><img class='exerciseIconImage' > Practice Exercise 6-6: Moving the Glass Elevator to the lowest floor</h4></a>
<p>

The custom class <code>GlassElevator</code> has a method <code>at_bottom()</code> that returns <code>True</code> if the elevator is at the lowest floor. Write a program that uses a <code>while</code> loop to display the number of each floor as the elevator moves from the 0th floor to the lowest floor. The method <code>go_to_floor()</code> in class <code>GlassElevator</code> takes the floor number of the destination floor as argument and moves the elevator to this floor.
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
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(6)' id='loquacious6' cols='70' rows='9' class='locbox'></textarea>
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

<a href="#part20" id="next20"><h4><img class='exerciseIconImage' > Practice Exercise 6-7: Displaying the number of the lowest floor in the Glass Elevator</h4></a>
<p>

The custom class <code>GlassElevator</code> has a method <code>at_bottom()</code> that returns <code>True</code> if the elevator is at the lowest floor. The method <code>go_to_floor()</code> in class <code>GlassElevator</code> takes the floor number of the destination floor as argument and moves the elevator to this floor. Write a program that uses a <code>while</code> loop to display the number of each floor as the elevator moves from the 0th floor to the lowest floor. When the elevator reaches the lowest floor, the program should display the number of that floor preceded by the following text: <samp>The lowest floor is</samp>
</p>

					<a href="#part10" id="next10">
						<h4>Practice Exercise 1-7: Calling a method </h4>
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
											<th style=" padding-left:10px;float:left; width:400px;"><input type="button" onclick="getSolution(7)" value="Show Answer"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(7)' id='loquacious7' cols='70' rows='9' class='locbox'></textarea>
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

<a href="#part21" id="next21"><h4><img class='exerciseIconImage' > Practice Exercise 6-8: Displaying the number of the highest floor in the Glass Elevator</h4></a>
<p>

The custom class <code>GlassElevator</code> has a method at_top that returns <code>True</code> if the elevator is at the highest floor. The method <code>go_to_floor()</code> in class <code>GlassElevator</code> takes the floor number of the destination floor as argument and moves the elevator to this floor. Write a program that uses a <code>while</code> loop to display the number of each floor as the elevator moves from the 0th floor to the highest floor. When the elevator reaches the highest floor, the program should display the number of that floor preceded by the following text: <samp>The highest floor is</samp>
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
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(8)' id='loquacious8' cols='70' rows='9' class='locbox'></textarea>
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

				<nav class="vertical" id="bottomnav" alt="end of tutorial 1 navigation menu">
					<ul alt="end of tutorial 1 navigation menu">
						<li>
							<a href="#part3" id="next3">Click to go to next practice exercises for this tutorial</a>
						</li>
						<li alt="link to the next tutorial">
							<a href="tutorial2" id="next11">Click to go to next tutorial</a>
						</li>				
						<li alt="link to the book">
							<a href="tutorial2" id="next12">Click to go Back to the book</a>
						</li>
					</ul>
				</nav>
				<input type="hidden" value="6" id="current"/>
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

<script type="text/javascript">

function updateEditor(i){
	document.getElementById("editorNumber").value=i;
	document.getElementById("loquacious").value=document.getElementById("loquacious"+i).value;
	document.getElementById("clickedLinkName").value='practice_exercise6-'+i;
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
