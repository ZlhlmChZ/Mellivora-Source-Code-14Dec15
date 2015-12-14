<?php

if (file_exists("/img/repo/" . $_FILES["upload"]["name"]))
{
 echo $_FILES["upload"]["name"] . " already exists please choose another image. ";
}
else
{
 move_uploaded_file($_FILES["upload"]["tmp_name"],
 "/var/www/mellivora/htdocs/img/repo/" . $_FILES["upload"]["name"]);
 echo "Stored in: " . "/img/repo/" . $_FILES["upload"]["name"];

$funcNum = $_GET['CKEditorFuncNum'] ;
$CKEditor = $_GET['CKEditor'] ;
$langCode = $_GET['langCode'] ;
$url = "/img/repo/" . $_FILES["upload"]["name"];


$message = '';
 
echo "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction($funcNum, '$url', '$message');</script>";

}