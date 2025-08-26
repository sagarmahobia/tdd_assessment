import 'package:tdd_assessment/tdd_assessment.dart';
import 'package:test/test.dart';

void main() {
  late StringCalculator calc;
  setUp(() => calc = StringCalculator());

  test('test nothing', () {});

  test("empty string returns 0", () {
    expect(calc.add(""), 0);
  });

  test("single number returns the number itself", () {
    expect(calc.add("5"), 5);
  });

  test("two numbers, comma delimited, returns the sum", () {
    expect(calc.add("1,2"), 3);
  });

  test("multiple numbers, comma delimited, returns the sum", () {
    expect(calc.add("1,2,3,4,5"), 15);
  });
}
