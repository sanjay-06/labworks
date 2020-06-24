<?php
if(isset($_GET['name']))
{
    setcookie("cookie",$_GET['name']);
}
?>
<html>
    <head>
        <title>ws7_11</title>
    </head>
    <body>
        <h1>Enter your name ( persisted by cookie )</h1>
        <p>Reload to see your name displayed</p>
        <form>
            <input type = "text" name = "name" ><br><br>
            <input type="submit" value="Enter!!">
        </form>
        <?php
        if(isset($_GET['name']))
        {
        echo "Cookie is {$_COOKIE['cookie']}";
        }
        ?>
    </body>
</html>