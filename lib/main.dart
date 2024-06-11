import 'package:flutter/material.dart';
import 'package:hadiths/core/strings/app_consts.dart';
import 'package:hadiths/presentation/pages/root_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'data/state/hadith_data_state.dart';
import 'presentation/state/main_bottom_bar_state.dart';
import 'presentation/state/settings_state.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(AppConsts.keyMainAppBox);
  runApp(MultiProvider(providers: [
    
        ChangeNotifierProvider(
          create: (_) => SettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => MainBottomBarState(),
        ),
        ChangeNotifierProvider(
          create: (_) => HadithDataState(),
        )
  ],
  child: const RootPage()));
}
