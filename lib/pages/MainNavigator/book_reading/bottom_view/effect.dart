import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<BottomState> buildEffect() {
  return combineEffects(<Object, Effect<BottomState>>{
    BottomAction.action: _onAction,
  });
}

void _onAction(Action action, Context<BottomState> ctx) {
}
