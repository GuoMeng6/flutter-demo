import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<BottomState> buildReducer() {
  return asReducer(
    <Object, Reducer<BottomState>>{
      BottomAction.action: _onAction,
    },
  );
}

BottomState _onAction(BottomState state, Action action) {
  final BottomState newState = state.clone();
  return newState;
}
