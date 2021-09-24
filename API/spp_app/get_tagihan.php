<?php
include 'koneksi.php';

$id_spp = $_POST['id_spp'];

$queryResult = $connect->query("SELECT * FROM tb_spp WHERE id_spp = '" . $id_spp . "'");
$result = array();
while ($fetchData = $queryResult->fetch_assoc()) {
    $result[] = $fetchData;
}
if ($result == null) {
    $gagal = null;
    echo json_encode($gagal);
} else {
    echo json_encode($result);
}
