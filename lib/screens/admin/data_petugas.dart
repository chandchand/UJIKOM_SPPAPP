import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spp_app/screens/admin/detail_petugas.dart';
import 'package:spp_app/screens/admin/tambah_data_pegawai.dart';
// import 'package:spp_app/screens/admin/action/detail_siswa.dart';
// import 'package:spp_app/screens/admin/detail_petugas.dart';

class Petugas extends StatefulWidget {
  @override
  _PetugasState createState() => _PetugasState();
}

class _PetugasState extends State<Petugas> {
  List _dataSiswa = List();
  String petugas = "petugas";
  void getData() async {
    var response = await http
        .post("http://192.168.1.10/spp_app/getdata_petugas.php", body: {
      "level": petugas,
    });
    setState(() {
      _dataSiswa = json.decode(response.body);
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  SingleChildScrollView _tabelData() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: DataTable(
          dataRowHeight: 60,
          columns: [
            // DataColumn(label: Text("NISN")),
            DataColumn(label: Text("Nama")),
            DataColumn(label: Text("Role")),
            DataColumn(label: Text("Status")),
            // DataColumn(label: Text("Jurusan")),
          ],
          rows: _dataSiswa
              .map((item) => DataRow(cells: <DataCell>[
                    // DataCell(Text(item["nisn"])),
                    DataCell(GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => DetailPetugas(
                                    id_petugas: item['id_petugas'],
                                    nama_ptgs: item['nama_ptgs'],
                                  )));
                        },
                        child: Text(item["nama_ptgs"]))),
                    DataCell(GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => DetailPetugas(
                                    id_petugas: item['id_petugas'],
                                    nama_ptgs: item['nama_ptgs'],
                                  )));
                        },
                        child: Text(item["level"]))),
                    DataCell(GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => DetailPetugas(
                                    id_petugas: item['id_petugas'],
                                    nama_ptgs: item['nama_ptgs'],
                                  )));
                        },
                        child: Text(item["status"]))),
                  ]))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[300],
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => TambahPegawai())),
          // tooltip: 'Increment',
          child: Icon(FontAwesomeIcons.plus)), // This trailing comma ma
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(FontAwesomeIcons.arrowAltCircleLeft))),
                // SizedBox(width:50),
                Center(
                  widthFactor: 2,
                  child: Image.asset('assets/images/logo_home.png', scale: 5),
                ),
                Padding(padding: const EdgeInsets.only(right: 50)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 40),
              child: Text(
                "Data Pegawai",
                style: GoogleFonts.inter(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            SizedBox(height: 20),
            Card(
                child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Center(child: _tabelData()),
            ))
          ],
        ),
      ),
    );
  }
}
