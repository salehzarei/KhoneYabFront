import 'package:flutter/material.dart';
import 'package:khoneyab/widgets/consulterDetails.dart';
import 'package:khoneyab/widgets/requestSetting.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RequestDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _pagewidth = MediaQuery.of(context).size.width;
    double _pageheight = MediaQuery.of(context).size.height;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.mode_edit), onPressed: null),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                  onPressed: () => Navigator.of(context).pop()),
            ],
            title: Text(
              "جزئیات درخواست",
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text("رهن و اجاره آپارتمان در منطقه الهیه",
                      style: Theme.of(context).textTheme.headline2),
                ),
                Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: _pagewidth,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey.shade50),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "مبلغ ودیعه: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  "3 الی 25 میلیون",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                          );
                        })),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("مشاورین املاک پذیرنده"),
                      Container(
                        height: 2,
                        width: _pagewidth * 0.50,
                        color: Colors.grey.shade200,
                      ),
                      Icon(Icons.sort)
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    width: _pagewidth,
                    height: _pageheight * 0.55,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Consulter(
                            pagewidth: _pagewidth,
                            pagehight: _pageheight,
                          );
                        }),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    // color: Colors.grey.shade200,
                    child: RequestSetting(),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

showConsulterDetails(context) {
  return showDialog(
      context: context,
      builder: (BuildContext buildContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
         elevation: 0.0, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ConsulterDetails(),
        );
      });
}

class Consulter extends StatelessWidget {
  final double pagewidth;
  final double pagehight;
  Consulter({this.pagewidth, this.pagehight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: GestureDetector(
        onTap: () => showConsulterDetails(context),
        child: Container(
          width: pagewidth,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/Saleh.jpg"))),
              ),
              Container(
                padding: EdgeInsets.only(right: 8, top: 6),
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: pagewidth * 0.71,
                      height: 25,
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SmoothStarRating(
                            rating: 2.5,
                            isReadOnly: true,
                            size: 18,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half,
                            defaultIconData: Icons.star_border,
                            starCount: 5,
                            allowHalfRating: true,
                            spacing: 0.0,
                            color: Colors.yellow.shade700,
                            borderColor: Colors.yellow.shade700,
                          ),
                          Text("3 مورد مشابه درخواست شما دارد",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: pagewidth * 0.58,
                            height: 40,
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: <Widget>[
                                Text("سیدامین زارعی",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                                Container(
                                  width: 6,
                                  color: Colors.grey,
                                  height: 1,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                ),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Text("املاک مرکزی الهیه",
                                      maxLines: 1,
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        fontSize: 12,
                                      )),
                                ),
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(right: 2),
                          width: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.message,
                                color: Colors.green,
                                size: 18,
                              ),
                              Icon(Icons.phone, color: Colors.green, size: 18),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
