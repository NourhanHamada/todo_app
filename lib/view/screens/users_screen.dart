import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/view/constant/assets.dart';
import 'package:todo_app/view/constant/colors.dart';
import 'package:todo_app/view/constant/extension.dart';
import 'package:todo_app/view/screens/home_screen.dart';
import 'package:todo_app/view/widgets/circle_decor.dart';
import 'package:todo_app/view/widgets/main_button.dart';
import 'package:todo_app/view_model/cubit/todo/todo_cubit.dart';
import 'package:todo_app/view_model/cubit/user/user_cubit.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = BlocProvider.of<UserCubit>(context, listen: true);
    TodoCubit todoCubit = BlocProvider.of<TodoCubit>(context, listen: true);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleDecor(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Image.asset(users),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 2,
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: userCubit.userList.length,
                      itemBuilder: (context, int index) {
                        return GestureDetector(
                          onTap: (){
                            context.push(const HomeScreen());
                            todoCubit.getUserTodo(index +1);
                          },
                          child: Card(
                            color: greenColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              leading: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: backgroundColor),
                                child: Center(
                                  child: Text(
                                    userCubit.userList[index].id.toString(),
                                  ),
                                ),
                              ),
                              title: Text(
                                userCubit.userList[index].name.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                userCubit.userList[index].email.toString(),
                                style: const TextStyle(
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 16.h,
                ),
                MainButton(title: 'All ToDos', onTap: (){
                  context.push(const HomeScreen());
                  todoCubit.getTodo();
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
