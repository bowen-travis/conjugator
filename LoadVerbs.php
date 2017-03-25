<?

//define the path as relative
$path = "/home/broot/public_html/Conjugator";

//using the opendir function
$dir_handle = @opendir($path) or die("Unable to open $path");

while ($file = readdir($dir_handle)) 
{
   echo("$file".",");
}

//closing the directory
closedir($dir_handle);

?> 
