import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum BookReadingAction { action, onIndexChanged }

class BookReadingActionCreator {
  static Action onAction() {
    return const Action(BookReadingAction.action);
  }

  static Action onIndexChanged(int index) {
    return Action(BookReadingAction.onIndexChanged, payload: index);
  }
}
