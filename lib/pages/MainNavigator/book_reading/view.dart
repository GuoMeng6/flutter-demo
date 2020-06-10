import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo4/utils/utils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_demo4/utils/ui.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    BookReadingState state, Dispatch dispatch, ViewService viewService) {
  print("${Utils.filePath}/book_${state.bookId}/${state.data[0].pdfPic}");
  return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
      ),
      body: Container(
        color: MyColors.primary,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: MyColors.primary2,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "${state.index + 1}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                " / ${state.data.length}",
                                style: TextStyle(
                                    color: MyColors.text3,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Center(
                          child: Image.asset(
                            "images/speed@2x.png",
                            width: 24,
                            height: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Transform.translate(
                            offset: Offset(-5, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFF9F9FA),
                                  border: Border.all(
                                      color: MyColors.primary2, width: 5),
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.zero,
                                      right: Radius.circular(25))),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 20,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Swiper(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.horizontal
                                                (left: Radius.zero, right: Radius
                                                  .circular(25)),
                                              image: DecorationImage(
                                                  image: FileImage(File("${Utils.filePath}/book_${state.bookId}/${state.data[index].pdfPic}"))
                                              )
                                          ),
                                        );
                                      },
                                      itemCount: state.data.length,
                                      loop: false,
                                      onIndexChanged: (int index){
                                        dispatch(BookReadingActionCreator.onIndexChanged(index));
                                      },
                                    ),
                                  ),
                                  Container(),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 120,
                ),
              ],
            ),

          ],
        ),
      ));
}
