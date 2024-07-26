class GitaModal {
  late int Chapter;
  late List<Verse> Verses;
  late ChapterNameModal chapterName;

  GitaModal(
      {required this.Chapter, required this.Verses, required this.chapterName});

  factory GitaModal.fromjson(Map m1) {
    return GitaModal(
        Chapter: m1['Chapter'],
        Verses: (m1['Verses'] as List)
            .map(
              (e) => Verse.fromjson(e),
        )
            .toList(),
        chapterName: ChapterNameModal.fromjson(m1['ChapterName']));
  }
}

class ChapterNameModal {
  late String Hindi, English, Gujarati, Sanskrit;

  ChapterNameModal(
      {required this.Hindi,
        required this.English,
        required this.Gujarati,
        required this.Sanskrit});

  factory ChapterNameModal.fromjson(Map m1) {
    return ChapterNameModal(
        Hindi: m1['Hindi'],
        English: m1['English'],
        Gujarati: m1['Gujarati'],
        Sanskrit: m1['Sanskrit']);
  }
}

class Verse {
  late int VerseNumber;
  late Language language;

  Verse({required this.VerseNumber, required this.language});

  factory Verse.fromjson(Map m1) {
    return Verse(
        VerseNumber: m1['VerseNumber'],
        language: Language.fromjson(m1['Text']));
  }
}

class Language {
  late String Hindi, English, Gujarati, Sanskrit;

  Language(
      {required this.Hindi,
        required this.English,
        required this.Gujarati,
        required this.Sanskrit});

  factory Language.fromjson(Map m1) {
    return Language(
        Hindi: m1['Hindi'],
        English: m1['English'],
        Gujarati: m1['Gujarati'],
        Sanskrit: m1['Sanskrit']);
  }
}
