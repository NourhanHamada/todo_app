import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/view/core/theme.dart';
import 'package:todo_app/view/screens/splash_screens.dart';
import 'package:todo_app/view_model/cubit/bloc_observer.dart';
import 'package:todo_app/view_model/cubit/todo/todo_cubit.dart';
import 'package:todo_app/view_model/database/networking/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TodoCubit()..getTodo(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData(context),
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
