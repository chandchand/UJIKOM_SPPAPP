import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spp_app/inc/login_siswa.dart';

class ProfileSiswa extends StatefulWidget {
  @override
  _ProfileSiswaState createState() => _ProfileSiswaState();
}

class _ProfileSiswaState extends State<ProfileSiswa> {
  void initState() {
    super.initState();
    namaUser();
  }

  String nama;
  String status;
  String nisn;
  String nis;
  String kelas;
  String alamat;
  String telp;
  String jk;
  String jurusan;

  void namaUser() async {
    dynamic namaSiswa = await FlutterSession().get('nama');
    dynamic telpSiswa = await FlutterSession().get('telp');
    dynamic statusSiswa = await FlutterSession().get('status');
    dynamic nisnSiswa = await FlutterSession().get('nisn');
    dynamic nisSiswa = await FlutterSession().get('nis');
    dynamic kelasSiswa = await FlutterSession().get('kelas');
    dynamic alamatSiswa = await FlutterSession().get('alamat');
    dynamic jkSiswa = await FlutterSession().get('jk');
    dynamic jurusanSiswa = await FlutterSession().get('jurusan');
    // dynamic password = await FlutterSession().get('password');
    // FlutterSession nama =await FlutterSession().get('nama');
    setState(() async {
      nama = namaSiswa.toString();
      status = statusSiswa.toString();
      nisn = nisnSiswa.toString();
      nis = nisSiswa.toString();
      kelas = kelasSiswa.toString();
      alamat = alamatSiswa.toString();
      telp = telpSiswa.toString();
      jk = jkSiswa.toString();
      jk = jurusanSiswa.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 20, bottom: 20),
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
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Center(
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Icon(
                              FontAwesomeIcons.user,
                              size: 120,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "$nama",
                                  style: GoogleFonts.inter(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(height: 3),
                                Row(
                                  children: [
                                    Text(
                                      "NISN",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    // Icon(FontAwesomeIcons.venusMars,size: 20,),
                                    SizedBox(width: 3),
                                    Text(
                                      ":",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      "$nisn",
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
                                      "NIS",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(width: 26),
                                    Text(
                                      ":",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      "$nis",
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
                                      "Kelas",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      ":",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      "$kelas",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(height: 3),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Alamat",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
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
                                      "$alamat",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                                                Row(
                                  children: [
                                    Text(
                                      "Telp",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
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
                                      "$telp",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                                                    Row(
                                  children: [
                                    Text(
                                      "Gender",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
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
                                      "$jk",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
                                      RaisedButton(
                child: Text("Logout"),
                onPressed: (){
                  FlutterSession().set('token', '');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
