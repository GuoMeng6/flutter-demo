import 'package:fish_redux/fish_redux.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_demo4/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart';
import 'action.dart';
import 'state.dart';

Effect<MapState> buildEffect() {
  return combineEffects(<Object, Effect<MapState>>{
    MapAction.action: _onAction,
    Lifecycle.initState: _init,
    MapAction.onMapCreated: _onMapCreated,
  });
}

void _onAction(Action action, Context<MapState> ctx) {}

void _init(Action action, Context<MapState> ctx) async {
  await enableFluttifyLog(false);
  await AmapService.init(
    iosKey: 'ddbbe135c26bd86db68ae47064e0b983',
    androidKey: 'f2ff1a3cefd3cdae6ba6e0ee8647b675',
  );
}

void _onMapCreated(Action action, Context<MapState> ctx) async {
  print("============ effect _onMapCreated ===========");
  ctx.dispatch(MapActionCreator.setController(action.payload));
  bool per = await Utils.checkPermission(PermissionGroup.location);
  if (!per) {
    Toast.show("请开启定位权限", ctx.context);
    return;
  }
  // 定位到当前位置
  AmapController controller = action.payload;
  await controller.showZoomControl(true); // 显示缩放按钮
  await controller.showCompass(true); // 显示指南针
  await controller.showLocateControl(true); // 显示定位
  await controller.showScaleControl(true);
  await controller.showMyLocation(true,
      strokeColor: Colors.blue,
      fillColor: Colors.lightBlueAccent.withOpacity(0.6),
      strokeWidth: 2);
  await controller.setZoomLevel(16);
  await controller.setMapClickedListener(
        (latLng) async {
      print('点击: lat: ${latLng.latitude}, lng: ${latLng.longitude}');
    },
  );
//  Marker marker = await controller.addMarker(MarkerOption(
//    latLng: LatLng(39.919992086530705, 116.5828807079231),
//      widget: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//          Text('使用Widget作为Marker'),
//          FlutterLogo(size: 80),
//        ],
//      ),
//      imageConfig: createLocalImageConfiguration(ctx.context),
//      title: '常营文体',
//      snippet: '嘻嘻哈哈'
//  ));
  await controller.addPolygon(PolygonOption(
    latLngList: [LatLng(39.922058409083675, 116.58363574974788),LatLng(39.92101342747243, 116.58492186894853),LatLng(39.919928316500375, 116.58448332778208)],
    width: 2,
    strokeColor: Colors.blue,
    fillColor: Colors.blue.withOpacity(0.5),
  ));
  Marker marker = await controller.addMarker(MarkerOption(

  ));
}
