// 购物车状态管理器
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_flutter_hammer/pages/carpage/car_product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  String cartString = "[]";

  List<Product> cartList = []; //商品列表对象

  final List<Product> _items = [
    Product(name: '牛仔裤', price: 120, isCheck: true, num: 1),
    Product(name: '连衣裙', price: 162, isCheck: false, num: 1),
    Product(name: '橘子', price: 16, isCheck: true, num: 2),
  ];
  List<Product> get items => _items;

  int currentIndex = 0; //详情页返回购物车列表

  bool isSelAll = false;
  double allPrice = 0; //总价格
  int allGoodsCount = 0; //商品总数量

 bool get isAllSelected {
    return _items.every((product) => product.isCheck!);
  }

  void toggleSelectAll() {
    bool newValue = !isAllSelected;
    _items.forEach((product) {
      product.isCheck = newValue;
    });
    notifyListeners();
  }

  // toggleSelAll(bool sel) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   cartString = prefs.getString('cartInfo') ?? '';

  //   isSelAll = sel;
  //   List temlist = [];
  //   for (var item in items) {
  //     var newitem = item;
  //     newitem.isCheck = sel;
  //     temlist.add(item);
  //   }
  //   // notifyListeners();
  //   cartString = json.encode(temlist).toString();
  //   prefs.setString('cartInfo', cartString); //
  //   await getCartInfo();
  // }

  //得到购物车中的商品
  getCartInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //获得购物车中的商品,这时候是一个字符串
    cartString = prefs.getString('cartInfo') ?? '';

    //把cartList进行初始化，防止数据混乱
    cartList = [];
    //判断得到的字符串是否有值，如果不判断会报错
    if (cartString == null) {
      cartList = [];
    } else {
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      allPrice = 0;
      allGoodsCount = 0;
      isSelAll = true;
      tempList.forEach((item) {
        if (item['isCheck']) {
          allPrice += (item['count'] * item['price']);
          allGoodsCount += item['count'] as int;
        } else {
          isSelAll = false;
        }

        cartList.add(item as Product);
      });
    }
    notifyListeners();
  }

  changeCurrentIndex(int newindex) {
    currentIndex = newindex;
    notifyListeners();
  }

  // 添加商品到购物车
  void addItem(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void switchSelect(Product product) {
    product.isCheck != product.isCheck;
    notifyListeners();
  }

  // 移除购物车中的商品
  void removeItem(Product product) {
    //根据ID是否一致来移除
    for (var i = 0; i < items.length; i++) {
      if (items[i].name == product.name) {
        _items.removeAt(i);
      }
    }
    notifyListeners();
  }

  void removeItemFromIndex(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var product in items) {
      if (product.isCheck == true) {
        total += product.price! * product.num!;
      }
    }
    return total;
  }

  int getTotalNum() {
    int total = 0;
    for (var product in items) {
      if (product.isCheck == true) {
        total += product.num!;
      }
    }
    return total;
  }
}
