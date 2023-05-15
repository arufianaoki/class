import 'package:flutter/material.dart';
import 'page_1.dart';
import 'page_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static List<Widget> _pages = [
    Page1(),
    Page2(),
  ];

  int _selectedTab = 0;

  void _pilihTab(indeks) {
    setState(() {
      _selectedTab = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Multitab 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Multitab 1'),
        ),
        body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedTab,
            onTap: _pilihTab,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Page1',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Page2',
              ),
            ]),
      ),
    );
  }
}
