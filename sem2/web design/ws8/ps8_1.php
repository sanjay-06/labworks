<?php
$valid = true;
if(isset($_POST['first']))
{
    $conn= mysqli_connect("localhost", "ranga", "qwerty", "ws8_1");
    if(!$conn)
    {
        echo "Connectoin Failed:" . mysqli_connect_error() ;
    }
    else
    {
        $sql= "INSERT INTO address (first, last, street, city, state, zipcode, t_number) VALUES ('$_POST[first]','$_POST[last]','$_POST[street]', '$_POST[city]', '$_POST[state]', '$_POST[zipcode]','$_POST[phone]')";
        if (mysqli_query($conn, $sql))
        {
            echo "New record created successfully";
        }
        else
        {
            echo "Error: " . $sql. "<br>" . mysqli_error($conn);
        }
        mysqli_close($conn);
    }
}
if (isset($_POST['search']))
{
    $conn= mysqli_connect("localhost", "ranga", "qwerty", "ws8_1");
    if(!$conn)
    {
        echo "Connectoin Failed:" . mysqli_connect_error() ;
    }
    else 
    {
        $retval = $conn->query("SELECT * FROM address");
        $table = [];
        while($row = mysqli_fetch_assoc($retval))
        {
            array_push($table, $row);
        }
        echo json_encode($table);
    }
}
?>
<html>
    <head>
        <title>ws8_1</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="ws8_1.js"></script>
        <style>
            #box
            {
            background-color: lightgoldenrodyellow;
            width: 50%;
            border-radius: 2%;
            }
            a:link{
            color: black !important;
            }
            a:hover{
            color: black!important;
            }
            a:active{
            color: black !important;
            }
            a:visited{
            color: black !important;
            }
        </style>
    </head>
    <body onload="load()">
        <h1>Address Book</h1>
        <button onclick="search()">Search</button>
        <button onclick="add()">Add an Entry</button>
        <div id="search" method="post" >
            <p>Search by last name:<input type="text" id = "search_1" onkeyup="sendDetails()"></p>
            <div id="contact_list" align = "center"></div>
        </div>
        <div id = "add">
            <p>First Name:<input type="text" name="first" class="add" required></p>
            <p>Last Name:<input type="text" name="last" class="add" required></p>
            <h4>Address:</h4>
            <p>Street:<input type="text" name="street" class="add" required></p>
            <p id = "city">City:<input type="text" name="city_input" class="add" id = "city_input" hidden></p>
            <p id = "state">State:<input type="text" name="state_input" class="add" id = "state_input" hidden></p>
            <p>Zipcode:<input type="number" name = "zipcode" id = "zipcode" class="add" onblur="getDetails()" required></p>
            <div class="text-error "></div>
            <p>Telephone:<input name="phone" placeholder="123-45-678" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" class="add" required></p>
            <button onclick="sendForm()">ADD</button>
        </div>
    </body>
</html>