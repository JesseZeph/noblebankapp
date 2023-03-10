extension NumCommaExtension on num {
  String get addComma {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String mathFunc(Match match) => "${match[1]},";
    return toString().replaceAllMapped(reg, mathFunc);
  }
}
