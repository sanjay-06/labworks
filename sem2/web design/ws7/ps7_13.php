<?php
if(isset($_GET["email"] ))
{
    $email = $_GET["email"];
    if (!filter_var($email, FILTER_VALIDATE_EMAIL))
    {
        $emailmsg = "Invalid email format";
    }
    else
    {
        $emailmsg = "Valid email format";
    }
}
?>
<html>
    <head>
        <title>ws7_13</title>
    </head>
    <body>
        <h1>Email validation</h1>
        <form>
            <input type = "text" name = "email" placeholder="Enter a email"><br><br>
            <input type="submit">
        </form><br><br>
        <?php
        if(isset($_GET["email"] ))
        {
            echo "$emailmsg";
        }
        ?>
    </body>
</html>