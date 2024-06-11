// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hadiths/core/strings/app_strings.dart';
import 'package:hadiths/core/style/app_styles.dart';
import 'package:hadiths/domain/entitles/hadith_entity.dart';
import 'package:hadiths/presentation/state/settings_state.dart';
import 'package:hadiths/presentation/widgets/html_text_data.dart';
import '../../data/state/hadith_data_state.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class HadithDetail extends StatelessWidget {
  const HadithDetail({
    super.key,
    required this.hadithId,
  });
  final int hadithId;

  // final HadithUseCase _hadithUseCase = HadithUseCase(HadithsDataRepository());
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsState>(context);

    return FutureBuilder<HadithEntity>(
      future: Provider.of<HadithDataState>(context)
          .fetchHadithById(hadithId: hadithId),
      builder: (BuildContext context, AsyncSnapshot<HadithEntity> snapshot) {
        if (snapshot.hasData) {
          final HadithEntity hadithModel = snapshot.data!;

          return SelectableRegion(
            focusNode: FocusNode(),
            selectionControls: Platform.isAndroid
                ? MaterialTextSelectionControls()
                : CupertinoTextSelectionControls(),
            child: Scaffold(
              appBar: AppBar(
                title: Text(hadithModel.hadithNumber),
                actions: [
                  FutureBuilder<int>(
                    future: Provider.of<HadithDataState>(context)
                        .fetchFavoriteState(hadithId: hadithModel.id),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // ignore: unused_local_variable
                        final int favoriteState = snapshot.data!;
                        return IconButton(
                          onPressed: () {
                            Provider.of<HadithDataState>(context, listen: false)
                                .fetchAddRemoveFavorite(
                                    hadithId: hadithModel.id,
                                    favoriteState:
                                        hadithModel.favoriteState == 0 ? 1 : 0);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(milliseconds: 350),
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                content: Text(
                                  hadithModel.favoriteState == 0
                                      ? AppString.removedFromFavorite
                                      : AppString.addedToFavorite,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            );
                          },
                          icon: snapshot.data! == 0
                              ? const Icon(Icons.bookmark_border)
                              : const Icon(Icons.bookmark),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
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
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      HtmlTextData(
                          textData: hadithModel.hadithArabic,
                          fontSize: AppStyles.textSizes[settings.getTextSize],
                          fontFamily: 'Uthmanic',
                          textDirection: TextDirection.rtl),
                      HtmlTextData(
                          textData: hadithModel.hadithTranslation,
                          fontSize: AppStyles.textSizes[settings.getTextSize],
                          fontFamily: 'Heuristica',
                          textDirection: TextDirection.ltr),
                    ],
                  ),
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
