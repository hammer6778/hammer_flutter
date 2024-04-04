import 'package:shared_preferences/shared_preferences.dart';

enum StoreKeys {
  token,
}

class StoreUtil {
  static late StoreKeys storeKeys;
  late final SharedPreferences _store;
  static Future<StoreUtil> getInstance() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    return StoreUtil._internal(pre);
  }

  StoreUtil._internal(this._store);

  getString(StoreKeys key) async {
    return _store.get(key.toString());
  }

  setString(StoreKeys key, String value) async {
    return _store.setString(key.toString(), value);
  }

  getStringList(StoreKeys key) async {
    return _store.getStringList(key.toString());
  }

  setStringList(StoreKeys key, List<String> value) async {
    return _store.setStringList(key.toString(), value);
  }
}
