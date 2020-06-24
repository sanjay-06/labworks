<?php
$var;$ans;
$is_palindrome = true;
if(isset($_GET['sentence']))
{
    $arr = str_split($_GET['sentence']);
    for ($i=0; $i < count($arr); $i++)
    {
        if($arr[$i] == " ")
        {
            array_splice($arr, $i, 1);
        }
    }
$var = implode("",$arr);
echo $var;
$arr_2 = str_split($var);
$j = count($arr_2)-1;
for ($i=0; $i < $j; $i++)
{
if($arr_2[$i] != $arr_2[$j])
{
$is_palindrome = false;
break;
}
$j--;
}
if($is_palindrome)
{
$ans = "is a Palindrome";
}
else
{
$ans = "is NOT a Palindrome";
}
}
?>
<html>
    <head>
        <title>ws7_7</title>
    </head>
    <body>
        <h1>Enter a Sentence and press check to know if it is a Plindrome</h1>
        <form>
        <input type = "text" name = "sentence" placeholder="Write a sentence "><br><br>
        <input type="submit" value="Check">
        </form><br>
        <?php
        if(isset($_GET['sentence']))
        {
            echo "<p> The Sentence/Word " . $ans . "</p>";
        }
        ?>
    </body>
</html>