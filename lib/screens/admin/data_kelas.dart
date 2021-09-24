import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spp_app/screens/admin/detail_petugas.dart';
import 'package:spp_app/screens/admin/nav.dart';
import 'package:spp_app/screens/admin/tambah_data_kelas.dart';
import 'package:spp_app/screens/admin/tambah_data_pegawai.dart';

class Kelas extends StatefulWidget {
  @override
  _KelasState createState() => _KelasState();
}

class _KelasState extends State<Kelas> {
  List _dataKelas = List();
  // Future<List> getData() async {
  //   final response =
  //       await http.get("http://192.168.1.10/spp_app/getdata_kelas.php");
  //   return json.decode(response.body);
  // }
  String id_kelas = '';
  void getData() async {
    var response =
        await http.post("http://192.168.1.10/spp_app/getdata_kelas.php", body: {
      "id_kelas": id_kelas,
    });
    setState(() {
      _dataKelas = json.decode(response.body);
      id_kelas = _dataKelas[0]['id_kelas'];
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void deleteKelas() {
    var url = "http://192.168.1.10/spp_app/delete_kelas.php";
    http.post(url, body: {
      "id_kelas": '$id_kelas',
    });
  }

  //   void deleteSiswaUser(){
  //   var url="http://192.168.137.65/spp_app/delete_siswa.php";
  //   http.post(url,body:{
  //   });
  // }
  // AlertDialog alertDialog = AlertDialog(
  //   content: Text("Yakin Ingin Menghapus Data '${widget.nama_siswa}'"),
  //   actions: <Widget>[
  //     RaisedButton(
  //       child: Row(
  //         children: [
  //           Text("Delete"),
  //           Icon(FontAwesomeIcons.sadCry)
  //         ],
  //       ),
  //       color: Colors.redAccent,
  //       onPressed: (){},),
  //     RaisedButton(
  //       child: Row(
  //         children: [
  //           Text("Cancel"),
  //           Icon(FontAwesomeIcons.smileBeam)
  //         ],
  //       ),
  //       color: Colors.greenAccent,
  //       onPressed: (){},)
  //   ],
  // );
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hapus Data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Yakin Ingin Menghapus?',
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                Text(
                  "$id_kelas",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              child: Row(
                children: [
                  Text("Delete"),
                  // SizedBox(width:10),
                  // Icon(FontAwesomeIcons.sadCry,size: 15,)
                ],
              ),
              color: Colors.redAccent,
              onPressed: () {
                deleteKelas();
                // deleteSiswaUser();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Nav()));
              },
            ),
            RaisedButton(
              child: Row(
                children: [
                  Text("Cancel"),
                  // Icon(FontAwesomeIcons.smileBeam)
                ],
              ),
              color: Colors.greenAccent,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  SingleChildScrollView _tabelData() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: DataTable(
          dataRowHeight: 60,
          columns: [
            DataColumn(label: Text("Id_Kelas")),
            DataColumn(label: Text("Kelas")),
            DataColumn(label: Text("Jurusan")),
            DataColumn(label: Text("Action")),
          ],
          rows: _dataKelas
              .map((item) => DataRow(cells: <DataCell>[
                    DataCell(Text(item["id_kelas"])),
                    DataCell(Text(item["nama_kls"])),
                    DataCell(Text(item["komp_keahlian"])),
                    DataCell(Row(
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: Icon(
                              FontAwesomeIcons.edit,
                              size: 20,
                            )),
                        SizedBox(width: 10),
                        GestureDetector(
                            onTap: () => _showMyDialog(),
                            child: Icon(
                              FontAwesomeIcons.trash,
                              size: 20,
                            )),
                      ],
                    )),
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
              builder: (BuildContext context) => TambahKelas())),
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
                "Data Kelas",
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
