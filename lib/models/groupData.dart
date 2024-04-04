import 'package:json_annotation/json_annotation.dart';

part 'groupData.g.dart';

@JsonSerializable()
class GroupData {
  final String name;
  final String subtitle;
  @JsonKey(name: 'update_time')
  final String updateTime;
  final List<GroupItem> data;

  GroupData({
    required this.name,
    required this.subtitle,
    required this.updateTime,
    required this.data,
  });

  factory GroupData.fromJson(Map<String, dynamic> json) =>
      _$GroupDataFromJson(json);

  Map<String, dynamic> toJson() => _$GroupDataToJson(this);
}

@JsonSerializable()
class GroupItem {
  final int index;
  final String title;
  final String hot;
  final String url;
  @JsonKey(name: 'mobilUrl')
  final String mobileUrl;

  GroupItem({
    required this.index,
    required this.title,
    required this.hot,
    required this.url,
    required this.mobileUrl,
  });

  factory GroupItem.fromJson(Map<String, dynamic> json) =>
      _$GroupItemFromJson(json);

  Map<String, dynamic> toJson() => _$GroupItemToJson(this);
}
