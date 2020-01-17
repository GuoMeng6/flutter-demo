import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ItemAction { action, onChangeThemeColor }

class ItemActionCreator {
  static Action onAction() {
    return const Action(ItemAction.action);
  }

  static Action onChangeThemeColor(){
    return const Action(ItemAction.onChangeThemeColor);
  }
}
