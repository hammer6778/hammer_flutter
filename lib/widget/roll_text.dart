import 'dart:async';

import 'package:flutter/material.dart';

class RollText extends StatefulWidget {
  final List<String> placeholders;
  const RollText({ Key? key, required this.placeholders }) : super(key: key);

  @override
  _RollTextState createState() => _RollTextState();
}

class _RollTextState extends State<RollText> {
  late StreamController<String> _streamController;
  int _index = 0;
  @override
  void initState() {
    
    _streamController = StreamController<String>();
    _startTextAnimation();
    super.initState();
  }
   void _startTextAnimation() {
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      _streamController.sink.add(widget.placeholders[_index]);
      _index = (_index + 1) % widget.placeholders.length;
    });
  }
  
  @override
  Widget build(BuildContext context) {
     return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: StreamBuilder<String>(
        stream: _streamController.stream,
        initialData: '',
        builder: (context, snapshot) {
           if (snapshot.hasData) {
              return Center(
                child: Text(
                  snapshot.data!,
                      style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                ),
              );
            } else {
              return Container(); // 没有数据时返回一个空容器
            }
        },
      ),
    );
 
  }
}