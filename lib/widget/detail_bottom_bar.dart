import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailBottomBar extends StatelessWidget {
  const DetailBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              color: Colors.white,
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setWidth(80),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                size: 18,
                color: Colors.red,
              )),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setWidth(80),
              alignment: Alignment.center,
              color: Colors.orange,
              child: Text(
                "加入购物车",
                style: TextStyle(fontSize: ScreenUtil().setSp(32), color: Colors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(320),
              height: ScreenUtil().setWidth(80),
              color: Colors.red,
              child:  Text(
                "立即购买",
                style: TextStyle(fontSize: ScreenUtil().setSp(32), color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
