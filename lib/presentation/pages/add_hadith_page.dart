import 'package:flutter/material.dart';
import 'package:hadiths/core/strings/app_strings.dart';
import 'package:hadiths/core/style/app_styles.dart';

class AddHadithPage extends StatefulWidget {
  const AddHadithPage({super.key});

  @override
  State<AddHadithPage> createState() => _AddHadithPageState();
}

class _AddHadithPageState extends State<AddHadithPage> {
  final _hadithNumberController = TextEditingController();
  final _hadithTitleController = TextEditingController();
  final _hadithArabicController = TextEditingController();
  final _hadithTranslationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.addHadith),
      ),
      body:  Padding(
        padding: AppStyles.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _hadithNumberController,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: AppString.enterNumberHadith,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _hadithTitleController,
              decoration: const InputDecoration(
                hintText: AppString.enterTitleHadith,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _hadithArabicController,
              decoration: const InputDecoration(
                hintText: AppString.enterArabicHadith,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _hadithTranslationController,
              decoration: const InputDecoration(
                hintText: AppString.enterTranslationHadith,
              ),
            ),
            const SizedBox(height: 8),
            OutlinedButton(onPressed: (){}, child: const Text(AppString.add),
            ),
          ],
        ),
      ),
    );
  }
}