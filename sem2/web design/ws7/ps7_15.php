<?php
if(isset($_GET['url']))
{
    $conn= mysqli_connect("localhost", "rtsp", "qwerty", "URL");
    if (!$conn)
    {
        echo "Error: " . mysqli_connect_error();
    }
    else
    {
        $sql = "INSERT INTO URLTable(url, description) VALUES('$_GET[url]', '$_GET[des]')";
        if (mysqli_query($conn, $sql))
        {
            alert("hello");
        }
        else
        {
            echo "Error: " . $sql. "<br>" . mysqli_error($conn);
        }
    }
}
?>
<html>
    <head>
        <title>ws7_15</title>
        <style>
            table,th,td,tr
            {
            border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <h1>Adding elements into Database and then displaying them</h1>
        <form>
            <h3>Enter the URL</h3>
            <input type = "text" name = "url" placeholder="Enter the url ">
            <h3>Enter the Description</h3>
            <input type = "text" name = "des" placeholder="Enter the description "><br><br>
            <input type="submit">
        </form>
        <?php
        if(isset($_GET['url']))
        {   
            $sql = "SELECT * FROM URLTable";
            $retval = mysqli_query($conn,$sql);
            $row;
            echo "<h2>Table of the url's</h2>";
            echo "<table>";
            echo "<tr>";
            echo "<th>URL</th>";
            echo "<th>Description</th>";
            echo "</tr>";
            while ($row = mysqli_fetch_assoc($retval))
            {
                echo "<tr>";
                echo "<td>$row[url]</td>";
                echo "<td>$row[description]</td>";
                echo "</tr>";
            }
            echo "</table>";
        }
        ?>
    </body>
</html>