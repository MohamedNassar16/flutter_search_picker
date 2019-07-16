import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_picker/search_picker.dart';

void main() {
  const MethodChannel channel = MethodChannel('search_picker');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SearchPicker.platformVersion, '42');
  });
}
