// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:hadiths/core/routes/route_names.dart';
import 'package:hadiths/data/model/arguments/hadith_args.dart';
import 'package:hadiths/domain/entitles/hadith_entity.dart';

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
    );
  }
}
