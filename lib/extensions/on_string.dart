extension StringExtension on String {
  String get toTitle => split(' ')
      .map((str) => '${str[0].toUpperCase()}${str.substring(1)}')
      .join(' ');

  String get first => split(' ').first;

  String get addNairaSymbol => '₦ $this';
}
