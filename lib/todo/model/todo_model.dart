import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;

  const TodoModel({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  TodoModel copyWith({String? id, String? title, bool? isCompleted}) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [id, title, isCompleted];
}
