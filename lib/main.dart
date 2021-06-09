import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Colors,
        Icon,
        Icons,
        Material,
        MaterialApp,
        Scaffold,
        SingleTickerProviderStateMixin,
        State,
        StatefulWidget,
        Tab,
        TabBar,
        TabBarView,
        TabController,
        Text,
        Widget,
        runApp;

import './hal_siswa.dart' as Siswa;
import './hal_laporan.dart' as Laporan;
import './hal_kelas.dart' as Kelas;
import './hal_detail.dart' as Detail;

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "BK APP",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BK APP"),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.account_circle_outlined),
            ),
            new Tab(
              icon: new Icon(Icons.app_registration),
            ),
            new Tab(
              icon: new Icon(Icons.assignment_ind_outlined),
            ),
            new Tab(
              icon: new Icon(Icons.corporate_fare_rounded),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          new Siswa.Siswa(),
          new Laporan.Laporan(),
          new Detail.Detail(),
          new Kelas.Kelas(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.account_circle_outlined),
            ),
            new Tab(
              icon: new Icon(Icons.app_registration),
            ),
            new Tab(
              icon: new Icon(Icons.assignment_ind_outlined),
            ),
            new Tab(
              icon: new Icon(Icons.corporate_fare_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
