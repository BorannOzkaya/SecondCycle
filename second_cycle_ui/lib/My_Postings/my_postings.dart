import 'package:flutter/material.dart';

List<String> titles = <String>[
  'Cloud',
  'Beach',
  'Sunny',
];

class MyPositngs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SecondCycle'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "İlanlarım",
              ),
              Tab(
                text: "Favoriler",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
          ],
        ),
      ),
    );
  }
}
