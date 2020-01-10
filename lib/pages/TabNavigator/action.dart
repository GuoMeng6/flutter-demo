import 'package:fish_redux/fish_redux.dart';

enum TabAction { action, openCoverPage, setPageIndex }

class TabActionCreator {
  static Action onAction() {
    return const Action(TabAction.action);
  }

  static Action onOpenCoverPage() {
    return const Action(TabAction.openCoverPage);
  }

  static Action onSetPageIndex(int index) {
    return Action(TabAction.setPageIndex, payload: index);
  }
}
