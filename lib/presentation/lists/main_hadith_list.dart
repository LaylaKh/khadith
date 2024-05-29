import 'package:flutter/material.dart';
import 'package:hadiths/data/repositories/hadith_data_repository.dart';
import 'package:hadiths/domain/entitles/hadith_entity.dart';
import 'package:hadiths/domain/usecases/hadith_use_case.dart';
import 'package:hadiths/presentation/items/hadith_item.dart';

class MainHadithsList extends StatefulWidget {
  const MainHadithsList({super.key});

  @override
  State<MainHadithsList> createState() => _MainHadithsListState();
}

class _MainHadithsListState extends State<MainHadithsList> {
  final HadithUseCase _hadithUseCase = HadithUseCase(HadithsDataRepository());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HadithEntity>>(
      future: _hadithUseCase.fetchAllHadith(), //передаем список хадисов
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Scrollbar(
            child: ListView.builder(
              itemCount: snapshot.data!.lenght,
              itemBuilder: (context, index){
                final HadithEntity hadithModel = snapshot.data![index];
                return HadithItem(hadithModel: hadithModel, index: index);
            }
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
