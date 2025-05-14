import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/main_screen/main_screen.dart';
import 'common/configs/theme_config.dart';
import 'common/providers/theme_provider.dart';
import 'common/constants/base_constants.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const QuoraCloneApp(),
    ),
  );
}

class QuoraCloneApp extends StatelessWidget {
  const QuoraCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: BaseInfo.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeConfig.getTheme(themeProvider.isDarkMode),
          home: const MainScreen(),
        );
      },
    );
  }
}
