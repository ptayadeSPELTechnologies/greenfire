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
         var index = "2-"+id;
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
        <h1 style="position:absolute; top: -50px; padding-bottom: 30px;"> <img class='tutorialIconImage' > TUTORIAL 2: INPUT AND OUTPUT, VARIABLES</h1>
   <div id="main" >
   			<!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 1

			//////////////////////////////////////////////////////////////////////-->
                  
    <a href="#part1" id="tutorial2part1"><h2><img class='numberIconImage' src='../images/numberIcons/one.png' > PART 1: PROGRAM INPUT AND OUTPUT</h2></a>
		  <p longdes="first part of tutorial 2 that explains how a user can interact with a program" id="part1">Merscythe sees the words “IDENTIFY YOURSELF” on the screen in the lab. He types in his <kbd>name</kbd> and this information is read by the program—this is known as giving <dfn>input</dfn> to a program. The program then displays <samp>Hello, Merscythe</samp> on the screen - this is called program output. In this tutorial, you will learn how to make a program interactive through input and output so that it can read the data the user types in and display information to the user. To do so, two functions that are built into the language called <code>input</code> and <code>print</code> are used. Functions are similar to methods in that they also used to perform tasks. However, there are differences between the two and we will discuss these later.</p>
          
            <!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 2

				  //////////////////////////////////////////////////////////////////////-->
          
    <a href="#part2" id="tutorial2part2"><h2><img class='numberIconImage' src='../images/numberIcons/two.png' > PART 2: USING VARIABLES</h2></a>
		  <p longdes="second part of tutorial 2 that explains how variables are used" id="part2"><dfn>Variables</dfn> are used to store data, such as text or a number, that is needed in the program. Any name can be chosen for a variable, but it cannot start with a digit.  For example, in this next line we create a variable called <var>num</var> and store the number 10 in it:
<code>num = 10</code></br>
The name of the variable must be placed to the left of the equals sign. It would be incorrect to write:</br>
<code>10 = num</code></br>
You can also store text data in a variable, but need to enclose the text within quotes.</p> 

			<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

  <a href="#part3" id="next3"><h4><img class='exerciseIconImage' > Practice Exercise 2-1: Creating a variable to store a number</h4></a>
				<p>
				Write a statement of code to store the number 413 in a variable called <var>num</var>, spelt as n u m. 
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
												<textarea  onkeyup='pressListener(event)' onmouseup='this.onkeyup()' onclick='focusAlert(1)' id='loquacious1' cols='70' rows='9' class='locbox'></textarea>
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
            <a href="#part4" id="next4"><h4><img class='exerciseIconImage' > Practice Exercise 2-2: Creating a variable to store text</h4></a>
                        
                        <p>

Write a statement of code to store the text “Codue 0413” in a variable called device. Text used in programs must be enclosed in single or double quotes.
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

<a href="#part5" id="next5"><h4><img class='exerciseIconImage' > Practice Exercise 2-3: Creating a variable</h4></a>
				<p>
				Write a statement of code to store the text “Merscythe” (spelt as M e r s c y t h e) in a variable called <var>name</var>. Text used in programs must be enclosed in single or double quotes. 
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
                
            <!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 3

			/////////////////////////////////////////////////////////////////////////-->
                
 <a href="#part6" id="tutorial2part3"><h2><img class='numberIconImage' src='../images/numberIcons/three.png' > Part 3: Displaying information using the function <code>print</code></h2></a>
		  <p longdes="third part of tutorial 2 that explains how to display data on the computer screen" id="part6">               
<p>The function <dfn>print</dfn> is used to display information on the screen when the program runs. For example, to display Merscythe’s name, you will write the following statement in the editor and run the program:</br>
<code>print ‘Merscythe’</code></br>
To print other information, such as the statement <samp>I am learning Python</samp>, you can write this line of code:</br>
<code>print ‘I am learning Python’</code></br>
Using the <code>print</code> function, try writing other statements in the editor. Compile and run each program and check that the output is correct. If you forget to enclose the text you are printing on the screen within quotes, it will result in an error.

	<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

       <a href="#part7" id="next7"><h4><img class='exerciseIconImage' > Practice Exercise 2-4: Using the <code>print</code> function</h4></a>
				<p>
                Write a statement of code to display the text “Merscythe” (spelt as M e r s c y t h e). 
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
                
        <a href="#part8" id="next8"><h4><img class='exerciseIconImage' > Practice Exercise 2-5: Using the <code>print</code> function</h4></a>
				<p>
                Write a statement of code to display the text “Ari’s Lab”. Note that when there is an apostrophe within the text, you should enclose the text within double quotation marks instead of single quotation marks. 
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
							TUTORIAL PART 4

			//////////////////////////////////////////////////////////////////////-->
 
<a href="#part9" id="tutorial2part4"><h2><img class='numberIconImage' src='../images/numberIcons/four.png' > Part 4: Displaying a variable using the function <code>print</code></h2></a>
		  <p longdes="fourth part of tutorial 2 that explains how to display data stored in a variable" id="part9">               
<p>
As an exercise, type out the next two lines in the editor. They are spelled out for you. When you hear the word space, press the space bar, and when you hear the word new line, press the enter key on the keyboard to start the next line.
<pre>user = ‘Ginger’ (new line)
print space user</pre>
In the first line, the text "Ginger" is stored in the variable <var>user</var>. In the second line, the value stored in the variable <var>user</var> is printed on the screen using the <code>print</code> function. Note that the variable name is not enclosed within quotes when it is used with <code>print</code> because we would like to display the data that is stored in this variable and not the name of the variable. Copy the program into the editor and run it. Check that when the program is run, the name <samp>Ginger</samp> is displayed on the screen. 

	<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

    <a href="#part10" id="next7"><h4><img class='exerciseIconImage' > Practice Exercise 2-6: Using the <code>print</code> function</h4></a>
				<p>Write a statement of code to display the value stored in a variable called <var>num1</var>.
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
                
     <!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 5

       //////////////////////////////////////////////////////////////////////-->
                
 <a href="#part11" id="tutorial2part5"><h2><img class='numberIconImage' src='../images/numberIcons/five.png' > Part 5: Displaying the variable value with a custom message</h2></a>
		  <p longdes="fifth part of tutorial 2 that explains how to use a custom message to display the value of the variable" id="part11">               
<p>               
Suppose you wanted to append the text "My name is" before printing out the value of the variable <var>user</var>. All you need to do is include the desired text within quotes and prefix a plus sign before the variable name. You can do this with the following statement:</br>
<code>print  ' My name is ' +user</code></br></p>

	<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

  <a href="#part12" id="next7"><h4><img class='exerciseIconImage' > Practice Exercise 2-7: Using the <code>print</code> function</h4></a>
				<p>Suppose that the variable <var>vial1</var> stores the name of the compound in the vial with blue liquid. Write a statement that displays the text “The blue liquid is” followed by the value in the variable <var>vial1</var>. 
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

                
       <!--  //////////////////////////////////////////////////////////////////////
							TUTORIAL PART 6

       //////////////////////////////////////////////////////////////////////-->
                
<a href="#part13" id="tutorial2part6"><h2><img class='numberIconImage' src='../images/numberIcons/six.png' > Part 6: Taking input from the keyboard</h2></a>
		  <p longdes="sixth part of tutorial 2 that explains how to read input from the keyboard into the program" id="part13">               
<p>Now that you have this background, let's get back to the program that Merscythe sees in the lab. When Merscythe types in his name, it is read by the program. This is called giving input to a program. A function called <code>input</code> reads data that the user of the program (in this case, Merscythe) types in at the console. The <code>input</code> function is useful because it allows the user to interact with the program. For example, the following statement asks for identification and prompts the user to enter text.

<code> user = input(‘Identify yourself’) </code></br>

This displays the two words <samp>Identify yourself</samp> on the screen. The <kbd>name</kbd> that Merscythe then types in using his keyboard is stored in the variable called <var>user</var>.
The following statement prints out the value stored in the <var>user</var> variable:</br>
 <code>print user</code></br>
Let’s take another example. This program reads your <kbd>favorite day of the week</kbd> and prints it out. Type this program in the editor and run it:</br>
<pre>day_of_week = input(‘Enter your favorite day of the week’)
print day_of_week</pre></p>
<p>When you run this program, it will prompt you to enter your favorite day of week. You will type in your choice on the keyboard (say, Tuesday) and press the Enter key. Then, this text you have typed in will be read by the program and stored in the variable <var>day_of_week</var>. Finally, the <code>print</code> statement will display the value of the variable on the screen. </br> 
</p>

	<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
                
    <a href="#part14" id="next14"><h4><img class='exerciseIconImage' > Practice Exercise 2-8: Using the <code>input</code> function</h4></a>
				<p>Write a program  that uses the function <code>input</code> to prompt the user to type in <kbd>some information</kbd> and read it into a variable called <var>user_data</var>. Display this information using the <code>print</code> function. 
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
                
     <a href="#part15" id="next15"><h4><img class='exerciseIconImage' > Practice Exercise 2-9: Using the <code>input</code> function</h4></a>
				<p>Write a program  that uses the function <code>input</code> to prompt the user to enter a <kbd>number</kbd> and read it into a variable called <var>num</var>. The program adds 2 to the value stored in <var>num</var>, multiplies the resulting value by 10, then subtracts 13 and prints out the result.  
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
    
     <a href="#part16" id="next16"><h4><img class='exerciseIconImage' > Practice Exercise 2-10: Using the <code>input</code> function, modulo operator</h4></a>
				<p>Write a program  that uses the function <code>input</code> to prompt the user to enter a <kbd>number</kbd> and read it into a variable called <var>num</var>. The program then displays the last digit of the number. For example, if the number entered is 2345, the program displays the number 5. To extract the last digit of the number, you need to get the remainder when the number is divided by 10. The modulo operator, which uses the % symbol on the keyboard, can be used to get the remainder when a division operation is performed. For example, to get the remainder when 7 is divided by 4, you can use 7%4. This returns the result 3.   
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
                
    <a href="#part17" id="next17"><h4><img class='exerciseIconImage' > Practice Exercise 2-11: Creating a number game</h4></a>
				<p>Write a program that will surprise your friend by guessing the loose change in his or her pocket. The pocket change should be under one dollar. To write the program, first use the <code>print</code> function to display the instructions for the game. Ask the friend to multiply his or her age by 10, add 2 to the resulting number, then multiply it by 10, subtract 13, and add their pocket change in cents to get a result. Next, use the <code>input</code> function prompt your friend to enter the <kbd>result</kbd> they got and read it into the program. Then subtract 7 from the result and divide it by 100. The remainder will be your friend’s pocket change! Display this value to your friend using the <code>print</code> function.    
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
				<input type="hidden" value="2" id="current"/>
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
	document.getElementById("clickedLinkName").value='practice_exercise2-'+i;
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