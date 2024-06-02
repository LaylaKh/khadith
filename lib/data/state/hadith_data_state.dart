import 'package:flutter/material.dart';
import 'package:hadiths/domain/entitles/hadith_entity.dart';
import '../../domain/usecases/hadith_use_case.dart';
import '../repositories/hadith_data_repository.dart';

class HadithDataState extends ChangeNotifier {
  final HadithUseCase _hadithUseCase = HadithUseCase(HadithsDataRepository());

  Future<List<HadithEntity>> fetchAllHadith() async {
    return await _hadithUseCase.fetchAllHadith();
  }

  Future<HadithEntity> fetchHadithById({required int hadithId}) async {
    return await _hadithUseCase.fetchHadithById(hadithId: hadithId);
  }

  Future<List<HadithEntity>> fetchFavoriteHadith() async {
    return await _hadithUseCase.fetchFavoriteHadith();
  }

  Future<void> fetchAddRemoveFavorite(
      {required int hadithId, required int favoriteState}) async {
    await _hadithUseCase.fetchAddRemoveHadith(
        hadithId: hadithId, favoriteState: favoriteState);
    notifyListeners();
  }

  Future<int> fetchFavoriteState({required int hadithId}) async {
    final int favoriteState =
        await _hadithUseCase.fetchFavoriteState(hadithId: hadithId);
    return favoriteState;
  }
}
