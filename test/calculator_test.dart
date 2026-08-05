import 'package:ecommerce_app3/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculator unit tests', () {
    test('add returns the correct sum', () {
      final calculator = Calculator();
      expect(calculator.add(1, 2), 3);
      expect(calculator.add(-5, 5), 0);
      // expect(calculator.add(10, 20), 10);
    });
  });
}
