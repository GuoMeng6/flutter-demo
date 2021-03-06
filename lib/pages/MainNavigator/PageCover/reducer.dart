import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PageCoverState> buildReducer() {
  return asReducer(
    <Object, Reducer<PageCoverState>>{
      PageCoverAction.action: _onAction,
      PageCoverAction.setBookDetail: _onSetBookDetail,
      PageCoverAction.setLoading: _onSetLoading,
      PageCoverAction.setProgress: _onSetProgress,
    },
  );
}

PageCoverState _onAction(PageCoverState state, Action action) {
  final PageCoverState newState = state.clone();
  return newState;
}

PageCoverState _onSetBookDetail(PageCoverState state, Action action) {
  final PageCoverState newState = state.clone();
  newState.bookDetail = action.payload;
  return newState;
}

PageCoverState _onSetLoading(PageCoverState state, Action action) {
  final PageCoverState newState = state.clone();
  newState.loading = action.payload;
  return newState;
}

PageCoverState _onSetProgress(PageCoverState state, Action action) {
  final PageCoverState newState = state.clone();
  newState.progress = action.payload;
  return newState;
}