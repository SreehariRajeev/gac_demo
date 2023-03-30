import 'package:flutter/material.dart';
import 'package:gac_demo_v1/Utils/constants.dart';
import 'package:gac_demo_v1/presentation/Screen/Home%20Page/home_screen.dart';
import 'package:gac_demo_v1/presentation/Screen/qr_code_scanner.dart';
import 'package:gac_demo_v1/presentation/Screen/qr_code_scanner2.dart';
import 'package:gac_demo_v1/presentation/Screen/search_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    QRCodeScanner2(),
    // const Text('3')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Scanner',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.file_copy),
          //   label: 'Status',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Constants.primaryColor,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
