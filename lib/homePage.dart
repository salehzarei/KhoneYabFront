import 'package:flutter/material.dart';
import 'package:khoneyab/widgets/buttonMenu.dart';
import 'package:provider/provider.dart';

import 'provider/mainProvider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          for (final menuItem in ButtonMenuItem.items) menuItem.page,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue.shade800,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            context.read<MainProvider>().loadApartemanOption();
          });
        },
        items: [
          for (final menuItem in ButtonMenuItem.items)
            BottomNavigationBarItem(icon: menuItem.icon, title: menuItem.title)
        ],
      ),
    );
  }
}
