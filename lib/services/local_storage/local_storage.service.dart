abstract class LocalStorageService {
  Future<String> getDataAsJson(String key);

  Future<String> saveDataAsJson(String key, String json);

  Future<String> updateDataAsJson(String key, String json);

  Future<bool> deleteData(String key);

  Future<bool> deleteAll();
}
