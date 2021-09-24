<?php
include 'koneksi.php';
$id=$_POST['id_kelas'];
$query1=$connect->query("DELETE FROM `tb_kelas` WHERE `tb_kelas`.`id_kelas` = '".$id."'");
?>