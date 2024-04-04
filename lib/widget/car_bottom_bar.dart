import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_hammer/pages/carpage/car_provide.dart';
import 'package:provider/provider.dart';

class CarBottomBar extends StatelessWidget {
  const CarBottomBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isSelAll = Provider.of<CartProvider>(context, listen: false).isSelAll;
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      return Container(
        margin: EdgeInsets.all(5.0),
        color: Colors.white,
        height: ScreenUtil().setHeight(160),
        width: ScreenUtil().setWidth(740),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _checkBtn(context, cartProvider),
              _allGoodsInfo(cartProvider),
              _goBtn(cartProvider)
            ],
          ),
        ),
      );
    });
  }

  Widget _checkBtn(context, CartProvider car) {
    return Row(
      children: [
        Checkbox(
          value: car.isAllSelected,
          onChanged: (val) {
            car.toggleSelectAll();
          },
        ),
        Text('全选')
      ],
    );
  }

  Widget _allGoodsInfo(CartProvider car) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '总价格${car.getTotalPrice()}元',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          '总金额超过200免费包邮',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _goBtn(CartProvider car) {
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(3.0)),
          child: Text(
            '结算(${car.getTotalNum()})',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
