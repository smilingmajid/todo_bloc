import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../model/todo_model.dart';

class TodoListWidget extends StatelessWidget {
  final List<TodoModel> todos;
  const TodoListWidget({super.key, required this.todos});
//gg
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          title: Text(
            todo.title,
            style: TextStyle(
              decoration:
                  todo.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          leading: Checkbox(
            value: todo.isCompleted,
            onChanged: (_) {
              context.read<TodoBloc>().add(ToggleTodo(todo.id));
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              context.read<TodoBloc>().add(DeleteTodo(todo.id));
            },
          ),
        );
      },
    );
  }
}
