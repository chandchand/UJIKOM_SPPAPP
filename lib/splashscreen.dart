import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:spp_app/inc/login_siswa.dart';
import 'package:spp_app/screens/admin/nav.dart';
import 'package:spp_app/screens/petugas/nav_petugas.dart';

import 'package:spp_app/screens/siswa/home.dart';


class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();
}
String siswa;
class _SplashScreen extends State<SplashScreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }
  splashscreenStart() async {
  dynamic token = await FlutterSession().get('token');
  dynamic siswa = await FlutterSession().get("siswa");
    var duration = const Duration(seconds: 3);
      if (token == null || token == '') {
        return new Timer(duration, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
          print(token);
        });
      } else if (token != null || token != '') {
        if (token == 'admin'){
          return new Timer(duration, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Nav()),
          );
          print(token);
        });
        } else if (token == 'petugas'){
          return new Timer(duration, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavPetugas()),
          );
          print(token);
        });
        } else if (token == 'siswa'){
          return new Timer(duration, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeSiswa()),
          );
          print(token);
        }); 
        }else {
          return new Timer(duration, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
          print(token);
        });
        }
        
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Image.asset(
                "assets/images/logo.png",height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Text("@chand_38",
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),
            )
          ],
        ),
      ),
    );
  }
}
