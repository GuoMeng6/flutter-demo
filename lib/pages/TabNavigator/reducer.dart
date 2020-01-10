import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TabState> buildReducer() {
  return asReducer(
    <Object, Reducer<TabState>>{
      TabAction.action: _onAction,
      TabAction.setPageIndex: _onSetPageIndex,
    },
  );
}

TabState _onAction(TabState state, Action action) {
  final TabState newState = state.clone();
  return newState;
}

TabState _onSetPageIndex(TabState state, Action action) {
  final int pageIndex = action.payload ?? 0;
  final TabState newState = state.clone();
  newState.pageIndex = pageIndex;
  return newState;
}