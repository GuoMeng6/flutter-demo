import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_demo4/pages/MainNavigator/page_list/item/state.dart';
import 'action.dart';
import 'state.dart';

Effect<ListState> buildEffect() {
  return combineEffects(<Object, Effect<ListState>>{
    ListAction.action: _onAction,
    Lifecycle.initState: _initState,
  });
}

void _onAction(Action action, Context<ListState> ctx) {}

void _initState(Action action, Context<ListState> ctx) {
  List<ItemState> list = [];
  for (int i = 0; i < 20; i++) {
    list.add(ItemState(
        type: i % 2 == 0 ? 1 : 0, title: "xixi", content: "hehehehe$i"));
  }
  ctx.dispatch(ListActionCreator.initList(list));
}
