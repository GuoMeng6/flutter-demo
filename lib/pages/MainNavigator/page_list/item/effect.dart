import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo4/global_store/action.dart';
import 'package:flutter_demo4/global_store/store.dart';
import 'action.dart';
import 'state.dart';

Effect<ItemState> buildEffect() {
  return combineEffects(<Object, Effect<ItemState>>{
    ItemAction.action: _onAction,
    ItemAction.onChangeThemeColor: _onChangeThemeColor,
  });
}

void _onAction(Action action, Context<ItemState> ctx) {
}

void _onChangeThemeColor(Action action, Context<ItemState> ctx) {
  print("======== 1 =========");
  GlobalStore.store.dispatch(GlobalActionCreator.onchangeThemeColor());
}
