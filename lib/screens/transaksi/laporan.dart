import 'package:flutter/material.dart';

class Laporan extends StatefulWidget {
  Laporan({Key key}) : super(key: key);

  @override
  _LaporanState createState() => _LaporanState();
}

class _LaporanState extends State<Laporan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Laporan'),
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      // ),
      body: Center(
        child: Text("data"),
      ),
    );
  }
}