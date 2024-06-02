import 'package:flutter/material.dart';
import 'package:hadiths/core/routes/app_routes.dart';
import 'package:hadiths/core/themes/app_theme.dart';
import 'package:hadiths/data/state/hadith_data_state.dart';
import 'package:hadiths/presentation/state/main_bottom_bar_state.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';


class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainBottomBarState(),
        ),
        ChangeNotifierProvider(
          create: (_) => HadithDataState(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkhtTheme,
        onGenerateRoute: AppRoutes.onGeneratorRoute,
        home: const MainPage(),
      ),
    );
  }
}
