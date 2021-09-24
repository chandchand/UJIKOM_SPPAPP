<?php
include 'koneksi.php';

$nisn = $_POST['nisn'];
$nis = $_POST['nis'];
$password = $_POST['password'];
$nama = $_POST['nama_siswa'];
// $kelas = $_POST['nama_kelas'];
// $jurusan = $_POST['komp_keahlian'];
// $jenkel = $_POST['jenkel'];
$alamat = $_POST['almt'];
$no_telp = $_POST['telp'];
// $status = $_POST['status'];

$connect->query("UPDATE `tb_siswa` SET `nama_siswa` = '".$nama."', `id_kelas` = '4', `almt` = '".$alamat."', `telp` = '$no_telp' WHERE `tb_siswa`.`nisn` = '".$nisn."'");
$connect->query("UPDATE `tb_login_siswa` SET `password` = '".$password."' WHERE `tb_login_siswa`.`nis` = '".$nis."'");


// $connect->query("UPDATE tb_siswa SET nis='".$nis."',nama='".$nama."',almt='".$alamat."',telp='".$no_telp."',id_kelas=3,jenkel='Pria',
// status='Aktif' WHERE nisn=".$nisn);
// $connect->query("UPDATE tb_siswa_login  SET nis='".$nis."',password='".$password."' WHERE nis=".$nis);
// UPDATE `tb_siswa` SET `nama_siswa` = 'Chandra Purnama', `id_kelas` = '3', `almt` = 'Cisaranten,bdg', `telp` = '089566547778' WHERE `tb_siswa`.`nisn` = '0035944564';
?>