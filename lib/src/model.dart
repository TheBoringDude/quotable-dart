// A single random quote from the database.
class RandomQuote {
  static String endpoint = '/random';

  String id;
  String content;
  String author;
  String authorSlug;
  String length;
  List<String> tags;

  RandomQuote(
      {required this.id,
      required this.content,
      required this.author,
      required this.authorSlug,
      required this.length,
      required this.tags});

  factory RandomQuote.fromJson(Map<String, dynamic> data) {
    return RandomQuote(
        id: data['id'],
        content: data['content'],
        author: data['author'],
        authorSlug: data['authorSlug'],
        length: data['length'],
        tags: data['tags']);
  }
}

// A quote by it's ID.
class Quote {
  String id;
  String content;
  String author;
  String length;
  List<String> tags;

  Quote({
    required this.id,
    required this.content,
    required this.author,
    required this.length,
    required this.tags,
  });
}

// A list of quotes.
class ListQuote {
  int count;
  int totalCount;
  int page;
  int totalPages;
  int lastItemIndex;
  List<RandomQuote> results;

  ListQuote(
      {required this.count,
      required this.totalCount,
      required this.page,
      required this.totalPages,
      required this.lastItemIndex,
      required this.results});
}

// Authors
class Authors {
  String id;
  String bio;
  String description;
  String link;
  String name;
  String slug;
  String quoteCount;

  Authors({
    required this.id,
    required this.bio,
    required this.description,
    required this.link,
    required this.name,
    required this.slug,
    required this.quoteCount,
  });
}

class ListAuthors {
  int count;
  int totalCount;
  int page;
  int totalPages;
  int? lastItemIndex;
  List<Authors> results;

  ListAuthors(
      {required this.count,
      required this.totalCount,
      required this.page,
      required this.totalPages,
      required this.lastItemIndex,
      required this.results});
}

class Tags {
  String id;
  String name;

  Tags({required this.id, required this.name});
}

class ListTags {
  int count;
  List<Tags> results;

  ListTags({required this.count, required this.results});
}
