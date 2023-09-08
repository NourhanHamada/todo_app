import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/view_model/database/networking/dio_helper.dart';
import 'package:todo_app/view_model/database/networking/end_points.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  TodoCubit get(context) => BlocProvider.of(context);

  List<TodoModel> todoList = [];
  TodoModel? todoModel;

  getTodo() async {
    emit(TodoDataLoading());
    await DioHelper.getData(
      url: todosEndPoint,
    ).then((value) {
      for (Map i in value.data) {
        todoModel = TodoModel(
          id: i['id'],
          userId: i['userId'],
          title: i['title'],
          completed: i['completed'],
        );
        todoList.add(todoModel!);
      }
      emit(TodoDataSuccess());
    }).catchError((onError) {
      debugPrint('FAIL');
      debugPrint(onError.toString());
      emit(TodoDataFail());
    });
  }
}
