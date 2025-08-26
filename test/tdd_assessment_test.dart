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

  test(
    "negative numbers throw an exception with message having those numbers",
    () {
      expect(
        () => calc.add("-2"),
        throwsA(
          predicate(
            (e) =>
                e is FormatException &&
                e.message == 'negative numbers not allowed -2',
          ),
        ),
      );
    },
  );

  test(
    "multiple negative numbers throw an exception with message having those numbers",
    () {
      expect(
        () => calc.add("10 , -2, -5, -10, 14"),
        throwsA(
          predicate(
            (e) =>
                e is FormatException &&
                e.message == 'negative numbers not allowed -2, -5, -10',
          ),
        ),
      );
    },
  );

  test("number string with new line", () {
    expect(calc.add("1\n2,3"), 6);
  });

  test("number string with multiple new line", () {
    expect(calc.add("1\n2\n3,4"), 10);
  });

  test("number string with custom delimiter", () {
    expect(calc.add("//;\n1;2"), 3);
  });

  test("number string with custom delimiter and negative numbers", () {
    expect(
      () => calc.add("//;\n1;2;-2;3;-5;6"),
      throwsA(
        predicate(
          (e) =>
              e is FormatException &&
              e.message == 'negative numbers not allowed -2, -5',
        ),
      ),
    );
  });

  test("number string with custom delimiter and multiple \\n", () {
    expect(calc.add("//;\n1;2\n4"), 7);
  });

    test(
    'custom delimiter header but empty body returns 0',
    () => expect(calc.add('//;\n'), 0),
  );
}
