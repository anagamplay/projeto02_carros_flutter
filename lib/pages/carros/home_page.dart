import 'package:carros/drawer_list.dart';
import 'package:carros/pages/carros/carros_api.dart';
import 'package:carros/pages/carros/carros_listview.dart';
import 'package:carros/pages/carros/carros_page.dart';
import 'package:carros/utils/prefs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
     _initTabs();
  }

  _initTabs() async {
    int tabIdx = await Prefs.getInt('tabIdx');

    _tabController = TabController(length: 3, vsync: this);

    setState(() {
      _tabController?.index = tabIdx;
    });
    _tabController?.addListener(() {
      Prefs.setInt(
        'tabIdx',
        _tabController?.index ?? 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: 'Clássicos',
            ),
            Tab(
              text: 'Esportivos',
            ),
            Tab(
              text: 'Luxo',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CarrosPage(TipoCarro.classicos),
          CarrosPage(TipoCarro.esportivos),
          CarrosPage(TipoCarro.luxo),
        ],
      ),
      drawer: DrawerList(),
    );
  }
}