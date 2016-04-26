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
         var index = "3-"+id;
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
    <h1 style="position:absolute; top: -50px; padding-bottom: 30px;"> <img class='tutorialIconImage' > TUTORIAL 3: CONDITIONS </h1>
		<div id="main" >
        
        		<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 1

				//////////////////////////////////////////////////////////////////////-->
                  
            <a href="#part1" id="tutorial3part1"><h2><img class='numberIconImage' src='../images/numberIcons/one.png' > Part 1: The <code>if</code> Clause</h2></a>
		  <p longdes="first part of tutorial 3 that explains the if clause" id="part1">
   In this tutorial, you are going to learn about conditions. We use conditions to decide what to do in our daily lives. Let's say Eric enjoys pasta and never misses an opportunity to eat it at a restaurant.
<pre id="part2" class="pre">if restaurant has pasta :
    Eric will eat it</pre>
A condition can only be true or false. The condition in this example is <samp>restaurant has pasta</samp>. If this condition is true, the action performed is for Eric to eat it. But this example does not tell us what action to take if the restaurant does not have Eric's pasta. </p>

				<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 2

				  //////////////////////////////////////////////////////////////////////-->

     <a href="#part3" id="tutorial3part2"><h2><img class='numberIconImage' src='../images/numberIcons/two.png' > Part 2: The <code>else</code> Clause</h2></a>
		  <p longdes="second part of tutorial 3 that explains the else clause" id="part3">
Suppose that Eric would like to try another dish if his favorite one is not available. This can be written as follows:
<pre id="part4" class="pre">if restaurant has pasta :
    Eric will eat it
else :
    Eric will try another dish</pre>
Note that we are using the "if” and “else” words here. If the condition is true, the action for the "if" clause, which is <samp>Eric will eat it</samp> gets executed. Otherwise, if the condition is false, the action for the “if” clause is skipped and only the action for the “else” clause, which is <samp>Eric</samp> will try another dish gets executed. A condition is followed by one or more actions.</br>
Let’s take another example. Lisa can program a robot to do useful work. Luckily, she is also an expert at fixing the robot if it's broken. The condition is <samp>Lisa’s robot is broken</samp>.  We can write this as follows:</p>
<pre id="part5" class="pre">if  Lisa’s robot is broken :
    Lisa fixes the robot
else :
    Lisa programs the robot to do useful work</pre></br>
    
    	<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 3

		//////////////////////////////////////////////////////////////////////-->

     <a href="#part4" id="tutorial3part3"><h2><img class='numberIconImage' src='../images/numberIcons/three.png' > Part 3: Conditions</h2></a>
		  <p longdes="first part of tutorial 3 that explains how to create and use conditions" id="part4">
Python uses these two words <code>if</code> and <code>else</code> similarly with conditions. In a program, a <dfn>condition</dfn> is evaluated to determine which action or actions to perform. In fact, <code>if</code> and <code>else</code> are reserved words in Python and you cannot use them as variables. Reserved words are also called <dfn>keywords</dfn>. 
In a program, we can use conditions to check the values of variables. For example, suppose that a program has a variable called <var>user</var> that stores the name of a person. We can write some code that checks if variable <var>user</var> stores the name Merscythe as shown in this <code>if</code> clause:</br>
<code>if user == ‘Merscythe’:</code></br>
Note how the <code>if</code> clause is created. The condition is:</br>
<code>user == 'Merscythe'</code></br>
This condition will be true if the values on either sides of the equals signs are equal. Two equals signs must be used in the condition, not one; otherwise, the condition will be formed incorrectly. Recall that a single equals sign is used when you are storing a value in a variable.</p>

	<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 4

	//////////////////////////////////////////////////////////////////////-->

     <a href="#part5" id="tutorial3part4"><h2><img class='numberIconImage' src='../images/numberIcons/four.png' > Part 4: Putting four spaces before every action</h2></a>
		  <p longdes="first part of tutorial 3 that explains how to create and use conditions" id="part5">
Another important point to remember is that the action must be placed on the next line after the condition and it must have a few spaces (usually 4) before it. If you hear the words "4 spaces" when the program is being read, press the space bar four times when you are writing out the program in the editor. It is important to use a consistent number of spaces before each action in a program; otherwise, it will result in an error and the program will not run. Note that there is a colon at the end of the if statement. Also, remember that to check for equality, two equals signs must be used in the condition.</p>

		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

  <a href="#part6" id="next6"><h4><img class='exerciseIconImage' > Practice Exercise 3-1: Using an <code>if</code> statement</h4></a>
				<p>
Create a variable called <var>var1</var> with the value 1015. Write an <code>if</code> statement to check if <var>var1</var> has the value 1015. If this condition is true, the action taken should to display the text <samp>equal</samp>.  
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
                
                
  <a href="#part7" id="next7"><h4><img class='exerciseIconImage' > Practice Exercise 3-2: The <code>if-else</code> statement</h4></a>
				<p>
Create a variable called <var>var1</var> with the value 1015. Write an <code>if</code> statement to check if <var>var1</var> has the value 1015. If this condition is true, the action taken should be to display the text <samp>equal</samp>; otherwise,  if the condition is false, the action taken is to display the text <samp>not equal</samp>. 
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
                
  <a href="#part8" id="next8"><h4><img class='exerciseIconImage' > Practice Exercise 3-3: Using the equals operator </h4></a>
				<p>
Write an <var>if</var> statement to check if the number 5 is equal to the number 10. If the condition is true, the action taken is to display the text <samp>5 is equal to 10</samp>; otherwise, the text <samp>5 is not equal to 10</samp> is displayed.  
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
                
<a href="#part9" id="next9"><h4><img class='exerciseIconImage' > Practice Exercise 3-4: The <code>if-else</code> statement and using the not equals operator</h4></a>
				<p>
The not equals operator is used to check if two values are not equal. This operator consists of an exclamation mark followed by an equals sign. For example, to create the condition <var>var1</var> is not equal to 1015, you can write:</br>

	<code>var1 != 1015</code></br>

Suppose that the variable <var>thickness1</var> stores the thickness of the Earth’s crust under continents and the variable <var>thickness2</var> stores the crust’s thickness under oceans, in miles. In this problem, use an <code>if-else</code> statement to check the condition <samp><var>thickness1</var> is not equal to <var>thickness2</var></samp>. If this condition is true, display a message <samp>not equal</samp>; otherwise, display the message <samp>equal</samp>. Assign some values to <var>thickness1</var> and <var>thickness2</var> to test your program.   
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

  <a href="#part10" id="next10"><h4><img class='exerciseIconImage' > Practice Exercise 3-5: The <code>if-else statement</code> and using the greater than operator</h4></a>
				<p>
The greater than operator is used to compare two numbers. The symbol for this operator is the right arrow. For example, to check if the variable <var>num1</var> is greater than <var>num2</var>, you can create the condition:</br>
	<code>num1 > num2</code></br>

This condition is true if the first number <var>num1</var> is greater than the second <var>num2</var>. In this problem, you will use this operator to determine the composition of the earth’s crust. Suppose that the variables <var>feldspar_percent</var> and <var>quartz_percent</var> store the percentage of two common minerals occurring in the earth’s crust, feldspar and quartz, respectively. Write an <code>if-else</code> statement to compare the two variables and display the text <samp>feldspar is greater</samp> or <samp>quartz is greater</samp> as appropriate.   
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
							TUTORIAL PART 5

		//////////////////////////////////////////////////////////////////////-->
     <a href="#part11" id="tutorial3part5"><h2><img class='numberIconImage' src='../images/numberIcons/five.png' > Part 5: Examining the program in Ari's lab</h2></a>
		  <p longdes="fifth part of tutorial 3 that explains the program in Ari's lab" id="part11">
Let’s turn our attention back to the program Merscythe ran in the lab to see why it set off the alarm. The first two lines of code are <code>import</code> statements that reference two existing classes <code>Door</code> and <code>Alarm</code> that are used in this program. The next two lines of code are:</p>
<pre id="part12" class="pre">user = input('IDENTIFY YOURSELF') 
print 'Hello, ' +user</pre>

 When you hear the word new line, press the Enter key on the keyboard to start the next line.
<pre id="part13" class="pre">user =  input ( ‘ IDENTIFY YOURSELF  ' )   (new line) 
print  ' Hello , '  space +user</pre>

If you have completed the previous tutorial on input and output, you will recognize that the first line prompts Merscythe to enter his name and stores it in the variable called <var>user</var>. The second line uses the <code>print</code> function to print out the greeting <samp>Hello, Merscythe</samp> on the screen. The next line in this program is:
<code>exit = Door()</code></br>
This statement means that the object <var>exit</var> is a type of <code>Door</code>.  Recall that <code>Door</code> is a class with methods <code>open()</code> and <code>close()</code>. So, the object <var>exit</var> can use the <code>open()</code> and <code>close()</code> methods of this class. 
The following line of code is
<code>siren = Alarm()</code>
The object <var>siren</var> is a type of <var>Alarm</var>. <var>Alarm</var> is a new class that you have not seen as yet. The <var>Alarm</var> class has two methods called <code>enable()</code> and <code>disable()</code>. So, to sound an alarm, you can use this line of code:
<code>siren.enable()</code>
We are, however, more interested in the more critical part of the program that sets off the alarm. This contains a conditional if/else statement  and the lines of code follow:
<pre id="part14" class="pre">if user == 'Ari':     
    print ‘Access granted’ 
else:     
    print 'Access denied'     
    exit.close()     
    siren.enable()</pre>

Let's review the <code>if</code> clause and its action again:
<pre id="part15" class="pre">if user ==  ‘ Ari ’ :  
    print  ' Access  space granted '</pre>
This statement checks if the variable <var>user</var> stores the text Ari. If this condition is true,  the action taken is to display the text <samp>Access granted</samp> on the screen. What this means is that if the user enters the name <kbd>Ari</kbd> as input, the program will display <samp>Access granted</samp>.</br>

	<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 6

	//////////////////////////////////////////////////////////////////////-->
 
      <a href="#part16" id="tutorial3part6"><h2><img class='numberIconImage' src='../images/numberIcons/six.png' > Part 6: How Merscythe unlocked the exit</h2></a>
		  <p longdes="sixth part of tutorial 3 that explains how Merscythe changes the program" id="part16">
What happened when Merscythe typed in his name as input to the program? The condition <samp>user equal to Ari</samp> became false, so the program did not execute the action in the <code>if</code> clause. Instead, it executed the actions for the <code>else</code> clause. The actions for <code>else</code> are given by the three statements that follow the “else” Python word. Let us examine these statements in the program:
<pre id="part17" class="pre">    print 'Access denied’
    exit.close()  
    siren.enable() </pre> 
As a result, the words <samp>Access denied</samp> were printed on the screen, the exit was closed and the siren was sounded. 
With this information, Merscythe is getting smarter. He changes the name from <samp>Ari</samp> to <samp>Merscythe</samp> in the program. The code looks like this:
<pre id="part18" class="pre">if user == ‘Merscythe': 
    print ‘Access granted’ 
else: 
    print 'Access denied’ 
    exit.close() 
    siren.enable() </pre>
Now, if Merscythe ran this modified program and typed in his own name, <samp>Access granted</samp> would be displayed on the screen. With any other name, the screen would display <samp>Access denied</samp>, the exit would close and the siren would sound.</br>

		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

  <a href="#part20" id="next20"><h4><img class='exerciseIconImage' > Practice Exercise 3-6: The <code>if-else</code> statement and using the greater than operator</h4></a>
				<p>
Suppose that you want to compare the depths of two locations below sea level. The first location is Badwater in Death Valley, California, and its depth is stored in the variable <var>badwater_depth</var>. The depth of the second location, Dead Sea in the Jordan Rift Valley, is stored in the variable <var>dead_sea_depth</var>. Use an <code>if-else</code> statement to check if Badwater’s depth is greater than that of Dead Sea and display the text <samp>badwater is greater</samp> or <samp>dead sea is greater</samp> as appropriate. Assign some values to <var>badwater_depth</var> and <var>dead_sea_depth</var> to test your program. 
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
                
                  <a href="#part20" id="next20"><h4><img class='exerciseIconImage' > Practice Exercise 3-7: Using the less than operator to create a condition</h4></a>
				<p>
The less than operator is used to compare two numbers. The symbol of this operators is the right arrow. Write a condition to check if the number <var>num1</var> is less than the number <var>num2</var>. Assign some values to <var>num1</var> and <var>num2</var> to test your program and print out the word <samp>true</samp> if the condition is true. 
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
                
                  <a href="#part21" id="next21"><h4><img class='exerciseIconImage' > Practice Exercise 3-8: The <code>if-else</code> statement and using the less than operator</h4></a>
				<p>
Write a program that prints out the word <samp>true</samp> if the depth of Dead Sea below sea level is less than the depth of Badwater; otherwise, it prints out the word <samp>false</samp>. The depth values are stored in the variables <var>dead_sea_depth</var> and <var>badwater_depth</var>. 
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
                
                  <a href="#part22" id="next22"><h4><img class='exerciseIconImage' > Practice Exercise 3-9: Using a condition to compare text values </h4></a>
				<p>
The variable <var>text1</var> stores the word <samp>aficionado</samp>, which may be misspelled. Write a condition to verify that the variable stores the word in lower case with the correct spelling. Remember to enclose text used in programs in single or double quotes. 
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
         
                  <a href="#part23" id="next23"><h4><img class='exerciseIconImage' > Practice Exercise 3-10: The <code>elif</code> statement</h4></a>
				<p>
The if statement can test only one condition. When you need to evaluate multiple conditions, you can use one or more <code>elif</code> clauses with the <code>if</code> statement. For example, suppose that the word aficionado can be spelled as starting with an uppercase A letter or with all uppercase letters. You can use the <code>elif</code> statement to check these additional conditions as follows:
<pre id="part24" class="pre">if text1 == 'aficionado':     
    print 'All lowercase' 
elif text1 == 'Aficionado':     
    print 'Starts with uppercase' 
elif text1 == 'AFICIONADO':     
    print 'All uppercase'
else:     
    print 'Spelling not recognized’</pre> 
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
                
          <!-- //////////////////////// Practice Exercise  /////////////////////////////////-->      
                
                  <a href="#part25" id="next25"><h4><img class='exerciseIconImage' > Practice Exercise 3-11: Using the greater than or equal to operator </h4></a>
				<p>
When comparing values in a condition you may be interested in knowing if one value is either greater than or equal to the other. This type of condition is made up of two operators, a greater than symbol followed by an equals sign. For example, to check if variable <var>var1</var> is greater than or equal to variable <var>var2</var>, you can write:</br>

<code>var1 >= var2</code></br>

The variables <var>age1</var> and <var>age2</var> store the ages of two people. Write a condition to check if <var>age1</var> is greater than or equal to <var>age2</var>. 
                </p>
                
                	 <!--  ****  editor  **** -->

				<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr>
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"><input type="button" onclick="getSolution(11)" value="Show Answer"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(11)'  id='loquacious11' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
												<div class='message' id='status11' style='overflow:scroll; '>
												</div> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(11); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick='' class='button'>Reset</button> 
												<button type='button' onclick='updateEditor(11); sayitMod(11)' class='button'>Say</button> 
												<button type='button' onclick='updateEditor(11); overviewMod(11)' class='button'>Overview</button> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												<p id='dvContent'></p>
											</td>
										</tr> 
										<tr >
											<td >
												<div id='output11' style='overflow:scroll; height:100px;'>
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
        
                  <a href="#part26" id="next26"><h4><img class='exerciseIconImage' > Practice Exercise 3-12: Using the less than or equal to operator</h4></a>
				<p>
This type of condition is made up of two operators, a less than symbol followed by an equals sign. For example, to check if variable <var>var1</var> is less than or equal to variable <var>var2</var>, you can write:</br>

<code>var1 <= var2</code></br>

The variables <var>temp1</var> and <var>temp2</var> store two temperatures. Write a condition to check if <var>temp1</var> is less than or equal to <var>temp2</var>.  
                </p>
                
                	       	 <!--  ****  editor  **** -->

				<div class="editor">
							<div class='horizontalloq' id='horizontalloq'>
								<form>
									<table class='horizontalLoqTable' align='left' border='0' >
										<tr>
											<th class='bar1' ><p class='logo'>Loquacious Python Editor</th>
											<th style=" padding-left:10px;float:left; width:400px;"><input type="button" onclick="getSolution(12)" value="Show Answer"></th>
										</tr>
										<tr>
											<td >
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(12)'  id='loquacious12' cols='70' rows='9' class='locbox'></textarea>
											</td>
											<td >
												<div class='message' id='status12' style='overflow:scroll; '>
												</div> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												</br>
												<button type="button" onclick="updateEditor(12); Running(); runit();" class="button">Run</button> 
												<button type='button' onclick='' class='button'>Reset</button> 
												<button type='button' onclick='updateEditor(12); sayitMod(12)' class='button'>Say</button> 
												<button type='button' onclick='updateEditor(12); overviewMod(12)' class='button'>Overview</button> 
											</td>
										</tr>
										<tr>
											<td class='bar'>
												<p id='dvContent'></p>
											</td>
										</tr> 
										<tr >
											<td >
												<div id='output12' style='overflow:scroll; height:100px;'>
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

				<nav class="vertical" id="bottomnav" alt="end of tutorial 3 navigation menu">
					<ul alt="end of tutorial 3 navigation menu">
						<li>
							<a href="#part3" id="next3">Click to go to next practice exercises for this tutorial</a>
						</li>
						<li alt="link to the next tutorial">
							<a href="tutorial4" id="next11">Click to go to next tutorial</a>
						</li>				
						<li alt="link to the book">
							<a href="tutorial1" id="next12">Click to go Back to the book</a>
						</li>
					</ul>
				</nav>
				<input type="hidden" value="3" id="current"/>
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
<p id="practiceQuestion8" style="display: none;"></p>
<p id="practiceQuestion9" style="display: none;"></p>
<p id="practiceQuestion10" style="display: none;"></p>
<p id="practiceQuestion11" style="display: none;"></p>
<p id="practiceQuestion12" style="display: none;"></p>

<script type="text/javascript">

function updateEditor(i){
	document.getElementById("editorNumber").value=i;
	document.getElementById("loquacious").value=document.getElementById("loquacious"+i).value;
	document.getElementById("clickedLinkName").value='practice_exercise3-'+i;
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

    
