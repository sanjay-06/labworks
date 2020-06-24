<?php
$array = array ("Sophia"=>"31","Jacob"=>"41","William"=>"39","Ramesh"=>"40");
echo "<h1> Original Array</h1><pre>";
var_dump($array);
echo "</pre>";
?>
<html>
    <head>
        <title>ws7_8</title>
    </head>
    <body>
        <h1>Ascending order sort by value</h1>
        <pre>
            <?php
            asort($array);
            var_dump($array);
            ?>
        </pre>
        <h1>Ascending order sort by key</h1>
        <pre>
             <?php
                ksort($array);
                var_dump($array);
             ?>
        </pre>
        <h1>Descending order sorting by value</h1>
        <pre>
            <?php
                arsort($array);
                var_dump($array);
            ?>
        </pre>
        <h1>Descending order sorting by key</h1>
        <pre>
            <?php
                krsort($array);
                var_dump($array);
            ?>
        </pre>
    </body>
</html>