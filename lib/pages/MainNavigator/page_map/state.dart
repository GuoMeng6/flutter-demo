import 'package:fish_redux/fish_redux.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

class MapState implements Cloneable<MapState> {

  AmapController controller;

  @override
  MapState clone() {
    return MapState()
      ..controller = controller;
  }
}

MapState initState(Map<String, dynamic> args) {
  return MapState();
}
