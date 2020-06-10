import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<BookReadingState> buildReducer() {
  return asReducer(
    <Object, Reducer<BookReadingState>>{
      BookReadingAction.action: _onAction,
      BookReadingAction.onIndexChanged: _onIndexChanged,
    },
  );
}

BookReadingState _onAction(BookReadingState state, Action action) {
  final BookReadingState newState = state.clone();
  return newState;
}

BookReadingState _onIndexChanged(BookReadingState state, Action action) {
  final BookReadingState newState = state.clone();
  newState.index = action.payload;
  return newState;
}