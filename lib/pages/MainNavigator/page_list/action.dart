import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo4/pages/MainNavigator/page_list/item/state.dart';

//TODO replace with your own action
enum ListAction { action, initList }

class ListActionCreator {
  static Action onAction() {
    return const Action(ListAction.action);
  }

  static Action initList(List<ItemState> items) {
    return Action(ListAction.initList, payload: items);
  }
}
