import 'package:flutter/material.dart';
import 'package:tikvah/Database/news_data.dart';
import 'package:tikvah/Newspage/news_page.dart';

class TopList extends StatefulWidget {
  final newsdata;
  final newsdataimage;

  TopList({this.newsdata, this.newsdataimage});
  @override
  _TopListState createState() => _TopListState();
}

class _TopListState extends State<TopList> {
  Stream newslist;
  NewsData crudObj = new NewsData();

  @override
  void initState() {
    crudObj.getData().then((results) {
      setState(() {
        newslist = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: newslist,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewsPage(
                                          newstext: snapshot
                                              .data.documents[index]
                                              .data()['text'],
                                          newsimage: snapshot
                                              .data.documents[index]
                                              .data()['image'],
                                        )));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 8, bottom: 4),
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "${snapshot.data.documents[index].data()['image'][0]}",
                                    )),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[300],
                                      offset: Offset(-2, -1),
                                      blurRadius: 5),
                                ]),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      stops: [
                                        0.1,
                                        0.9
                                      ],
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.1)
                                      ])),
                              /*child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    "${snapshot.data.documents[index].data()['text']}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),*/
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 2, bottom: 4),
                          child: Text(
                              "${snapshot.data.documents[index].data()['text']}"),
                        )
                      ],
                    ),
                  );
                });
          } else {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 5,
                ),
                Text('Loading,Please wait...'),
              ],
            ));
          }
        });
  }
}
