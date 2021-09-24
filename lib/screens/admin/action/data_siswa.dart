import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:spp_app/screens/admin/action/tambah_data_siswa.dart';

import 'package:spp_app/screens/admin/x.dart';
import 'package:spp_app/screens/admin/xi.dart';
import 'package:spp_app/screens/admin/xii.dart';
// import 'package:spp_app/screens/admin/detail.dart';

class Siswa extends StatefulWidget {
  @override
  _SiswaState createState() => _SiswaState();
}

class _SiswaState extends State<Siswa> {
  // Future<List> getData() async {
  //   final response =
  //       await http.get("http://192.168.137.65/spp_app/getdata_kelas.php");
  //   return json.decode(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.blue[300],
        //   centerTitle: true,
        //   title: Text("Siswa"),
        // ),
        body: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20),
                  child: GestureDetector(
                    onTap: (){Navigator.pop(context);},
                    child: Icon(FontAwesomeIcons.arrowAltCircleLeft)
                  )
                ),
                // SizedBox(width:50),
                Center(
                  widthFactor: 2,
                  child: Image.asset('assets/images/logo_home.png',scale: 5),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:50)
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80, top: 50),
              child: Center(
                // padding: const EdgeInsets.only(left: 25, bottom: 130, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total Siswa Active",
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Card(
                      shadowColor: Colors.black,
                      child: Text(
                        "1 Siswa/",
                        style: GoogleFonts.inter(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("Tingkatan",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)
                    ),
                  //       FutureBuilder<List>(
                  //         future: getData(),
                  //         builder: (context, snapshot) {
                  //           if (snapshot.hasError) print(snapshot.error);

                  //           return snapshot.hasData
                  //               ? new ItemList(
                  //                   list: snapshot.data,
                  //                 )
                  //               : new Center(
                  //                   child: new CircularProgressIndicator(),
                  //                 );
                  //         },
                  // ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      child: Column(
                        children: [
                          Icon(FontAwesomeIcons.userGraduate,
                          size: 45,
                          color: Colors.blue[300]),
                          SizedBox(height: 15,),
                          Text("Kelas X", style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),)
                        ],
                      ),
                      onPressed: (){
                        Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new X()));
                      }
                    ),
                    FlatButton(
                      child: Column(
                        children: [
                          Icon(FontAwesomeIcons.userGraduate,
                          size: 45,
                          color: Colors.blue),
                          SizedBox(height: 15,),
                          Text("Kelas XI", style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),)
                        ],
                      ),
                      onPressed: (){
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new XI()));}
                    ),
                    FlatButton(
                      child: Column(
                        children: [
                          Icon(FontAwesomeIcons.userGraduate,
                          size: 45,
                          color: Colors.blue[700]),
                          SizedBox(height: 15,),
                          Text("Kelas XII", style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),)
                        ],
                      ),
                      onPressed: (){
                        Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new XII()));
                      }
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 35, bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Fitur Lainnya",
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)
                      ),
                    ],
                  ),
                  Column(children: [
                    Container(
                      padding: const EdgeInsets.only(right: 30,top: 20),
                      child: FlatButton(
                        color: Colors.white,
                        splashColor: Colors.green,
                        onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Tambah())),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.userPlus,size: 25,color: Colors.green,),
                              SizedBox(height: 50, width: 25,
                              ),
                              Text("Tambah Siswa",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 30,top: 20),
                      child: FlatButton(
                        color: Colors.white,
                        splashColor: Colors.green,
                        onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Tambah())),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.verified_user,size: 30,color: Colors.green,),
                              SizedBox(height: 50, width: 25,
                              ),
                              Text("Naik Kelas",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],)
                ],
              ),
            ),
          ]),
        ));
  }
}

// class ItemList extends StatelessWidget {
//   List list;
//   ItemList({this.list});

//   @override
//   Widget build(BuildContext context) {
//     return
//     ListView.builder(
//       itemCount: list == null ? 0 : list.length,
//       itemBuilder: (context, i) {
//         return Container(
//           padding: const EdgeInsets.all(5.0),
//           child: GestureDetector(
//             onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                 builder: (BuildContext context) => DetailSiswa(
//                       list: list,
//                       index: i,
//                     ))),

//             child: Card(
//               child: new ListTile(
//                 title: Text(list[i]['nama_kelas']),
//                 leading: new Icon(
//                   FontAwesomeIcons.userGraduate,
//                   size: 40,
//                 ),
//               ),
//             ),
//           ),
//         );
//         // Text(list[i]['nama_siswa']);
//       },
//     );
//   }
// }
