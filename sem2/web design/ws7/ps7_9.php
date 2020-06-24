<?php
if(!isset($_SESSION['name']))
{
    if(isset($_GET['name']))
    {
        $_SESSION['name'] = $_GET['name'];
    }
}
?>
<html>
    <head>
        <title>ws7_9</title>
    </head>
    <body>
        <h1>Enter your name and it will be persistent</h1>
        <form>
            <input type = "text" name = "name" ><br><br>
            <input type="submit" value="Submit Name">
        </form>
        <?php
        if(isset($_SESSION['name']))
        {
            echo "<br><h1>Hello {$_SESSION['name']}</h1>";
        }
        ?>
    </body>
</html>