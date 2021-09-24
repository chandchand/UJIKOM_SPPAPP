<?php 
include 'koneksi.php';
$nisn = $_POST['nisn'];

// $queryResult=$connect->query ("SELECT * FROM tb_siswa");
// $queryResult=$connect->query ("SELECT tb_siswa.*,tb_kelas.* FROM tb_siswa 
// INNER JOIN tb_kelas ON tb_kelas.id_kelas=tb_siswa.id_siswa ORDER BY tb_siswa.id_siswa ASC");
// $queryResult=$connect->query("SELECT * FROM tb_siswa INNER JOIN tb_kelas ON tb_siswa.id_kelas = tb_kelas.id_kelas WHERE nama_kls = '".$nama_kls."'");
$queryResult = $connect->query("SELECT tb_siswa.*, tb_kelas.* FROM tb_siswa INNER JOIN tb_kelas ON tb_siswa.id_kelas = tb_kelas.id_kelas WHERE tb_siswa.nisn = '" . $nisn . "'");
$result = array();


while ($fetchData = $queryResult->fetch_assoc()) {
    $result[] = $fetchData;
}
$hasil = $result;

echo json_encode("Berhasil");
