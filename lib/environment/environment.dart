interface class AppEnvironment {
  final String baseUrl;
  final String domainUrl;
  AppEnvironment(this.domainUrl, this.baseUrl);
}

interface class TempEnvironment extends AppEnvironment {
  TempEnvironment() : super("", "");
}

// ignore: non_constant_identifier_names
AppEnvironment _appEnvironment = TempEnvironment();

setEnvironment<T extends AppEnvironment>(T obj) {
  _appEnvironment = obj;
}

AppEnvironment get getEnvironment => _appEnvironment;
