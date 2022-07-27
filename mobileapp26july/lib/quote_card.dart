import 'package:flutter/material.dart';
import 'quotes.dart';

class QuoteCard extends StatelessWidget {
  final Quotes quote;
  final Function delete;
  QuoteCard({required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(quote.text,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      color: Color.fromARGB(255, 71, 70, 70))),
              SizedBox(height: 5),
              Text(
                quote.author,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.redAccent,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 8.0,
              ),
              // ignore: deprecated_member_use
              FlatButton.icon(
                  onPressed: delete(),
                  icon: Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 74, 74, 74),
                  ),
                  label: Text(
                    'Delete Quote',
                    style: TextStyle(
                        color: Color.fromARGB(255, 74, 74, 74),
                        fontStyle: FontStyle.normal),
                  ))
            ]),
      ),
    );
  }
}
