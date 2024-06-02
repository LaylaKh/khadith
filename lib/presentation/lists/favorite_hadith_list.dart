import 'package:flutter/material.dart';
import 'package:hadiths/data/state/hadith_data_state.dart';
import 'package:hadiths/presentation/items/hadith_item.dart';
import 'package:provider/provider.dart';
import '../../domain/entitles/hadith_entity.dart';

class FavoriteHadithsList extends StatelessWidget {
  const FavoriteHadithsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HadithEntity>>(
      future: Provider.of<HadithDataState>(context).fetchFavoriteHadith(), //передаем список хадисов
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
            child: Text(
              'Избранных хадисов нет',
              style: TextStyle(
              fontSize: 18),
            ),
          );
        }
      },
    );
  }
}
