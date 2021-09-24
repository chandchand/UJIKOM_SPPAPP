import 'dart:convert';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:spp_app/screens/transaksi/bayar.dart';
import 'package:spp_app/screens/transaksi/invoice.dart';
// import 'package:spp_app/screens/admin/action/edit_siswa.dart';
// import 'package:spp_app/screens/admin/nav.dart';

class DetailBayarSiswa extends StatefulWidget {
  final String id_siswa;
  final String nis_siswa;
  final String nama_siswa;

  DetailBayarSiswa({Key key, this.id_siswa, this.nis_siswa, this.nama_siswa})
      : super(key: key);
  // List list;
  // int index;
  // DetailBayarSiswa({this.index,this.list});

  @override
  _DetailBayarSiswaState createState() => _DetailBayarSiswaState();
}

class _DetailBayarSiswaState extends State<DetailBayarSiswa> {
  void initState() {
    super.initState();
    siswaDetail();
    tagihanSiswa();
  }

  String nisn = "";
  String nis = "";
  String nama = "";
  String password = "";
  String jenkel = "";
  String kelas = "";
  String jurusan = "";
  String alamat = "";
  String telp = "";
  String status = "";
  String tagihan = "";

  void siswaDetail() async {
    final response =
        await http.post("http://192.168.1.10/spp_app/detail_siswa.php", body: {
      "nisn": widget.id_siswa,
    });

    var data = json.decode(response.body);
    setState(() {
      nisn = data[0]['nisn'];
      nis = data[0]['nis'];
      nama = data[0]['nama_siswa'];
      password = data[0]['password'];
      jenkel = data[0]['jenkel'];
      kelas = data[0]['nama_kls'];
      jurusan = data[0]['komp_keahlian'];
      telp = data[0]['telp'];
      alamat = data[0]['almt'];
      status = data[0]['status'];
    });
  }

  void deleteSiswa() {
    var url = "http://192.168.1.10/spp_app/detail_siswa.php";
    http.post(url, body: {"nisn": '$nisn', "nis": '$nis'});
  }

  Future<List> tagihanSiswa() async {
    Uri uriTagihan =
        Uri.parse("http://192.168.1.10/spp_app/detail_tagihan.php");
    final responseTagihan = await http.post(uriTagihan, body: {
      "nisn": widget.id_siswa,
    });
    dynamic hasilTagihan = json.decode(responseTagihan.body);
    if (hasilTagihan != null) {
      setState(() {
        tagihan = hasilTagihan.toString();
      });
    } else {
      setState(() {
        tagihan = "null";
      });
    }
    return hasilTagihan;
  }

  //   void deleteSiswaUser(){
  //   var url="http://192.168.137.65/spp_app/delete_siswa.php";
  //   http.post(url,body:{
  //   });
  // }
  // AlertDialog alertDialog = AlertDialog(
  //   content: Text("Yakin Ingin Menghapus Data '${widget.nama_siswa}'"),
  //   actions: <Widget>[
  //     RaisedButton(
  //       child: Row(
  //         children: [
  //           Text("Delete"),
  //           Icon(FontAwesomeIcons.sadCry)
  //         ],
  //       ),
  //       color: Colors.redAccent,
  //       onPressed: (){},),
  //     RaisedButton(
  //       child: Row(
  //         children: [
  //           Text("Cancel"),
  //           Icon(FontAwesomeIcons.smileBeam)
  //         ],
  //       ),
  //       color: Colors.greenAccent,
  //       onPressed: (){},)
  //   ],
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(centerTitle: true,title: Text("${widget.list[widget.index]['nama_siswa']}"),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // padding: const EdgeInsets.all(20.0),
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
            padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Detail Siswa",
                  style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 15),
                    child: Icon(
                      FontAwesomeIcons.userGraduate,
                      size: 120,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 15, bottom: 8),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$nama",
                          style: GoogleFonts.inter(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text(
                              "Gender",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            // Icon(FontAwesomeIcons.venusMars,size: 20,),
                            SizedBox(width: 8),
                            Text(
                              ":",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 3),
                            Text(
                              "$jenkel",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text(
                              "NISN",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 22),
                            Text(
                              ":",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 3),
                            Text(
                              "$nisn",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text(
                              "NIS",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 30),
                            Text(
                              ":",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 3),
                            Text(
                              "$nis",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text(
                              "Kelas",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 19),
                            Text(
                              ":",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 3),
                            Text(
                              "$kelas $jurusan",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text(
                              "Alamat",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 10),
                            Text(
                              ":",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 3),
                            Text(
                              "$alamat",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Text(
                              "No Telp",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 7),
                            Text(
                              ":",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 3),
                            Text(
                              "$telp",
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Row(
              children: [
                Text(
                  "Tagihan Siswa",
                  style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[300]),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
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
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Keterangan :",
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.squareFull,
                                color: Colors.blue[300],
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Warna biru menandai lunas",
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.squareFull,
                                color: Colors.yellow,
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Warna kuning menandai belum lunas",
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.squareFull,
                                color: Colors.red,
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Warna merah menandai belum dibayar",
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              )),
          Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(25.0),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder<List>(
                        future: tagihanSiswa(),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? new TagihanSiswaView(
                                  tagihan: snapshot.data, nisn_data: '$nisn')
                              : new Center(
                                  child: new CircularProgressIndicator(
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            Colors.blue),
                                  ),
                                );
                        })
                  ]))
        ]),
      ),
    );
  }
}

class TagihanSiswaView extends StatelessWidget {
  final List tagihan;
  final String nisn_data;
  TagihanSiswaView({this.tagihan, this.nisn_data});
  var tagihanTextStyle = TextStyle(
      fontFamily: "Montserrat Medium", fontSize: 15, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: tagihan == null ? 0 : tagihan.length,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          Color colorJanuari;
          if (int.parse(tagihan[i]['januari']) == 300000) {
            colorJanuari = Colors.yellow;
          } else if (int.parse(tagihan[i]['januari']) == 0) {
            colorJanuari = Colors.blue[300];
          } else if (int.parse(tagihan[i]['januari']) < 300000) {
            colorJanuari = Color(0xFFFCE205);
          } else {
            colorJanuari = Colors.white;
          }

          Color colorFebruari;
          if (int.parse(tagihan[i]['februari']) == 300000) {
            colorFebruari = Colors.yellow;
          } else if (int.parse(tagihan[i]['februari']) == 0) {
            colorFebruari = Colors.blue[300];
          } else if (int.parse(tagihan[i]['februari']) < 300000) {
            colorFebruari = Color(0xFFFCE205);
          } else {
            colorJanuari = Colors.white;
          }

          Color colorMaret;
          if (int.parse(tagihan[i]['maret']) == 300000) {
            colorMaret = Colors.yellow;
          } else if (int.parse(tagihan[i]['maret']) == 0) {
            colorMaret = Colors.blue[300];
          } else if (int.parse(tagihan[i]['maret']) < 300000) {
            colorMaret = Color(0xFFFCE205);
          } else {
            colorJanuari = Colors.white;
          }

          Color colorApril;
          if (int.parse(tagihan[i]['april']) == 300000) {
            colorApril = Colors.yellow;
          } else if (int.parse(tagihan[i]['april']) == 0) {
            colorApril = Colors.blue[300];
          } else if (int.parse(tagihan[i]['april']) < 300000) {
            colorApril = Color(0xFFFCE205);
          } else {
            colorJanuari = Colors.white;
          }

          Color colorMei;
          if (int.parse(tagihan[i]['mei']) == 300000) {
            colorMei = Colors.yellow;
          } else if (int.parse(tagihan[i]['mei']) == 0) {
            colorMei = Colors.blue[300];
          } else if (int.parse(tagihan[i]['mei']) < 300000) {
            colorMei = Color(0xFFFCE205);
          } else {
            colorMei = Colors.white;
          }

          Color colorJuni;
          if (int.parse(tagihan[i]['juni']) == 300000) {
            colorJuni = Colors.yellow;
          } else if (int.parse(tagihan[i]['juni']) == 0) {
            colorJuni = Colors.blue[300];
          } else if (int.parse(tagihan[i]['juni']) < 300000) {
            colorJuni = Color(0xFFFCE205);
          } else {
            colorJuni = Colors.white;
          }

          Color colorJuli;
          if (int.parse(tagihan[i]['juli']) == 300000) {
            colorJuli = Colors.yellow;
          } else if (int.parse(tagihan[i]['juli']) == 0) {
            colorJuli = Colors.blue[300];
          } else if (int.parse(tagihan[i]['juli']) < 300000) {
            colorJuli = Color(0xFFFCE205);
          } else {
            colorJuli = Colors.white;
          }

          Color colorAgustus;
          if (int.parse(tagihan[i]['agustus']) == 300000) {
            colorAgustus = Colors.yellow;
          } else if (int.parse(tagihan[i]['agustus']) == 0) {
            colorAgustus = Colors.blue[300];
          } else if (int.parse(tagihan[i]['agustus']) < 300000) {
            colorAgustus = Color(0xFFFCE205);
          } else {
            colorAgustus = Colors.white;
          }

          Color colorSeptember;
          if (int.parse(tagihan[i]['september']) == 300000) {
            colorSeptember = Colors.yellow;
          } else if (int.parse(tagihan[i]['september']) == 0) {
            colorSeptember = Colors.blue[300];
          } else if (int.parse(tagihan[i]['september']) < 300000) {
            colorSeptember = Color(0xFFFCE205);
          } else {
            colorSeptember = Colors.white;
          }

          Color colorOktober;
          if (int.parse(tagihan[i]['oktober']) == 300000) {
            colorOktober = Colors.yellow;
          } else if (int.parse(tagihan[i]['oktober']) == 0) {
            colorOktober = Colors.blue[300];
          } else if (int.parse(tagihan[i]['oktober']) < 300000) {
            colorOktober = Color(0xFFFCE205);
          } else {
            colorOktober = Colors.white;
          }

          Color colorNovember;
          if (int.parse(tagihan[i]['november']) == 300000) {
            colorNovember = Colors.yellow;
          } else if (int.parse(tagihan[i]['november']) == 0) {
            colorNovember = Colors.blue[300];
          } else if (int.parse(tagihan[i]['november']) < 300000) {
            colorNovember = Color(0xFFFCE205);
          } else {
            colorNovember = Colors.white;
          }

          Color colorDesember;
          if (int.parse(tagihan[i]['desember']) == 300000) {
            colorDesember = Colors.yellow;
          } else if (int.parse(tagihan[i]['desember']) == 0) {
            colorDesember = Colors.blue[300];
          } else if (int.parse(tagihan[i]['desember']) < 300000) {
            colorDesember = Color(0xFFFCE205);
          } else {
            colorDesember = Colors.white;
          }
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "SPP tahun Ajaran " + tagihan[i]['thn'].toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Futura Medium',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 11.0,
                ),
                GridView.count(
                    shrinkWrap: true,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    primary: false,
                    crossAxisCount: 4,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if (int.parse(tagihan[i]['januari']) == 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'januari',
                                      namabulan: 'Januari')),
                            );
                          } else if (int.parse(tagihan[i]['januari']) == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          } else if (int.parse(tagihan[i]['januari']) <
                              300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'januari',
                                      namabulan: 'Januari')),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          }
                        },
                        child: Card(
                          color: colorJanuari,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(.50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Jan',
                                textAlign: TextAlign.center,
                                style: tagihanTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (int.parse(tagihan[i]['februari']) == 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'februari',
                                      namabulan: 'Februari')),
                            );
                          } else if (int.parse(tagihan[i]['februari']) == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          } else if (int.parse(tagihan[i]['februari']) <
                              300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'februari',
                                      namabulan: 'Februari')),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          }
                        },
                        child: Card(
                          color: colorFebruari,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(.50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Feb',
                                textAlign: TextAlign.center,
                                style: tagihanTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (int.parse(tagihan[i]['maret']) == 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'maret',
                                      namabulan: 'Maret')),
                            );
                          } else if (int.parse(tagihan[i]['maret']) == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          } else if (int.parse(tagihan[i]['maret']) < 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'maret',
                                      namabulan: 'Maret')),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          }
                        },
                        child: Card(
                          color: colorMaret,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(.50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Mar',
                                textAlign: TextAlign.center,
                                style: tagihanTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (int.parse(tagihan[i]['april']) == 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'april',
                                      namabulan: 'April')),
                            );
                          } else if (int.parse(tagihan[i]['april']) == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          } else if (int.parse(tagihan[i]['april']) < 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'april',
                                      namabulan: 'April')),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          }
                        },
                        child: Card(
                          color: colorApril,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(.50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Apr',
                                textAlign: TextAlign.center,
                                style: tagihanTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (int.parse(tagihan[i]['mei']) == 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'mei',
                                      namabulan: 'Mei')),
                            );
                          } else if (int.parse(tagihan[i]['mei']) == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          } else if (int.parse(tagihan[i]['mei']) < 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'mei',
                                      namabulan: 'Mei')),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          }
                        },
                        child: Card(
                          color: colorMei,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(.50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Mei',
                                textAlign: TextAlign.center,
                                style: tagihanTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (int.parse(tagihan[i]['juni']) == 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'juni',
                                      namabulan: 'Juni')),
                            );
                          } else if (int.parse(tagihan[i]['juni']) == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          } else if (int.parse(tagihan[i]['juni']) < 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'juni',
                                      namabulan: 'Juni')),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          }
                        },
                        child: Card(
                          color: colorJuni,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(.50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Jun',
                                textAlign: TextAlign.center,
                                style: tagihanTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (int.parse(tagihan[i]['juli']) == 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'juli',
                                      namabulan: 'Juli')),
                            );
                          } else if (int.parse(tagihan[i]['juli']) == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          } else if (int.parse(tagihan[i]['juli']) < 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'juli',
                                      namabulan: 'Juli')),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          }
                        },
                        child: Card(
                          color: colorJuli,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(.50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Jul',
                                textAlign: TextAlign.center,
                                style: tagihanTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (int.parse(tagihan[i]['agustus']) == 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'agustus',
                                      namabulan: 'Agustus')),
                            );
                          } else if (int.parse(tagihan[i]['agustus']) == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          } else if (int.parse(tagihan[i]['agustus']) <
                              300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'agustus',
                                      namabulan: 'Agustus')),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          }
                        },
                        child: Card(
                          color: colorAgustus,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(.50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Agu',
                                textAlign: TextAlign.center,
                                style: tagihanTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (int.parse(tagihan[i]['september']) == 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'september',
                                      namabulan: 'September')),
                            );
                          } else if (int.parse(tagihan[i]['september']) == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          } else if (int.parse(tagihan[i]['september']) <
                              300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'september',
                                      namabulan: 'September')),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          }
                        },
                        child: Card(
                          color: colorSeptember,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(.50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Sep',
                                textAlign: TextAlign.center,
                                style: tagihanTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (int.parse(tagihan[i]['oktober']) == 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'oktober',
                                      namabulan: 'Oktober')),
                            );
                          } else if (int.parse(tagihan[i]['oktober']) == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          } else if (int.parse(tagihan[i]['oktober']) <
                              300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'oktober',
                                      namabulan: 'Oktober')),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          }
                        },
                        child: Card(
                          color: colorOktober,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(.50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Okt',
                                textAlign: TextAlign.center,
                                style: tagihanTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (int.parse(tagihan[i]['november']) == 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'november',
                                      namabulan: 'November')),
                            );
                          } else if (int.parse(tagihan[i]['november']) == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          } else if (int.parse(tagihan[i]['november']) <
                              300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'november',
                                      namabulan: 'November')),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          }
                        },
                        child: Card(
                          color: colorNovember,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(.50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Nov',
                                textAlign: TextAlign.center,
                                style: tagihanTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (int.parse(tagihan[i]['desember']) == 300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'desember',
                                      namabulan: 'Desember')),
                            );
                          } else if (int.parse(tagihan[i]['desember']) == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          } else if (int.parse(tagihan[i]['desember']) <
                              300000) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bayar(
                                      nisn: nisn_data,
                                      id_spp: tagihan[i]['id_spp'],
                                      bulan: 'desember',
                                      namabulan: 'Desember')),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Invoice()),
                            );
                          }
                        },
                        child: Card(
                          color: colorDesember,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(.50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Des',
                                textAlign: TextAlign.center,
                                style: tagihanTextStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 17.0,
                ),
              ]);
        });
  }
}

//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Container(
//               decoration: new BoxDecoration(
//                 boxShadow: [
//                   new BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 10.0,
//                   ),
//                 ],
//               ),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: Column(children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(
//                       "Data SPP Tahun Ajaran",
//                       style: GoogleFonts.inter(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                     ),
//                   ),
//                   SizedBox(height: 11),
//                   GridView.count(
//                       shrinkWrap: true,
//                       mainAxisSpacing: 10,
//                       crossAxisSpacing: 10,
//                       primary: false,
//                       crossAxisCount: 4,
//                       children: <Widget>[])
//                 ]),
//               ),
//             ),
//           )
