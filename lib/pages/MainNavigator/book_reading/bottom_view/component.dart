import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class BottomComponent extends Component<BottomState> {
  BottomComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<BottomState>(
                adapter: null,
                slots: <String, Dependent<BottomState>>{
                }),);

}
