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
  String dateAdded;
  String dateModified;

  Quote(
      {required this.id,
      required this.content,
      required this.author,
      required this.authorSlug,
      required this.length,
      required this.tags,
      required this.dateAdded,
      required this.dateModified});

  factory Quote.fromJson(Map<String, dynamic> data) {
    return Quote(
        id: data['_id'],
        content: data['content'],
        author: data['author'],
        authorSlug: data['authorSlug'],
        length: data['length'],
        tags: List<String>.from(data['tags']),
        dateAdded: data['dateAdded'],
        dateModified: data['dateModified']);
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
  int quoteCount;
  String dateAdded;
  String dateModified;

  Authors(
      {required this.id,
      required this.bio,
      required this.description,
      required this.link,
      required this.name,
      required this.slug,
      required this.quoteCount,
      required this.dateAdded,
      required this.dateModified});

  factory Authors.fromJson(Map<String, dynamic> data) {
    return Authors(
        id: data['_id'],
        bio: data['bio'],
        description: data['description'],
        link: data['link'],
        name: data['name'],
        slug: data['slug'],
        quoteCount: data['quoteCount'],
        dateAdded: data['dateAdded'],
        dateModified: data['dateModified']);
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
  int v__;
  int quoteCount;
  String dateAdded;
  String dateModified;

  Tags(
      {required this.id,
      required this.name,
      required this.v__,
      required this.quoteCount,
      required this.dateAdded,
      required this.dateModified});

  factory Tags.fromJson(Map<String, dynamic> data) {
    return Tags(
        id: data['_id'],
        name: data['name'],
        v__: data['__v'],
        quoteCount: data['quoteCount'],
        dateAdded: data['dateAdded'],
        dateModified: data['dateModified']);
  }
}

class ListTags {
  static String endpoint = '/tags';
  List<Tags> results;

  ListTags({required this.results});

  factory ListTags.fromJson(List<dynamic> data) {
    return ListTags(results: List<Tags>.from(data.map((l) => Tags.fromJson(l))));
  }
}
