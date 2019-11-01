import 'package:single_storage_base.dart/single_storage_base.dart';

void main() {
  final storage = MyStorage();
  final _ = storage.at("somewhere");
  final __ = storage.map((key) => "somewhere/$key");
}

class MyStorage extends StorageBase<String> {
  @override
  Future<bool> exists(String key) async {
    return false;
  }

  @override
  Future<String> get(String key) async {
    return "todo";
  }

  @override
  String location(String key) {
    return key;
  }

  @override
  Future<void> remove(String key) async {
    // remove
  }

  @override
  Future<void> set(String key, String value) async {
    // set
  }
}
