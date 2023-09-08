import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/user_model.dart';
import 'package:todo_app/view_model/database/networking/dio_helper.dart';
import 'package:todo_app/view_model/database/networking/end_points.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  UserCubit get(context) => BlocProvider.of(context);

  List<UserModel> userList = [];
  UserModel? userModel;

  getUsersData() async {
    emit(UserDataLoading());
    await DioHelper.getData(url: usersEndPoint).then((value) {
      // debugPrint(value.data.toString());
      for (Map i in value.data) {
        userModel = UserModel(
          id: i['id'],
          name: i['name'],
          username: i['username'],
          email: i['email'],
          phone: i['phone'],
          website: i['website'],
        );
        userList.add(userModel!);
      }
      emit(UserDataSuccess());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(UserDataFail());
    });
  }


  // static List<TodoModel> todoList = [];
  // TodoModel? todoModel;
  //
  // getTodo() async {
  //   emit(TodoDataLoading());
  //   await DioHelper.getData(
  //     url: todosEndPoint,
  //   ).then((value) {
  //     for (Map i in value.data) {
  //       todoModel = TodoModel(
  //         id: i['id'],
  //         userId: i['userId'],
  //         title: i['title'],
  //         completed: i['completed'],
  //       );
  //       todoList.add(todoModel!);
  //     }
  //     emit(TodoDataSuccess());
  //   }).catchError((onError) {
  //     debugPrint('FAIL');
  //     debugPrint(onError.toString());
  //     emit(TodoDataFail());
  //   });
  // }
}
