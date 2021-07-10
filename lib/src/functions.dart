/// MAIN FUNCTIONS FOR THE LIBRARY

import 'package:quotable/quotable.dart';
import 'package:quotable/src/utils.dart';

/// Get a single random quote from the database.
/// Endpoint: `/random`
Future<Quote> getRandomQuote({int? maxLength, int? minLength, String? tags, String? author}) async {
  // parse custom params
  var ps = [
    {'v': 'maxLength', 'r': maxLength},
    {'v': 'minLength', 'r': minLength},
    {'v': 'tags', 'r': tags},
    {'v': 'author', 'r': author},
  ];
  var params = '';

  ps.forEach((el) {
    if (!isNull(el['r'])) {
      params += "&${el['v']}=${el['r']}";
    }
  });

  final endpoint = Quote.endpoint + replaceQMark(params);
  final r = await requestHandler(endpoint);

  return Quote.fromJson(r);
}

/// Get all quotes matching a given query. By default, this
/// will return a paginated list of all quotes, sorted by _id.
/// Quotes can also be filter by author, tag, and length.
Future<ListQuote> getQuotes(
    {int? maxLength,
    int? minLength,
    String? tags,
    SortByQuote? sortBy,
    SortOrder? order,
    int? limit,
    int? page}) async {
  // parse custom params
  var ps = [
    {'v': 'maxLength', 'r': maxLength},
    {'v': 'minLength', 'r': minLength},
    {'v': 'tags', 'r': tags},
    {'v': 'limit', 'r': limit},
    {'v': 'page', 'r': page}
  ];
  var params = '';

  ps.forEach((el) {
    if (!isNull(el['r'])) {
      params += "&${el['v']}=${el['r']}";
    }
  });

  if (!isNull(sortBy)) {
    params += "&sortBy=${sortBy.toString().replaceAll('SortBy.', '')}";
  }
  if (!isNull(order)) {
    params += "&order=${order.toString().replaceAll('SortOrder.', '')}";
  }

  final endpoint = ListQuote.endpoint + replaceQMark(params);
  final r = await requestHandler(endpoint);

  return ListQuote.fromJson(r);
}

/// Get a quote by its ID
Future<Quote> getQuoteByID(String id) async {
  final endpoint = ListQuote.endpoint + '/$id';

  final r = await requestHandler(endpoint);

  return Quote.fromJson(r);
}

/// Get all authors matching the given query.
/// This endpoint can be used to list authors,
/// with several options for sorting and filter.
/// It can also be used to get author details
/// for one or more specific authors, using the
/// author slug or ids.
Future<ListAuthors> getAuthors(
    {String? slug, SortByAuthor? sortBy, SortOrder? order, int? limit, int? page}) async {
  // parse custom params
  var ps = [
    {
      'v': 'slug',
      'r': slug,
    },
    {
      'v': 'limit',
      'r': limit,
    },
    {'v': 'page', 'r': page}
  ];
  var params = '';

  ps.forEach((el) {
    if (!isNull(el['r'])) {
      params += "&${el['v']}=${el['r']}";
    }
  });

  if (!isNull(sortBy)) {
    params += "&sortBy=${sortBy.toString().replaceAll('SortBy.', '')}";
  }
  if (!isNull(order)) {
    params += "&order=${order.toString().replaceAll('SortOrder.', '')}";
  }

  final endpoint = ListAuthors.endpoint + replaceQMark(params);
  final r = await requestHandler(endpoint);

  return ListAuthors.fromJson(r);
}

/// Get details about a specific author by _id.
Future<Authors> getAuthorByID(String id) async {
  final endpoint = ListAuthors.endpoint + '/$id';

  final r = await requestHandler(endpoint);

  return Authors.fromJson(r);
}

/// Get a list of all tags
Future<ListTags> getTags({SortByTags? sortBy, SortOrder? order}) async {
  // parse custom params
  var params = '';

  if (!isNull(sortBy)) {
    params += "&sortBy=${sortBy.toString().replaceAll('SortBy.', '')}";
  }
  if (!isNull(order)) {
    params += "&order=${order.toString().replaceAll('SortOrder.', '')}";
  }

  final endpoint = ListTags.endpoint + replaceQMark(params);
  final r = await requestListHandler(endpoint);

  return ListTags.fromJson(r);
}
