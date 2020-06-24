<?php
session_start();
if(isset($_SESSION['name']))
{
    $_SESSION['name'] .= " " . $_GET['name'];
}
else
{
    if(isset($_GET['name']))
    {
        $_SESSION['name'] = $_GET['name'];
    }
}
?>
<html>
    <head>
        <title>ws7_10</title>
    </head>
    <body>
        <h1>Enter your our item</h1>
        <form>
            <input type = "text" name = "name" ><br><br>
            <input type="submit" value="Add Item">
        </form>
        <?php
        if(isset($_SESSION['name']))
        {
            echo "<br><h1>Your Cart items<br> {$_SESSION['name']}</h1>";
        }
        ?>
    </body>
</html>