import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EncryptionService {
  static final _secureStorage = FlutterSecureStorage();
  static final _key = Key.fromLength(32); // AES key length (32 bytes)
  static final _iv = IV.fromLength(16); // Initialization vector (16 bytes)
  static final _encrypter = Encrypter(AES(_key));

  // Encrypt the data
  static String encrypt(String data) {
    return _encrypter.encrypt(data, iv: _iv).base64;
  }

  // Decrypt the data
  static String decrypt(String encryptedData) {
    return _encrypter.decrypt64(encryptedData, iv: _iv);
  }

  // Store AES key securely
  static Future<void> storeEncryptionKey(String key) async {
    await _secureStorage.write(key: 'aes_key', value: key);
  }

  // Retrieve AES key
  static Future<String?> getEncryptionKey() async {
    return await _secureStorage.read(key: 'aes_key');
  }
}
