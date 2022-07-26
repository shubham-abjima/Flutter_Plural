import 'package:flutter/material.dart';
import 'quotes.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
      home: QuoteList(),
    ));

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quotes> quotes = [
    Quotes(author: 'Frank Zappa', text: 'So many books, so little time.'),
    Quotes(
        author: 'Marcus Tullius Cicero',
        text: 'A room without books is like a body without a soul.'),
    Quotes(
        author: 'Mahatma Gandhi',
        text: 'Be the change that you wish to see in the world.')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(251, 165, 162, 162),
        appBar: AppBar(
          title: Text('Awesome Quotes'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 234, 96, 98),
        ),
        body: Column(
          children: quotes
              .map((quote) => QuoteCard(
                  quote: quote,
                  delete: () {
                    setState(() {
                      quotes.remove(quote);
                    });
                  }))
              .toList(),
        ));
  }
}
