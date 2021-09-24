<?php
include 'koneksi.php';
$id = $_POST['id_petugas'];

$queryResult=$connect->query("SELECT * FROM tb_petugas WHERE tb_petugas.id_petugas = '".$id."'");
$result=array();

while($fetchData=$queryResult->fetch_assoc()){
    $result[]=$fetchData;
}
 
echo json_encode($result);
?>