import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spp_app/screens/transaksi/x.dart';
import 'package:spp_app/screens/transaksi/xi.dart';
import 'package:spp_app/screens/transaksi/xii.dart';

class Transaksi extends StatefulWidget {
  Transaksi({Key key}) : super(key: key);

  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 10),
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 40),
              child: Text(
                "Pembayaran SPP",
                style: GoogleFonts.inter(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.blue[300]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 40),
              child: Row(
                children: [
                  Text("Pilih Tingkatan",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 30),
              child: Padding(
                padding: const EdgeInsets.only(top: 15
                 
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new XTransaksi()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.userGraduate,
                                  size: 45, color: Colors.blue[300]),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "KELAS X",
                                style: GoogleFonts.inter(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      child: FlatButton(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Icon(FontAwesomeIcons.userGraduate,
                                    size: 45, color: Colors.blue),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "KELAS XI",
                                  style: GoogleFonts.inter(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new XITransaksi()));
                          }),
                    ),
                    Card(
                      child: FlatButton(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Icon(FontAwesomeIcons.userGraduate,
                                    size: 45, color: Colors.blue[700]),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "KELAS XII",
                                  style: GoogleFonts.inter(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        new XIITransaksi()));
                          }),
                    )
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
