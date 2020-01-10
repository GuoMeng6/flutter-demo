import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PageCoverPage extends Page<PageCoverState, Map<String, dynamic>> {
  PageCoverPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PageCoverState>(
                adapter: null,
                slots: <String, Dependent<PageCoverState>>{
                }),
            middleware: <Middleware<PageCoverState>>[
              logMiddleware(tag: 'PageCoverPage'),
            ]);

}
