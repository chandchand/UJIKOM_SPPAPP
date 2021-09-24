import 'dart:convert';
// import 'dart:js';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:spp_app/screens/admin/action/detail_siswa.dart';

class X extends StatefulWidget {
  @override
  _XState createState() => _XState();
}

class _XState extends State<X> {
  List _dataSiswa = List();
  String x = "X";
  void getData() async {
    var response =
        await http.post("http://192.168.1.10/spp_app/getdata_siswa.php", body: {
      "nama_kls": x,
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
            DataColumn(label: Text("Kelas")),
            DataColumn(label: Text("NIS")),
            DataColumn(label: Text("Jurusan")),
          ],
          rows: _dataSiswa
              .map((item) => DataRow(cells: <DataCell>[
                    // DataCell(Text(item["nisn"])),
                    DataCell(GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => DetailSiswa(
                                    id_siswa: item['nisn'],
                                    nis_siswa: item['nis'],
                                  )));
                        },
                        child: Text(item["nama_siswa"]))),
                    DataCell(GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => DetailSiswa(
                                    id_siswa: item['nisn'],
                                    nis_siswa: item['nis'],
                                  )));
                        },
                        child: Text(item["nama_kls"]))),
                    DataCell(GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => DetailSiswa(
                                    id_siswa: item['nisn'],
                                    nis_siswa: item['nis'],
                                  )));
                        },
                        child: Text(item["nis"]))),
                    DataCell(GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => DetailSiswa(
                                    id_siswa: item['nisn'],
                                    nis_siswa: item['nis'],
                                  )));
                        },
                        child: Text(item["komp_keahlian"]))),
                  ]))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        // padding: const EdgeInsets.only(right: 1,),
        child: ListView(children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
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
              "Data Siswa Kelas X",
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
        ]),
      ),
    );
  }
}
