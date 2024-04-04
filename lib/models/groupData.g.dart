// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groupData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupData _$GroupDataFromJson(Map<String, dynamic> json) => GroupData(
      name: json['name'] as String,
      subtitle: json['subtitle'] as String,
      updateTime: json['update_time'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => GroupItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupDataToJson(GroupData instance) => <String, dynamic>{
      'name': instance.name,
      'subtitle': instance.subtitle,
      'update_time': instance.updateTime,
      'data': instance.data,
    };

GroupItem _$GroupItemFromJson(Map<String, dynamic> json) => GroupItem(
      index: json['index'] as int,
      title: json['title'] as String,
      hot: json['hot'] as String,
      url: json['url'] as String,
      mobileUrl: json['mobilUrl'] as String,
    );

Map<String, dynamic> _$GroupItemToJson(GroupItem instance) => <String, dynamic>{
      'index': instance.index,
      'title': instance.title,
      'hot': instance.hot,
      'url': instance.url,
      'mobilUrl': instance.mobileUrl,
    };
