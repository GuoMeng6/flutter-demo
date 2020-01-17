import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<BookReadingState> buildReducer() {
  return asReducer(
    <Object, Reducer<BookReadingState>>{
      BookReadingAction.action: _onAction,
    },
  );
}

BookReadingState _onAction(BookReadingState state, Action action) {
  final BookReadingState newState = state.clone();
  return newState;
}
