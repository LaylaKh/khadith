// ignore_for_file: public_member_api_docs, sort_constructors_first
class HadithModel {
  final int id;
  final String hadithNumber;
  final String hadithTitle;
  final String hadithArabic;
  final String hadithTranslation;
  final String nameAudio;
  final int favoriteState;
  
  HadithModel({
    required this.id,
    required this.hadithNumber,
    required this.hadithTitle,
    required this.hadithArabic,
    required this.hadithTranslation,
    required this.nameAudio,
    required this.favoriteState,
  });
  factory HadithModel.fromMap(Map<String, dynamic> map) {
    return HadithModel(
      id: map['id'] as int,
      hadithNumber: map['hadith_number'] as String,
      hadithTitle: map['hadith_title'] as String,
      hadithArabic: map['hadith_arabic'] as String,
      hadithTranslation: map['hadith_translation'] as String,
      nameAudio: map['name_audio'] as String,
      favoriteState: map['favorite_state'] as int,
    );
  }
}
