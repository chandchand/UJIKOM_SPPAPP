<?php
include 'koneksi.php';

$id = $_POST['id_kelas'];
$nama = $_POST['nama_kls'];
$jurusan = $_POST['komp_keahlian'];

$connect->query("INSERT INTO `tb_kelas` (`id_kelas`, `nama_kls`, `komp_keahlian`) VALUES (NULL, '".$nama."', '".$jurusan."');")
// $connect->query("INSERT INTO tb_petugas (id_petugas,nama_ptgs,username,password,level,status,) VALUES ('".$id."','".$nama."','".$username."','".$password."','".$level."','".$status."')");


?>