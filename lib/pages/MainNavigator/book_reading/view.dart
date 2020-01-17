import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(BookReadingState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: null,
    body: Container(
      color: Colors.yellow,
    ),
  );
}
