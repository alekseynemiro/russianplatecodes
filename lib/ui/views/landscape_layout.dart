import 'package:flutter/material.dart';

class LandscapeLayout extends StatelessWidget {

  final Widget left;

  final Widget right;

  const LandscapeLayout({
    super.key,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: left,
        ),
        Expanded(
          child: right,
        ),
      ],
    );
  }

}
