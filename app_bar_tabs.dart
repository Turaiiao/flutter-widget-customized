import 'package:flutter/material.dart';

class NavigationOrderPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return NavigationOrderPageState();
  }
}

class NavigationOrderPageState extends State<NavigationOrderPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          elevation: 1.5,
          bottom: PreferredSize(
            child: TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text('进行中'),
                ),
                Tab(
                  child: Text('待接单'),
                ),
                Tab(
                  child: Text('已完成'),
                )
              ],
              labelColor: Colors.white,
              indicatorColor: Colors.white,
            ),
            preferredSize: Size.fromHeight(0),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text('DataList'),
            ),
            Center(
              child: Text('DataList'),
            ),
            Center(
              child: Text('DataList'),
            )
          ],
        ),
      ),
    );
  }
}
