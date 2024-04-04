

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_hammer/pages/carpage/car_product.dart';
import 'package:my_flutter_hammer/pages/carpage/car_provide.dart';
import 'package:provider/provider.dart';


class CarItemW extends StatelessWidget {
  final bool isSelect= false;
  final Product product;

  // ProductItem({required this.product});
  const CarItemW({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
      padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: Row(
        children: [
          _cartCheckBt(context, product),
          _cartImage(product),
          _cartGoodsName(product),
          _cartPrice(context, product)

        ],
      ),
    );
  }

  //多选按钮
  Widget _cartCheckBt(context,Product item) {
    return Container(
      child: 
      Checkbox(
        value: item.isCheck,
        activeColor: Colors.pink,
        onChanged: (bool? val) {
          item.isCheck = val ?? true;
          
              Provider.of<CartProvider>(context, listen: false)
                  .switchSelect(item);
        },
      ),
    );
  }

  //商品图片
  Widget _cartImage(item) {
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3.0),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black12)),
      child: Image.asset('assets/images/img0.png'),
    );
  }

  //商品名称
  Widget _cartGoodsName(Product item) {
    return Container(
      width: ScreenUtil().setWidth(300),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Text(item.name ?? ''),
           
          Text('${item.num}'),
          ]
      ),
    );
  }

  //商品价格
  Widget _cartPrice(context,Product item) {
    return Container(
      width: ScreenUtil().setWidth(150),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Text('￥${item.price}'),
          Container(
            child: InkWell(
              onTap: () {
              Provider.of<CartProvider>(context, listen: false)
                  .removeItem(product);
              },
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
