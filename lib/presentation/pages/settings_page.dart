import 'package:flutter/material.dart';
import 'package:hadiths/core/strings/app_strings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppString.settings),
      ),
      body: Container(),
    );
  }
}