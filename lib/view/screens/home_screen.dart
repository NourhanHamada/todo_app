import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loadmore/loadmore.dart';
import 'package:todo_app/view/constant/assets.dart';
import 'package:todo_app/view/constant/colors.dart';
import 'package:todo_app/view/constant/extension.dart';
import 'package:todo_app/view/widgets/circle_decor.dart';
import 'package:todo_app/view_model/cubit/todo/todo_cubit.dart';
import '../core/custom_clip_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 100;

  void load() {
    if (count < TodoCubit.todoList.length) {
        count += 100;
    }
  }

  Future<bool> loadMore() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 100));
    setState(() {
      load();
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    TodoCubit todoCubit = BlocProvider.of<TodoCubit>(context, listen: true);
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
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 128),
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        todoCubit.motivationalQuotes[0],
                        style: const TextStyle(
                          color: whiteColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SafeArea(
                    child: GestureDetector(
                      onTap: (){
                        context.pop();
                      },
                        child: Image.asset(
                  arrowBack,
                  color: blackColor,
                  width: 48,
                ))),
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
                              height: 250,
                              child: state is TodoDataSuccess
                                  ? LoadMore(
                                      textBuilder:
                                          DefaultLoadMoreTextBuilder.english,
                                      isFinish: count >= TodoCubit.todoList.length,
                                      onLoadMore: loadMore,
                                      child: ListView.builder(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          itemCount: TodoCubit
                                                  .filteredTodos.isNotEmpty
                                              ? TodoCubit.filteredTodos.length
                                              : count,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: blackColor,
                                                            width: 2),
                                                        color: TodoCubit
                                                                    .todoList[
                                                                        index]
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
                                                      TodoCubit.filteredTodos
                                                              .isNotEmpty
                                                          ? TodoCubit
                                                              .filteredTodos[
                                                                  index]
                                                              .title
                                                              .toString()
                                                          : TodoCubit
                                                              .todoList[index]
                                                              .title
                                                              .toString(),
                                                      // TodoCubit.todoList[index].title.toString(),
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    )
                                  // : TodoCubit.todoList.isEmpty
                                  //     ? const Center(
                                  //         child: Text(
                                  //           'Add Your First Task <3',
                                  //           style: TextStyle(
                                  //             fontSize: 20,
                                  //           ),
                                  //         ),
                                  //       )
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
