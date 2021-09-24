import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:spp_app/screens/admin/data_kelas.dart';
import 'package:spp_app/screens/admin/data_petugas.dart';
import 'package:spp_app/screens/admin/data_siswa.dart';

import 'package:spp_app/screens/admin/data_spp.dart';
import 'package:spp_app/screens/transaksi/history.dart';
import 'package:spp_app/screens/profile.dart';

import 'data_kelas.dart';
// import 'package:spp_app/screens/side_drawer.dart';

class HomeAdmin extends StatefulWidget {
// HomeAdmin({this.nama});
// final String nama;

  // GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  // // List get datas => null;
  // int _currentIndex = 0;

  // final tabs =[
  //   Home(),
  //   Transaksi(),
  //   Laporan(),
  //   Setting(),
  //   Profile()
  //   // Center(child: Text("Transaksi")),
  //   // Center(child: Text("Home")),
  //   // Center(child: Text("Laporan")),
  // ];

  // //handle Indicator
  // List<T> map<T>(List list, Function handler) {
  //   List<T> result =[];
  //   for (var i = 0; i < list.length; i++){
  //     result.add(handler(i, list[i]));
  //   }
  //   return result;
  // }

  @override
  _HomeAdminState createState() => _HomeAdminState();
}

String nama = '';

class _HomeAdminState extends State<HomeAdmin> {
  void initState() {
    super.initState();
    namaUser();
  }

  void namaUser() async {
    // FlutterSession nama = await FlutterSession().get('nama');

    setState(() async {
      dynamic nama = await FlutterSession().get('nama');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 8),
      child: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(left: 25, right: 25, top: 16),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // GestureDetector(
                    //   onTap: (){
                    //     _globalKey;
                    //     },
                    //   child:
                    //   Icon(Icons.menu)),
                    // Text("SPPKU",
                    //         style: GoogleFonts.inter(
                    //         fontSize: 17,
                    //         fontWeight: FontWeight.bold,
                    //         ),
                    // ),
                    Image.asset("assets/images/logo_home.png", height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new Profile()));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://media.matamata.com/thumbs/2020/10/23/25523-shani-jkt48/745x489-img-25523-shani-jkt48.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/WelcomeBar2.png'),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 150, top: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Selamat Datang",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Text('$nama'),
                    FutureBuilder(
                        future: FlutterSession().get('nama'),
                        builder: (context, snapshot) {
                          return Text(
                              snapshot.hasData ? snapshot.data : 'Loading...');
                        }),
                  ],
                ),
              ),
            ),
            Center(
              // padding: const EdgeInsets.only(left: 150, bottom: 25, ),
              child: Column(children: [
                Text(
                  "Operations",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            Container(
              // height: 250,
              margin: EdgeInsets.only(left: 26, right: 16, bottom: 5, top: 40),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new Siswa()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.only(left: 16),
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  color: Colors.blueAccent,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Data Siswa",
                                        style: GoogleFonts.inter(
                                            // fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new Petugas()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.only(left: 16),
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.admin_panel_settings,
                                  color: Colors.greenAccent,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Data Petugas",
                                        style: GoogleFonts.inter(
                                            // fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new Kelas()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.only(left: 16),
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.class__rounded,
                                  color: Colors.brown,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Data Kelas",
                                        style: GoogleFonts.inter(
                                            // fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.only(left: 16),
                          height: 70,
                          // decoration: BoxDecoration(
                          //   color: Colors.white,
                          //   borderRadius: BorderRadius.circular(12),
                          //   border: Border.all(color: Colors.black, width: 2),
                          // ),
                          // child: Row(
                          //   children: [
                          //     Icon(Icons.inventory, color: Colors.redAccent,
                          //     ),
                          //     GestureDetector(
                          //       onTap: (){
                          //         Navigator.push(
                          //           context,
                          //           new MaterialPageRoute(
                          //               builder: (BuildContext context) =>
                          //               new Spp()));
                          //       },
                          //       child: Padding(
                          //         padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
                          //         child: Column(
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //           Text("Data Spp",
                          //           style: GoogleFonts.inter(
                          //             // fontSize: 25,
                          //             fontWeight: FontWeight.w500
                          //           ),)
                          //         ],),
                          //       ),
                          //     )
                          //   ],
                          // ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 28, bottom: 16, top: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("History Transaksi",
                      style: GoogleFonts.inter(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new History()));
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
