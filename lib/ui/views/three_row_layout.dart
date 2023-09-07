import 'package:flutter/material.dart';

class ThreeRowLayout extends StatelessWidget {

  final Widget? header;

  final Widget main;

  final Widget? footer;

  const ThreeRowLayout({
    super.key,
    this.header,
    this.footer,
    required this.main,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        header != null
          ? Row(
            children: [
              Expanded(
                child: header!,
              ),
            ],
          )
          : const SizedBox.shrink(),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: main,
              ),
            ],
          )
        ),
        footer != null
          ? Row(
            children: [
              Expanded(
                child: footer!,
              ),
            ],
          )
          : const SizedBox.shrink(),
      ],
    );
  }

}
