import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
    home: QuoteList(),
));

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', text: 'Be yourself; everyone else is already taken.', category: 'Inspiration'),
    Quote(author: 'Oscar Wilde', text: 'I have nothing to declare except my genius.', category: 'Humor'),
    Quote(author: 'Oscar Wilde', text: 'The truth is rarely pure and never simple.', category: 'Thoughtful')
  ];

  void _likeQuote(Quote quote) => setState(() => quote.likes++);
  void _deleteQuote(Quote quote) => setState(() => quotes.remove(quote));

  Color _categoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'humor':
        return Colors.amber.shade100;
      case 'inspiration':
        return Colors.blueAccent.shade100.withAlpha(60);
      case 'thoughtful':
        return Colors.green.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(quote: quote,
            onLike: () => _likeQuote(quote),
            onDelete: () => _deleteQuote(quote),
            color: _categoryColor(quote.category)),
        ).toList(),
      ),
    );
  }
}



