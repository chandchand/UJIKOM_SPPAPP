import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spp_app/screens/transaksi/history.dart';
import 'package:spp_app/screens/petugas/profile_petugas.dart';
// import 'package:spp_app/screens/laporan.dart';
// import 'package:spp_app/screens/profile.dart';
// import 'package:spp_app/screens/transaksi.dart';
// import 'package:spp_app/setting.dart';
// import 'package:spp_app/tabs_navigator.dart';
// import 'package:spp_app/main.dart';
// import 'package:spp_app/screens/nav.dart';
import 'package:spp_app/screens/profile.dart';
// import 'package:spp_app/screens/side_drawer.dart';

class HomePetugas extends StatefulWidget {
  HomePetugas({Key key}) : super(key: key);

  @override
  _HomePetugasState createState() => _HomePetugasState();
}

class _HomePetugasState extends State<HomePetugas> {
  // GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();


  // // List get datas => null;
  // int _currentIndex = 0;

  // final tabs =[
  //   Home(),
  //   Transaksi(),
  //   Laporan(),
  //   Setting(),
  //   Profile()
  //   // Center(child: Text("Transaksi")),
  //   // Center(child: Text("Home")),
  //   // Center(child: Text("Laporan")),
  // ];

  // //handle Indicator
  // List<T> map<T>(List list, Function handler) {
  //   List<T> result =[];
  //   for (var i = 0; i < list.length; i++){
  //     result.add(handler(i, list[i]));
  //   }
  //   return result;
  // }

  void initState(){
    super.initState();
    namaUser();
  }
  String nama;

  void namaUser() async {
    // FlutterSession nama =await FlutterSession().get('nama');

    setState(() async {
      dynamic nama = await FlutterSession().get('nama');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( 
        margin: EdgeInsets.only(top: 8),
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
                      Image.asset(
                        "assets/images/logo_home.png", height: 40),
                      GestureDetector(
                          onTap: (){
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    new ProfilePetugas()));
                            }, 
                          child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey,
                            image: DecorationImage(
                              image: NetworkImage('https://media.matamata.com/thumbs/2020/10/23/25523-shani-jkt48/745x489-img-25523-shani-jkt48.jpg'),
                          ),
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/WelcomeBar2.png'),
                          fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 150, top: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Selamat Datang",
                       style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                        future: FlutterSession().get('nama'),
                        builder: (context,snapshot){
                          return Text (snapshot.hasData ? snapshot.data : 'Loading...');
                        }),
                      // Text("as Petugas",
                      //  style: GoogleFonts.inter(
                      //   fontSize: 18,
                      //   fontWeight: FontWeight.bold,
                      //   color: Colors.black54
                      // ),)
                    ],
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 28, bottom: 16, top: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("History Transaksi",
                    style: GoogleFonts.inter(
                      fontSize:15,
                      fontWeight: FontWeight.bold
                    )),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz), 
                        onPressed: () {
                          Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                              new History()));
                              }),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}