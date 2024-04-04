import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_hammer/pages/carpage/car_product.dart';
import 'package:my_flutter_hammer/pages/carpage/car_provide.dart';
import 'package:my_flutter_hammer/pages/carpage/cart_item.dart';
import 'package:my_flutter_hammer/widget/car_bottom_bar.dart';
import 'package:my_flutter_hammer/widget/car_item_w.dart';
import 'package:my_flutter_hammer/widget/right_action_navbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Hot extends StatefulWidget {
  const Hot({Key? key}) : super(key: key);

  @override
  HotState createState() => HotState();
}

class HotState extends State<Hot> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
          centerTitle: false,
          actions: [
            SizedBox(
              width: 20,
            ),
            Icon(Icons.message, size: 16),
            SizedBox(
              width: 20,
            )
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.red], // 渐变色列表
                begin: Alignment.topLeft, // 渐变起始位置
                end: Alignment.bottomRight, // 渐变结束位置
                // 可选的渐变颜色分布
                stops: [0.0, 1.0],
                // 可选的渐变颜色分布方式
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          elevation: 0, // 移除阴影效果
        ),
        backgroundColor: Color.fromARGB(115, 251, 246, 246),
        body: Stack(
          children: [
            Consumer<CartProvider>(
              builder: (context, model, child) => ListView.builder(
                itemCount: model.items.length,
                itemBuilder: (context, index) {
                  return CarItemW(product: model.items[index]);
                },
              ),
            ),
            const Positioned(bottom: 0, left: 0, child: CarBottomBar())
          ],
        ));
  }
}
