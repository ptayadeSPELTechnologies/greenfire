<!-- Remove the mapping for email_list_test in controller.xml -->
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
    </head>
    <body>
    <form action=""  method="get" name="member_form1" id="member_form1">
    <fieldset>
        <legend> Registration info</legend>
        <label for="email">Email Address:</label>
        <input type="text" id="email" name="email"><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br>
        <label for="verify">Verify Password:</label>
        <input type="password" id="verify" name="verify"><br>
    </fieldset>
    <fieldset>
        <legend> Member info</legend>
        <label for="phone">Phone Number:</label>

        <input type="text" id="phone" name="phone" placeholder="999-999-9999">
                <span id="err">Span</span><br>
        <label for="start_date">Start Date:</label>
        <input type="text" id="start_date" name="start_date"><br>
    </fieldset>
    <fieldset id = "buttons">
        <legend> Submit Your Membership</legend>
        <label>&nbsp;</label>
        <input type="button" id="submit" name="submit" value="Submit">
        <input type="reset" id="reset" name="reset" value="Reset"><br>
    </fieldset>

    <script>
    $(document).ready(function() {
      console.log("hi211");
    
      $("#submit").click( function() {
         console.log("pressed submit");
          var text1 = $("#phone").val();
            console.log("ph is "+text1);
          if (text1 == "a")
              $("#phone").next().text("Error!");
        });
     });
    </script>

    </body>
</html>