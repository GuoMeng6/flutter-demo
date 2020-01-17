import 'dart:ui';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo4/global_store/state.dart';
import 'package:flutter_demo4/pages/MainNavigator/page_list/item/state.dart';

class ListState implements Cloneable<ListState>, GlobalBaseState {

  List<ItemState> items;

  @override
  Color themeColor;

  @override
  ListState clone() {
    return ListState()
      ..items = items
      ..themeColor = themeColor;
  }
}

ListState initState(Map<String, dynamic> args) {
  return ListState();
}
