class AyaOfTheday {
  final String? arText;
  final String? enTran;
  final String? surEnName;
  final int? surNumber;

  AyaOfTheday({this.arText, this.enTran, this.surEnName, this.surNumber});

  factory AyaOfTheday.fromJSON(Map<String, dynamic> json) {
    return AyaOfTheday(
        arText: json['data'][0]['text'],
        enTran: json['data'][2]['text'],
        surEnName: json['data'][2]['surah']['englishName'],
        surNumber: json['data'][2]['numberInSurah']);
  }
}
