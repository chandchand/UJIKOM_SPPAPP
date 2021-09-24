import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class NaikKelas extends StatefulWidget {
  @override
  _NaikKelasState createState() => _NaikKelasState();
}

class _NaikKelasState extends State<NaikKelas> {
  // TextEditingController nisn = new TextEditingController();
  // TextEditingController nis = new TextEditingController();
  // TextEditingController nama = new TextEditingController();
  // TextEditingController alamat = new TextEditingController();
  // TextEditingController password = new TextEditingController();
  // // TextEditingController kelas = new TextEditingController();
  // // TextEditingController jurusan = new TextEditingController();
  // // TextEditingController jenkel = new TextEditingController();
  // TextEditingController noTelp = new TextEditingController();
  // // TextEditingController status = new TextEditingController();

  // void tambahData(){
  //   var url="http://192.168.1.10/spp_app/add_data_siswa.php";
  //   http.post(url, body:{
  //     "nisn" : nisn.text,
  //     "nis" : nis.text,
  //     "nama_siswa" : nama.text,
  //     "password" : password.text,
  //     "almt" : alamat.text,
  //     "telp" : noTelp.text,
  //   });
  // }

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
                  "Tambah Data Siswa",
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
                    Text("Coming Soon...")
                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: nisn,
                    //       decoration: InputDecoration(
                    //           hintText: "NISN", labelText: "NISN"),
                    //     ),
                    //   ),
                    // ),
                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: nis,
                    //       decoration: InputDecoration(
                    //           hintText: "NIS", labelText: "NIS"),
                    //     ),
                    //   ),
                    // ),
                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: nama,
                    //       decoration: InputDecoration(
                    //           hintText: "Nama", labelText: "Nama"),
                    //     ),
                    //   ),
                    // ),
                    //                     Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: password,
                    //       decoration: InputDecoration(
                    //           hintText: "Password", labelText: "Password"),
                    //     ),
                    //   ),
                    // ),
                    // // Card(
                    // //   child: Padding(
                    // //     padding: const EdgeInsets.all(8.0),
                    // //     child: TextField(
                    // //       controller: jenkel,
                    // //       decoration: InputDecoration(
                    // //           hintText: "Jenis Kelamin",
                    // //           labelText: "Jenis Kelamin"),
                    // //     ),
                    // //   ),
                    // // ),

                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: alamat,
                    //       decoration: InputDecoration(
                    //           hintText: "Alamat", labelText: "Alamat"),
                    //     ),
                    //   ),
                    // ),
                    // // Card(
                    // //   child: Padding(
                    // //     padding: const EdgeInsets.all(8.0),
                    // //     child: TextField(
                    // //       controller: kelas,
                    // //       decoration: InputDecoration(
                    // //           hintText: "Kelas", labelText: "Kelas"),
                    // //     ),
                    // //   ),
                    // // ),
                    // // Card(
                    // //   child: Padding(
                    // //     padding: const EdgeInsets.all(8.0),
                    // //     child: TextField(
                    // //       controller: jurusan,
                    // //       decoration: InputDecoration(
                    // //           hintText: "Jurusan", labelText: "Jurusan"),
                    // //     ),
                    // //   ),
                    // // ),
                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: TextField(
                    //       controller: noTelp,
                    //       decoration: InputDecoration(
                    //           hintText: "No Telp", labelText: "No Telp"),
                    //     ),
                    //   ),
                    // ),
                    // // Card(
                    // //   child: Padding(
                    // //     padding: const EdgeInsets.all(8.0),
                    // //     child: TextField(
                    // //       controller: status,
                    // //       decoration: InputDecoration(
                    // //           hintText: "Status Siswa",
                    // //           labelText: "Status Siswa"),
                    // //     ),
                    // //   ),
                    // // ),
                    // SizedBox(height: 35),
                    // RaisedButton(
                    //   onPressed: () {
                    //     tambahData();
                    //     Navigator.pop(context);
                    //   },
                    //   color: Colors.green,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(15.0),
                    //     child: Container(
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Icon(
                    //             FontAwesomeIcons.plus,
                    //             size: 13,
                    //           ),
                    //           SizedBox(width: 15),
                    //           Text(
                    //             "Tambah Data Siswa",
                    //             style: GoogleFonts.inter(
                    //                 fontSize: 16, fontWeight: FontWeight.bold),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // )
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
