# quotable_dart

A simple API Wrapper for https://github.com/lukePeavey/quotable

## Usage

```dart
import 'package:quotable/quotable.dart';

void main() async {
  listQuotes();
}

void randomQuote() async {
  final r = await getRandomQuote(author: 'johann-wolfgang-von-goethe');

  print(r.content);
  print(r.author);
}

void listQuotes() async {
  final r = await getQuotes(limit: 2, sortBy: SortByQuote.author);

  for (var item in r.results) {
    print(item.content);
  }
}

void listAuthors() async {
  final r = await getAuthors(limit: 3);

  print(r.count);
}

void authorByID() async {
  final r = await getAuthorByID('johann-wolfgang-von-goethe');

  print(r.name);
}

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/TheBoringDude/quotable-dart/issues

##

#### &copy; 2021 | TheBoringDude | [LICENSE](./LICENSE)
