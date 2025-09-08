import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {

  final Quote quote;
  final VoidCallback onLike;
  final VoidCallback onDelete;
  final Color color;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.onLike,
    required this.onDelete,
    required this.color,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                quote.text,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                quote.author,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[600],
                ),
              ),

              Wrap(
                spacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                Chip(label: Text(quote.category,
                    style: TextStyle(color: Colors.grey[800])),
                    backgroundColor: color),
                Text(DateFormat('yyyy-MM-dd').format(quote.createdAt),
                    style: TextStyle(color: Colors.grey[600])),
                ],
              ),

              const SizedBox(height: 6.0),

              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: onLike,
                  ),
                  Text('${quote.likes}'),
                  IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async{
                        final ok = await showDialog<bool>(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Delete Quote?'),
                            content: Text('Are you sure you want to delete this quote?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        ) ?? false;
                        if (ok) {
                          onDelete();
                        }
                      }
                  ),
                ],
              ),

            ],
          ),
        )
    );
  }
}