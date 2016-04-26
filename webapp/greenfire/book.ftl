<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <title>loquacious</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">-->

    <!-- Bootstrap Core CSS -->
   <!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- for toggle -->
    <link href="/greenfire/styles/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>



    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine">

    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine">

    <link href="/greenfire/styles/booklet/jquery.booklet.latest.css" type="text/css" rel="stylesheet" media="screen, projection, tv" />




    
    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>

    <link href='https://fonts.googleapis.com/css?family=Cutive+Mono' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Custom CSS -->
    <link href="/greenfire/styles/book.css" rel="stylesheet">
    <!-- Custom CSS -->
    <!--<link href="/greenfire/styles/startbootstrap-business-casual/css/business-casual.css" rel="stylesheet">-->
    
    <script src="/greenfire/js/skulpt_modified.js" type="text/javascript"></script> 
    <script src="/greenfire/js/skulpt-stdlib.js" type="text/javascript"></script> 
    <script src = "/greenfire/js/mespeak.js" type="text/javascript"></script>
    <script src = "/greenfire/js/loquacious_for_questions.js" type="text/javascript"></script> 

    <script type="text/javascript">

      function navigation(){
         //alert(document.getElementById("chapterunlock").value);
/*
         for(var i=1;i<=document.getElementById("chapterunlock").value;i++){
          var id="navLink"+i;
          var em=document.getElementById(id);
          var page=document.getElementById("ch"+i).value;
          em.innerHTML="<a  href='#/page/"+page+"' ><img src='/greenfire/images/book/nav/chapter"+i+"unlocked.png' alt='chapter "+i+" unlocked' /></a>";
          var tableofContentLink=document.getElementById("table-content-"+i);
          tableofContentLink.setAttribute("href", '#/page/'+page); 
           //em=document.getElementById("circle"+i);
           //em.style.backgroundColor='#ffa500';
         }

         var i=parseInt(document.getElementById("chapterunlock").value);
         if(i<8){
           i++;
           var id="navLink"+i;
           var em=document.getElementById(id);
           var page=document.getElementById("quest"+(i-1)).value;
           em.innerHTML="<a  href='#/page/"+page+"'><img src='/greenfire/images/book/nav/question"+(i-1)+".png' alt='question "+(i-1)+" ' /></a>";
           //em=document.getElementById("circle"+i);
           //em.style.backgroundColor='#f46049';
           i--;
        }

        if(document.getElementById("chapterunlock").value<8){
         for(var j=i+1;j<=8;j++){
          var page=j+1;
          var id="navLink"+page;
          var em=document.getElementById(id);
          em.innerHTML="<a  href='javascript:void(0)''><img src='/greenfire/images/book/nav/chapter"+(j)+"locked.png' alt='chapter "+(j)+" locked' /></a>";
         }
       } -->

      /* if(document.getElementById("chapterunlock").value==8){
          var id="navLink9";
          var em=document.getElementById(id);
          em.innerHTML="<a  href='javascript:void(0)''><img src='/greenfire/images/book/nav/chapter8locked.png' /></a>";
       } */

       //alert(document.getElementById("chapterunlock").value);

         for(var i=1;i<=document.getElementById("chapterunlock").value;i++){
          var id="navLink"+i;
          var em=document.getElementById(id);
          var page=document.getElementById("ch"+i).value;
          em.innerHTML="<a  href='#/page/"+page+"' ><img src='/greenfire/images/book/nav/chapter"+i+"unlocked.png' alt='chapter "+i+" unlocked' /></a>";
           //em=document.getElementById("circle"+i);
           //em.style.backgroundColor='#ffa500';

           var tableofContentLink=document.getElementById("table-content-"+i);
          tableofContentLink.setAttribute("href", '#/page/'+page); 
         }

         var i=parseInt(document.getElementById("chapterunlock").value);
         if(i<8){
           i++;
           var id="navLink"+i;
           var em=document.getElementById(id);
           var page=document.getElementById("questionPageNumber").value;
           em.innerHTML="<a  href='#/page/"+page+"'><img src='/greenfire/images/book/nav/question"+(i-1)+".png' alt='question "+(i-1)+" ' /></a>";
           //em=document.getElementById("circle"+i);
           //em.style.backgroundColor='#f46049';
           i--;
        }

        if(document.getElementById("chapterunlock").value<8){
         for(var j=i+1;j<=8;j++){
          var page=j+1;
          var id="navLink"+page;
          var em=document.getElementById(id);
          em.innerHTML="<a  href='javascript:void(0)''><img src='/greenfire/images/book/nav/chapter"+(j)+"locked.png' alt='chapter "+(j)+" locked' /></a>";
         }
       }
      }

</script>
<script type="text/javascript">
      function loadNextChapterData(page){
          $.ajax({
                      type: "GET",
                      url: "LoadChapter?lastPageNumber="+page+"",
                      dataType: "html",
                      success: function(html){

                          $('#mybook').booklet("remove", "end");
                          $('#mybook').booklet("remove", "end");
                          $('#mybook').booklet("remove", "end");
                  

                          $('#mybook').booklet("add", "end",  html);
                          $('#mybook').booklet("remove", "end");

                          
                         //$('#mybook').booklet("add", page, html);

                         // location.reload();
                         window.location.hash='/page/'+page;
                          navigation(); 
              
                        },
                        error: function() {
                          //alert("An error occurred while processing XML file.");
                        }  
                    }); 

      }
      function loadNextChapter(){
      
        var page=document.getElementById("questionPageNumber").value;
        window.setTimeout( loadNextChapterData(page), 5000 );
        //loadNextChapterData();      
      }
    </script>
    <script src = "/greenfire/js/checker.js" type="text/javascript"></script> 
</head>

<script>

function sayitMod(){
	var data=document.getElementById("loquacious").value;
	sayit(data);
}
</script>
<body>

  <!--  <a id="skipToMainContent" longdes="click this link to skip the navigation and go to main content" href="#navLink1" onclick="focusmain()">Skip and Go to Main Content</a> -->
   <!-- <section id="mainNav" >
        <nav class="horizontal">
            <ul>
              <li><a href="/greenfire/control/tutorial1" ><h2>Tutorials</h2></a></li>
            </ul>
        </nav>  
    </section>-->
    <section id="content" >
      <div class="container-fluid">
        <!--
          <div style="top:10%; position:absolute; right:10%;">
            <h3>Feedback Level</h3>
              <div class="bootstrap-switch bootstrap-switch-wrapper bootstrap-switch-on bootstrap-switch-animate" style="width: 102px;"><div class="bootstrap-switch-container" style="width: 150px; margin-left: 0px;"><span class="bootstrap-switch-handle-on bootstrap-switch-primary" style="width: 50px;">ON</span><span class="bootstrap-switch-label" style="width: 50px;">&nbsp;</span><span class="bootstrap-switch-handle-off bootstrap-switch-default" style="width: 50px;">OFF</span><input type="radio" name="radio2" checked="" data-radio-all-off="true" class="switch-radio2"></div></div>
              <div class="bootstrap-switch bootstrap-switch-wrapper bootstrap-switch-off bootstrap-switch-animate" style="width: 102px;"><div class="bootstrap-switch-container" style="width: 150px; margin-left: -50px;"><span class="bootstrap-switch-handle-on bootstrap-switch-primary" style="width: 50px;">ON</span><span class="bootstrap-switch-label" style="width: 50px;">&nbsp;</span><span class="bootstrap-switch-handle-off bootstrap-switch-default" style="width: 50px;">OFF</span><input type="radio" name="radio2" data-radio-all-off="true" class="switch-radio2"></div></div>
              <div class="bootstrap-switch bootstrap-switch-wrapper bootstrap-switch-off bootstrap-switch-animate" style="width: 102px;"><div class="bootstrap-switch-container" style="width: 150px; margin-left: -50px;"><span class="bootstrap-switch-handle-on bootstrap-switch-primary" style="width: 50px;">ON</span><span class="bootstrap-switch-label" style="width: 50px;">&nbsp;</span><span class="bootstrap-switch-handle-off bootstrap-switch-default" style="width: 50px;">OFF</span><input type="radio" name="radio2" data-radio-all-off="true" class="switch-radio2"></div></div>
            </div>
          </div> -->

            <!--
          <div class="row" >
              <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1 text-center">
                  <div class="navLink" id="navLink1"></div>
              </div>
              <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1 text-center">
                  <div class="navLink" id="navLink2"></div>
              </div>
              <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1 text-center">
                  <div class="navLink" id="navLink3"></div>
              </div>
              <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1 text-center">
                  <div class="navLink" id="navLink4"></div>
              </div>
              <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1 text-center">
                  <div class="navLink" id="navLink5"></div>
              </div>
              <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1 text-center">
                  <div class="navLink" id="navLink6"></div>
              </div>
              <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1 text-center">
                  <div class="navLink" id="navLink7"></div>
              </div>
              <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1 text-center">
                  <div class="navLink" id="navLink8"></div>
              </div>
              <div class="col-xs-2 col-sm-2 col-md-1 col-lg-1 text-center">
                  <div class="navLink" id="navLink9"></div>
              </div>
          </div>

        -->
        <div class="container">
            <nav class="chapter-Nav-horizontal">
              <ul>
                <li class="navLink" id="navLink1"></li>
                <li class="navLink" id="navLink2"></li>
                <li class="navLink" id="navLink3"></li>
                <li class="navLink" id="navLink4"></li>
                <li class="navLink" id="navLink5"></li>
                <li class="navLink" id="navLink6"></li>
                <li class="navLink" id="navLink7"></li>
                <li class="navLink" id="navLink8"></li>
                <li class="navLink" id="navLink9"></li>
              </ul>
            </nav> 
            <div  class="row" style="align:center; padding-bottom: 2%;">
              <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">   
              </div>
              <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 text-center">
                    <label ><h4 style="color:white;">Audio</h4></label>
                    <input type="checkbox" id="audioCheckBox" name="audioCheckBox" checked>
              </div>
              <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 text-center">
                    
              </div>
              <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-center">
                    <label for="audio" ><h4 style="color:white;">Audio Control</h4></label>
                    <audio id="audio" controls autoplay>
                          <source id="wavSource" src='' type='audio/wav'  />
                          <p>Your user agent does not support the HTML5 Audio element.</p>
                    </audio>
              </div>
                <div class="col-xs-2 col-sm-2 col-md-6 col-lg-6 text-center">
                </br>
                    <a href="/greenfire/control/tutorial1" ><h4 style="color:white;">Go To Tutorials</h4></a>
              </div>
           </div>
        </div>

          <!--<iframe src="https://appear.in/priyanka" width="700" height="600" frameborder="0"></iframe> -->
           <!--<img src="/greenfire/images/stock-illustration-20442031-open-book.jpg" />-->
           <div class="bookcontainer" id="bookcontainer" align="center">
            <!--<img src="/greenfire/images/MersyctheCoverCenterStockphoto.png" width="1000" />-->
            <div id="mybook" lable="content">
                <div title="cover page" style="">
                  
                </div>
                <div title="cover page" style="padding-right:40px; padding-top:30px;" >
                    <img src="/greenfire/images/Merscythe-Ebook-Cover.jpg" width="400px" height="550px"align="right" border="1"/>
                </div> 
                <div title="2 page">
                	<div class="title2">Credits</div>
                </div>
                <div title="1 page">
                	<div class="title3" style="">Table of Contents</div>
                	<div style="padding-left:5%; padding-top:7%; ">
                		<table class="table table-hover">
                			<tr >
                		
                				<td style="padding-bottom:5%;">
                					<div class="title4"><a href="#/page/3" id="table-content-1"><h4>Chapter 1: A Holey Reunion</h4></a></div>
                				</td>
                			</tr>
                			<tr>
                				
                				<td style="padding-bottom:5%;">
                					<div class="title4"><a href="#/page/3" id="table-content-2"><h4>Chapter 2: The Magnificent One</h4></a></div>
                				</td>
                			</tr>
                			<tr>
  
                				<td style="padding-bottom:5%;">
                					<div class="title4"><a href="#/page/3" id="table-content-3"><h4>Chapter 3: Through the Caverns</h4></a></div>
                				</td>
                			</tr>
                			<tr>
                				<td style="padding-bottom:5%;">
                					<div class="title4"><a href="#/page/3" id="table-content-4"><h4>Chapter 4: Little Men and Long Beards</h4></a></div>
                				</td>
                			</tr>
                			<tr>
                				<td style="padding-bottom:5%;">
                					<div class="title4"><a href="#/page/3" id="table-content-5"><h4>Chapter 5: Apella, Loftar, and Miton</h4></a></div>
                				</td>
                			</tr>
                			<tr>
                				<td style="padding-bottom:5%;">
                					<div class="title4"><a href="#/page/3" id="table-content-6"><h4>Chapter 6: The Ariester</h4></a></div>
                				</td>
                			</tr>
                			<tr>
                				<td style="padding-bottom:5%;">
                					<div class="title4"><a href="#/page/3" id="table-content-7"><h4>Chapter 7: Ari and the Smarties</h4></a></div>
                				</td>
                			</tr>
                			<tr>
                				<td style="padding-bottom:5%;">
                					<div class="title4"><a href="#/page/3" id="table-content-8"><h4>Chapter 8: Through the Lava Pit</h4></a></div>
                				</td>
                			</tr>
                		</table>
                	</div>
                </div>
              </div>
            </div>
          </div>

          </br></br>
            
           <!-- <div>
            	<audio controls>
  					<source src="http://media.w3.org/2010/07/bunny/04-Death_Becomes_Fur.mp4" type='audio/wav' />
  					<p>Your user agent does not support the HTML5 Audio element.</p>
				</audio>
            <div>-->

      </div>
    </section>

    <!--  <footer>

    <div id="chapterNavBar">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <p>Copyright &copy; SPEL Technologies, Inc. 2015.</p>
                </div>
            </div>
        </div> 
    </footer> -->

    <!-- jQuery -->
   <!-- <script src="/greenfire/js/startbootstrap-business-casual/js/jquery.js"></script> -->

    <!-- Bootstrap Core JavaScript -->
    <script src="/greenfire/js/bootstrap.min.js"></script>

    <script>
      $(function () {   
          $("#mybook").booklet({
            closed: false,
            covers: true,
            width:  1000,
            height: 700,
            arrows: true,
            hash: true,
            pageBorder:0
          });
      });
    </script>
    
    
     <script>


      function loadChapter(){
          
            $.ajax({
                type: "GET",
                url: "BookData",
                dataType: "html",
                success: function(html){

                    $('#mybook').booklet("add", "end",  html);
         
                      navigation();  
                  },
                  error: function() {
                    //alert("An error occurred while processing XML file.");
                  }  
              }); 
            
      }
      
      function loadNavigationBar(){

        	$.ajax({
                  type: "GET",
                  url: "chapternav",
                  dataType: "html",
                  success: function(html){

                  	     document.getElementById("chapterNavBar").innerHTML=html;
                  
                    },
                    error: function() {
                      //alert("An error occurred while processing XML file.");
                    }                  
                });  


      }

    

      function load() {

        //alert(location.hash);
        loadChapter();      

		    //loadNavigationBar();  
        
      } 

      window.onload = load;           
  </script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script> window.jQuery || document.write('<script src="/greenfire/js/booklet/jquery-2.1.0.min.js"><\/script>') </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    

  <script> window.jQuery.ui || document.write('<script src="/greenfire/js/booklet/jquery-ui-1.10.4.min.js"><\/script>') </script>
    <script src="/greenfire/js/booklet/jquery.easing.1.3.js"></script>
    <script src="/greenfire/js/booklet/jquery.booklet.latest.js"></script>


    <script src = "/greenfire/js/miniLoqProgValidator.js" type="text/javascript"></script> 
    
		<script src="/greenfire/js/jquery.ba-hashchange.js" type="text/javascript"></script> 
		
    <!--<div class="chapterNavigation">
      <!--
      <div class="navLink" id="navLink1"></div>
      <div class="navLink" id="navLink2"></div>
      <div class="navLink" id="navLink3"></div>
      <div class="navLink" id="navLink4"></div>
      <div class="navLink" id="navLink5"></div>
      <div class="navLink" id="navLink6"></div>
      <div class="navLink" id="navLink7"></div>
      <div class="navLink" id="navLink8"></div>
      <div class="navLink" id="navLink9"></div>
    
    </div>-->

  <!-- <input type="hidden" id="ch1" value="5" />
    <input type="hidden" id="ch2" value="11" />
    <input type="hidden" id="ch3" value="21" />
    <input type="hidden" id="ch4" value="27" />
    <input type="hidden" id="ch5" value="41" />
    <input type="hidden" id="ch6" value="57" />
    <input type="hidden" id="ch7" value="69" />
    <input type="hidden" id="ch8" value="83" />

    <input type="hidden" id="quest1" value="11" />
    <input type="hidden" id="quest2" value="21" />
    <input type="hidden" id="quest3" value="29" /> 
    <input type="hidden" id="quest4" value="43" /><
    <input type="hidden" id="quest5" value="59" /><
    <input type="hidden" id="quest6" value="71" /><
    <input type="hidden" id="quest7" value="85" />-->


</body>


<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.3/highlight.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
  <script src="/greenfire/js/bootstrap-switch.min.js"></script>
  <script>
      
    $('[type="checkbox"]').bootstrapSwitch();

    

</script>

<script type="text/javascript">
    $('input[name="audioCheckBox"]').on('switchChange.bootstrapSwitch', function(event, state) {
        console.log(this); // DOM element
        console.log(event); // jQuery event
        console.log(state); // true | false
        var playme = document.getElementById('audio');
        if(state==true){
          playme.play();
        }
        else {
          playme.src='';
        }
    });
</script>
<script>
  


  $(function(){
    $(window).hashchange( function(){

      if(location.hash=='#/page/1'){
          //document.getElementById("bookcontainer").style.backgroundImage = 'url("/greenfire/images/HiRes_Half.png")';
          return;
        }
        var page=parseInt(location.hash.substr(location.hash.lastIndexOf('/')+1));
        var chapterunlock=parseInt(document.getElementById('chapterunlock').value);
        //int[] page={0,5,9,15,19,27,35,41,49,57};
        var playme = document.getElementById('audio');
        var pageno=[8,12,18,22,30,39,43,51,60];
        //alert(page); 
        
        /*if(location.hash=='#/page/'+pageno[chapterunlock] ){
          document.getElementById("bookcontainer").style.backgroundImage = 'none';
        }*/

        if(page==document.getElementById("ch1").value) {
            if(document.getElementById("audioCheckBox").checked==true){
              //alert("CHAPTER 1");
             playme.src='/greenfire/audio/CHAPTER/CHAPTER1.wav';
           }
        }
        if(chapterunlock>2 || chapterunlock==2){

            if(page==document.getElementById("ch2").value) {
              //alert("CHAPTER 2");
              if(document.getElementById("audioCheckBox").checked==true){
                playme.src='/greenfire/audio/CHAPTER/CHAPTER2.wav';
              }
           }
        }
        if(chapterunlock>3 || chapterunlock==3){
          //alert(page);
          if(page==parseInt(document.getElementById("ch3").value)) {
            //alert("CHAPTER 3");
            if(document.getElementById("audioCheckBox").checked==true){
              playme.src='/greenfire/audio/CHAPTER/CHAPTER3.wav';
            }
           }
        }
        if(chapterunlock>4 || chapterunlock==4){
          if(page==document.getElementById("ch4").value) {
            //alert("CHAPTER 4");
            if(document.getElementById("audioCheckBox").checked==true){
             playme.src='/greenfire/audio/CHAPTER/CHAPTER4.wav';
            }
           }
        }
        if(chapterunlock>5 || chapterunlock==5){
          if(page==document.getElementById("ch5").value) {
            //alert("CHAPTER 5");
            if(document.getElementById("audioCheckBox").checked==true){
              playme.src='/greenfire/audio/CHAPTER/CHAPTER5.wav';
            }
           }
        }
        if(chapterunlock>6 || chapterunlock==6){
          if(page==document.getElementById("ch6").value) {
            //alert("CHAPTER 6");
            if(document.getElementById("audioCheckBox").checked==true){
              playme.src='/greenfire/audio/CHAPTER/CHAPTER6.wav';
            }
           }
        }
        if(chapterunlock>7 || chapterunlock==7){
          if(page==document.getElementById("ch7").value) {
            //alert("CHAPTER 7");
            if(document.getElementById("audioCheckBox").checked==true){
              playme.src='/greenfire/audio/CHAPTER/CHAPTER7.wav';
            }
           }
        }
        if(chapterunlock==8){
          if(page==document.getElementById("ch8").value) {
            //alert("CHAPTER 8");
            if(document.getElementById("audioCheckBox").checked==true){
              playme.src='/greenfire/audio/CHAPTER/CHAPTER8.wav';
            }
           }
        }
        if(chapterunlock<8){

        if(page==document.getElementById("questionPageNumber").value) {
             //alert('Chapter 2');
             if(chapterunlock==1){
                //alert("QUESTION 1");
                if(document.getElementById("audioCheckBox").checked==true){
                  playme.src='/greenfire/audio/QUESTION/QUESTION1.wav';
              }
             }
             else if(chapterunlock==2){
                //alert("QUESTION 2");
                if(document.getElementById("audioCheckBox").checked==true){
                  playme.src='/greenfire/audio/QUESTION/QUESTION2.wav';
              }

             }
             else if(chapterunlock==3){
                //alert("QUESTION 3");
                if(document.getElementById("audioCheckBox").checked==true){
                  playme.src='/greenfire/audio/QUESTION/QUESTION3.wav';
              }
             }
             else if(chapterunlock==4){
                //alert("QUESTION 4");
                if(document.getElementById("audioCheckBox").checked==true){
                  playme.src='/greenfire/audio/QUESTION/QUESTION4.wav';
              }
             }
             else if(chapterunlock==5){
                //alert("QUESTION 5");
                if(document.getElementById("audioCheckBox").checked==true){
                  playme.src='/greenfire/audio/QUESTION/QUESTION5.wav';
              }
             }
             else if(chapterunlock==6){
                //alert("QUESTION 6");
                if(document.getElementById("audioCheckBox").checked==true){
                  playme.src='/greenfire/audio/QUESTION/QUESTION6.wav';
              }
             }
             else if(chapterunlock==7){
                //alert("QUESTION 7");
                if(document.getElementById("audioCheckBox").checked==true){
                  playme.src='/greenfire/audio/QUESTION/QUESTION7.wav';
              }
             }
    
        }

      }

       // if(page==parseInt(document.getElementById("questionPageNumber").value)+2) {
          //document.getElementById("bookcontainer").style.backgroundImage = 'url("/greenfire/images/bookLeft.jpg")';
        //}

          

    })
   /* 
   $("#mybook").bind("bookletchange", function(event, data) {
    
      var lastPage=parseInt(document.getElementById("questionPageNumber").value);
      //alert(last[chapterunlock]);
    if(location.hash=='#/page/3' || location.hash=='#/page/'+lastPage){
       document.getElementById("bookcontainer").style.backgroundImage = 'url("/greenfire/images/book.png")';
      } 
  
    });
    
    /*$("#mybook").bind("bookletstart", function(event, data) {
      if(location.hash=='#/page/1' || location.hash=='#/page/11')
        document.getElementById("bookcontainer").style.backgroundImage = 'none';
    });   */

    // Trigger the event (useful on page load).

   // var event=$(window).hashchange();

  }); 
    </script>
</html>
