import 'package:built_collection/built_collection.dart';
import 'package:silicon_beach_space/models/provider_info.dart';
import 'package:silicon_beach_space/models/user.dart';
import 'package:test/test.dart';

void main() {
  group('ProviderInfo', () {
    test('handles missing nullable members', () {
      // email, displayName, photoUrl, phoneNumber are nullable
      final info = ProviderInfo((b) => b
        ..uid = 'id'
        ..providerId = 'provider');

      expect(info.uid, 'id');
      expect(info.email, null);
      expect(info.providerId, 'provider');
      expect(info.displayName, null);
      expect(info.photoUrl, null);
      expect(info.phoneNumber, null);
    });

    test('members take expected values', () {
      final providerInfo = ProviderInfo((b) => b
        ..displayName = 'name'
        ..providerId = 'provider'
        ..photoUrl = 'url'
        ..email = 'email'
        ..uid = 'uid'
        ..phoneNumber = 'number');

      final user = User((a) => a
        ..email = 'email'
        ..uid = 'id'
        ..displayName = 'name'
        ..photoUrl = 'url'
        ..providers = ListBuilder([providerInfo]));

      expect(user.uid, 'id');
      expect(user.email, 'email');
      expect(user.displayName, 'name');
      expect(user.photoUrl, 'url');

      final info = ProviderInfo((b) => b
        ..displayName = 'name'
        ..providerId = 'provider'
        ..photoUrl = 'url'
        ..email = 'email'
        ..uid = 'uid'
        ..phoneNumber = 'number');

      expect(user.providers.length, 1);
      expect(user.providers.first, info);
    });
  });
}
