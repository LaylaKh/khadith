import 'package:flutter/material.dart';
import 'package:hadiths/core/strings/app_strings.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppString.favorites),
      ),
      body: Container(),
    );
  }
}