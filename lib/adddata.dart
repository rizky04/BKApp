import 'dart:convert';
import 'dart:io';

// ignore: unused_import
import 'package:appbk/hal_kelas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
// import 'package:image_picker/image_picker.dart';

File _image;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerNomorInduk = new TextEditingController();
  TextEditingController controllerNamaSiswa = new TextEditingController();
  TextEditingController controllerWaliMurid = new TextEditingController();
  TextEditingController controllerNoHp = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();

  // ignore: non_constant_identifier_names
  void AddData() {
    var url = "http://sibk.amindev.online/api/adddataSiswa.php";

    http.post(url, body: {
      "no_induk": controllerNomorInduk.text,
      "nama_siswa": controllerNamaSiswa.text,
      "jenis_kelamin": selectedKelamin,
      "id_agama": selectedAgama,
      "id_kelas": selectedKelas,
      "wali_murid": controllerWaliMurid.text,
      "no_hp": controllerNoHp.text,
      "alamat": controllerAlamat.text,
    });
  }

  String selectedKelamin;
  String selectedAgama;
  String selectedKelas;
  // ignore: deprecated_member_use
  List data = List();
  // ignore: deprecated_member_use
  List dataAgama = List();

  // ignore: deprecated_member_use
  List dataKelas = List();

  Future getAllKelamin() async {
    var response = await http.get(
        "http://sibk.amindev.online/api/getdataKelamin.php",
        headers: {"Accept": "application/json"});
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);

    setState(() {
      data = jsonData;
    });

    print(jsonData);
    return "succes";
  }

  Future getAllAgama() async {
    var response = await http.get(
        "http://sibk.amindev.online/api/getdataAgama.php",
        headers: {"Accept": "application/json"});
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);

    setState(() {
      dataAgama = jsonData;
    });

    print(jsonData);
    return "succes";
  }

  Future getAllKelas() async {
    var response = await http.get(
        "http://sibk.amindev.online/api/getdataKelas.php",
        headers: {"Accept": "app;ication"});
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);
    setState(() {
      dataKelas = jsonData;
    });
    print(jsonData);
    return "sukses";
  }

  @override
  void initState() {
    super.initState();
    getAllKelamin();
    getAllAgama();
    getAllKelas();
  }

  //http://sibk.amindev.online/api/getdataKelamin.php
  // ignore: deprecated_member_use
  var spasi = new Padding(padding: new EdgeInsets.all(10));
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.all(10)),
                new TextField(
                  controller: controllerNomorInduk,
                  decoration: new InputDecoration(
                      hintText: "Nomor Induk",
                      labelText: "Nomor Induk",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
                spasi,
                new TextField(
                  controller: controllerNamaSiswa,
                  decoration: new InputDecoration(
                      hintText: "Nama Siswa",
                      labelText: "Nama Siswa",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
                spasi,
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        style: BorderStyle.solid,
                        width: 1.80,
                      ),
                    ),
                    child: DropdownButtonFormField(
                      value: selectedKelamin,
                      hint: Text("select Data Kelamin"),
                      items: data.map(
                        (list) {
                          return DropdownMenuItem(
                            child: Text(list['jenis_kelamin']),
                            value: list['jenis_kelamin'],
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedKelamin = value;
                        });
                      },
                    ),
                  ),
                ),
                spasi,
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 1.80,
                        )),
                    child: DropdownButtonFormField(
                      value: selectedAgama,
                      hint: Text("select Data Agama"),
                      items: dataAgama.map(
                        (list1) {
                          return DropdownMenuItem(
                            child: Text(list1['agama']),
                            value: list1['id_agama'],
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedAgama = value;
                        });
                      },
                    ),
                  ),
                ),
                spasi,
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 1.80,
                        )),
                    child: DropdownButtonFormField(
                      value: selectedKelas,
                      hint: Text("select Data Kelas"),
                      items: dataKelas.map(
                        (list2) {
                          return DropdownMenuItem(
                            child: Text(list2['kelas']),
                            value: list2['id_kelas'],
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedKelas = value;
                        });
                      },
                    ),
                  ),
                ),
                spasi,
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 1.80,
                        )),
                    child: new TextField(
                      controller: controllerWaliMurid,
                      decoration: new InputDecoration(
                          hintText: "wali murid", labelText: "wali murid"),
                    ),
                  ),
                ),
                spasi,
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 1.80,
                        )),
                    child: new TextField(
                      controller: controllerNoHp,
                      decoration: new InputDecoration(
                          hintText: "no hp", labelText: "no hp"),
                    ),
                  ),
                ),
                spasi,
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 1.80,
                        )),
                    child: new TextField(
                      controller: controllerAlamat,
                      decoration: new InputDecoration(
                          hintText: "alamat", labelText: "alamat"),
                    ),
                  ),
                ),
                spasi,
                // Center(
                //   child: _image == null
                //       ? new Text("No image selected")
                //       : new Image.file(_image),
                // ),
                // spasi,

                Container(
                  // height: 50.0,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      AddData();
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Tambah Data",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
                // ignore: deprecated_member_use
                // new RaisedButton(
                //   child: new Text("ADD DATA"),
                //   color: Colors.blueAccent,
                //   onPressed: () {
                //     AddData();
                //     Navigator.pop(context);
                //   },
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
