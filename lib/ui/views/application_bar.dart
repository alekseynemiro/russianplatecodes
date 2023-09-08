import 'package:flutter/material.dart';

class ApplicationBar extends StatefulWidget implements PreferredSizeWidget {

  final String title;

  const ApplicationBar(
    this.title,
    {
      super.key,
    }
  );

  @override
  createState() => _ApplicationBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}

class _ApplicationBarState extends State<ApplicationBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      leading: TextButton(
        child: Icon(
          Icons.menu,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Text(widget.title),
    );
  }

}
