import 'package:flutter/material.dart';

class RequestOptionItem extends StatelessWidget {
  final String optionTitle;

  RequestOptionItem({this.optionTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(optionTitle,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Expanded(
                  flex: 9,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () => showModalBottomSheet(
                            barrierColor: Colors.black.withOpacity(0.5),
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25))),
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                      child: Center(child: Text("گزینه ها")),
                                )),
                        child: Text(
                          'انتخاب',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.grey.shade700, fontSize: 12),
                        ),
                      )))
            ],
          ),
          Divider(
            thickness: 0.8,
          )
        ],
      ),
    );
  }
}
