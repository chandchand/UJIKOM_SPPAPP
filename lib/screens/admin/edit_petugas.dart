import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:spp_app/screens/admin/nav.dart';

class EditPetugas extends StatefulWidget {
  final String id_petugas;
  final String nama_ptgs;
  final String username;
  final String password;
  final String role;
  final String status;
  EditPetugas(
      {Key key,
      this.id_petugas,
      this.nama_ptgs,
      this.password,
      this.username,
      this.role,
      this.status})
      : super(key: key);
  @override
  _EditPetugasState createState() => _EditPetugasState();
}

class _EditPetugasState extends State<EditPetugas> {
  TextEditingController nama_ptgs;
  TextEditingController username;
  TextEditingController password;
  TextEditingController role;
  TextEditingController status;
  @override
  void initState() {
    // TODO: implement initState
    // id_petugas = new TextEditingController(text: widget.id_petugas);
    nama_ptgs = new TextEditingController(text: widget.nama_ptgs);
    username = new TextEditingController(text: widget.username);
    password = new TextEditingController(text: widget.password);
    role = new TextEditingController(text: widget.role);
    status = new TextEditingController(text: widget.status);
    super.initState();
  }

  void editData() {
    var url = "http://192.168.1.10/spp_app/edit_data_siswa.php";
    http.post(url, body: {
      "nama_ptgs": nama_ptgs.text,
      "username": username.text,
      "password": password.text,
      "level": role.text,
      "status": status.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          // padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 20, bottom: 20),
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
                padding: const EdgeInsets.only(left: 10, top: 40),
                child: Text(
                  "Edit Data Siswa",
                  style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          enabled: false,
                          controller: nama_ptgs,
                          decoration: InputDecoration(
                              hintText: "Nama Petugas",
                              labelText: "Nama Petugas"),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: username,
                          decoration: InputDecoration(
                              hintText: "Username", labelText: "Username"),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                              hintText: "Password", labelText: "Password"),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: status,
                          decoration: InputDecoration(
                              hintText: "Status", labelText: "Status"),
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: role,
                          decoration: InputDecoration(
                              hintText: "Role", labelText: "Role"),
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    RaisedButton(
                      onPressed: () {
                        editData();
                        // Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Nav()));
                      },
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.userEdit,
                                size: 15,
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Edit Data Siswa",
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    // Row(
                    //   children: [
                    //     Radio(
                    //       value: 1,
                    //       onChanged: (val) {}),
                    //     Text(
                    //       'ONE',
                    //       style: new TextStyle(fontSize: 17.0),
                    //     ),
                    //     Radio(
                    //       value: 1,
                    //       onChanged: (val) {}),
                    //     Text(
                    //       'ONE',
                    //       style: new TextStyle(fontSize: 17.0),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
