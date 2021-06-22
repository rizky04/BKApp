// ignore: unused_shown_name
import 'dart:convert' show json, jsonDecode;

import 'package:flutter/material.dart'
    show
        AppBar,
        BoxDecoration,
        BuildContext,
        Center,
        CircularProgressIndicator,
        Colors,
        Container,
        FloatingActionButton,
        FutureBuilder,
        Icon,
        Icons,
        ListView,
        MaterialApp,
        MaterialPageRoute,
        Navigator,
        Scaffold,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        Widget;
import 'package:http/http.dart' as http;
import 'dart:async' show Future;

import 'addpelanggaran.dart';

class Laporan extends StatefulWidget {
  @override
  _LaporanState createState() => new _LaporanState();
}

class _LaporanState extends State<Laporan> {
  Future<List> getData() async {
    final response =
        await http.get("http://sibk.amindev.online/api/getdataLaporan.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Laporan"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AddDataPelanggaran(),
        )),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.blueAccent),
      child: new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Text(list[i]['nama_siswa']);
        },
      ),
    );
  }
}
