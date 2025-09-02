import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>>{
  TodoCubit() : super([]);

  void addtodo(String name){
    final todo = Todo(name: name, createAt:DateTime.now());
   state.add(todo);
   emit([...state]);

  }
}