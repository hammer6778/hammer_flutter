import 'dart:async';
import 'package:flutter/material.dart';


class TopSearchBar extends StatefulWidget {
  @override
  _TopSearchBarState createState() => _TopSearchBarState();
}

class _TopSearchBarState extends State<TopSearchBar> {
  late StreamController<int> _streamController;
  List<String> _placeholders = ['Search...', 'Find...', 'Explore...'];
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<int>();
    _startTextAnimation();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void _startTextAnimation() {
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      _streamController.sink.add(_index);
      _index = (_index + 1) % _placeholders.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Icon(Icons.search),
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: '输入搜索',
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.cancel),
          SizedBox(width: 8.0),
          Icon(Icons.home),
        ],
      ),
    );
  }
}