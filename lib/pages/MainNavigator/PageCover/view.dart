import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../../components/app_loading.dart';
import '../../../models/book_detail.dart';
import '../../../utils/ui.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    PageCoverState state, Dispatch dispatch, ViewService viewService) {
  BookDetail bookDetail = state.bookDetail ??= null;
  if (bookDetail == null) {
    return Container(
      width: 0,
    );
  }

  String imgUrl =
      "${bookDetail?.bookHosts?.bookCover}${bookDetail?.book?.cover}";
  List<String> topicArr = bookDetail.book.keywords.split("，");
  return Scaffold(
    appBar: AppBar(
      backgroundColor: MyColors.primary,
      elevation: 0,
    ),
    body: AppLoading(
        inAsyncCall: state.loading,
        progress: state.progress,
        child: Container(
          color: MyColors.primary,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 80,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 260,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "单词数",
                                        style: TextStyle(
                                            color: MyColors.text2,
                                            fontSize: 12),
                                      ),
                                      Container(height: 10),
                                      Text("${bookDetail?.book?.wordCount}",
                                          style: TextStyle(
                                              color: MyColors.text1,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 48,
                                  color: MyColors.text4,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "页数",
                                        style: TextStyle(
                                            color: MyColors.text2,
                                            fontSize: 12),
                                      ),
                                      Container(height: 10),
                                      Text("${bookDetail?.book?.pageCount}",
                                          style: TextStyle(
                                              color: MyColors.text1,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 48,
                                  color: MyColors.text4,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "阅读人数",
                                        style: TextStyle(
                                            color: MyColors.text2,
                                            fontSize: 12),
                                      ),
                                      Container(height: 10),
                                      Text("886",
                                          style: TextStyle(
                                              color: MyColors.text1,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              flex: 1,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                      child: Text(
                                        "${bookDetail?.book?.intro}",
                                        style: TextStyle(
                                            color: MyColors.text1,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                      child: Wrap(
                                        spacing: 10,
                                        runSpacing: 0,
                                        direction: Axis.horizontal,
                                        children: topicArr
                                            .asMap()
                                            .keys
                                            .map((index) => FlatButton(
                                                  color: state.colors[index % 1]
                                                      [1],
                                                  highlightColor: state
                                                      .colors[index % 1][1],
                                                  colorBrightness:
                                                      Brightness.dark,
                                                  splashColor: Colors.grey,
                                                  child: Text(topicArr[index]),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  onPressed: () {},
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 60),
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 60,
                              child: RaisedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      "images/read@2x.png",
                                      width: 32,
                                      height: 32,
                                    ),
                                    Container(width: 10),
                                    Text(
                                      "读书",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                color: Color(0xFF3AAFFF),
                                highlightColor: Colors.blue[700],
                                splashColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {
                                  dispatch(PageCoverActionCreator.onPressRead(bookDetail));
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 60,
                              child: RaisedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/practise@2x.png",
                                        width: 32, height: 32),
                                    Container(width: 10),
                                    Text(
                                      "练习",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                color: Color(0xFFFF8811),
                                highlightColor: Colors.blue[700],
                                splashColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {},
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 200,
                    height: 280,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage("$imgUrl"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    ),
  );
}
