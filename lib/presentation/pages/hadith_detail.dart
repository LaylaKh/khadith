// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hadiths/core/strings/app_strings.dart';
import 'package:hadiths/core/style/app_styles.dart';
import 'package:hadiths/domain/entitles/hadith_entity.dart';
import '../../data/state/hadith_data_state.dart';
import 'package:provider/provider.dart';


class HadithDetail extends StatelessWidget {
  const HadithDetail({
    super.key,
    required this.hadithId,
  });
  final int hadithId;

 // final HadithUseCase _hadithUseCase = HadithUseCase(HadithsDataRepository());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HadithEntity>(
      future: Provider.of<HadithDataState>(context).fetchHadithById(hadithId: hadithId),
      builder: (BuildContext context, AsyncSnapshot<HadithEntity> snapshot) {

        if (snapshot.hasData) {
          final HadithEntity hadithModel = snapshot.data!;

          return Scaffold(
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
                          },
                          icon: snapshot.data! == 0 
                              ? const Icon(Icons.bookmark_border)
                              : const Icon(Icons.bookmark),
                        );
                      } else {
                        return const SizedBox();
                      }
                    }),
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
