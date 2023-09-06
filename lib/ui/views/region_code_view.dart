import 'package:flutter/material.dart';

class RegionCodeView extends StatelessWidget {

  final String code;
  final RegionCodeViewBrightness brightness;

  const RegionCodeView(
    {
      super.key,
      required this.code,
      required this.brightness,
    }
  );

  @override
  Widget build(BuildContext context) {
    if (brightness == RegionCodeViewBrightness.light) {
      return _light(context);
    } else {
      return _dark(context);
    }
  }

  Widget _dark(BuildContext context) {
    final borderSide = BorderSide(
      color: Theme.of(context).colorScheme.outlineVariant,
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 2.0,
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
        ),
      ),
    );
  }

  Widget _light(BuildContext context) {
    final borderSide = BorderSide(
      color: Theme.of(context).colorScheme.outlineVariant,
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 2.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: borderSide,
          left: borderSide,
          right: borderSide,
          bottom: borderSide,
        ),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Text(
        code,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

}

enum RegionCodeViewBrightness {
  dark,
  light,
}
