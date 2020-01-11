import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<TabState> buildEffect() {
  return combineEffects(<Object, Effect<TabState>>{
    TabAction.action: _onAction,
    Lifecycle.initState: _onInitState,
    TabAction.openCoverPage: _onOpenCoverPage,
  });
}

void _onAction(Action action, Context<TabState> ctx) {
}

void _onInitState(Action action, Context<TabState> ctx) async{
  const platform = const MethodChannel('samples.flutter.io/battery');
  try {
    final int result = await platform.invokeMethod('getBatteryLevel');
    print("========= result ========= $result");
  } on PlatformException catch (e) {
    print("=========== Failed to get battery level: '${e.message}'.");
  }

}

void _onOpenCoverPage(Action action, Context<TabState> ctx){
  Navigator.of(ctx.context).pushNamed("cover");
}