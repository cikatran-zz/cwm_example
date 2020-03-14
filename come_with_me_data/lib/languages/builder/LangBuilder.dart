abstract class LangBuilder {
  String getLocale() => '${this.getLanguageCode()}_${this.getCountryCode()}';

  String getCountryCode();

  String getLanguageCode();
  String get TEMP;
}
