// 商品列表项组件
import 'package:flutter/material.dart';
import 'package:my_flutter_hammer/pages/carpage/car_product.dart';
import 'package:my_flutter_hammer/pages/carpage/car_provide.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .addItem(product);
            },
          ),
          title: Text(product.name ?? ''),
          subtitle: Text('\$${product.price}'),
          trailing: IconButton(
            icon: Icon(Icons.remove_shopping_cart),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .removeItem(product);
            },
          ),
        ));
  }
}
