import 'package:flutter/material.dart';

import '../constant/colors.dart';


//ignore: must_be_immutable
class MainButton extends StatelessWidget {
  MainButton({super.key, required this.title, required this.onTap});

  final String title;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 40,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: backgroundColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}