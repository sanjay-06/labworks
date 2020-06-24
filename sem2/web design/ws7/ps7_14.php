<?php
$conn= mysqli_connect("localhost", "rtsp", "qwerty", "students");
if (!$conn)
{
    echo "Error: " . mysqli_connect_error();
}
else
{
    $sql = "SELECT * FROM name";
    $retval = mysqli_query($conn,$sql);
    $name = array();
    $row;
    $i = 0;
    while ($row = mysqli_fetch_assoc($retval))
    {
        $name[$i] = $row['name'];
        $i++;
    }
    asort($name);
}
?>
<html>
    <head>
        <title>ws7_14</title>
    </head>
    <body>
        <h1>Sorting elements acquired from Database</h1>
        <?php
        echo "<P><B>Array after sorting is</b></p>";
        echo "<pre>";
        var_dump($name);
        echo "</pre>";
        ?>
    </body>
</html>