extension IntegerExtension on int? {
  bool isSuccessStatusCode() {
    return this == null ? false : (this! >= 200 && this! < 300);
  }
}
