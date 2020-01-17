import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<BookReadingState> buildEffect() {
  return combineEffects(<Object, Effect<BookReadingState>>{
    BookReadingAction.action: _onAction,
  });
}

void _onAction(Action action, Context<BookReadingState> ctx) {
}
