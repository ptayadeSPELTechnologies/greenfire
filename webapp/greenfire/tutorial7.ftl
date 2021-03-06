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
         var index = "7-"+id;
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
		<h1 style="position:absolute; top: -50px; padding-bottom: 30px;"><img class='tutorialIconImage' > TUTORIAL 7 : The <code>for</code> LOOP </h1>

			<div id="main" >

				
                <!--///////////////////////////////////////////////////////////////////
							TUTORIAL PART 1

				  //////////////////////////////////////////////////////////////////////-->
    <a href="#part1" id="tutorial7part1"><h2><img class='numberIconImage' src='../images/numberIcons/one.png' > Part 1: Introducing the <code>for</code> loop</h2></a>
		  <p longdes="first part of tutorial 7 that introduces the for loop" id="part1">
To solve the next problem, you will need to learn how <code>for</code> loops work. In addition, you will also learn about a programming structure called list that is used to store data. Python has two types of loops: <code>while</code> and <code>for</code>. You've already learned how to use the <code>while</code> loop. Likewise, the <code>for</code> loop is also used to perform repetitious tasks.</p>

                <!--///////////////////////////////////////////////////////////////////
							TUTORIAL PART 2

				  //////////////////////////////////////////////////////////////////////-->
    
<a href="#part1" id="tutorial7part2"><h2><img class='numberIconImage' src='../images/numberIcons/two.png' > Part 2: Displaying numbers with a <code>for</code> loop</h2></a>
		  <p longdes="first part of tutorial 7 that introduces the for loop" id="part1">
      The next example shows a simple program that has a <code>for</code> loop to print out the numbers 0 to 9:</br>
<pre id="part2" class="pre">for i in range(10):
    print i</pre>
Copy this program into the editor and run it. Note that the words "for" and "in" used in the program are keywords. The variable <var>i</var> is known as the loop variable and is assigned one value at a time from a list of numbers generated by the <code>range</code> function. For example, range(10) generates the list of numbers 0 to 9. To begin with, <var>i</var> is assigned the first number in the list, which is 0, and this is printed out by the <code>print</code> statement. This completes the first loop iteration. In the second loop iteration, <var>i</var> is assigned the next value in the list, which is 1, and so on. The loop executes until all the numbers in the list have been printed out.

                <!--///////////////////////////////////////////////////////////////////
							TUTORIAL PART 3

				  //////////////////////////////////////////////////////////////////////-->

<a href="#part1" id="tutorial7part3"><h2><img class='numberIconImage' src='../images/numberIcons/three.png' > Part 3: Displaying numbers using range in the <code>for</code> clause</h2></a>
		  <p longdes="first part of tutorial 7 that introduces the for loop" id="part1">
To better understand how the function <code>range</code> works, rerun the program with different arguments to the function. In general, the function <code>range</code> takes an argument of a number, say <var>n</var>, to generate a list of numbers from 0 to n-1. Note that the argument <var>n</var> is not included in the list. To change the starting number of the list, two arguments must to given to this function as shown in the following program:
<pre id="part2" class="pre">for i in range(100, 200):
    print i</pre>
In this example, the first argument of 100 to function range is the starting number of the list, and the second argument of 200 implies that 199 is the last number of the list. 

		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 7-1: A <code>for</code> loop using the <code>range</code> function</h4></a>
<p>
Using a <code>for</code> loop and the <code>range</code> function, write a program to display numbers from 0 to 5.
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

<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 7-2: A <code>for</code> loop using the <code>range</code> function</h4></a>
<p>
Using a <code>for</code> loop and the <code>range</code> function, write a program to display the numbers from 100 to 105. 
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


<!--///////////////////////////////////////////////////////////////////
							TUTORIAL PART 4

				  //////////////////////////////////////////////////////////////////////-->
<a href="#part1" id="tutorial7part4"><h2><img class='numberIconImage' src='../images/numberIcons/four.png' > Part 4: Displaying numbers in a list using the for loop</h2></a>
		  <p longdes="first part of tutorial 7 that introduces the for loop" id="part1">

An alternate way to generate a list of numbers without using the <code>range</code> function is by specifying the values in the list within square brackets and separated by commas. For example, the following statement creates a list called <var>num</var> with the elements 0 to 5:</br>
<code>num = [0, 1, 2, 3, 4, 5]</code></br>
You can create a loop to display all the numbers in this list as follows:
<pre id="part2" class="pre">for i in num:
    print i</pre>
In each loop iteration, successive values from the list <var>num</var> will be assigned to the variable <var>i</var>. Copy this program into the editor and run it. Check how the output changes when the list elements are modified. 

		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 7-3: Using a <code>for</code> loop with a list of numbers</h4></a>
<p>
Using a <code>for</code> loop, write a program to display the elements in a list named <var>list1</var>. This list contains numbers from 100 to 105. 
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

                <!--///////////////////////////////////////////////////////////////////
							TUTORIAL PART 5

				  //////////////////////////////////////////////////////////////////////-->

<a href="#part1" id="tutorial7part5"><h2><img class='numberIconImage' src='../images/numberIcons/five.png' > Part 5: Displaying text data in a list using the <code>for</code> loop</h2></a>
		  <p longdes="first part of tutorial 7 that introduces the for loop" id="part1">


Lists are not restricted to numeric values, and can contain textual values and even objects. For example, Merscythe creates a list to store the names of the root vegetables he has gathered in a short foraging expedition with Herv, shortly after enjoying the soup. He creates the list as follows:</br>
<code>root_veggies = ['cassava', 'earthnut', 'lily yam', 'rutabaga']</code></br>
The list is named <code>root_veggies</code> and it stores the names of four root vegetables. Each name must be enclosed within quotes as it is text data and not a number. The following <code>for</code> loop prints out the name of each root vegetable in the list:
<pre id="part2" class="pre">for i in root_veggies:
    print i</pre>
Although it is common to use the letters <var>i</var>, <var>j</var>,  and <var>k</var> as loop variables, any valid variable name can be used.

		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->


<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 7-4: Using a <code>for</code> loop with a list containing text</h4></a>
<p>
Using a <code>for</code> loop, write a program to display the data in the list called city_names. This list stores the names of the cities, “Loftar”, “Miton”, and “Apella”. 
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


                <!--///////////////////////////////////////////////////////////////////
							TUTORIAL PART 6

				  //////////////////////////////////////////////////////////////////////-->

<a href="#part1" id="tutorial7part6"><h2><img class='numberIconImage' src='../images/numberIcons/six.png' > Part 6: Displaying objects in a list using the for loop</h2></a>
		  <p longdes="first part of tutorial 7 that introduces the for loop" id="part1">

In addition to numbers and textual data, lists can also store objects. For example, let us create three different objects of the GlassElevator class and store them in a list called elevator_list:
<pre id="part2" class="pre">elevator1 = GlassElevator()
elevator2 = GlassElevator()
elevator3 = GlassElevator()
elevator_list = [elevator1, elevator2, elevator3]
for item in elevator_list:
    print item</pre>
Copy this program into the editor and run it. You will observe that the output comprises of 3 lines of the form:</br>
<code>GlassElevator.GlassElevator instance at 0x100deaa28</code></br>
Each line is a brief description of an elevator object; the number at the end of the line identifies the object internally in the system and it can change each time the program is run. You don't need to concern yourself with this number.
To dispatch all three elevators to a certain floor, say 5, you can call the <code>go_to_floor()</code> method of the <code>Elevator</code> class within the loop as follows:
<pre id="part2" class="pre">for item in elevator_list:
    item.go_to_floor(5)</pre>
    
    		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->
    
<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 7-5: Creating custom objects of a class</h4></a>
<p>
The method <code>init</code> in the <code>Elevator</code> class takes three arguments, <var>elevator_floor</var>, <var>lowfloor</var>, and <var>highfloor</var>, and creates a custom object of this class. The first argument <var>elevator_floor</var> is the initial floor the elevator starts on. The next two arguments, <var>lowfloor</var> and <var>highfloor</var>,  are the lowest and highest floors, respectively, that the elevator goes to. The <code>init</code> method is never called explicitly; instead, the class name is used to create the object. For example, to create an elevator object called <var>elevator1</var> that starts on floor 101 of a building with lowest and highest floors of 0 and 200, respectively, you can write:</br>

<code>elevator1 = Elevator(101, 0, 200)</code></br>

In this exercise, create two custom objects of <code>Elevator</code> called <var>elevator_a</var> and <var>elevator_b</var>. <var>elevator_a</var> has a starting floor of 100, lowest floor of 0 and highest floor of 1000. <var>elevator_b</var> has a starting floor of 101, lowest floor of 0 and highest floor of 1001, respectively. Add these two objects to a list called <var>elevator_list</var>.
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


		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 7-6: Using a <code>for</code> loop with a list containing objects</h4></a>

<p>
The list <var>elevator_list</var> contains several objects of the <code>Elevator</code> class. Write a <code>for</code> loop to display these objects in the list.
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

<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 7-7: Creating a list of objects</h4></a>

<p>
The <code>init</code> method in the custom class <code>Ufo</code> takes two arguments, the id number and the status, to create an object of this class. The status can be <code>active</code> or <code>inactive</code>. Create two objects <var>ufo1</var> and <var>ufo2</var>, where <var>ufo1</var> has id 10 and status of <code>inactive</code>, and <var>ufo2</var> has id 13 and status of <code>active</code>. Add both objects to a list called <var>ufo_list</var>.
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
        
<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 7-8: Using a <code>for</code> loop to display objects in a list</h4></a>
<p>

The list named <var>ufo_list</var> created in the previous exercise contains objects of the <code>Ufo</code> class. Use a <code>for</code> loop to iterate over the list and display information about each object using the <code>display()</code> method in the <code>Ufo</code> class.
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


		<!-- //////////////////////// Practice Exercise  /////////////////////////////////-->

<a href="#part13" id="next13"><h4><img class='exerciseIconImage' > Practice Exercise 7-9: Using a <code>for</code> loop to selectively display objects in a list</h4></a>

Write a program to display information only of those <code>Ufo</code> objects in a list with a status of <code>active</code>. Create two objects <var>ufo1</var> and <var>ufo2</var>, where <var>ufo1</var> has id 10 and status of <code>inactive</code>, and <var>ufo2</var> has id 13 and status of <code>active</code>. Add both objects to a list called <var>ufo_list</var>. The <code>get_status()</code> method in the <code>Ufo</code> class returns the status of an object, and the <code>display()</code> method in the same class returns information about an object. Use a <code>for</code> loop to iterate over the list and display information about each object that has a status of <code>active</code>.
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

                <!--///////////////////////////////////////////////////////////////////
							TUTORIAL PART 7

				  //////////////////////////////////////////////////////////////////////-->

<a href="#part1" id="tutorial7part7"><h2><img class='numberIconImage' src='../images/numberIcons/seven.png' > Part 7: Tracking the UFOs</h2></a>
		  <p longdes="first part of tutorial 7 that introduces the for loop" id="part1">
Now, back to the task at hand. Merscythe has to use the Codue to track the UFOS. The <code>UfoTracker</code> class provides the method <code>get_ufo_list()</code> that returns a list containing objects of the <code>Ufo</code> class. Suppose that you want to display each object in the list. Before writing the code, we describe the steps that are needed to accomplish this:</br>
Step 1. Create an object of the <code>UfoTracker</code> class called <var>tracker</var>.</br>
Step 2. Use the <code>get_ufo_list()</code> method in the <code>UfoTracker</code> class to get a list containing the names of all <code>Ufo</code> objects. Store this data in a variable called <var>ufo_list</var>.</br>
Step 3: Display all the objects in <code>ufo_list</code>.</br>
Note how we have broken down the problem into a sequence of simpler steps known as an algorithm. When you encounter a more complex problem, you can use an algorithm to help you solve it. After you have devised an algorithm, write the code for each step in the algorithm. In step 1, an object of the <code>UfoTracker</code> class called <var>tracker</var> is created:</br>
<code>tracker = UfoTracker()</code></br>
In step 2, the names of all <code>Ufo</code> objects are stored in <var>ufo_list</var> as follows:</br>
<code>ufo_list = tracker.get_ufo_list()</code></br>
Finally, in step 3, a <code>for</code> loop is used to iterate over the objects in <var>ufo_list</var> and each object is displayed: 
<pre>for ufo in ufo_list:
    print ufo</pre>
Putting the code statements together creates the program. In addition, remember to import the classes you are using. The complete program for the algorithm discussed earlier follows:
<pre>from UfoTracker import UfoTracker
tracker = UfoTracker() 
ufo_list = tracker.get_ufo_list() 
for ufo in ufo_list:
    print ufo</pre>
This will display each <code>Ufo</code> object in <var>ufo_list</var>. To get more information about each object, you can use the <code>display()</code> method in the <code>Ufo</code> class. Change the statement
<code>print ufo</code></br>
to </br>
<code>ufo.display() </code></br>
Import the <code>Ufo</code> class. Run the program and observe the output. 
</p>

	<!-- //////////////////////////////////////////////////////////////////////
							TUTORIAL End

				  //////////////////////////////////////////////////////////////////////-->
				</br>
				<a href="#part17" id="next17">This concludes the tutorial.</a>

				<nav class="vertical" id="bottomnav" alt="end of tutorial 7 navigation menu">
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
				<input type="hidden" value="7" id="current"/>
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
	document.getElementById("clickedLinkName").value='practice_exercise7-'+i;
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

    

