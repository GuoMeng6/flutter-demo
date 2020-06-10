import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum BottomAction { action }

class BottomActionCreator {
  static Action onAction() {
    return const Action(BottomAction.action);
  }
}
