class Hadith {
  final int number;
  final String arab;
  final String translation;

  Hadith({
    required this.number,
    required this.arab,
    required this.translation,
  });

  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      number: json['number'],
      arab: json['arab'],
      translation: json['id'],
    );
  }
}
