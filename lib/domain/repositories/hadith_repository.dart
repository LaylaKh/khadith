import 'package:hadiths/domain/entitles/hadith_entity.dart';

abstract class HadithRepository {
  Future<List<HadithEntity>> getAllHadiths();
  Future<HadithEntity> getHadithById({required int hadithId});
  Future<List<HadithEntity>> getAllFavoriteHadith();
  Future<void> addRemoveFavorite({required int hadithId, required int favoriteState});
}
