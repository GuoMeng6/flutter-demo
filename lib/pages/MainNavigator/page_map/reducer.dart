import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MapState> buildReducer() {
  return asReducer(
    <Object, Reducer<MapState>>{
      MapAction.action: _onAction,
      MapAction.setController: _onSetController,
    },
  );
}

MapState _onAction(MapState state, Action action) {
  final MapState newState = state.clone();
  return newState;
}

MapState _onSetController(MapState state, Action action) {
  print("========== reducer _onSetController ========== ");
  final MapState newState = state.clone();
  newState.controller = action.payload;
  return newState;
}