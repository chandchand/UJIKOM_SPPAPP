import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:spp_app/screens/admin/action/detail_siswa.dart';
import 'package:spp_app/screens/transaksi/detail_siswa_bayar.dart';

class XIITransaksi extends StatefulWidget {
  @override
  _XIITransaksiState createState() => _XIITransaksiState();
}

class _XIITransaksiState extends State<XIITransaksi> {
  List _dataSiswa = List();
  String xii = "XII";
  void getData() async {
    var response =
        await http.post("http://192.168.1.10/spp_app/getdata_siswa.php", body: {
      "nama_kls": xii,
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
            DataColumn(label: Text("Nama Siswa")),
            DataColumn(label: Text("Jurusan")),
            DataColumn(label: Text("Aksi")),
          ],
          rows: _dataSiswa
              .map((item) => DataRow(cells: <DataCell>[
                    // DataCell(Text(item["nisn"])),
                    DataCell(Text(item["nama_siswa"])),
                    DataCell(Text(item["komp_keahlian"])),
                    DataCell(GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => DetailBayarSiswa(
                                  id_siswa: item['nisn'],
                                  nis_siswa: item['nis'],
                                )));
                      },
                      child: Text(
                        "Tagihan",
                        style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.yellow[900]),
                      ),
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
      //   floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.blue[300],
      //   onPressed: (){},
      //   // tooltip: 'Increment',
      //   child: Icon(FontAwesomeIcons.plus)
      // ), // This trailing comma ma
      body: Container(
        width: MediaQuery.of(context).size.width,
        //  padding: const EdgeInsets.all(8.0),
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
              "Pembayaran SPP ",
              style: GoogleFonts.inter(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.blue[300]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "Siswa Kelas XII",
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.blue[300]),
            ),
          ),
          // SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Center(child: _tabelData()),
                )),
          )
          //  FloatingActionButton(
          //   //  Icon(FontAwesomeIcons.plus),
          //    onPressed: (){},
          //   )
        ]),
      ),
    );
  }
}
