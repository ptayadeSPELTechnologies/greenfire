<!----------------------------------------------------------------------------
Copyright 2015 SPEL Technologies, Inc. All Rights Reserved.
    Authors: Pranav Grover and Rohan Grover
     
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
 ----------------------------------------------------------------------->

<!-- include the meSpeak, skulpt and loquacious files -->
<html> 
    <head> 
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script> 
            <script src="/greenfire/js/skulpt_modified.js" type="text/javascript"></script> 
            <script src="/greenfire/js/skulpt-stdlib.js" type="text/javascript"></script> 
            <script src = "/greenfire/js/mespeak.js" type="text/javascript"></script>
            <script src = "/greenfire/js/loquacious_with_testing.js" type="text/javascript"></script> 
            <script src = "/greenfire/js/checker.js" type="text/javascript"></script> 
    </head> 

    <body> 
     
        
        <!-- create the text area for editor and buttors for Run, Say and Overview functions -->
        <h3>Loquacious Python Editor </h3> 
        
        <form> 
            <textarea  onkeyup="pressListener(event)" onmouseup="this.onkeyup()" id="loquacious" cols="40" rows="10">
from Dog import Dog</textarea><br> 
   			
            <button type="button" onclick="runit();">Run</button> 
            <button type="button" onclick="sayit(document.getElementById('loquacious').value)">Say</button> 
            <button type="button" onclick="overview()">Overview</button> 
        </form> 
        
        <pre id="output"></pre> 
        <div id="mycanvas"></div> 
        
        <!-- store the desired output here -->
        <form name= "solution">
           <input type=hidden id="desiredoutput" value=""/>
           <input type=hidden id="clickedLinkName" value=""/>
           <input type=hidden id="testingOutput" value=""/>
        </form>
        
     
        
      </body> 
      
      <script>
    /*  function runandtest() {
        	var myPromise = Sk.misceval.callsimAsync(null, runit).then(function success() {
             	 console.log("Entering function checkit from runandtest");
             	 checkit();
        	 },function failure() {
                 console.log("Function threw an exception: ");
           });
      }
      */

    
     </script>

</html>  