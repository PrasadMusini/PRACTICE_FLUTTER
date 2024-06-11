class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    userId: json['userId'] as int,
    id: json['id'] as int,
    title: json['title'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
