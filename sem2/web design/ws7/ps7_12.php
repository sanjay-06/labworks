<html>
	<head>
		<title>ws7_12</title>
	</head>
	<body>
		<?php
			$states="Mississippi Texas Massachusetts Kansas";
			
			$end=strpos($states,"xas")+2;
			$start=strrpos($states," ",$end-strlen($states) );
			$statesArray[0]=substr($states,$start,$end-$start+1);
			
			$start=stripos($states,"k");
			$end=stripos($states,"s",$start);
			$statesArray[1]=substr($states,$start,$end-$start+1);
			
			$start=strpos($states,"M");
			$end=strpos($states,"s",$start);
			$statesArray[2]=substr($states,$start,$end-$start+1);
			
			$end=strpos($states,"a");
			$start=strrpos($states," ",$end-strlen($states) );
			$statesArray[3]=substr($states,$start,$end-$start+1);

			$start=strpos($states,"M");
			$end=strpos($states," ",$start);
			$statesArray[4]=substr($states,$start,$end-$start+1);
			foreach($statesArray as $x)
			{
				echo $x."<br>";
			}
		?>
	</body>
</html>

