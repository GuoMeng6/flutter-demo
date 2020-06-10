import 'package:fish_redux/fish_redux.dart';

class BottomState implements Cloneable<BottomState> {



  @override
  BottomState clone() {
    return BottomState();
  }
}

BottomState initState(Map<String, dynamic> args) {
  return BottomState();
}
