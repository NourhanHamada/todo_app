import 'package:flutter/material.dart';
import '../constant/colors.dart';

class CircleDecor extends StatelessWidget {
  const CircleDecor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -540,
      // angle: 0,
      child: Transform.translate(
        offset: const Offset(-70, -70),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightGreenColor,
              ),
            ),
            Transform.translate(
              offset: const Offset(-55, 60),
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightGreenColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
