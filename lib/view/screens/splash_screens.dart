import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/view/constant/assets.dart';
import 'package:todo_app/view/constant/extension.dart';
import 'package:todo_app/view/widgets/circle_decor.dart';
import 'package:todo_app/view/screens/home_screen.dart';
import '../widgets/main_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleDecor(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    splashImage,
                  ),
                  Text(
                    'Get things done with ToDo',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      'ToDo is the easiest way to stay organized and on top of your tasks. With ToDo, you can keep track of everything you need to do, stay productive and motivated, and get things done',
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  MainButton(
                    title: 'Get Started',
                    onTap: () {
                      context.push(const HomeScreen());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
