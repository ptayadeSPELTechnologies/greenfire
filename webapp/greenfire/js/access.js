
//---- code to set focus on main content----


function focusmain(){
    console.log("focus is set to main content");
    $('#part1').focus();
}


$('#skipToMainContent').click(function(){
    $('#part1').focus();
});

//---- code to check mouse movement---- unused

$("p").hover(function(){
    //$(this).css("background-color", "yellow");
//sayit("mouse over tutorial paragraph "+this.id);
    }, function(){
    //$(this).css("background-color", "pink");
});

$(".pre").hover(function(){
    //$(this).css("background-color", "yellow");
//sayit("mouse over code area "+this.id);
    }, function(){
    //$(this).css("background-color", "pink");
});

$(".left-menu").hover(function(){
    //$(this).css("background-color", "yellow");
//sayit("mouse over left navigation menu ");
    }, function(){
    //$(this).css("background-color", "pink");
});

$(".horizontal").hover(function(){
    //$(this).css("background-color", "yellow");
//sayit("mouse over top navigation menu ");
    }, function(){
    //$(this).css("background-color", "pink");
});

$("#bottomnav").hover(function(){
    //$(this).css("background-color", "yellow");
//sayit("mouse over end of tutorial page navigation menu ");
    }, function(){
    //$(this).css("background-color", "pink");
});

/*--- code to listen to keyboard input-----------*/

document.addEventListener('keydown', function(event) {

    //alert(event.keyCode);
    if(event.keyCode == 37) {
        
        console.log("Left key was pressed");
        var current=parseInt(document.getElementById('current').value);

        if(current>1)
            current=current-1;

        document.getElementById('current').value=current;
        window.location="#next"+current;
    }
    else if(event.keyCode == 39) {
        
        console.log("Right key was pressed");

        var maxpart=14;
        var current=parseInt(document.getElementById('current').value);

        if(current<maxpart){
            var ncurrent=current+1;

        document.getElementById('current').value=ncurrent;
        window.location="#next"+current;

        }
        else {
            console.log("End of Page, no next link item");
        }
    }
    /*
    else if(event.keyCode == 66) {

        console.log("Redirecting to the book");
        window.location="index";
    }

    else if(event.keyCode == 80) {

        console.log("Redirecting to the practice exercise 1");
        window.location="practice1";
    }
    else if(event.keyCode == 49) {

        console.log("Go to tutorial 1");
        window.location="tutorial1";
    }
    else if(event.keyCode == 50) {

        console.log("Go to tutorial 2");
        window.location="tutorial2";
    }
    else if(event.keyCode == 51) {

        console.log("Go to tutorial 2");
        window.location="tutorial3";
    }
    else if(event.keyCode == 52) {

        console.log("Go to tutorial 2");
        window.location="tutorial4";
    }
    else if(event.keyCode == 53) {

        console.log("Go to tutorial 2");
        window.location="tutorial5";
    }
    else if(event.keyCode == 54) {

        console.log("Go to tutorial 2");
        window.location="tutorial6";
    }
    else if(event.keyCode == 55) {

        console.log("Go to tutorial 2");
        window.location="tutorial7";
    }*/
});

