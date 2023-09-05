import 'package:flutter/material.dart';

typedef OnSwipeCallback = void Function(SwipeCallbackEventArgs e);

class SwipeCallbackEventArgs {

  final double x;

  final double y;

  const SwipeCallbackEventArgs({
    required this.x,
    required this.y
  });

}

class SwipeDetector extends StatefulWidget {

  final OnSwipeCallback onSwipeUp;
  final OnSwipeCallback onSwipeDown;

  final Widget child;

  const SwipeDetector({
    super.key,
    required this.child,
    required this.onSwipeUp,
    required this.onSwipeDown,
  });

  @override
  createState() => _SwipeDetectorState();

}

class _SwipeDetectorState extends State<SwipeDetector> {

  late DragStartDetails _startVerticalDragDetails;
  late DragUpdateDetails _updateVerticalDragDetails;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (e) {
        _startVerticalDragDetails = e;
      },
      onVerticalDragUpdate: (e) {
        _updateVerticalDragDetails = e;
      },
      onVerticalDragEnd: (e) {
        if (e.primaryVelocity == null) {
          return;
        }

        double dx = _updateVerticalDragDetails.globalPosition.dx
          - _startVerticalDragDetails.globalPosition.dx;

        double dy = _updateVerticalDragDetails.globalPosition.dy
          - _startVerticalDragDetails.globalPosition.dy;

        double velocity = e.primaryVelocity!;

        if (dx < 0) {
          dx = -dx;
        }

        if (dy < 0) {
          dy = -dy;
        }

        if (velocity < 0) {
          widget.onSwipeUp(
            SwipeCallbackEventArgs(x: dx, y: dy)
          );
        } else {
          widget.onSwipeDown(
            SwipeCallbackEventArgs(x: dx, y: dy)
          );
        }
      },
      child: widget.child
    );
  }
}
