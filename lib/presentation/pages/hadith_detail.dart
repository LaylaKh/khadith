// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hadiths/core/strings/app_strings.dart';
import 'package:hadiths/core/style/app_styles.dart';
import 'package:hadiths/data/repositories/hadith_data_repository.dart';
import 'package:hadiths/domain/entitles/hadith_entity.dart';
import 'package:hadiths/domain/usecases/hadith_use_case.dart';

class HadithDetail extends StatefulWidget {
  const HadithDetail({
    super.key,
    required this.hadithId,
  });
  final int hadithId;

  @override
  State<HadithDetail> createState() => _HadithDetailState();
}

class _HadithDetailState extends State<HadithDetail> {
  final HadithUseCase _hadithUseCase = HadithUseCase(HadithsDataRepository());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HadithEntity>(
      future: _hadithUseCase.fetchHadithById(hadithId: widget.hadithId),
      builder: (BuildContext context, AsyncSnapshot<HadithEntity> snapshot) {
        final HadithEntity hadithModel = snapshot.data!;
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(hadithModel.hadithNumber),
            ),
            body: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      margin: AppStyles.mainMarginMini,
                      child: Padding(
                        padding: AppStyles.mainPaddingMini,
                        child: Text(
                        hadithModel.hadithTitle,
                        style: const TextStyle(
                          fontSize: 18
                        ),
                        textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Html(data: hadithModel.hadithArabic),
                    Html(data: hadithModel.hadithTranslation),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text(AppString.error),
            ),
            body: const Center(
              child: Text(AppString.errorGetData),
            ),
          );
        }
      },
    );
  }
}
