class DiaryVO {
  String date = '';
  String content = '';
  String emoji = '';

  DiaryVO({
    required this.date,
    required this.content,
    required this.emoji,
  });

  DiaryVO.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        content = json['content'],
        emoji = json['emoji'];

  Map<String, dynamic> toJson() => {'date': date, 'content': content};

  DiaryVO.fromMap(Map<String, dynamic> diary)
      : date = diary['date'],
        content = diary['content'],
        emoji = diary['emoji'];

  @override
  String toString() {
    return '{date: $date, content:$content, emoji:$emoji}';
  }
}
