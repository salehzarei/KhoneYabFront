import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ConsulterDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5),
            margin: EdgeInsets.only(top: 40 ,  bottom: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        // color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 15),
                        height: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SmoothStarRating(
                              rating: 2.5,
                              isReadOnly: true,
                              size: 15,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              defaultIconData: Icons.star_border,
                              starCount: 5,
                              allowHalfRating: true,
                              spacing: 0.0,
                              color: Colors.yellow.shade700,
                              borderColor: Colors.yellow.shade700,
                            ),
                            Text(
                              "میزان امتیاز مشتریان",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                          alignment: Alignment.topLeft,
                          //  color: Colors.green,
                          height: 40,
                          child: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () => Navigator.pop(context))),
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 18, bottom: 10),
                            child: Text(
                              "عبدالصالح زارعی" + " از " + "املاک نیلی",
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  "6 مورد مناسب برای شما دارد",
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: false,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                Divider(),
                //// کد درخواست

                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "کد درخواست",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("1825",
                          style: TextStyle(fontSize: 40, color: Colors.green)),
                      Text("لطفا هنگام تماس این کد را به مشاور اعلام کنید",
                          style: TextStyle(fontSize: 12))
                    ],
                  ),
                ),

                //// تماس ها
                Divider(),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.call,
                        size: 28,
                        color: Colors.white,
                      ),
                      Text("تماس با دفتر",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          )),
                      Text("05135242166",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),

                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.call,
                        size: 28,
                        color: Colors.white,
                      ),
                      Text("تماس با دفتر",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          )),
                      Text("05135242166",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),

                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.phone_android,
                        size: 28,
                        color: Colors.white,
                      ),
                      Text("تماس با موبایل",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          )),
                      Text("09154127181",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),

                /// آدرس و ساعت کاری
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: <Widget>[
                      Text("آدرس دفتر: الهیه، نبش محمدیه3،املاک نیلی",
                          style: TextStyle(fontSize: 14)),
                      Text("ساعات کاری دفتر: 11 الی 15 و 17 الی 22",
                          style: TextStyle(fontSize: 14))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              maxRadius: 45,
              minRadius: 25,
              backgroundImage: AssetImage('assets/images/Saleh.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
