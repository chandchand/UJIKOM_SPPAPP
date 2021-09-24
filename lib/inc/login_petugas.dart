// import 'package:spp_app/Animation/FadeAnimation.dart';
import 'dart:convert';
import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:spp_app/inc/register.dart';
import 'package:http/http.dart' as http;
import 'package:spp_app/screens/admin/nav.dart';
import 'package:spp_app/screens/petugas/nav_petugas.dart';

class LoginPetugas extends StatefulWidget {
  @override
  _LoginPetugasState createState() => _LoginPetugasState();
}

class _LoginPetugasState extends State<LoginPetugas> {
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String nama;
  String level;
  String status;
  String username;
  String password;
  String msg = '';

  Future<List> _login() async {
    final response =
        await http.post("http://192.168.1.10/spp_app/login.php", body: {
      "user": userController.text,
      "ptgs_password": passwordController.text,
    });

    // SharedPreferences preferences = await SharedPreferences.getInstance();
    print(response.body);
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      setState(() {
        Fluttertoast.showToast(
          msg: "Password atau Username anda tidak terdaftar",
          backgroundColor: Colors.grey,
          textColor: Colors.yellowAccent,
        );
      });
    } else {
      await FlutterSession().set("token", datauser[0]['level']);
      await FlutterSession().set("nama", datauser[0]['nama_ptgs']);
      await FlutterSession().set("status", datauser[0]['status']);
      await FlutterSession().set("username", datauser[0]['user']);
      await FlutterSession().set("password", datauser[0]['ptgs_password']);
      if (datauser[0]['level'] == 'admin') {
        // await FlutterSession().set('nama', datauser[0]('nama_ptgs'));
        // print("Welcome Admin");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Nav(),
          ),
        );
      } else if (datauser[0]['level'] == 'petugas') {
        // print("Welcome Petugas");
        // await FlutterSession().set('nama', datauser[0]('nama_ptgs'));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NavPetugas(),
          ),
        );
      }
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Login.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 5,
                        height: 120,
                        child: FadeAnimation(
                          1.5,
                          Row(
                            children: [
                              FlatButton.icon(
                                icon: Icon(
                                  Icons.keyboard_arrow_left,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                label: Text(
                                  "Back",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Center(
                                child: Text(
                                  "Login Petugas",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextField(
                                    controller: userController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                        2,
                        Container(
                          height: 50.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            shadowColor: Color(0xff4DAAA7),
                            color: Colors.greenAccent,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                _login();
                                // setState((){
                                //   _isLoading = true;
                                // });
                                // sigIn(nikController.text, passwordController.text);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => Nav()),
                              },
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        msg,
                        style:
                            GoogleFonts.inter(fontSize: 20, color: Colors.red),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: FadeAnimation(
                            1.5,
                            Text(
                              "Regisrasi Petugas",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1)),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
