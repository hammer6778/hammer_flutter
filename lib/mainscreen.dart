
import 'package:flutter/material.dart';
import 'package:my_flutter_hammer/pages/home.dart';
import 'package:my_flutter_hammer/pages/hot.dart';
import 'package:my_flutter_hammer/pages/usercenter.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  MainscreenState createState() => MainscreenState();
}

class MainscreenState extends State<Mainscreen> {
  int _selectIndex = 0;
  static List<Widget> pages = <Widget>[
    const Home(),
    const Hot(),
    const Usercenter(),
  ];

  void ontap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectIndex,
        onTap: ontap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: "购物"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "个人中心"),
        ],
      ),
    );
  }
}
