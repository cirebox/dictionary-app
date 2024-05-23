abstract class LocalStorageDatasource {
  Future<dynamic> load(String key);
  Future<dynamic> save(String key, dynamic value);
}
