import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ListState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter adapter = viewService.buildAdapter();
  print("======== count ====== ${adapter.itemCount}");
  return Scaffold(
      appBar: AppBar(
        title: Text("PageList"),
        backgroundColor: state.themeColor,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("11112222"),
            Expanded(
              flex:1,
              child: ListView.builder(
                itemBuilder: adapter.itemBuilder, //把adapter配置到list
                itemCount: adapter.itemCount, //
              ),
            )
          ],
        ),
      ));
}
