import 'package:quotable/quotable.dart';
import 'package:test/test.dart';

void main() {
  group('test :: get random quote', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('response is not null', () async {
      final r = await getRandomQuote();

      expect(r, isNotNull);
    });
  });
}
