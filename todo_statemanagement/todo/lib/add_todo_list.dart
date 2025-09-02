import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubit/todo_cubit.dart';
import 'package:todo/todo_list.dart';

class AddTodoList extends StatefulWidget {
  const AddTodoList({super.key});

  @override
  State<AddTodoList> createState() => _AddTodoListState();
}

class _AddTodoListState extends State<AddTodoList> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Write ur todo here'),
      ),
      body:Column(
        children: [
           Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText:'go on...'
          ),
        ),
      ),
      ElevatedButton(onPressed: (){
        BlocProvider.of<TodoCubit>(context).addtodo(controller.text.trim());
        Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoList()));
      }, child:Text('Add'))
        ],
      )

    );
  }
}