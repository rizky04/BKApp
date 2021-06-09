import 'package:flutter/material.dart';
// ignore: unused_import
import './hal_detail.dart';

// ignore: must_be_immutable
class DetailSiswa extends StatefulWidget {
  List list;
  int index;
  DetailSiswa({this.index, this.list});
  @override
  _DetailSiswaState createState() => _DetailSiswaState();
}

class _DetailSiswaState extends State<DetailSiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['nama_siswa']}")),
      body: new Container(
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['nama_siswa'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Text(
                  "No Induk : ${widget.list[widget.index]['no_induk']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Kelas : ${widget.list[widget.index]['kelas']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Wali Kelas : ${widget.list[widget.index]['wali_kelas']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Agama : ${widget.list[widget.index]['agama']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Jenis Kelamin : ${widget.list[widget.index]['jenis_kelamin']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Alamat : ${widget.list[widget.index]['alamat']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Wali Murid : ${widget.list[widget.index]['wali_murid']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "No Hp : ${widget.list[widget.index]['no_hp']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // ignore: deprecated_member_use
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.green,
                      onPressed: () {},
                    ),
                    // ignore: deprecated_member_use
                    new RaisedButton(
                      child: new Text("HAPUS"),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
