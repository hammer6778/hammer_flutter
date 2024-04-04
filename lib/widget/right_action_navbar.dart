import 'package:flutter/material.dart';

class RightActionNavbar extends StatelessWidget {
  const RightActionNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                '更多',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Divider(
            height: 4.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
