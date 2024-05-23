import 'package:shared_preferences/shared_preferences.dart';
import '../../infra/datasource/localstorage.dart';

class LocalStorageDatasourceImpl implements LocalStorageDatasource {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Future<dynamic> load(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? '';
  }

  @override
  Future<dynamic> save(String key, dynamic value) async {
    final SharedPreferences prefs = await _prefs;
    switch (value.runtimeType) {
      case String:
        return await prefs.setString(key, value);
      case int:
        return await prefs.setInt(key, value);
      case double:
        return await prefs.setDouble(key, value);
      case bool:
        return await prefs.setBool(key, value);
      default:
        return await prefs.setString(key, value.toString());
    }
  }
}
