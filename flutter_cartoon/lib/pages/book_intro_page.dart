import 'package:flutter/material.dart';
import 'package:fluttercartoon/page_request/home_page_request.dart';
import 'dart:ui';
import 'package:fluttercartoon/PHheader.dart';
//
//  Widget _buildTabBarBg() {
//    return Container(
//      //TabBar圆角背景颜色
//      height: 50,
//      child: ClipRRect(
//          borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
//          child: Container(color: Colors.red)),
//    );
//  }

class BookIntro_Page extends StatefulWidget {
  int comic_id;

  BookIntro_Page(this.comic_id);

  @override
  _BookIntro_PageState createState() => _BookIntro_PageState();
}

class _BookIntro_PageState extends State<BookIntro_Page>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    HomeRequest.request_CommicDetail(widget.comic_id).then((res) {
      setState(() {
        print(res.data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                // backgroundColor: Colors.transparent,
                pinned: true,
//              floating: true,
                expandedHeight: 280,

                flexibleSpace: FlexibleSpaceBar(
//                collapseMode: CollapseMode.pin,
//                stretchModes:const <StretchMode>[StretchMode.blurBackground],
                  background: Column(
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            ConstrainedBox(
                                constraints: BoxConstraints.expand(),
                                child: Image.asset(
                                  'assets/images/mine/mine_bg_for_girl@2x.png',
                                  fit: BoxFit.cover,
                                )),
                            Positioned.fill(
                              child: BackdropFilter(
                                filter: new ImageFilter.blur(
                                    sigmaX: 15, sigmaY: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: (Colors.black).withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                left: 0,
                                top: Device.device_top(context) + 44,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                 
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                                'https://cover.u17i.com/temp/2020/05/3674833_1590765609_8OBOjRK4eigJ.jpg')),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 15, bottom: 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment: 
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '妙手咸蛋',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            Container(height:10),
                                            Text(
                                              '玉麒麟',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                            Container(height:20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(right: 5),
                                                  child: Text('点击',style: TextStyle(color:Colors.white,fontSize: 14),),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(right: 5),
                                                  child: Text(
                                                    '4111万',
                                                    style: TextStyle(color: Colors.orange,fontSize: 14),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(right: 5),
                                                  child: Text('收藏',style: TextStyle(color:Colors.white,fontSize: 14),),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(right: 5),
                                                  child: Text('10086',style: TextStyle(color:Colors.orange,fontSize: 14)),
                                                ),
                                              ],
                                            ),

                                            Spacer(),
                                            Row(children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(right:8.0),
                                                child: _colorRimText(' text ', Colors.white, Colors.white, 1, 2, 15),
                                              ),
                                               Padding(
                                                padding: const EdgeInsets.only(right:8.0),
                                                child: _colorRimText(' text ', Colors.white, Colors.white, 1, 2, 15),
                                              ),
                                               Padding(
                                                padding: const EdgeInsets.only(right:18.0),
                                                child: _colorRimText(' text  ', Colors.white, Colors.white, 1, 2, 15),
                                              ),
                                            ],)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        height: 44,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                bottom: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: "详情"),
                    Tab(text: "目录"),
                    Tab(text: "评论"),
                  ],
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.greenAccent,
                  indicatorColor: Colors.greenAccent,
                  indicatorSize: TabBarIndicatorSize.label,
                ),
              ),
            ];
          },
          body: TabBarView(controller: _tabController, children: [
            _buildListView("aaa:"),
            _buildListView("bbb:"),
            _buildListView("ccc:"),
          ])),
    );
  }

  Widget _buildListView(String s) {
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) => Divider(
              color: Colors.grey,
              height: 1,
            ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              color: Colors.white,
              child: ListTile(title: Text("$s第$index 个条目")));
        });
  }

  //带颜色边框的文字-如积分提示
Widget _colorRimText(String text,Color textColor,Color rimColor,double rimWidth,double borderRadius,double fontsize){
  return  Container(
    child: Text(text,style: TextStyle(color: textColor,fontSize: fontsize),textAlign: TextAlign.center,),
    decoration: BoxDecoration(
        border: Border.all(color: rimColor,width: rimWidth),
        borderRadius: BorderRadius.circular(borderRadius)
    ),
  );
}
}
