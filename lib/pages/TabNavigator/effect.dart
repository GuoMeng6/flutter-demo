import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<TabState> buildEffect() {
  return combineEffects(<Object, Effect<TabState>>{
    TabAction.action: _onAction,
    Lifecycle.initState: _onInitState,
    TabAction.openCoverPage: _onOpenCoverPage,
  });
}

void _onAction(Action action, Context<TabState> ctx) {
}

void _onInitState(Action action, Context<TabState> ctx) {

}

void _onOpenCoverPage(Action action, Context<TabState> ctx){
  Navigator.of(ctx.context).pushNamed("cover");
}