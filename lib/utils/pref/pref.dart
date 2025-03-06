import '../../app/index.dart';

class Pref{
  static final Pref _preferences = Pref._internal();
  static late final SharedPreferences?  _sharedPreferences;
  Pref._internal();

  factory Pref() {
    return _preferences;
  }

  static Future<void> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void setString(String key, String value){
    if (_sharedPreferences != null) {
      _sharedPreferences!.setString(key, value);
    } else {
      throw Exception(Strings.exceptionString);
    }
  }

  String? getString(String key) {
    if (_sharedPreferences != null) {
      return _sharedPreferences!.getString(key);
    } else {
      throw Exception(Strings.exceptionString);
    }
  }

}