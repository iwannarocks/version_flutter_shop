import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_method.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = 'koll';

  @override
  void initState() {
    getHomePageContent().then((value) => {
      setState(() {
        homePageContent = value.toString();
      }),
    });
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
        appBar: AppBar(title: Text('百姓生活+')),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Text('a'),
              )
            ],
          ),
        ),
    );
  }
}


class SwiperDiy extends StatelessWidget {
  final List swiperDateList;
  // SwiperDiy({this.swiperDateList}); 另一种构造函数写法
  SwiperDiy({Key key, this.swiperDateList}) : super(key: key);  // 官方推荐

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {print("点击导航");},
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(95)),
          Text(item['mallCategoryName']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3),
      child: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.all(5),
        children: navigatorList.map((item){
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}
