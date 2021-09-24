<?php 

    include 'koneksi.php';

    $nama = $_POST['nama_ptgs'];
    $user = $_POST['user'];
    $password = $_POST['ptgs_password'];
    $level = 'petugas';

    $connect->query("INSERT INTO tb_petugas (nama_ptgs,user,ptgs_password,level) VALUES ('".$nama."','".$user."','".$password."','".$level."')");
    $notif="Berhasil";
    echo json_encode($notif);

?>  