import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:spp_app/screens/admin/nav.dart';

class TambahPegawai extends StatefulWidget {
  @override
  _TambahState createState() => _TambahState();
}

class _TambahState extends State<TambahPegawai> {
  TextEditingController nama = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  void tambahData() {
    var url = "http://192.168.1.10/spp_app/add_data_petugas.php";
    http.post(url, body: {
      "nama_ptgs": nama.text,
      "user": username.text,
      "ptgs_password": password.text,
      // "level" : level.text,
      // "status" : status.text,
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
                          controller: nama,
                          decoration: InputDecoration(
                              hintText: "Nama Petugas",
                              labelText: "Nama Petugas"),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: username,
                          decoration: InputDecoration(
                              hintText: "Username", labelText: "Username"),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                              hintText: "Password", labelText: "Password"),
                        ),
                      ),
                    ),
                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: level,
                    //       decoration: InputDecoration(
                    //           hintText: "Level", labelText: "Level"),
                    //     ),
                    //   ),
                    // ),
                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: status,
                    //       decoration: InputDecoration(
                    //           hintText: "Status", labelText: "Status"),
                    //     ),
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
                                "Tambah Data Pegawai",
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
