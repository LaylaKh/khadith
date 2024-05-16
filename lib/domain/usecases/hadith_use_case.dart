import 'package:hadiths/domain/entitles/hadith_entity.dart';
import '../repositories/hadith_repository.dart';


class HadithUseCase{
  // ignore: unused_field
  final HadithRepository _hadithRepository;
  HadithUseCase(this._hadithRepository);
  Future<List<HadithEntity>> fetchAllHadith() async {
    try {
      final List<HadithEntity> getAllHadith = await _hadithRepository.getAllHadiths();
      return getAllHadith;
    } catch(e) {
      throw Exception('Ошибка при получении всех хадисов:\n\n$e');
    }
  }
  Future<HadithEntity> fetchHadithById({required int hadithId}) async {
    try {
      final HadithEntity getHadithById = await _hadithRepository.getHadithById(hadithId: hadithId);
      return getHadithById;
    } catch (e) {
      throw Exception('Ошибка при получении хадиса по id:\n\n$e');
    }
  }
}