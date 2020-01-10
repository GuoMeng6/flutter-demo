import 'package:fish_redux/fish_redux.dart';

import 'package:flutter/material.dart';
import 'dart:ui';
import '../../../models/book_detail.dart';
import '../../TabNavigator/book/book.dart';

class PageCoverState implements Cloneable<PageCoverState> {

  BookItem bookItem;
  BookDetail bookDetail;
  bool loading = false; // 是否正在请求图书详情
  List<List<Color>> colors = [[Color(0xFFD7EFFF),Color(0xFF3AAFFF)]];

  @override
  PageCoverState clone() {
    return PageCoverState()
      ..loading = loading
      ..bookDetail = bookDetail
      ..colors = colors
      ..bookItem = bookItem;
  }
}

PageCoverState initState(Map<String, dynamic> args) {
  final PageCoverState state = PageCoverState().clone();
  state.bookItem = args["data"];
  return state;
}
