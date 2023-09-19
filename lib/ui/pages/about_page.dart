import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../views/application_bar.dart';
import '../views/application_drawer.dart';

class AboutPage extends StatelessWidget {

  late final Future<PackageInfo> _packageInfoFuture;

  AboutPage({ super.key }) {
    _packageInfoFuture = PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    addBottomIndent(Widget widget) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: widget,
      );
    }

    link(String url, Widget widget) {
      return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: InkWell(
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            child: Center(
              child: SizedBox(
                width: 48,
                height: 48,
                child: widget,
              ),
            ),
          ),
          onTap: () {
            launchUrl(Uri.parse(url));
          },
        ),
      );
    };

    final futureBuilder = FutureBuilder<PackageInfo>(
      future: _packageInfoFuture,
      builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        PackageInfo packageInfo = snapshot.data!;

        final colorFilter = ColorFilter.mode(
          Theme.of(context).colorScheme.onSecondaryContainer,
          BlendMode.srcIn
        );

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                addBottomIndent(
                  const SizedBox(
                    child: Image(
                      image: AssetImage('assets/app_icon.png'),
                      width: 96,
                    ),
                  ),
                ),
                addBottomIndent(Text(packageInfo.appName)),
                addBottomIndent(Text('Версия: ${packageInfo.version}')),
                addBottomIndent(Text('Сборка: ${packageInfo.buildNumber}')),
                addBottomIndent(Divider(color: Theme.of(context).colorScheme.outline)),
                addBottomIndent(const Text('Автор: Алексей Немиро')),
                addBottomIndent(Divider(color: Theme.of(context).colorScheme.outline)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    link(
                      'https://aleksey.nemiro.ru',
                      SvgPicture.asset(
                        'assets/home.svg',
                        colorFilter: colorFilter,
                      )
                    ),
                    link(
                      'https://vk.com/ae_drive',
                      SvgPicture.asset(
                        'assets/vk.svg',
                        colorFilter: colorFilter,
                      )
                    ),
                    link(
                      'https://github.com/alekseynemiro',
                      SvgPicture.asset(
                        'assets/github.svg',
                        colorFilter: colorFilter,
                      )
                    ),
                  ],
                ),
                addBottomIndent(Divider(color: Theme.of(context).colorScheme.outline)),
                addBottomIndent(const Text(
                  'Это свободное программное обеспечение поставляется на условиях лицензии MIT.',
                  textAlign: TextAlign.center
                )),
                addBottomIndent(const Text(
                  'Copyright © 2023 Aleksey Nemiro',
                  textAlign: TextAlign.center
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: InkWell(
                    child: const Text(
                      'Открыть исходный код приложения в GitHub',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dotted,
                      ),
                    ),
                    onTap: () {
                      launchUrl(Uri.parse('https://github.com/alekseynemiro/russianplatecodes'));
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );

    return Scaffold(
      appBar: const ApplicationBar('О программе...'),
      drawer: const ApplicationDrawer(),
      body: futureBuilder,
    );
  }

}
