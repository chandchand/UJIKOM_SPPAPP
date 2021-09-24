<?php
include 'koneksi.php';
$id=$_POST['id_petugas'];
$query1=$connect->query("DELETE FROM `tb_petugas` WHERE `tb_petugas`.`id_petugas` = '".$id."'");
?>