import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:my_flutter_hammer/models/groupData.dart';


class GroupService {
  final Dio _dio;

  GroupService(this._dio);

  Future<GroupData> fetchGroupData() async {
    try {
      final response = await _dio.get('http://api.vvhan.com/api/hotlist/douban');
      if (response.statusCode == 200) {
        final jsonData = response.data;
        print('jsonData$jsonData');
        return GroupData.fromJson(jsonData['data']);
      } else {
        throw Exception('Failed to load group data');
      }
    } catch (e) {
      throw Exception('Failed to load group data: $e');
    }
  }

  
}
