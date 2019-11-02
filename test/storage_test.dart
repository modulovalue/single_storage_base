import 'package:mockito/mockito.dart';
import 'package:single_storage_base/single_storage_base.dart';
import 'package:test/test.dart';

void main() {
  group("tests", () {
    group(".at", () {
      final storage = TestStorageBase();
      final sut = storage.at("myKey");

      test("get", () async {
        when(storage.get("myKey")).thenAnswer((_) async => "mydata");
        expect(await sut.get(), "mydata");
      });

      test("set", () async {
        await sut.set("data");
        verify(storage.set("myKey", "data")).called(1);
      });

      test("remove", () async {
        await sut.remove();
        verify(storage.remove("myKey")).called(1);
      });

      test("exists", () async {
        when(storage.exists("myKey")).thenAnswer((_) async => false);
        expect(await sut.exists(), false);
        verify(storage.exists("myKey")).called(1);
      });

      test("location", () async {
        when(storage.location("myKey")).thenAnswer((_) => "myLocation");
        expect(sut.location, "myLocation");
        verify(storage.location("myKey")).called(1);
      });
    });

    group(".at", () {
      final storage = TestStorageBase();
      final sut = storage.map((key) => "$key newKey");
      const key = "key";
      test("get", () async {
        when(storage.get("$key newKey")).thenAnswer((_) async => "mydata");
        expect(await sut.get("$key"), "mydata");
      });

      test("set", () async {
        await sut.set("$key", "data");
        verify(storage.set("$key newKey", "data")).called(1);
      });

      test("remove", () async {
        await sut.remove("$key");
        verify(storage.remove("$key newKey")).called(1);
      });

      test("exists", () async {
        when(storage.exists("$key newKey")).thenAnswer((_) async => false);
        expect(await sut.exists("$key"), false);
        verify(storage.exists("$key newKey")).called(1);
      });

      test("location", () async {
        when(storage.location("$key newKey")).thenAnswer((_) => "myLocation");
        expect(sut.location("$key"), "myLocation");
      });
    });
  });
}

class TestStorageBase extends StorageBase<String> with Mock {}
