import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/view/constant/assets.dart';
import 'package:todo_app/view/constant/colors.dart';
import 'package:todo_app/view/widgets/circle_decor.dart';
import 'package:todo_app/view_model/cubit/todo/todo_cubit.dart';
import '../core/custom_clip_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodoCubit todoCubit = BlocProvider.of(context, listen: true);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipPath(
                  clipper: CustomClipperContainer(),
                  child: Container(
                    color: greenColor,
                    width: double.infinity,
                    height: 300,
                  ),
                ),
                const CircleDecor(),
                Transform.translate(
                  offset: Offset(
                    MediaQuery.sizeOf(context).width / 3.5,
                    280,
                  ),
                  child: Image.asset(
                    todoIll,
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 128),
                    child: Text(
                      'Make it for you Future!',
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Todo Tasks .',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Card(
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Dairy tasks .',
                              style: TextStyle(
                                color: greyColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                //todo: postTodos
                                // Add new task.
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: blackColor,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.add,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        BlocConsumer<TodoCubit, TodoState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return SizedBox(
                              height: 230,
                              child: state is TodoDataSuccess
                                  ? ListView.builder(
                                      padding: const EdgeInsets.only(top: 8),
                                      itemCount: 100,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: blackColor,
                                                        width: 2),
                                                    color: todoCubit
                                                                .todoList[index]
                                                                .completed ==
                                                            true
                                                        ? mainColor
                                                        : whiteColor),
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              SizedBox(
                                                width: 230.w,
                                                child: Text(
                                                  todoCubit
                                                      .todoList[index].title
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      })
                                  : todoCubit.todoList.isEmpty
                                      ? const Center(
                                          child: Text(
                                            'Add Your First Task <3',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator(
                                            color: mainColor,
                                          ),
                                        ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
