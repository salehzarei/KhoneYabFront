import 'package:flutter/material.dart';
import 'package:khoneyab/pages/addRequestPage.dart';
import 'package:khoneyab/pages/chatPage.dart';
import 'package:khoneyab/pages/profilePage.dart';
import 'package:khoneyab/pages/userRequestList.dart';

class ButtonMenuItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  ButtonMenuItem(
      {@required this.page, @required this.title, @required this.icon});

  static List<ButtonMenuItem> get items => [
        ButtonMenuItem(
            page: ProfilePage(),
            title: Text("پروفایل"),
            icon: Icon(Icons.person)),
        ButtonMenuItem(
            page: ChatPage(), title: Text("چت ها"), icon: Icon(Icons.chat)),
        ButtonMenuItem(
            page: UserRequestList(),
            title: Text("درخواست ها"),
            icon: Icon(Icons.list)),
        ButtonMenuItem(
            page: AddRequestPage(),
            title: Text("ثبت درخواست"),
            icon: Icon(Icons.add_circle))
      ];
}
