import 'package:my_flutter_hammer/util/dio_http.dart';

class Api {
  //认证
  static auth(data) {
    return DioHttp.post('/user', data: data);
  }
  //登录
  static login(params) {
    return DioHttp.get('/user/login', params: params);
  }
}
