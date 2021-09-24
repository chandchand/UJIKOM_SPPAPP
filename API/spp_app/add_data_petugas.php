<?php
include 'koneksi.php';

$id = $_POST['id_petugas'];
$nama = $_POST['nama_ptgs'];
$username = $_POST['username'];
$password = $_POST['password'];
// $level = $_POST['level'];
// $status = $_POST['status'];

$connect->query("INSERT INTO `tb_petugas` (`id_petugas`, `user`, `ptgs_password`, `nama_ptgs`, `level`, `status`) VALUES (NULL, '".$username."', '".$password."', '".$nama."', 'petugas', 'Terverifikasi');")
// $connect->query("INSERT INTO tb_petugas (id_petugas,nama_ptgs,username,password,level,status,) VALUES ('".$id."','".$nama."','".$username."','".$password."','".$level."','".$status."')");


?>