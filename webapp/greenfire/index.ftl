<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <title>loquacious</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <!-- Bootstrap Core CSS -->
    <link href="/greenfire/styles/startbootstrap-business-casual/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/greenfire/styles/startbootstrap-business-casual/css/business-casual.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine">

    <link rel="stylesheet" href="/greenfire/assets/css/custom.min.css">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine">

    <link href="/greenfire/styles/booklet/jquery.booklet.latest.css" type="text/css" rel="stylesheet" media="screen, projection, tv" />

    <!-- Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- testing the output -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script> 
    <script src="/greenfire/js/skulpt_modified.js" type="text/javascript"></script> 
    <script src="/greenfire/js/skulpt-stdlib.js" type="text/javascript"></script> 
    <script src = "/greenfire/js/mespeak.js" type="text/javascript"></script>
    <script src = "/greenfire/js/loquacious_with_testing.js" type="text/javascript"></script> 
    <script src = "/greenfire/js/checker.js" type="text/javascript"></script> 

    <style type="text/css">
        #mybook {
           background-color: rgba(0, 0, 0, 0);
           font-size: 15px !important;
           font-family: Georgia, serif !important;
           max-height: 900px;
           align:center;
           vertical-align: center;
           top:11px;
           left:6px;
           text-align: left;
 			
        }

        .title2 {
          font-family: 'Tangerine', serif;
          font-size: 48px; 
          text-shadow: 4px 4px 4px #aaa; 
          margin: 0;
          position: relative;
          padding-top: 50%;
          text-align: center;

        }
        
        .title4 {
          font-family: 'Tangerine', serif;
          font-size: 38px; 
          text-shadow: 4px 4px 4px #aaa; 
          margin: 0;
          position: relative;

        }
        
        .title3 {
          font-family: 'Tangerine', serif;
          font-size: 48px; 
          text-shadow: 4px 4px 4px #aaa; 
          margin: 0;
          position: relative;
          text-align: center;

        }

        .title {
          font-family: 'Tangerine', serif;
          text-align: right; 
          font-size: 26px !important;
        }

        .truncate {
          height: 730px;
          overflow: hidden;
          text-overflow: ellipsis;
      }

      .lock{

          margin: 0;
          position: relative;
          padding-top: 50%;
          text-align: center;

      }

      .button{
        cursor: pointer;
        display: inline-block;
        text-align: center;
        color: green;
        line-height: 1;
        padding: .6em .8em;
        /*background: #009afd;*/
       /* background:#ed3333;*/
       background: white;
        -webkit-transition: background 0.15s ease, color 0.15s ease;
        -moz-transition: background 0.15s ease, color 0.15s ease;
        -ms-transition: background 0.15s ease, color 0.15s ease;
        -o-transition: background 0.15s ease, color 0.15s ease;
        /*border: 1px solid #1777b7;*/ 
        border: 1px solid white;
        box-shadow: 0 1px 0 rgba(255,255,255,0.3) inset,0 1px 1px rgba(100,100,100,0.3);
        border-radius: 3px;
      }

      .loq{
            box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12) !important;

      }


      .bar{
        background-color: #f1f1f1;
        
      }

      .bar1{
        background:#a6a6a6;
      }

      .logo{
        font-family:Aileron Regular;
        font-size: 20px;
        text-align: center;
        color: white;
      }

      .locbox{
        border: none;
      }
      
      #output{
      
      background:white;

      }
      
      .message{
      

      
      }


      .editor{

         background-color:white !important;
         height:100%;
      }

      .question{
         background-color:white !important;
         height:100%;
         text-align: left;
         padding-left: 5%;
         padding-right: 5%;
         padding-top: 5%;
         padding-bottom: 5%;
      }
      
      
      .bookpage{
        padding-left:5%;
        padding-right:5%;
        padding-bottom:50%;
      
      }

	.bookcontainer{
		width: 1220px;
		height:840px;
		margin-left:auto;
  		margin-right:auto;
    background-image:url("/greenfire/images/MersctheCoverCenter.png");
     -ms-background-size: cover;
    -o-background-size: cover;
    -moz-background-size: cover;
    -webkit-background-size: cover;
    background-size: cover;
     background-repeat:   no-repeat;
     border: solid 1px;
	}
    </style>


<!--    <script>

     var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-23019901-1']);
      _gaq.push(['_setDomainName', "bootswatch.com"]);
        _gaq.push(['_setAllowLinker', true]);
      _gaq.push(['_trackPageview']);

     (function() {
       var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
       ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
       var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
     })();

    </script>-->
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
                <a class="navbar-brand" href="index.html">Business Casual</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="tutorial1">Tutorial</a>
                    </li>
                    <li>
                        <a href="about.html">Practice</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <section id="content" >
      
            <div class="row" style="padding-bottom:10px;">
                <div class="col-lg-12 text-center">
                   <div id="chapterNavBar">
                   </div>
                </div>
           </div>
           <div class="bookcontainer" align="center">
            <div id="mybook" lable="content">
                <div title="0 page">
                </div>
                <div title="cover page">
                	<div class="title2">Credits</div>
                </div>
                <div title="1 page">
                	<div class="title3">Table of Contents</div>
                	<div style="padding-left:15%; padding-top:7%; ">
                		<table class="table table-hover">
                			<tr >
                		
                				<td style="padding-bottom:5%;">
                					<div class="title4"><h4>Chapter 1: A Holey Reunion</h4></div>
                				</td>
                			</tr>
                			<tr>
                				
                				<td style="padding-bottom:5%;">
                					<div class="title4"><h4>Chpater 2: The Magnificent One</h4></div>
                				</td>
                			</tr>
                			<tr>
  
                				<td style="padding-bottom:5%;">
                					<div class="title4"><h4>Chapter 3: Through the Caverns</h4></div>
                				</td>
                			</tr>
                			<tr>
                				<td style="padding-bottom:5%;">
                					<div class="title4"><h4>Chapter 4: Little Men and Long Beards</h4></div>
                				</td>
                			</tr>
                			<tr>
                				<td style="padding-bottom:5%;">
                					<div class="title4"><h4>Chapter 5: Apella, Loftar, and Miton</h4></div>
                				</td>
                			</tr>
                			<tr>
                				<td style="padding-bottom:5%;">
                					<div class="title4"><h4>Chapter 6: The Ariester</h4></div>
                				</td>
                			</tr>
                			<tr>
                				<td style="padding-bottom:5%;">
                					<div class="title4"><h4>Chapter 7: Ari and the Smarties</h4></div>
                				</td>
                			</tr>
                			<tr>
                				<td style="padding-bottom:5%;">
                					<div class="title4"><h4>Chapter 8: Through the Lava Pit</h4></div>
                				</td>
                			</tr>
                		</table>
                	</div>
                </div>
                <div title="2 page">
                </div>
            </div>
            </div>
            
           <!-- <div>
            	<audio controls>
  					<source src="http://media.w3.org/2010/07/bunny/04-Death_Becomes_Fur.mp4" type='audio/wav' />
  					<p>Your user agent does not support the HTML5 Audio element.</p>
				</audio>
            <div>-->
      
    </section>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <p>Copyright &copy; SPEL Technologies, Inc. 2015.</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="/greenfire/js/startbootstrap-business-casual/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/greenfire/js/startbootstrap-business-casual/js/bootstrap.min.js"></script>

 <script>


      function loadChapter(){
          
            $.ajax({
                type: "GET",
                url: "book",
                dataType: "html",
                success: function(html){

                    $('#mybook').booklet("add", "end",  html);
                
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

            loadChapter();      

		    loadNavigationBar();  
      } 

      window.onload = load;           
  </script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script> window.jQuery || document.write('<script src="/greenfire/js/booklet/jquery-2.1.0.min.js"><\/script>') </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    


    <script src="/greenfire/assets/js/custom.js"></script>



    <script> window.jQuery.ui || document.write('<script src="/greenfire/js/booklet/jquery-ui-1.10.4.min.js"><\/script>') </script>
    <script src="/greenfire/js/booklet/jquery.easing.1.3.js"></script>
    <script src="/greenfire/js/booklet/jquery.booklet.latest.js"></script>



  <script>
      $(function () {   
          $("#mybook").booklet({
            closed: true,
            covers: true,
            width:  1160,
            height: 840,
            arrows: true,
            hash: true,
            pageBorder:0
          });
      });
    </script>

 <!--   <script type="text/javascript">
            $('#custom-goto').click(function(e){
            var goto=document.getElementById('custom-goto').innerHTML;
            $('#mybook').booklet("gotopage", 'ch2page1');

    });

    </script> -->
    
  <script>
		$(document).ready(function(){
		   // determine which tutorial link has been clicked
		   $(".link").click(function(e) {
		      var linkname = $(this).attr("id");
	    	  e.preventDefault();
	    	  e.stopPropagation();
	    	  console.log("clicked");
	    	  console.log(linkname);
	    	  
	    	  var datafile = "/greenfire/xml_files/" + linkname + ".xml";
  			  $("#dvContent").html("<ul></ul>");
  			  // read data from tutorial#.xml file
  			  $.ajax({
    			  type: "GET",
    			  url: datafile,
    			  dataType: "xml",
    			  success: function(xml){
      				  var title = $(xml).find('Title').text();
      				  var data = $(xml).find('Data').text();
      				  $("<li></li>").html(title + ", " + data).appendTo("#dvContent ul");
  			      },
  			      error: function() {
    			      alert("An error occurred while processing XML file.");
  			      }
  			  });
  			  
  			    var datafile1 = "/greenfire/xml_files/" + "question_examples" + ".xml";
  			    // parse the index from the name of link clicked; for example, question1 has index 1.
  			    console.log("linkname" +linkname.substr(8));
  			     var index = parseInt(linkname.substr(8)) - 1;
  			    //read data from questionExamples.xml file
  			    // this problem will be displayed in editor
  			      $.ajax({
    			  type: "GET",
    			  url: datafile1,
    			  dataType: "xml",
    			  success: function(xml){
    			      console.log(datafile1);
      				  var examples = $(xml).find("Examples");
      				  // find the relevant problem for current tutorial
      				  var data = examples.find("Data").eq(index).text();
      				  console.log(data);
      				 $("#loquacious").val(data);
      				 
  			      },
  			      error: function() {
    			      alert("An error occurred while processing XML file.");
  			      }
  			  });
  			  
  			    var datafile2 = "/greenfire/xml_files/" + "questionSolutions" + ".xml";
  			    // parse the index from the name of link clicked; for example, question1 has index 1.
  			    console.log("linkname" +linkname.substr(8));
  			     var index = parseInt(linkname.substr(8)) - 1;
  			    //read data from questionExamples.xml file
  			    // this problem will be displayed in editor
  			      $.ajax({
    			  type: "GET",
    			  url: datafile2,
    			  dataType: "xml",
    			  success: function(xml){
    			      console.log(datafile1);
      				  var examples = $(xml).find("Examples");
      				  // find the relevant problem for current tutorial
      				  var data = examples.find("Data").eq(index).text();
      				  //console.log("desired output read from XML file is " +data);
      				  //$("#desiredoutput").val(data);
      				 // insert the linkname into the hidden field
      				 //$("#clickedLinkName").val(linkname);
  			      },
  			      error: function() {
    			      alert("An error occurred while processing XML file.");
  			      }
  			  });
  			      
  		  });
	  });               
	</script>
	
	function audio(){
		
	}
	<script>
</body>

</html>
