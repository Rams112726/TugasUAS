<?php 
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");

$conn=new mysqli("localhost","root","","perusahaan");
$query=mysqli_query($conn,"select * from karyawan");
$data=mysqli_fetch_all($query,MYSQLI_ASSOC);
echo json_encode($data);

 ?>