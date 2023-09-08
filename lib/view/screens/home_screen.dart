import 'package:flutter/material.dart';
import 'package:todo_app/view/constant/colors.dart';
import 'package:todo_app/view/core/scaffold_custom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: greenColor,
                width: double.infinity,
                height: 300,
              ),
              const CircleDecor(),
            ],
          ),
        ],
      ),
    );
  }
}
