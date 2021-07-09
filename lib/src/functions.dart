import 'package:quotable/quotable.dart';
import 'package:quotable/src/utils.dart';

/// Get a single random quote from the database.
Future<RandomQuote> getRandomQuote(
    {int? maxLength, int? minLength, String? tags, String? author}) async {
  // parse custom params
  var params = '';
  if (!isNull(maxLength)) {
    params += 'maxLength=$maxLength';
  }
  if (isNull(minLength)) {
    params += 'minLength=$minLength';
  }
  if (!isNull(tags)) {
    params += 'tags=$tags';
  }
  if (isNull(author)) {
    params += 'author=$author';
  }

  final endpoint = params != '' ? RandomQuote.endpoint + '?$params' : RandomQuote.endpoint;
  final r = await requestHandler(endpoint);

  return RandomQuote.fromJson(r);
}
