<!--Copyright (c) Spel Technologies, Inc. 2015


<html> 
    <head> 
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script> 
        <script src="http://www.skulpt.org/static/skulpt.min.js" type="text/javascript"></script> 
        <script src="http://www.skulpt.org/static/skulpt-stdlib.js" type="text/javascript"></script> 
        <script src = "/greenfire/js/mespeak.js" type="text/javascript"></script>
        <link href='http://fonts.googleapis.com/css?family=Ubuntu+Mono' rel='stylesheet' type='text/css'>
        

    </head> 
s
    <body> 
        <audio controls>
        	<source src="greenfire/audio/chapter1_part1.m4a" type="audio/mp4"/>
        	<p> Your browser does not support HTML5 audio.</p>
        </audio>
        
        <script type="text/javascript"> 
            //Desc whitespace
//high-level overview of code
//compiler error message read out error, go to code
            
            
            // output functions are configurable.
            function outf(text) { 
                var mypre = document.getElementById("output"); 
                outputText = mypre.innerHTML; 
            } 
            function builtinRead(x) {
                if (Sk.builtinFiles === undefined || Sk.builtinFiles["files"][x] === undefined)
                        throw "File not found: '" + x + "'";
                return Sk.builtinFiles["files"][x];
            }
            // Here's everything you need to run a python program in skulpt
            // grab the code from your textarea
            // get a reference to your pre element for output
            // configure the output function
            // call Sk.importMainWithBody()
            function punct(input, chars){
                var output = "";
                var addedBoolCheck = false;
                if(chars == undefined){
                var chars = [[" semicolon ",";"],[" quotes ",'"'],[" quote ","'"],[" left parenthesis ","("],[" right parenthesis ",")"],[" left bracket ","["],[" right bracket ","]"],[" dot ","."],[" equals ","="],[" left brace ","{"],[" right brace ","}"],[" slash ","/"],[" colon ",":"],[" com ma ",","],[" new line ", "\n" ],[" four spaces ","    "],[" question mark ","?"],[" percent","%"],[" plus ","+"],[" minus ","-"],[" times ","*"]];
                }
                if(input.length == null){
                    input.length = 0;
                    
                }
                for(var i = 0; i <= input.length-1; i++){ 
                    for(var k = 0; k <= chars.length-1; k++){
                        var kval = chars[k][1];
                        if(kval[0] == input[i] && kval.length > 1){
                                var curCharList = "";
                                for(var n = 0; n <= kval.length-1; n++){
                                    if(input[i+n] == chars[k][1][n]){
                                        curCharList += input[i+n];
                                    }else {
                                        break;
                                    }
                                    if(curCharList == chars[k][1]){
                                        output += ", "+ chars[k][0] + ", ";
                                        //prevents repeats:
                                        addedBoolCheck = true;
                                        i+=n+1;
                                        break;
                                    }
                                }
                        }
                        else if(kval == input[i] && kval.length == 1){
                            output += ", "+ chars[k][0] + ", ";
                            //prevents repeats:
                            addedBoolCheck = true;
                            break;
                        }
                        }
                    if(!addedBoolCheck){
                        output += input[i];
                    }else {
                        addedBoolCheck = false;
                    }
                }
                return output;
            };
            
            speaking = false;
            
            function sayit(currentString){
            
            
             /* 	if(currentString !== 'undefined'){
                    currentString = document.getElementById("yourcode").value;
                }
                
                meSpeak.loadConfig('/greenfire/js/mespeak_config.json');
                meSpeak.loadVoice('/greenfire/js/voices/fr.json');//make punctuation talk
                meSpeak.loadVoice('/greenfire/js/voices/en/en-us.json');
          
                var parts = [
  		
  					  { text: "Chapter 1. A Holey Reunion. Merscythe was just your typical, run of the mill 13-year-old. Emphasis on the", voice: "en/en-us" , variant:"m5",  speed:180,  wordgap:1, linebreak:2, pitch:50, roughness:0, flutter:1, echo:0},
  					  
  			          { text: "was", voice: "en/en-us" , variant:"m5",  speed:160,  wordgap:0, linebreak:2, pitch:40, roughness:0, flutter:1, consonants:10, echo:0, gender},
  					  
				    
				];
              
                if(!speaking){
                    speaking=true;
                    meSpeak.speakMultipart(parts);
                }
                speaking = false;*/
            };
            
            function runit() { 
               var prog = document.getElementById("yourcode").value; 
               var mypre = document.getElementById("output"); 
               mypre.innerHTML = ''; 
               Sk.pre = "output";
               Sk.configure({output:outf, read:builtinRead}); 
               (Sk.TurtleGraphics || (Sk.TurtleGraphics = {})).target = 'mycanvas';
               var myPromise = Sk.misceval.asyncToPromise(function() {
                   return Sk.importMainWithBody("<stdin>", false, prog, true);
               });
               myPromise.then(function(mod) {
                   sayit('success');
               },
                   function(err) {
                   meSpeak.speak(err.toString());
                   console.log(err.toString());
               });
            }
            
        </script>
        <h3>Try This</h3> 
        
        <form> 
            <textarea  onkeyup="pressListener()" onmouseup="this.onkeyup()" id="yourcode" cols="100" rows="10">
            	Chapter 1: A Holey Reunion
					Merscythe was just your typical, run of the mill 13-year-old. Emphasis on the “was.” Nowadays, he’s probably the least ordinary person in the world. Though he looks pretty normal with his soft, green eyes and black hair, he’s anything but ordinary. But before we get to all that, let’s go back to where this started—the small town of Gobbler’s Knob, Pennsylvania.
					Merscythe was at another boring family reunion. The tears, the “Oh, it’s been so long!”-s, and the hour-long talks about the old days was enough to drive him crazy. He’d rather get beaten up by Croy, the school bully (and he had experienced that a lot). He sat on a chair and avoided as many relatives as possible. He knew that they would find him and ask him what grade he was in, how old he was, what he likes to do, what he doesn’t like to do, and a bunch of other questions that would bore him to death.
					“Merscythe!” called someone, presumably his mother. “Aunt Arabella wants to talk to you! She’s come all the way from Massachusetts!”
						Merscythe groaned silently and ran away. As he ran, he tripped over a tree root and landed hard on his face. He moaned and rolled over. Looking at the thick trunk, he noticed something odd. About two feet from the base of the tree, set into the trunk, was a small screen. It was only about six inches wide. Merscythe pushed himself up to get a better look. As his hand brushed the tree, he realized that it didn’t feel like real wood—more like plastic. Glancing up, he realized that it had bright purple leaves that made no sound as they rustled. Looking closely at the screen, Merscythe saw that it showed a computer program and a small keyboard.
            
            
            </textarea><br> 
            <!-- <button type="button" onclick="runit()">Run</button>  -->
            <button type="button" onclick="sayit()">Say</button> 
        </form> 
        <pre id="output" ></pre> 
        <!-- If you want turtle graphics include a canvas -->
        <div id="mycanvas"></div> 
        <script>
        
            function preload(){
              //  meSpeak.loadConfig('/greenfire/js/mespeak_config.json');
               // meSpeak.loadVoice('/greenfire/js/en-us.json');//make punctuation talk
              //  meSpeak.speak(document.getElementById("yourcode").value, {rawdata: 'buffer'});
            }
            
            //preload();
            
            function textbox(){
                var ctl = document.getElementById('yourcode');
                var startPos = ctl.selectionStart;
                var endPos = ctl.selectionEnd;
                console.log(startPos + ", " + endPos);
            };
            
            function speakline(){
                var textIp = document.getElementById('yourcode');
                var sp = textIp.selectionStart;
                var txt = textIp.value;
                var breakeverything = false;
                var lines = txt.split('\n');
                console.log(txt);
                console.log(lines);
                var curline = 0;//the current line we are looking at
                var curchar = 0;//the character of the total string
                /*if(sp){
                    
                    for(var i = 0; i <= lines.length-1; i++){
                        for(var k = 0; k <= lines[i].length-1; k++){
                            if(curchar == sp){
                                breakeverything = true;
                                console.log(curchar + ", " + sp+"\n"+"Line: "+curline);
                                
                                break;
                            }
                            curchar++;//the importance of putting this after the if statement is that the first
                                      //if statement check is at zero
                            console.log(curchar);
                        }
                        curline++;
                        if(breakeverything){
                            break;
                        }
                    }
                    
                }*/
                if (true){
                    console.log("text: "+txt.substr(0, textIp.selectionStart).split("\n").length);
                    return txt.substr(0, textIp.selectionStart).split("\n").length;
                }//the line with the cursor
                else{
                    return null;
                }
            };
            
            function pressListener(){
                console.log("I began");
                var key = event.which || event.keyCode;
                if(key == 38||key == 40){
                    sayit(speakline());
                }
            };
        </script>
        <script type="text/javascript" src="https://rawgithub.com/hiddentao/google-tts/master/google-tts.min.js"></script>
    </body> 

</html>  