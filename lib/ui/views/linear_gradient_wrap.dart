import 'package:flutter/material.dart';

class LinearGradientWrap extends StatelessWidget {

  final Widget _child;

  const LinearGradientWrap(this._child, { super.key });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _child,
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0,
                1,
              ],
              colors: [
                Theme.of(context).colorScheme.onPrimaryContainer,
                Colors.transparent,
              ],
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                stops: [
                  0,
                  1,
                ],
                colors: [
                  Colors.transparent,
                  Theme.of(context).colorScheme.onPrimaryContainer,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}
