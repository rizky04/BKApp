import 'dart:convert';
import 'dart:io';

// ignore: unused_import
import 'package:appbk/hal_kelas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:image_picker/image_picker.dart';

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
                new TextField(
                  controller: controllerNomorInduk,
                  decoration: new InputDecoration(
                      hintText: "Nomor Induk", labelText: "Nomor Induk"),
                ),
                new TextField(
                  controller: controllerNamaSiswa,
                  decoration: new InputDecoration(
                      hintText: "Nama Siswa", labelText: "Nama Siswa"),
                ),

                Center(
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
                Center(
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

                Center(
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
                new TextField(
                  controller: controllerWaliMurid,
                  decoration: new InputDecoration(
                      hintText: "wali murid", labelText: "wali murid"),
                ),
                new TextField(
                  controller: controllerNoHp,
                  decoration: new InputDecoration(
                      hintText: "no hp", labelText: "no hp"),
                ),
                new TextField(
                  controller: controllerAlamat,
                  decoration: new InputDecoration(
                      hintText: "alamat", labelText: "alamat"),
                ),
                Center(
                  child: _image == null
                      ? new Text("No image selected")
                      : new Image.file(_image),
                ),

                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                // ignore: deprecated_member_use
                new RaisedButton(
                  child: new Text("ADD DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    AddData();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
