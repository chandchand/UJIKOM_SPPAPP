<?php
include 'koneksi.php';
$level = $_POST['level'];

$queryResult=$connect->query ("SELECT * FROM tb_petugas");
$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[]=$fetchData;
}
 
echo json_encode($result);
?>