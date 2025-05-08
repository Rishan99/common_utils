extension FileExtension on String {
  String get getFileName => split('/').last.split('.').first;
  String get getFileExtension => split('/').last.split('.').last;
  String get getFileNameWithExtension => split('/').last;
  String get getUniqueNameForFile => DateTime.now().toIso8601String().replaceAll('-', '').replaceAll(':', '').replaceAll('.', '');
  bool get isNetworkFile => contains('http');
  bool get isAssetFile => contains('asset');
}
