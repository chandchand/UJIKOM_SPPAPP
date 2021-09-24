import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spp_app/inc/login_siswa.dart';

class ProfilePetugas extends StatefulWidget {
  @override
  _ProfilePetugasState createState() => _ProfilePetugasState();
}

class _ProfilePetugasState extends State<ProfilePetugas> {
  void initState() {
    super.initState();
    namaUser();
  }

  String nama;
  String level;
  String status;
  String username;
  String password;

  void namaUser() async {
    dynamic namaPetugas = await FlutterSession().get('nama');
    dynamic levelPetugas = await FlutterSession().get('level');
    dynamic statusPetugas = await FlutterSession().get('status');
    // dynamic username = await FlutterSession().get('username');
    // dynamic password = await FlutterSession().get('password');
    // FlutterSession nama =await FlutterSession().get('nama');
    setState(() async {
      nama = namaPetugas.toString();
      level = levelPetugas.toString();
      status = statusPetugas.toString();
      // username = username.toString();
      // password = password.toString();
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
                                      "Role",
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
                                      "$level",
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
                                      "$status",
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
                                      "Username",
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
                                      "$username",
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
                                      "Password",
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
                                      "$password",
                                      style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
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
