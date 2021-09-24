import 'dart:convert';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:spp_app/screens/admin/edit_petugas.dart';
// import 'package:spp_app/screens/admin/action/edit_siswa.dart';
import 'package:spp_app/screens/admin/nav.dart';

class DetailPetugas extends StatefulWidget {
  final String id_petugas;
  final String nama_ptgs;

  DetailPetugas({Key key, this.id_petugas, this.nama_ptgs}) : super(key: key);
  // List list;
  // int index;
  // DetailSiswa({this.index,this.list});

  @override
  _DetailPetugasState createState() => _DetailPetugasState();
}

class _DetailPetugasState extends State<DetailPetugas> {
  void initState() {
    super.initState();
    siswaDetail();
  }

  String id_petugas = "";
  String nama_ptgs = "";
  String username = "";
  String password = "";
  String role = "";
  String status = "";

  void siswaDetail() async {
    final response = await http
        .post("http://192.168.1.10/spp_app/detail_petugas.php", body: {
      "id_petugas": widget.id_petugas,
    });

    var data = json.decode(response.body);
    setState(() {
      id_petugas = data[0]['id_petugas'];
      nama_ptgs = data[0]['nama_ptgs'];
      username = data[0]['user'];
      password = data[0]['ptgs_password'];
      role = data[0]['level'];
      status = data[0]['status'];
    });
  }

  void deleteSiswa() {
    var url = "http://192.168.1.10/spp_app/delete_petugas.php";
    http.post(url, body: {
      "id_petugas": '$id_petugas',
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
                SizedBox(height: 5),
                Text(
                  "$nama_ptgs",
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
                deleteSiswa();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(centerTitle: true,title: Text("${widget.list[widget.index]['nama_siswa']}"),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // padding: const EdgeInsets.all(20.0),
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
            padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Detail Petugas",
                  style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => EditPetugas(
                                      id_petugas: widget.id_petugas,
                                      nama_ptgs: '$nama_ptgs',
                                      username: '$username',
                                      status: '$status',
                                      password: '$password',
                                    ))),
                        icon: Icon(
                          FontAwesomeIcons.edit,
                          size: 20,
                        )),
                    IconButton(
                        onPressed: () => _showMyDialog(),
                        // => Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => HapusSiswa())),
                        icon: Icon(
                          FontAwesomeIcons.trash,
                          size: 20,
                        )),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 15),
                  child: Icon(
                    FontAwesomeIcons.userGraduate,
                    size: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15, bottom: 8),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$nama_ptgs",
                        style: GoogleFonts.inter(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Text(
                            "Username",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          // Icon(FontAwesomeIcons.venusMars,size: 20,),
                          SizedBox(width: 8),
                          Text(
                            ":",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(width: 3),
                          Text(
                            "$username",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Text(
                            "Password",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(width: 10),
                          Text(
                            ":",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(width: 3),
                          Text(
                            "$password",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Text(
                            "Role",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(width: 30),
                          Text(
                            ":",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(width: 3),
                          Text(
                            "$role",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Text(
                            "Status",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(width: 19),
                          Text(
                            ":",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(width: 3),
                          Text(
                            "$status",
                            style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
