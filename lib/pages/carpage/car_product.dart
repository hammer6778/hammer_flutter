
import 'package:flutter/material.dart';

class Product with ChangeNotifier{
    String? name;
    double? price;
   int? num;
  bool? isCheck;

  Product({ this.name,  this.price, this.num,  this.isCheck});

 

}
