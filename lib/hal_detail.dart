// ignore: unused_shown_name
import 'dart:convert' show json, jsonDecode;

import 'package:flutter/material.dart'
    show
        AppBar,
        BoxDecoration,
        BuildContext,
        Card,
        Center,
        CircularProgressIndicator,
        Colors,
        EdgeInsets,
        FloatingActionButton,
        FutureBuilder,
        GestureDetector,
        Icon,
        Icons,
        ListTile,
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
// ignore: implementation_imports
import "package:flutter/src/widgets/container.dart" show Container;
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
// ignore: unused_import
import './detail.dart';
import './adddata.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  Future<List> getData() async {
    final response =
        await http.get("http://sibk.amindev.online/api/getdataDetail.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Data Lengkap Siswa"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AddData(),
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
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          decoration: new BoxDecoration(color: Colors.blueAccent),
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DetailSiswa(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nama_siswa']),
                leading: new Icon(Icons.school),
                subtitle: new Text("Kelas : ${list[i]['kelas']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
