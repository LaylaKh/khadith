import 'package:flutter/material.dart';
import 'package:hadiths/core/strings/app_strings.dart';
import 'package:hadiths/presentation/lists/main_hadith_list.dart';

class HadithPage extends StatelessWidget {
  const HadithPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppString.appName),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const MainHadithsList(),
    );
  }
}