import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  final newstext;
  final newsimage;

  const NewsPage({this.newstext, this.newsimage});
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        automaticallyImplyLeading: false,
        title: Text(
          'Tikvah',
          style: TextStyle(color: Colors.green[500], fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white24,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  for (int i = 0; i < widget.newsimage.length; i++) {
                    _listOfImages.add(NetworkImage(widget.newsimage[i]));
                  }
                  return Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => imagePage(context),
                        child: Hero(
                          tag: "Demo",
                          child: SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: Carousel(
                                boxFit: BoxFit.cover,
                                images: _listOfImages,
                                autoplay: true,
                                autoplayDuration: Duration(seconds: 3),
                                indicatorBgPadding: 1,
                                dotSize: 5,
                                dotBgColor: Colors.transparent,
                                dotColor: Colors.black,
                                dotPosition: DotPosition.bottomCenter,
                                animationCurve: Curves.fastOutSlowIn,
                                animationDuration:
                                    Duration(milliseconds: 2000)),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: ParsedText(
                  text: widget.newstext,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  parse: <MatchText>[
                    MatchText(
                        type: ParsedType.PHONE,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                        ),
                        onTap: (url) {
                          launch("tel:" + url);
                        }),
                    MatchText(
                      pattern: r"\B#+([\w]+)\b",
                      style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 19,
                      ),
                    ),
                    MatchText(
                      pattern: r"\B@+([\w]+)\b",
                      style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 19,
                      ),
                    ),
                  ]),
            ),
            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Add a comment...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      onPressed: () {}),
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }

  void imagePage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          backgroundColor: Colors.black,
          body: SizedBox(
            height: double.infinity,
            child: Hero(
              tag: "Demo",
              child: InteractiveViewer(
                maxScale: 6.0,
                child: Carousel(
                    boxFit: BoxFit.contain,
                    images: _listOfImages,
                    autoplay: true,
                    autoplayDuration: Duration(seconds: 5),
                    indicatorBgPadding: 1,
                    dotSize: 5,
                    dotBgColor: Colors.transparent,
                    dotColor: Colors.black,
                    dotPosition: DotPosition.bottomCenter,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 2000)),
              ),
            ),
          )),
    ));
  }
}
