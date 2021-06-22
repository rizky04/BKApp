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
        FutureBuilder,
        ListView,
        MaterialApp,
        Scaffold,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        Widget;
import 'package:http/http.dart' as http;
import 'dart:async' show Future;

class Kelas extends StatefulWidget {
  @override
  _KelasState createState() => new _KelasState();
}

class _KelasState extends State<Kelas> {
  Future<List> getData() async {
    final response =
        await http.get("http://sibk.amindev.online/api/getdataKelas.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Kelas"),
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
          return new Text(list[i]['kelas']);
        },
      ),
    );
  }
}
