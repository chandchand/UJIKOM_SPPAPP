import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:spp_app/inc/login_siswa.dart';
import 'package:spp_app/screens/admin/nav.dart';
import 'package:spp_app/screens/petugas/nav_petugas.dart';



class  MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {



dynamic token = FlutterSession().get('token');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(future: token,
        builder: (context, snapshot){
          if(snapshot.data == 'admin'){
            return Nav();
          } else if(snapshot.data == 'petugas'){
            return NavPetugas();
          }else{
            return Login();
          }
        }
        ,),
      
    );
  }
}