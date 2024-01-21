import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertraining/main.dart';

void main() {
  // group the test cases together
  group('is Even group', () {
    test('is Even', () {
      bool result = isEven(12);
      expect(result, true);
    });

    test('is Odd', () {
      bool result = isEven(123);
      expect(result, false);
    });
  });
}
