import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MapPage extends Page<MapState, Map<String, dynamic>> {
  MapPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MapState>(
                adapter: null,
                slots: <String, Dependent<MapState>>{
                }),
            middleware: <Middleware<MapState>>[
            ],);

}
