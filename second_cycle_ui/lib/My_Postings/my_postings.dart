import 'package:flutter/material.dart';
import 'package:second_cycle_ui/constants.dart';

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
          title: const Text(
            'SecondCycle',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: olive_yesil,
          bottom: const TabBar(
            labelColor: pastel_yesil, //<-- selected text color
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.black,
            tabs: <Widget>[
              Tab(
                text: "İlanlarım",
              ),
              Tab(
                text: "Favoriler",
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Görükle ...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
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
