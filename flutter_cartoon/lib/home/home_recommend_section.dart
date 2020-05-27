import 'package:flutter/material.dart';
import 'package:fluttercartoon/home/home_recommend_item.dart';

class HomeSections extends StatefulWidget {

  @override
  _HomeSectionsState createState() => _HomeSectionsState();
}

class _HomeSectionsState extends State<HomeSections> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              color: Colors.white,
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.print),
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text("强力推荐作品"),
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.arrow_forward),
                  )
                ],
              )),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                childAspectRatio: 1.3),
            itemCount: 4,
            shrinkWrap: true,
            //使当前gridview自适应自己高度，解决GridView inside a Listview causing “Vertical viewport was given unbounded height” even when Expanded
            physics: NeverScrollableScrollPhysics(),
            //使这个GridView不随着外边的listview滚动滚动
            itemBuilder: (context, index) {
              return HomeItem();
            },
          ),
          Container(
            height: 15,
          )
        ],
      ),
    );
//    return CustomScrollView(
//      slivers: <Widget>[
////        SliverAppBar(),
//        SliverGrid(delegate: SliverChildBuilderDelegate((context,index){
//          return Container(child: Text("$index"),);
//        },childCount: 4),),
//      ],
//    );
  }
}
