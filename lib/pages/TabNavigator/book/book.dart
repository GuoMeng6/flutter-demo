import 'dart:convert';
import 'dart:ui';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../api/api.dart';
import '../../../local/local-storage.dart';
import '../../../utils/ui.dart';

class BookItem {
  final String id;
  final String name;
  final String intro; // 介绍
  final String book_level;
  final String image;
  final String cover;
  final int is_free;

  BookItem(this.id, this.name, this.intro, this.book_level, this.image,
      this.cover, this.is_free);

  BookItem.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        intro = json['intro'],
        book_level = json['book_level'],
        image = json['image'],
        cover = json['cover'],
        is_free = json['is_free'];

  String toString() {
    return "<BookItem> name: $name, id: $id, intro: $intro, image: $image, "
        "cover: $cover, is_free: $is_free";
  }
}

class Book extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookContainer(),
      backgroundColor: Color(0xFFF9F9FA),
    );
  }
}

class BookContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookContainerState();
  }
}

class BookContainerState extends State<BookContainer> with AutomaticKeepAliveClientMixin{
  final _dataList = <BookItem>[];
  int page = 0;
  int totalCount = 0;
  bool loadAll = false;
  String book_cover;
  bool loading = false; // 是否正在加载图书

  @override
  void initState() {
    super.initState();
    print("======== initState ========");
    getUserInfo();
  }

  @override
  void dispose() {
    super.dispose();
    print("======= dispose ========");
  }

  @override
  bool get wantKeepAlive => true;

  bool onScrollNotification(ScrollNotification notification) {
    if (notification.metrics.extentAfter <= 5 && !loading) {
      if (totalCount <= page * 20) {
        setState(() {
          loadAll = true;
        });
        return true;
      }
      page++;
      getBookShelf(page, 20, 2);
    }
    return true;
  }

  void getUserInfo() async {
    var userInfoJson = await Api.getUserInfo();
    Map<String, dynamic> userRes = json.decode(userInfoJson);
    String msg = userRes['msg'];
    if (msg == 'Success') {
      await LocalStorage.save('token', userRes['result']['token']);
      getBookShelf(1, 20, 2);
    }
  }

  void getBookShelf(int page, int size, int grade) async {
    setState(() {
      loading = true;
    });
    String resJSON = await Api.getBookShelf(page, size, grade);
    Map<String, dynamic> shelfRes = json.decode(resJSON);
    if (shelfRes['msg'] == 'Success') {
      List list = shelfRes['result']['book_list'];
      print('======== listJSON ======== $list');
      List<BookItem> bookList = new List();
      list.forEach((item) => bookList.add(new BookItem.fromJson(item)));
      setState(() {
        book_cover = shelfRes['result']['book_hosts']['book_cover'];
        _dataList.addAll(bookList);
        totalCount = shelfRes['result']['current_level_count'];
        loading = false;
      });
    }
  }

  void _onTab(index) {
    Map<String, dynamic> args = {
      "data": _dataList[index],
    };
    Navigator.of(context).pushNamed("cover", arguments: args);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              alignment: Alignment(0, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    '图书',
                    style: TextStyle(
                        color: Color(0xFF3C3C5C),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    width: 120,
                    height: 40,
                    alignment: Alignment(0, 0),
                    decoration: new BoxDecoration(
                      //背景
                      color: Color(0xFFFFFFFF),
                      //设置四周圆角 角度
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      //设置四周边框
                      border:
                          new Border.all(width: 2, color: Color(0xFFFF9900)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Image.asset(
                          "images/vip.png",
                          width: 20,
                          height: 20,
                        ),
                        new Text("图书会员",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFFF9901),
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    width: 40,
                    height: 40,
                    alignment: Alignment(0, 0),
                    decoration: new BoxDecoration(
                      //背景
                      color: Color(0xFFFFFFFF),
                      //设置四周圆角 角度
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      //设置四周边框
                      border: new Border.all(width: 2, color: MyColors.primary),
                    ),
                    child: new Image.asset(
                      "images/vip.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: onScrollNotification,
                    child: CustomScrollView(
//                      controller: _controller,
                      slivers: <Widget>[
                        SliverGrid.extent(
//                          crossAxisCount: Platform.isMacOS ? 5 : 2,
                          maxCrossAxisExtent: 163.0,
                          childAspectRatio: 0.716,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 10.0,
                          children: _dataList
                              .asMap()
                              .keys
                              .map((index) => BookItemWidget(
                                    book: _dataList[index],
                                    index: index,
                                    coverHost: book_cover,
                                    onTab: this._onTab,
                                  ))
                              .toList(),
                        ),
                        SliverPersistentHeader(
                          pinned: true,
                          floating: true,
                          delegate: MySliverPersistentHeaderDelegate(
                              minHeight: 0,
                              maxHeight: 60,
                              visible: loading,
                              loadAll: loadAll),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.visible,
    @required this.loadAll,
  });

  final double minHeight;
  final double maxHeight;
  final bool visible;
  final bool loadAll;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (!visible && !loadAll) {
      return Container();
    }

    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      width: DeviceInfo.width,
      height: 50,
      color: MyColors.primary,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 20,
              height: 20,
              child: loadAll
                  ? Container()
                  : CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(loadAll ? "人家也是有底线的~" : "正在加载...",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(MySliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        visible != oldDelegate.visible ||
        loadAll != oldDelegate.loadAll;
  }
}

class BookItemWidget extends StatelessWidget {
  final BookItem book;
  final String coverHost;
  final int index;
  final ValueChanged<int> onTab;

  final colors = [
    Color(0xFFFD6363),
    Color(0xFF55C885),
    Color(0xFF3AAFFF),
    Color(0xFFA55FEF),
    Color(0xFF784FFF),
    Color(0xFFFF847C)
  ];

  BookItemWidget({this.book, this.index, this.coverHost, @required this.onTab});

  void _onTab() {
    onTab(index);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTab,
      child: Container(
        decoration: new BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(coverHost + book.cover),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x44000000),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0)
            ]),
        child: Center(
          child: Stack(
            overflow: Overflow.clip,
            children: <Widget>[
              book.is_free == 1
                  ? Positioned(
                      top: 0,
                      right: 0,
                      width: 58,
                      height: 30,
                      child: Container(
                        decoration: new BoxDecoration(
                          color: Color(0xFFFF8811),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: Center(
                          child: Text("免费",
                              style: TextStyle(color: Color(0xFFFFFFFF))),
                        ),
                      ),
                    )
                  : Container(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 105,
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: new BoxDecoration(
                    color: colors[index % 6],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(book.name,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Image.asset("images/not-read.png", width: 20, height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
