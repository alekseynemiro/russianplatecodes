import 'package:flutter/material.dart';

class RegionSearch extends StatefulWidget {

  final String? filter;

  final ValueChanged<String>? onChanged;

  const RegionSearch({
    super.key,
    this.filter,
    this.onChanged,
  });

  @override
  createState() => _RegionSearchState();

}

class _RegionSearchState extends State<RegionSearch> {

  final _controller = TextEditingController();

  @override
  void didUpdateWidget(covariant RegionSearch oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.filter != widget.filter) {
      _controller.text = widget.filter ?? '';
    }
  }

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
          controller: _controller,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          decoration: InputDecoration(
            hintText: 'Начните вводить код или название региона',
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
              fontWeight: FontWeight.normal,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _controller.clear();
                widget.onChanged!('');
              },
            ),
          ),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }

}
