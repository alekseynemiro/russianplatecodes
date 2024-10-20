import 'package:flutter/material.dart';

import 'ui/pages/home_page.dart';

class App extends StatelessWidget {

  const App({ super.key });

  @override
  Widget build(BuildContext context) {
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF001D32),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFCDE5FF),
      onPrimaryContainer: Color(0xFF001D32),
      secondary: Color(0xFF51606F),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFD4E4F6),
      onSecondaryContainer: Color(0xFF0D1D2A),
      tertiary: Color(0xFF67587A),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFEDDCFF),
      onTertiaryContainer: Color(0xFF221533),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410002),
      surface: Color(0xFFFCFCFF),
      onSurface: Color(0xFF1A1C1E),
      surfaceContainerHighest: Color(0xFFDEE3EB),
      onSurfaceVariant: Color(0xFF42474E),
      outline: Color(0xFF72787E),
      onInverseSurface: Color(0xFFF0F0F4),
      inverseSurface: Color(0xFF2F3033),
      inversePrimary: Color(0xFF006398),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF006398),
      outlineVariant: Color(0xFFC2C7CE),
      scrim: Color(0xFF000000),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryIconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
        colorScheme: colorScheme,
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            color: Color(0xFF42474E),
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF42474E),
          ),
          bodyLarge: TextStyle(
            color: Color(0xFF42474E),
          ),
          headlineSmall: TextStyle(
            color: Color(0xFF42474E),
          ),
          headlineMedium: TextStyle(
            color: Color(0xFF42474E),
          ),
          headlineLarge: TextStyle(
            color: Color(0xFF42474E),
          ),
          titleLarge: TextStyle(
            color: Color(0xFF42474E),
          ),
          titleMedium: TextStyle(
            color: Color(0xFF42474E),
          ),
          titleSmall: TextStyle(
            color: Color(0xFF42474E),
          ),
        ),
        listTileTheme: ListTileThemeData(
          textColor: colorScheme.onPrimary,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }

}
