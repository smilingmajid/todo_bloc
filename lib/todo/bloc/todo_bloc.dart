import 'package:flutter_bloc/flutter_bloc.dart';

import 'todo_event.dart';
import 'todo_state.dart';
import '../model/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodo>((event, emit) {
      final updated = List<TodoModel>.from(state.todos)..add(event.todo);
      emit(state.copyWith(todos: updated));
    });

    on<ToggleTodo>((event, emit) {
      final updated = state.todos.map((todo) {
        if (todo.id == event.id) {
          return todo.copyWith(isCompleted: !todo.isCompleted);
        }
        return todo;
      }).toList();
      emit(state.copyWith(todos: updated));
    });

    on<DeleteTodo>((event, emit) {
      final updated = state.todos.where((t) => t.id != event.id).toList();
      emit(state.copyWith(todos: updated));
    });
  }
}
