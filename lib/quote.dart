class Quote{
  final String text;
  final String author;
  final String category;
  final DateTime createdAt;
  int likes;

  Quote({
    required this.text,
    required this.author,
    this.category = 'General',
    DateTime? createdAt,
    this.likes = 0,
  }) : createdAt = DateTime.now();

}

