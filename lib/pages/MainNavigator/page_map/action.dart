import 'package:fish_redux/fish_redux.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

//TODO replace with your own action
enum MapAction { action, onMapCreated, setController }

class MapActionCreator {
  static Action onAction() {
    return const Action(MapAction.action);
  }

  static Action onMapCreated(AmapController controller) {
    return Action(MapAction.onMapCreated, payload: controller);
  }

  static Action setController(AmapController controller) {
    return Action(MapAction.setController, payload: controller);
  }
}
