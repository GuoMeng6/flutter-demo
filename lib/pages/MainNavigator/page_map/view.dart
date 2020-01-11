import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MapState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("地图"),
      backgroundColor: Colors.blue,
    ),
    body: Container(
      child: AmapView(
        showZoomControl: false,
        maskDelay: Duration(milliseconds: 500),
        onMapCreated: (controller) {
          return dispatch(MapActionCreator.onMapCreated(controller));
        },
      ),
    ),
  );
}
