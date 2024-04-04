import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_hammer/util/store_util.dart';
import 'package:scoped_model/scoped_model.dart';

@JsonSerializable()
class AuthModel extends Model {
  String _token = '';
  
  String get token => _token;
  bool get isLogin => _token is String && _token != '';

  void initApp(BuildContext context) async {
    StoreUtil store = await StoreUtil.getInstance();
    String token = store.getString(StoreKeys.token);
    if (token.isNotEmpty) {
      login(token, context);
    }
  }

  void login(String token, BuildContext context) {
    _token = token;
    notifyListeners();
  }

  void logout(String token, BuildContext context) {
    _token = '';
    notifyListeners();
  }
}
