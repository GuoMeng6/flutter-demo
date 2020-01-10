import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../utils/ui.dart';

import 'action.dart';
import 'state.dart';

GlobalKey _bottomNavigationKey = GlobalKey();

Widget buildView(TabState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    bottomNavigationBar: CurvedNavigationBar(
      key: _bottomNavigationKey,
      items: <Widget>[
        Icon(Icons.add,size: 30),
        Icon(Icons.list,size: 30),
        Icon(Icons.compare_arrows,size: 30),
        Icon(Icons.call_split,size: 30),
        Icon(Icons.perm_identity,size: 30)
      ],
      index: 0,
      height: 50,
      color: MyColors.primary,
      buttonBackgroundColor: MyColors.primary,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOutCubic,
      animationDuration: Duration(milliseconds: 500),
      onTap: (index) {
        dispatch(TabActionCreator.onSetPageIndex(index));
      },
    ),
//    body: state.pageList[state.pageIndex],
    body: IndexedStack(
      index: state.pageIndex,
      children: state.pageList,
    ),
  );
}
