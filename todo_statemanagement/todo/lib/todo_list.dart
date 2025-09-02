import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/add_todo_list.dart';
import 'package:todo/cubit/todo_cubit.dart';
import 'package:todo/models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('todo List'),
      ),
      body: Column(children: [
        Expanded(
          child: BlocBuilder<TodoCubit, List<Todo>>(
            builder: (context, todos) {
              return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                     return ListTile(
                      title: Text(todo.name),
                    );
                  });
            },
          ),
        ),
        Center(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddTodoList()));
            },
            child: const Icon(Icons.add),
          ),
        )
      ]),
    );
  }
}
