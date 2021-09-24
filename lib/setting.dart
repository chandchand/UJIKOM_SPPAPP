import 'package:flutter/material.dart';
import 'package:spp_app/inc/login_petugas.dart';

class Setting extends StatefulWidget {
  Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Setting'),
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      // ),
  body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            children: [
              Text("Profile"),
              RaisedButton(
                child: Text("Logout"),
                onPressed: (){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LoginPetugas(),),);
                }),
            ],
          ),
        ),
      ),
    );
  }
}