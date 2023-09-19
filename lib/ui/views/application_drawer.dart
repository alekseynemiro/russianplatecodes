import 'package:flutter/material.dart';

import '../pages/about_page.dart';
import '../pages/dictionary_page.dart';
import '../pages/home_page.dart';

class ApplicationDrawer extends StatelessWidget {

  const ApplicationDrawer({ super.key });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              image: const DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                  'Автомобильные коды регионов России',
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Справочник кодов'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Справочник регионов'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DictionaryPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('О программе...'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

}
