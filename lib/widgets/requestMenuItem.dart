import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RequestMenuItem extends StatelessWidget {
  final String menuTitle;
  final IconData menuIcon;

  const RequestMenuItem({this.menuTitle, this.menuIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          InkWell(
            onTap: ()=>Navigator.pushNamed(context, 'addRequestDetails'),
            customBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: FaIcon(
                      menuIcon,
                      color: Colors.grey.shade800,
                      size: 18,
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text(menuTitle,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: true,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.arrow_forward_ios,
                          size: 15, color: Colors.grey.shade800),
                    ))
              ],
            ),
          ),
          Divider(
            thickness: 0.8,
          )
        ],
      ),
    );
  }
}
