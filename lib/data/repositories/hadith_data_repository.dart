import 'package:hadiths/data/model/hadith.model.dart';
import 'package:hadiths/data/services/local/database_service.dart';
import 'package:hadiths/domain/entitles/hadith_entity.dart';
import 'package:hadiths/domain/repositories/hadith_repository.dart';
import 'package:sqflite/sqflite.dart';

class HadithsDataRepository implements HadithRepository {
  final DatabaseService _databaseService = DatabaseService();
  final String _tableName = 'Table_of_hadith';

  @override
  Future<List<HadithEntity>> getAllHadiths() async {
    // возвращает список всех наших хадисов
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources =
        await database.query(_tableName);
    final List<HadithEntity> allHadiths = resources.isNotEmpty
        ? resources.map((e) => _entity(HadithModel.fromMap(e))).toList()
        : []; //если их нет, возвращает пустой список
    return allHadiths;
  }

  @override
  Future<HadithEntity> getHadithById({required int hadithId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resource =
        await database.query(_tableName, where: 'id = $hadithId');
    final HadithEntity? hadithById = resource.isNotEmpty
        ? _entity(HadithModel.fromMap(resource.first))
        : null;
    return hadithById!;
  }

  @override
  Future<List<HadithEntity>> getAllFavoriteHadith() async {
    //список возвращает только избранне хадисы
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resource =
        await database.query(_tableName, where: 'favorite_state = 1');
    final List<HadithEntity> favoriteHadiths = resource.isNotEmpty
        ? resource.map((e) => _entity(HadithModel.fromMap(e))).toList()
        : [];
    return favoriteHadiths;
  }

  @override
  Future<void> addRemoveFavorite(
      {required int hadithId, required int favoriteState}) async {
    final Database database = await _databaseService.db;
    final Map<String, int> favorite = {'favorite_state': favoriteState};
    await database.update(_tableName, where: 'id = $hadithId', favorite);
  }

  @override
  Future<int> getFavoriteState({required int hadithId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resource = await database.query(_tableName,
        where: 'id = $hadithId', columns: ['favorite_state']);
    final int favoriteState = resource.first['favorite_state'] as int;
    return favoriteState;
  }

  HadithEntity _entity(HadithModel model) {
    return HadithEntity(
      id: model.id,
      hadithNumber: model.hadithNumber,
      hadithTitle: model.hadithTitle,
      hadithArabic: model.hadithArabic,
      hadithTranslation: model.hadithTranslation,
      nameAudio: model.nameAudio,
      favoriteState: model.favoriteState,
    );
  }
}
