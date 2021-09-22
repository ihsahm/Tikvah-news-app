import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:tikvah/Contact/contactus.dart';
import 'package:tikvah/Homepage/Tab/tabs_list.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _pages = <Widget>[
      TabsList(),
      Settings(),
    ];
    final _items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(FontAwesome5.home),
          // ignore: deprecated_member_use
          title: Text('Home')),
      BottomNavigationBarItem(
          icon: Icon(Typicons.cog_outline),
          // ignore: deprecated_member_use
          title: Text('Settings')),
    ];
    assert(_pages.length == _items.length);

    final bottomNavBar = BottomNavigationBar(
        items: _items,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        });
    return Scaffold(
      body: _pages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
