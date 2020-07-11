import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class UserRequestList extends StatefulWidget {
  @override
  _UserRequestListState createState() => _UserRequestListState();
}

class _UserRequestListState extends State<UserRequestList> {
  @override
  Widget build(BuildContext context) {
    double _pagewidth = MediaQuery.of(context).size.width;
    double _pageheight = MediaQuery.of(context).size.height;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "لیست درخواست های من",
              style: Theme.of(context).textTheme.headline1,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Container(
            height: _pageheight,
            width: _pagewidth,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.grey.shade400,
                  height: 0.5,
                  width: _pagewidth * 0.75,
                ),
                Expanded(
                  child: Container(
                    width: _pagewidth,
                    height: _pageheight * 0.80,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Request(
                            pagewidth: _pagewidth,
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class Request extends StatelessWidget {
  final double pagewidth;

  Request({this.pagewidth});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'RequestDetails'),
        child: Container(
          width: pagewidth * 0.51,
          height: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 5.0))
              ]),
          child: Row(
            children: <Widget>[
              Container(
                width: 7,
                height: 75,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
              ),
              Expanded(
                  flex: 10,
                  child: Container(
                    padding: EdgeInsets.only(top: 10, right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(
                              width: pagewidth * 0.48,
                              height: 25,
                              child: Text(
                                "آپارتمان در الهیه",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: pagewidth * 0.21,
                              height: 25,
                              child: Text("تاریخ : 1398/4/18",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: pagewidth * 0.70,
                          height: 25,
                          child: Marquee(
                            text:
                                "نوساز و صفر - حداکثر رهن 35 میلیون - حداکثر اجاره 2 میلیون",
                            velocity: 10,
                            scrollAxis: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            pauseAfterRound: Duration(seconds: 2),
                            blankSpace: 20,
                            showFadingOnlyWhenScrolling: true,
                            fadingEdgeStartFraction: 0.1,
                            fadingEdgeEndFraction: 0.1,
                            startPadding: 30.0,
                            accelerationCurve: Curves.linear,
                            decelerationDuration: Duration(milliseconds: 500),
                            decelerationCurve: Curves.easeOut,
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.tag_faces,
                          color: Colors.green,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "20 مشاور",
                          style: TextStyle(fontSize: 10, color: Colors.green),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
