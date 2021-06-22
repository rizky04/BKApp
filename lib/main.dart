import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        Colors,
        Column,
        Container,
        ElevatedButton,
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
  int pageIndex = 0;
  final Siswa.Siswa _siswa = Siswa.Siswa();
  final Detail.Detail _detail = Detail.Detail();
  final Laporan.Laporan _laporan = Laporan.Laporan();
  final Kelas.Kelas _kelas = Kelas.Kelas();

  Widget _showPage = new Siswa.Siswa();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _siswa;
        break;
      case 1:
        return _detail;
        break;
      case 2:
        return _laporan;
        break;
      case 3:
        return _kelas;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text(
              'halaman tidak di temukan',
              style: new TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: pageIndex,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _showPage,
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Text(_page.toString(), textScaleFactor: 10.0),
            //     ElevatedButton(
            //       child: Text('Go To Page of index 1'),
            //     )
            //   ],
            // ),
          ),
        ));
  }
}
