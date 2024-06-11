import 'package:hadiths/domain/entitles/hadith_entity.dart';

abstract class HadithRepository {
  Future<List<HadithEntity>> getAllHadiths();
  Future<HadithEntity> getHadithById({required int hadithId});
  Future<List<HadithEntity>> getAllFavoriteHadith();
  Future<void> addRemoveFavorite(
      {required int hadithId, required int favoriteState});
  Future<int> getFavoriteState({required int hadithId});

  Future<void> addHadith({required Map<String, Object?> mapHadith});
  Future<void> changeHadith({required int hadithId, required Map<String, Object?> mapHadith});
  Future<void> removedHadith({required int hadithId});
}
