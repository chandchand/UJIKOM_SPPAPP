import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spp_app/inc/login_siswa.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile'),
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      // ),
      body: Container(
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                    decoration: new BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Icon(
                            FontAwesomeIcons.userShield,
                            size: 60,
                          ),
                        ))),
                SizedBox(
                  width: 20,
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama : ",
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Role : ",
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Status : ",
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ],
                )
                // Center(child: Text("Profile")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.signOutAlt),
                    SizedBox(width: 20),
                    Text("Logout"),
                  ],
                ),
                onPressed: () {
                  FlutterSession().set('token', '');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
