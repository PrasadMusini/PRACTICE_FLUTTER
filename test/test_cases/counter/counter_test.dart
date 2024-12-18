import 'package:flutter_test/flutter_test.dart';
import 'package:practice_flutter/test_cases/counter/counter.dart';

void main() {
  group('test counter -', () {
    late Counter counter;

    setUp(() {
      counter = Counter();
    });

    test('Given counter class when instatited counter then count should be 0',
        () {
      expect(counter.count, 0);
    });

    test(
        'Given counter class when invoked incrementCount then count should be 1',
        () {
      counter.incrementCount();
      final result = counter.count;
      expect(result, 1);
    });

    test(
        'Given counter class when invoked decrementCounter then count should be -1',
        () {
      counter.decrementCounter();
      final result = counter.count;
      expect(result, -1);
    });

    test('Given counter class when invoked resetCount then count should be 0',
        () {
      counter.resetCount();
      final result = counter.count;
      expect(result, 0);
    });
  });
}
