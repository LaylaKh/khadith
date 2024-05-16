import 'package:flutter/material.dart';
import 'package:hadiths/core/themes/app_theme.dart';
import 'package:hadiths/presentation/state/main_bottom_bar_state.dart';
import 'main_page.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainBottomBarState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkhtTheme,
        home: const MainPage(),
      ),
    );
  }
}
