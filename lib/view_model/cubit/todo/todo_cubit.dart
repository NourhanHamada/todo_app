import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/view_model/database/networking/dio_helper.dart';
import 'package:todo_app/view_model/database/networking/end_points.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  TodoCubit get(context) => BlocProvider.of(context);

  List motivationalQuotes = [
    'Make it for you Future!',
    'Don\'t stop until you\'re proud of your self!',
    'Don\'t give up!',
    'Sweet now, Glow later!',
  ];

  void random() {
    motivationalQuotes.shuffle();
    emit(GetRandomQuote());
  }

  static List<TodoModel> todoList = [];
  TodoModel? todoModel;
  late String data;

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
      data = value.data.toString();
      emit(TodoDataSuccess());
    }).catchError((onError) {
      debugPrint('FAIL');
      debugPrint(onError.toString());
      emit(TodoDataFail());
    });
  }


 static List<TodoModel> filteredTodos = [];
  getUserTodo(int? index){
    filteredTodos = todoList.where((todo) => todo.userId == index).toList();
    // emit(FilterData());
  }

}
