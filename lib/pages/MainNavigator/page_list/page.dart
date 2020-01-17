import 'package:fish_redux/fish_redux.dart' hide ListAdapter;
import 'package:flutter_demo4/pages/MainNavigator/page_list/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ListPage extends Page<ListState, Map<String, dynamic>> {
  ListPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ListState>(
                adapter: NoneConn<ListState>() + ListAdapter(),
                slots: <String, Dependent<ListState>>{
                }),
            middleware: <Middleware<ListState>>[
            ],);

}
