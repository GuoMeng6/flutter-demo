import 'package:flutter/widgets.dart' hide Action;
import 'package:fish_redux/fish_redux.dart';
import './book/book.dart';
import './learn/learn.dart';

class TabState implements Cloneable<TabState> {
  List<Widget> pageList = [
    new Book(),
    new Learn(),
    new Learn(),
    new Learn(),
    new Learn()
  ];
  int pageIndex = 0;

  @override
  TabState clone() {
    return TabState()
      ..pageList = pageList
      ..pageIndex = pageIndex;
  }
}

TabState initState(Map<String, dynamic> args) {
  return TabState();
}
