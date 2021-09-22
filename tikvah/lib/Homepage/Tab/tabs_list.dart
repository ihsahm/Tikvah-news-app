import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:tikvah/Homepage/Content/news_list.dart';
import 'package:tikvah/Homepage/Content/sports_list.dart';
import 'package:tikvah/Homepage/Content/top_news.dart';

class TabsList extends StatelessWidget {
  final tabPages = <Widget>[
    TopList(),
    NewsList(),
    SportList(),
  ];
  final tabs = <Tab>[
    const Tab(
      child: Text(
        'Top story',
        style: TextStyle(color: Colors.blue),
      ),
      icon: Icon(
        MfgLabs.newspaper,
        color: Colors.blue,
      ),
    ),
    const Tab(
      child: Text(
        'News',
        style: TextStyle(color: Colors.blue),
      ),
      icon: Icon(
        Elusive.mic,
        color: Colors.blue,
      ),
    ),
    const Tab(
      child: Text(
        'Sports',
        style: TextStyle(color: Colors.blue),
      ),
      icon: Icon(
        RpgAwesome.soccer_ball,
        color: Colors.blue,
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tikvah',
            style: TextStyle(color: Colors.green[500], fontSize: 20),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white24,
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          children: tabPages,
        ),
      ),
    );
  }
}
