import 'package:flutter/material.dart';
import 'package:hadiths/data/model/arguments/hadith_args.dart';
import '../../presentation/pages/hadith_detail.dart';
import 'route_names.dart';

class AppRoutes {
  static Route onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.hadithDetailPage:
        final HadithArgs hadithArgs = routeSettings.arguments as HadithArgs;
        return MaterialPageRoute(
          builder: (_) =>  HadithDetail(hadithId: hadithArgs.hadithId,
          ),
        );
      default:
        throw Exception('Invalid route\n${routeSettings.name}');
    }
  }
}
