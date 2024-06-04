// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:hadiths/core/routes/route_names.dart';
import 'package:hadiths/core/strings/app_strings.dart';
import 'package:hadiths/data/model/arguments/hadith_args.dart';
import 'package:hadiths/data/state/hadith_data_state.dart';
import 'package:hadiths/domain/entitles/hadith_entity.dart';
import 'package:provider/provider.dart';

class HadithItem extends StatelessWidget {
  const HadithItem({super.key, required this.hadithModel, required this.index});

  final HadithEntity hadithModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final Color oddColor =
        appColors.primary.withOpacity(0.05); // разделение цвета хадисов
    final Color evenColor = appColors.primary.withOpacity(0.10);
    return ListTile(
      tileColor: index.isOdd ? oddColor : evenColor,
      onTap: () {
        Navigator.pushNamed(
          context,
          RouteNames.hadithDetailPage,
          arguments: HadithArgs(hadithId: hadithModel.id),
        );
      },
      title: Text(
        hadithModel.hadithNumber,
        style: TextStyle(
          color: appColors.secondary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        hadithModel.hadithTitle,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Provider.of<HadithDataState>(context, listen: false)
              .fetchAddRemoveFavorite(
                  hadithId: hadithModel.id,
                  favoriteState: hadithModel.favoriteState == 0 ? 1 : 0);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 350),
              backgroundColor: appColors.secondary,
              content: Text(hadithModel.favoriteState == 0
                  ? AppString.removedFromFavorite
                  : AppString.addedToFavorite,
                  style: const TextStyle(fontSize: 18
                )
              ),
            ),
          );
        },
        icon: hadithModel.favoriteState == 1
            ? const Icon(Icons.bookmark_border)
            : const Icon(Icons.bookmark),
      ),
    );
  }
}
