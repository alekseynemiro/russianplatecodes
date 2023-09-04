import 'package:flutter/material.dart';

class RegionSearch extends StatefulWidget {

  const RegionSearch({ super.key });

  @override
  createState() => _RegionSearchState();

}

class _RegionSearchState extends State<RegionSearch> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 8,
        ),
        child: TextField(
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          decoration: InputDecoration(
            hintText: 'Начните вводить код или название региона',
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

}
