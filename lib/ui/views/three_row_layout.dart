import 'package:flutter/material.dart';

class ThreeRowLayout extends StatelessWidget {

  final Widget? _header;

  final Widget _main;

  final Widget? _footer;

  const ThreeRowLayout(
      this._header,
      this._main,
      this._footer,
      { super.key }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _header != null
          ? Row(
            children: [
              Expanded(
                child: _header!,
              ),
            ],
          )
          : const SizedBox.shrink(),
        Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _main,
                ),
              ],
            )
        ),
        _footer != null
          ? Row(
            children: [
              Expanded(
                child: _footer!,
              ),
            ],
          )
          : SizedBox.shrink(),
      ],
    );
  }

}
