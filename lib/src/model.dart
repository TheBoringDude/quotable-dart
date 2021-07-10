// though they are similar, it is better to separate each of them
enum SortByQuote { dateAdded, dateModified, author, content }
enum SortByAuthor { dateAdded, dateModifed, name, quoteCount }
enum SortByTags { dateAdded, dateModifed, name, quoteCount }
enum SortOrder { asc, desc }

// A single random quote from the database.
class Quote {
  static String endpoint = '/random';

  String id;
  String content;
  String author;
  String authorSlug;
  int length;
  List<String> tags;

  Quote(
      {required this.id,
      required this.content,
      required this.author,
      required this.authorSlug,
      required this.length,
      required this.tags});

  factory Quote.fromJson(Map<String, dynamic> data) {
    return Quote(
        id: data['_id'],
        content: data['content'],
        author: data['author'],
        authorSlug: data['authorSlug'],
        length: data['length'],
        tags: List<String>.from(data['tags']));
  }
}

// A list of quotes.
class ListQuote {
  static String endpoint = '/quotes';

  int count;
  int totalCount;
  int page;
  int totalPages;
  int lastItemIndex;
  List<Quote> results;

  ListQuote(
      {required this.count,
      required this.totalCount,
      required this.page,
      required this.totalPages,
      required this.lastItemIndex,
      required this.results});

  factory ListQuote.fromJson(Map<String, dynamic> data) {
    Iterable r = data['results'];

    return ListQuote(
      count: data['count'],
      totalCount: data['totalCount'],
      page: data['page'],
      totalPages: data['totalPages'],
      lastItemIndex: data['lastItemIndex'],
      results: List<Quote>.from(r.map((l) => (Quote.fromJson(l)))),
    );
  }
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

  factory Authors.fromJson(Map<String, dynamic> data) {
    return Authors(
        id: data['id'],
        bio: data['bio'],
        description: data['description'],
        link: data['link'],
        name: data['name'],
        slug: data['slug'],
        quoteCount: data['quoteCount']);
  }
}

class ListAuthors {
  static String endpoint = '/authors';

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

  factory ListAuthors.fromJson(Map<String, dynamic> data) {
    Iterable r = data['results'];

    return ListAuthors(
      count: data['count'],
      totalCount: data['totalCount'],
      page: data['page'],
      totalPages: data['totalPages'],
      lastItemIndex: data['lastItemIndex'],
      results: List<Authors>.from(r.map((l) => (Authors.fromJson(l)))),
    );
  }
}

class Tags {
  String id;
  String name;

  Tags({required this.id, required this.name});

  factory Tags.fromJson(Map<String, dynamic> data) {
    return Tags(id: data['id'], name: data['name']);
  }
}

class ListTags {
  static String endpoint = '/tags';

  int count;
  List<Tags> results;

  ListTags({required this.count, required this.results});

  factory ListTags.fromJson(Map<String, dynamic> data) {
    Iterable r = data['results'];

    return ListTags(count: data['count'], results: List<Tags>.from(r.map((l) => Tags.fromJson(l))));
  }
}
