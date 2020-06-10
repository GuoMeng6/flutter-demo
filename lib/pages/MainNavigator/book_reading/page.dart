import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class BookReadingPage extends Page<BookReadingState, Map<String, dynamic>> {
  BookReadingPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<BookReadingState>(
                adapter: null,
                slots: <String, Dependent<BookReadingState>>{
                  
                }),
            middleware: <Middleware<BookReadingState>>[
            ],);

}
