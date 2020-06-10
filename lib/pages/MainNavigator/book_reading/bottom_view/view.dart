import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(BottomState state, Dispatch dispatch, ViewService viewService) {
  return Positioned(
    bottom: 60,
    height: 120,
    child: Container(
      color: Colors.green,
    ),
  );
}
