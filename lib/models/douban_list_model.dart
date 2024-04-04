class DoubanListModel {
  String? name;
  String? subtitle;
  String? updateTime;
  List<DoubanItemModel>? data;

  DoubanListModel({this.name, this.subtitle, this.updateTime, this.data});

  DoubanListModel.fromJson(Map<String, dynamic> json) {
    print('DoubanListModelfromJson=$json');
    name = json['name'];
    subtitle = json['subtitle'];
    updateTime = json['update_time'];
    if (json['data'] != null) {
      data = <DoubanItemModel>[];
      json['data'].forEach((v) {
        data!.add(DoubanItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['subtitle'] = this.subtitle;
    data['update_time'] = this.updateTime;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DoubanItemModel {
  int? index;
  String? title;
  String? hot;
  String? url;
  String? mobilUrl;

  DoubanItemModel({this.index, this.title, this.hot, this.url, this.mobilUrl});

  DoubanItemModel.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    title = json['title'];
    hot = json['hot'];
    url = json['url'];
    mobilUrl = json['mobilUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['index'] = this.index;
    data['title'] = this.title;
    data['hot'] = this.hot;
    data['url'] = this.url;
    data['mobilUrl'] = this.mobilUrl;
    return data;
  }
}
