import 'package:flutter/material.dart';
import 'package:hadiths/core/routes/route_names.dart';
import 'package:hadiths/core/strings/app_strings.dart';
import 'package:hadiths/presentation/pages/favorites.page.dart';
import 'package:hadiths/presentation/pages/hadith_page.dart';
import 'package:hadiths/presentation/pages/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../state/main_bottom_bar_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // ignore: unused_field
  final _mainPage = <Widget>[
    const HadithPage(),
    const FavoritesPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    // ignore: unused_local_variable
    final mainBottomBarState = Provider.of<MainBottomBarState>(context);

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: _mainPage[mainBottomBarState.getIndex],
      ),
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: appColors
            .secondary, //цвета выбранной темы (на телефоне или в приложении)
        unselectedItemColor: appColors.secondary,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.format_list_bulleted_outlined),
            title: const Text(
              AppString.hadith,
              style: TextStyle(fontFamily: 'Heuristica'),
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.bookmark_border),
            title: const Text(
              AppString.favorites,
              style: TextStyle(fontFamily: 'Heuristica'),
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text(
              AppString.settings,
              style: TextStyle(fontFamily: 'Heuristica'),
            ),
          ),
        ],
        currentIndex: mainBottomBarState.getIndex,
        onTap: (int index) {
          mainBottomBarState.setIndex = index;
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: appColors.inversePrimary,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.addHadithPage);
        }
      ),
    );
  }
}
