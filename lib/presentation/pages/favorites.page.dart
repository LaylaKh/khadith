import 'package:flutter/material.dart';
import 'package:hadiths/core/strings/app_strings.dart';
import 'package:hadiths/presentation/lists/favorite_hadith_list.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppString.favorites),
      ),
      body: const FavoriteHadithsList(),
    );
  }
}