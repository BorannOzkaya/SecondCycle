import 'package:flutter/material.dart';
import 'package:second_cycle_ui/Chat_Page/chat_page.dart';
import 'package:second_cycle_ui/My_Postings/my_postings.dart';
import 'package:second_cycle_ui/Profile_Page/profile_page.dart';
import 'package:second_cycle_ui/Sell_Page/sell_page.dart';

import 'Home_Page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Second Cycle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pageOptions = [
    HomePage(),
    ChatPage(),
    SellPage(),
    MyPositngs(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Scaffold(
      appBar: _selectedIndex == 3
          ? null
          : AppBar(
              title: Text('SecondCycle'),
              actions: [
                TextButton(
                  style: style,
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text('Görükle ......'),
                    ],
                  ),
                ),
              ],
            ),
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_rounded),
            label: 'Sat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken_rounded),
            label: 'İlanlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
