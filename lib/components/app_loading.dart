import 'package:flutter/material.dart';

import '../utils/ui.dart';

///
/// Wrap around any widget that makes an async call to show a modal progress
/// indicator while the async call is in progress.
///
/// The progress indicator can be turned on or off using [inAsyncCall]
///
/// The progress indicator defaults to a [CircularProgressIndicator] but can be
/// any kind of widget
///
/// The progress indicator can be positioned using [offset] otherwise it is
/// centered
///
/// The modal barrier can be dismissed using [dismissible]
///
/// The color of the modal barrier can be set using [color]
///
/// The opacity of the modal barrier can be set using [opacity]
///
/// HUD=Heads Up Display
///
class AppLoading extends StatelessWidget {
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset offset;
  final bool dismissible;
  final Widget child;
  final double progress;

  AppLoading({
    Key key,
    @required this.inAsyncCall,
    this.opacity = 0.5,
    this.color = Colors.grey,
    this.progressIndicator =
        const CircularProgressIndicator(backgroundColor: Colors.white),
    this.offset,
    this.dismissible = false,
    this.progress = 0,
    @required this.child,
  })  : assert(child != null),
        assert(inAsyncCall != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (inAsyncCall) {
      Widget layOutProgressIndicator = Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0x66000000),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(backgroundColor: Colors.white,
                  value: progress > 0 ? progress/100 : null),
                progress > 0
                    ? Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          "$progress%",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )
                    : Container(height: 0),
              ],
            ),
          ),
        ),
      );
//      if (offset == null)
//        layOutProgressIndicator = Center(child: progressIndicator);
//      else {
//        layOutProgressIndicator = Positioned(
//          child: progressIndicator,
//          left: offset.dx,
//          top: offset.dy,
//        );
//      }
      final modal = [
//        new Opacity(
//          child: new ModalBarrier(dismissible: dismissible, color: color),
//          opacity: opacity,
//        ),
        layOutProgressIndicator
      ];

      widgetList += modal;
    }
    return new Stack(
      children: widgetList,
    );
  }
}
