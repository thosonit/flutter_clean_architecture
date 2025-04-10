import 'package:shared_preferences/shared_preferences.dart';
import 'package:ts_domain/error/exceptions.dart';
import 'storage_service.dart';

class SharedPrefsStorageService implements StorageService {
  final SharedPreferences _prefs;

  SharedPrefsStorageService(this._prefs);

  // Nên có một hàm khởi tạo async static để đảm bảo SharedPreferences sẵn sàng
  static Future<SharedPrefsStorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPrefsStorageService(prefs);
  }

  @override
  Future<String?> read({required String key}) async {
    try {
      return _prefs.getString(key);
    } catch (e) {
      // Log error e
      throw CacheException(message: "Không thể đọc dữ liệu từ key: $key");
    }
  }

  @override
  Future<void> write({required String key, required String value}) async {
    try {
      await _prefs.setString(key, value);
    } catch (e) {
      // Log error e
      throw CacheException(message: "Không thể ghi dữ liệu cho key: $key");
    }
  }

  @override
  Future<void> delete({required String key}) async {
    try {
      await _prefs.remove(key);
    } catch (e) {
      // Log error e
      throw CacheException(message: "Không thể xoá dữ liệu cho key: $key");
    }
  }

  @override
  Future<bool> containsKey({required String key}) async {
    try {
      return _prefs.containsKey(key);
    } catch (e) {
      // Log error e
      throw CacheException(message: "Không thể kiểm tra key: $key");
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await _prefs.clear();
    } catch (e) {
      // Log error e
      throw CacheException(message: "Không thể xoá toàn bộ dữ liệu.");
    }
  }
}
