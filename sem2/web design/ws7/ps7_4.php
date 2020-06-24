<?php
$arr = localtime(time(),true);
$time = $arr["tm_hour"] . ":" . $arr['tm_min']. ":" . $arr['tm_sec'];
header("refresh: 1 ");
?>
<html>
    <head>
        <title>ws7_4</title>
    </head>
    <body>
        <h1>The Time at the server is <?= $time?> in the form of h:m:s.</h1>
    </body>
</html>