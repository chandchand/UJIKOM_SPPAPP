import 'dart:convert';
import 'dart:io';
import 'package:custom_fade_animation/custom_fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:spp_app/inc/login_petugas.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:spp_app/screens/siswa/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  DateTime backButtonPressed;
  TextEditingController nisController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String siswa = '';
  String nama;

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    bool backButton = backButtonPressed == null ||
        currentTime.difference(backButtonPressed) > Duration(seconds: 3);

    if (backButton) {
      backButtonPressed = currentTime;
      Fluttertoast.showToast(
        msg: "Double Click To Exit",
        backgroundColor: Colors.grey,
        textColor: Colors.redAccent,
      );

      return false;
    }
    return exit(0);
  }

  Future<List> _login() async {
    final response =
        await http.post("http://192.168.1.10/spp_app/login_siswa.php", body: {
      "nis": nisController.text,
      "password": passwordController.text,
    });

    // SharedPreferences preferences = await SharedPreferences.getInstance();

    print(response.body);
    var datauser = json.decode(response.body);
    await FlutterSession().set('nama', datauser[0]['nama_siswa']);
    // await FlutterSession().set('telp', datauser[0]['telp']);
    // await FlutterSession().set('status', datauser[0]['status']);
    // await FlutterSession().set('nisn', datauser[0]['nisn']);
    // await FlutterSession().set('nis', datauser[0]['nis']);
    // await FlutterSession().set('kelas', datauser[0]['nama_kelas']);
    // await FlutterSession().set('alamat', datauser[0]['almt']);
    // await FlutterSession().set('jk', datauser[0]['jenkel']);
    // await FlutterSession().set('jurusan', datauser[0]['komp_keahlian']);
    if (datauser.length == 0) {
      setState(() {
        Fluttertoast.showToast(
          msg: "Password atau Username anda tidak terdaftar",
          backgroundColor: Colors.grey,
          textColor: Colors.yellowAccent,
        );
      });
    } else {
      await FlutterSession().set('token', 'siswa');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeSiswa(),
        ),
      );
    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: onWillPop,
          child: SingleChildScrollView(
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
                          left: 30,
                          width: 80,
                          height: 200,
                          child: FadeAnimation(
                              1,
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/light-1.png'))),
                              )),
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
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        )
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
                                        color:
                                            Color.fromRGBO(143, 148, 251, .2),
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
                                      controller: nisController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "NIS",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
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
                        SizedBox(
                          height: 70,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPetugas()),
                            );
                          },
                          child: FadeAnimation(
                              1.5,
                              Text(
                                "Login Petugas & Admin",
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
          ),
        ));
  }
}
