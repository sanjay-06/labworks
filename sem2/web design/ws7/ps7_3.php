<?php
session_start();
if(isset($_SESSION['views']))
$_SESSION['views'] = $_SESSION['views']+1;
else
$_SESSION['views']=1;
?>
<html>
    <head>
        <title>ws7_3</title>
    </head>
    <body>
        <h1>This site is visited <?= $_SESSION['views'] ?> times.</h1>
    </body>
</html>