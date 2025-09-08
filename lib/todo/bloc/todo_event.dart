import 'package:equatable/equatable.dart';

import '../model/todo_model.dart';


abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class AddTodo extends TodoEvent {
  final TodoModel todo;
  const AddTodo(this.todo);

  @override
  List<Object?> get props => [todo];
}

class ToggleTodo extends TodoEvent {
  final String id;
  const ToggleTodo(this.id);

  @override
  List<Object?> get props => [id];
}

class DeleteTodo extends TodoEvent {
  final String id;
  const DeleteTodo(this.id);

  @override
  List<Object?> get props => [id];
}
