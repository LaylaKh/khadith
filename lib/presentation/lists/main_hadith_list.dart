import 'package:flutter/material.dart';
import 'package:hadiths/data/state/hadith_data_state.dart';
import 'package:hadiths/domain/entitles/hadith_entity.dart';
import 'package:hadiths/presentation/items/hadith_item.dart';
import 'package:hadiths/presentation/widgets/error_text_data.dart';
import 'package:provider/provider.dart';

class MainHadithsList extends StatelessWidget {
  const MainHadithsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HadithEntity>>(
      future: Provider.of<HadithDataState>(context)
          .fetchAllHadith(), //передаем список хадисов
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Scrollbar(
            child: ListView.builder(
                itemCount: snapshot.data!.lenght,
                itemBuilder: (context, index) {
                  final HadithEntity hadithModel = snapshot.data![index];
                  return HadithItem(hadithModel: hadithModel, index: index);
                }),
          );
        } else if (snapshot.hasError) {
          return ErrorTextData(errorText: snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
