import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ListState> buildReducer() {
  return asReducer(
    <Object, Reducer<ListState>>{
      ListAction.action: _onAction,
      ListAction.initList: _initList,
    },
  );
}

ListState _onAction(ListState state, Action action) {
  final ListState newState = state.clone();
  return newState;
}


ListState _initList(ListState state, Action action) {
  final ListState newState = state.clone();
  newState.items = action.payload;
  return newState;
}