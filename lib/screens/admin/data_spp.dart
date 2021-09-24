import 'package:flutter/material.dart';

class Spp extends StatefulWidget {
  @override
  _SppState createState() => _SppState();
}

class _SppState extends State<Spp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SPP"),
      ),
      body: Center(
        child: Text("Data Spp"),
      ),
    );
  }
}