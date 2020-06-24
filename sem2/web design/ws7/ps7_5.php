<?php
$var;
if(isset($_GET['sentence']))
{
    $arr = str_split($_GET['sentence']);
    $var = $arr[0];
    for ($i=0; $i < count($arr); $i++)
    {
        if($arr[$i] == " ")
        {
            array_splice($arr, $i, 1);
        }
    }
    $var = implode("",$arr);
}
?>