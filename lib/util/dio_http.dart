import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_hammer/config.dart';

class DioHttp {
  static const dioHeader = {
    // 'Accept': 'application/json,text/plain,*/*',
    // 'Content-Type': 'application/json, charset=utf-8',
    // 'Access-Control-Allow-Origin': true,
    // 'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, DELETE, HEAD',
    // "connection": "keep-alive",
    // "accept": "application/json, */*",
    // "content-type": "application/json",
    // "accept-encoding": "gzip, deflate",
    // "accept-language": "zh-CN,zh;q=0.8,en;q=0.6,zh-TW;q=0.4,ja;q=0.2",

       "accept": "application/json, */*",
        "content-type": "application/json,application/x-www-form-urlencoded",

  };
  //设置配置
  static final BaseOptions _options = BaseOptions(
    baseUrl: Config.BaseUrl,
    connectTimeout: Duration(milliseconds: 5000 * 10),
    receiveTimeout: Duration(milliseconds: 3000 * 10),
    headers: dioHeader,
  );
  //实例Dio
  static final Dio _dio = Dio(_options);
  //核心request方法
  static Future<T> _request<T>(String path,
      {String? mathod, Map? params, data}) async {
    //如果参数有值，开始请求
    if (params != null) {
      params.forEach((key, value) {
        print("参数遍历为$value");
        if (path.indexOf(key) != -1) {
          path = path.replaceAll(":$key", value.toString());
        }
      });
    }
    print("请求路径为$path");
    print("发送的数据为$data");
    //加载动画
    //定义请全体
    Response response = await _dio.request(path,
        data: data,
        options: Options(
            method: mathod, contentType: Headers.contentEncodingHeader));
    //根据响应体字段进行判断
    if (response.statusCode == 200 || response.statusCode == 201) {
      ///如果请求到，则关闭弹窗动画
      /// 格式化接收到的数据
      var data = jsonDecode(response.data);
      return data;
    } else {
      return Future.error('解析响应数据异常1');
    }
    // return Future.error('error====');
  }

  //请求方式
  static Future<T> get<T>(String path, {Map? params}) {
    return _request(path, mathod: "get", params: params);
  }

  static Future<T> post<T>(String path, {Map? params, data}) {
    return _request(path, mathod: "post", params: params, data: data);
  }
}
