extension StringTitleExtension on String {
  String get toTitle => split(' ')
      .map((str) => '${str[0].toUpperCase()}${str.substring(1)}')
      .join(' ');
}

extension StringFirst on String {
  String get first => split(' ').first;
}
