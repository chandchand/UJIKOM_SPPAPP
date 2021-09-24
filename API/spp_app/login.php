<?php
// require "koneksi.php";

// if($_SERVER['REQUEST_METHOD'] == "POST"){
//     $response = array();
//     $username = $_POST['user'];
//     $password = $_POST['password'];
    
//     $cek = "SELECT * FROM tb_petugas WHERE user='$username' and password='$password'";
//     $result = mysqli_fetch_array(mysqli_query($connect, $cek));

//     if(isset($result)){
//         $response['value'] = 1;
//         $response['message'] = 'Login Berhasil';
//         echo json_encode($response);

//     } else{
//             $response['value'] = 0;
//             $response['message'] = "login gagal";
//             echo json_encode($response);
//         }
//     }


include "koneksi.php";
$username = $_POST['user'];
$password = $_POST['ptgs_password'];

$queryResult = $connect->query("SELECT * FROM `tb_petugas` WHERE user = '".$username."' and ptgs_password = '".$password."'");
$result=array();


while ($fetchData=$queryResult->fetch_assoc()) {
    $result[]=$fetchData;
}

echo json_encode($result);

?>