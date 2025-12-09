import 'package:equatable/equatable.dart';

class ContentItemModel extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String body;

  const ContentItemModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory ContentItemModel.fromJson(Map<String, dynamic> json) {
    return ContentItemModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'userId': userId, 'title': title, 'body': body};
  }

  @override
  List<Object?> get props => [id, userId, title, body];
}
