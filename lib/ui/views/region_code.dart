import 'package:flutter/material.dart';

class RegionCode extends StatelessWidget {

  final String _code;

  const RegionCode(this._code, { super.key });

  @override
  Widget build(BuildContext context) {
    final code = _code;
    final borderSide = BorderSide(
      color: Theme.of(context).colorScheme.outlineVariant,
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 2.0
      ),
      decoration: BoxDecoration(
        border: Border(
          top: borderSide,
          left: borderSide,
          right: borderSide,
          bottom: borderSide,
        ),
        color: Theme.of(context).colorScheme.outline,
      ),
      child: Text(
        code,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.outlineVariant,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        )
      ),
    );
  }

}
