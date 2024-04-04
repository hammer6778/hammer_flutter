const serviceUrl= 'http://v.jspang.com:8088/baixing/';
const newsApiKey = '71da63ca6498413c9b5f8f319d75e149';
//const serviceUrl= 'http://test.baixingliangfan.cn/baixing/';
const servicePath={
  'homePageContext': '${serviceUrl}wxmini/homePageContent', // 商家首页信息
  'homePageBelowConten': serviceUrl+'wxmini/homePageBelowConten', //商城首页热卖商品拉取
  'getCategory': serviceUrl+'wxmini/getCategory', //商品类别信息
  'getMallGoods': serviceUrl+'wxmini/getMallGoods', //商品分类的商品列表
  'getGoodDetailById':serviceUrl+'wxmini/getGoodDetailById', //商品详细信息列表
  videourlType.videotop:'http://web.peakchao.top:250/video/getVideoBanner'
};

enum videourlType{
videobanner,
videotop,
videodetail
}

