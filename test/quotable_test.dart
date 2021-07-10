// simple tests only implemented

import 'package:quotable/quotable.dart';
import 'package:test/test.dart';

void main() {
  group('test :: all', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('get random quote', () async {
      final r = await getRandomQuote();

      expect(r, isNotNull);
    });

    test('get a quote by id', () async {
      final r = await getQuoteByID('aEPNVog6sT');

      expect(r, isNotNull);
      expect(r.id, 'aEPNVog6sT');
    });

    test('get authors', () async {
      final r = await getAuthors();

      expect(r, isNotNull);
    });

    test('get author by id', () async {
      final r = await getAuthorByID('Bblz8Knp6-ZB');

      expect(r, isNotNull);
    });

    test('get tags', () async {
      final r = await getTags();

      expect(r, isNotNull);
    });
  });
}
