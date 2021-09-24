import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:spp_app/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dynamic token = FlutterSession().get('token');
  // runApp(MaterialApp(home: MyApp()));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: token != '' ? SplashScreen() : MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool isUser = false;

  @override
  void initState() {
    super.initState();
    // _initCheck();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }

  // void _initCheck() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   if (preferences.getBool('isUser') != null) {
  //     setState(() {
  //       isUser = preferences.getBool('isUser');
  //     });
  //   }
  // }
}
