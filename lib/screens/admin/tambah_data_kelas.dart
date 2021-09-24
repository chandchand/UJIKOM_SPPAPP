import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:spp_app/screens/admin/nav.dart';

class TambahKelas extends StatefulWidget {
  @override
  _TambahKelasState createState() => _TambahKelasState();
}

class _TambahKelasState extends State<TambahKelas> {
  TextEditingController nama = new TextEditingController();
  TextEditingController jurusan = new TextEditingController();

  String _jk = "";

  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  void tambahData() {
    var url = "http://192.168.1.10/spp_app/add_data_kelas.php";
    http.post(url, body: {
      "nama_kls": _jk,
      "komp_keahlian": jurusan.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          // padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 20, bottom: 20),
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
                padding: const EdgeInsets.only(left: 10, top: 40),
                child: Text(
                  "Tambah Data Petugas",
                  style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: jurusan,
                          decoration: InputDecoration(
                              hintText: "Kompentensi Keahlian",
                              labelText: "Kompentensi Keahlian"),
                        ),
                      ),
                    ),
                    Card(
                      // shape: BorderRadius.circular(),
                      child: Container(
                        // padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 20),
                              child: Text("Pilih Kelas"),
                            ),
                            RadioListTile(
                              value: "X",
                              title: Text("Kelas X"),
                              groupValue: _jk,
                              onChanged: (String value) {
                                _pilihJk(value);
                              },
                              activeColor: Colors.greenAccent,
                            ),
                            RadioListTile(
                              value: "XI",
                              title: Text("Kelas XI"),
                              groupValue: _jk,
                              onChanged: (String value) {
                                _pilihJk(value);
                              },
                              activeColor: Colors.greenAccent,
                            ),
                            RadioListTile(
                              value: "XII",
                              title: Text("Kelas XII"),
                              groupValue: _jk,
                              onChanged: (String value) {
                                _pilihJk(value);
                              },
                              activeColor: Colors.greenAccent,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: TextField(
                    //     controller: jurusan,
                    //     decoration: InputDecoration(
                    //         hintText: "Username", labelText: "Username"),
                    //   ),
                    // ),

                    SizedBox(height: 35),
                    RaisedButton(
                      onPressed: () {
                        tambahData();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Nav()));
                        // Navigator.pop(context);
                      },
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.plus,
                                size: 13,
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Tambah Data Kelas",
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    // Row(
                    //   children: [
                    //     Radio(
                    //       value: 1,
                    //       onChanged: (val) {}),
                    //     Text(
                    //       'ONE',
                    //       style: new TextStyle(fontSize: 17.0),
                    //     ),
                    //     Radio(
                    //       value: 1,
                    //       onChanged: (val) {}),
                    //     Text(
                    //       'ONE',
                    //       style: new TextStyle(fontSize: 17.0),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
