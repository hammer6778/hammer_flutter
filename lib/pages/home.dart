import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_hammer/config/servieces_url.dart';
import 'package:my_flutter_hammer/models/douban_list_model.dart';
import 'package:my_flutter_hammer/models/groupData.dart';
import 'package:my_flutter_hammer/models/movieItem.dart';
import 'package:my_flutter_hammer/models/newsData.dart';
import 'package:my_flutter_hammer/pages/detail_page.dart';
import 'dart:async';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:my_flutter_hammer/services/group_service.dart';
import 'package:my_flutter_hammer/services/news_service.dart';
import 'package:my_flutter_hammer/util/dio_http.dart';
import 'package:my_flutter_hammer/util/store_util.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  var videourl =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4';
  final oceanUrl = "//vjs.zencdn.net/v/oceans.mp4";
  final List<String> images = [
    'assets/images/pic0.jpeg',
    'assets/images/pic1.jpeg',
    'assets/images/pic2.jpeg',
  ];
  final List<Map> topNavigators = [
    {'img': 'assets/images/img0.png', 'title': '1'},
    {'img': 'assets/images/img1.png', 'title': '2'},
    {'img': 'assets/images/img2.png', 'title': '3'},
    {'img': 'assets/images/img3.png', 'title': '4'},
    {'img': 'assets/images/img4.png', 'title': '5'},
  ];
  final List<Map> goodsList = [
    {'img': 'assets/images/pic0.jpeg', 'oldprice': '200', 'newprice': '180'},
    {'img': 'assets/images/pic1.jpeg', 'oldprice': '133', 'newprice': '114'},
    {'img': 'assets/images/pic2.jpeg', 'oldprice': '268', 'newprice': '129'},
  ];
  List<Map<String, dynamic>> data = <Map<String, dynamic>>[];
  late Future<GroupData> _groupDataFuture;
  late Future<NewsData> _newsDataFuture;

  @override
  void initState() {
    super.initState();

    final dio2 = Dio(); // 创建 Dio 实例
    dio2.options.connectTimeout = Duration(seconds: 5);
    dio2.options.receiveTimeout = Duration(seconds: 5);
    final newsService = NewsService(dio2); // 创建 GroupService 实例
    _newsDataFuture = newsService.fetchNewsData();
    // req();
  }

  req() {
    final dio = Dio(); // 创建 Dio 实例
    final groupService = GroupService(dio); // 创建 GroupService 实例
    _groupDataFuture = groupService.fetchGroupData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      appBar: AppBar(
        leading: Icon(Icons.home),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.green], // 渐变色列表
              begin: Alignment.topLeft, // 渐变起始位置
              end: Alignment.bottomRight, // 渐变结束位置
              // 可选的渐变颜色分布
              stops: [0.0, 1.0],
              // 可选的渐变颜色分布方式
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        elevation: 0, // 移除阴影效果
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 28, 8),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '输入商品进行搜索',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
                height: ScreenUtil().setHeight(240),
                child: Swiper(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  autoplay: true,
                  loop: true,
                  // pagination: const SwiperPagination(),
                  control: const SwiperControl(),
                  pagination: const SwiperPagination(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.grey,
                          activeColor: Colors.white,
                          size: 4,
                          activeSize: 6)),
                  itemBuilder: (context, index) {
                    return Image.asset(images[index], fit: BoxFit.cover);
                  },
                  onTap: (int index) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailPage(
                        videoUrl: oceanUrl,
                        img: images[index],
                      );
                    }));
                  },
                )
                // }).toList(),
                ),
            // ),
            TopNavigators(navigatorList: topNavigators),
            Goods(goods: goodsList),
            SizedBox(
              height: 30,
              
              child: Container(
                
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(12, 2, 0, 5),
                child: Text(
                  "新闻热点",
                  style: TextStyle(fontSize: ScreenUtil().setSp(32)),
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.pink))),
              ),
            ),
            FutureBuilder<NewsData>(
              future: _newsDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final newsData = snapshot.data!;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: newsData.articles!.length,
                      itemBuilder: (context, index) {
                        return NewsItem(
                          article: newsData.articles![index],
                        );
                      });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final Article article;

  NewsItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/img0.png'), // 占位图像
              image: NetworkImage(article.urlToImage ?? ''), // 网络图像
              fit: BoxFit.cover, // 图像适应方式
              width: 200,
              height: 160,
            ),
          ),
          SizedBox(height: 10),
          Text(
            article.title ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Text(
            article.description ?? '',
            maxLines: 3, // 最多显示三行
            overflow: TextOverflow.ellipsis, // 超出部分显示省略号
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}

class TopNavigators extends StatelessWidget {
  final List navigatorList;
  const TopNavigators({super.key, required this.navigatorList});

  Widget navigatorItemUI(BuildContext context, item) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item['img'],
            width: ScreenUtil().setWidth(64),
            height: ScreenUtil().setHeight(64),
            fit: BoxFit.cover,
          ),
          Text(
            item['title'],
            style: TextStyle(fontSize: ScreenUtil().setSp(26)),
          )
        ],
      ),
      onTap: () {
        print(item);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(160),
      padding: EdgeInsets.all(3),
      child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(5),
          crossAxisCount: 5,
          children: navigatorList.map((item) {
            return navigatorItemUI(context, item);
          }).toList()),
    );
  }
}

class Goods extends StatelessWidget {
  final List goods;
  const Goods({super.key, required this.goods});

  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(12, 2, 0, 5),
      child: Text(
        "商品推荐",
        style: TextStyle(fontSize: ScreenUtil().setSp(32)),
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 0.5, color: Colors.pink))),
    );
  }

  Widget _goodsItem(index) {
    return InkWell(
        onTap: () {
          print('你干嘛');
        },
        child: Container(
          padding: EdgeInsets.all(6),
          width: ScreenUtil().setWidth(250),
          height: ScreenUtil().setHeight(300),
          decoration: const BoxDecoration(
              border: Border(left: BorderSide(color: Colors.grey, width: 1))),
          child: Column(
            children: [
              Image.asset(
                goods[index]['img'],
                width: ScreenUtil().setWidth(180),
                height: ScreenUtil().setHeight(200),
                fit: BoxFit.cover,
              ),
              Text(
                "￥${goods[index]['newprice']}",
                style: TextStyle(fontSize: ScreenUtil().setSp(26)),
              ),
              Text(
                "￥${goods[index]['oldprice']}",
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    fontSize: ScreenUtil().setSp(20)),
              ),
            ],
          ),
        ));
  }

//横向列表
  Widget recommandUI() {
    return Container(
      height: ScreenUtil().setHeight(300),
      margin: EdgeInsets.only(top: 10),
      // color: Colors.red,
      child: ListView.builder(
        itemCount: goods.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _goodsItem(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(380),
        color: Colors.white,
        child: Column(
          children: [_titleWidget(), recommandUI()],
        ));
  }
}
