<html>
    <head>
        <title>ws7_6</title>    
    </head>
    <body>
        <h1>Enter a Sentence with spaces:</h1>
        <form>
            <input type = "text" name = "sentence" placeholder="Write a sentence "><br><br>
            <input type="submit">
        </form><br>
        <?php
        if(isset($_GET['sentence']))
        {
            echo "<p> The Sentence without spaces is <br>" . $var . "</p>";
        }
        ?>
    </body>
</html>