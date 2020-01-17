import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum BookReadingAction { action }

class BookReadingActionCreator {
  static Action onAction() {
    return const Action(BookReadingAction.action);
  }
}
