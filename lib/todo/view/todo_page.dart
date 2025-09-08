import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import '../model/todo_model.dart';
import '../widget/todo_list.dart';
import 'package:uuid/uuid.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});
  final TextEditingController _controller = TextEditingController();
  final uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo List (BLoC)")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Add new task...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      context.read<TodoBloc>().add(
                        AddTodo(
                          TodoModel(id: uuid.v4(), title: _controller.text),
                        ),
                      );
                      _controller.clear();
                    }
                  },
                  child: const Text("Add"),
                )
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                return TodoList(todos: state.todos);
              },
            ),
          )
        ],
      ),
    );
  }
}
