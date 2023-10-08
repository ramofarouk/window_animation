import 'package:flutter/material.dart';
import 'package:window_animation/utils/colors.dart';
import 'package:window_animation/utils/dimensions.dart';

class WindowTopWidget extends StatelessWidget {
  const WindowTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Horizontal Bar
        Positioned(
            top: Dimension.getScreenHeight(context) * 0.020,
            right: 10,
            left: 10,
            child: Container(
              height: Dimension.getScreenHeight(context) * 0.025,
              color: AppColor.primaryColor,
            )),
        // Adding right circle
        Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: AppColor.primaryColor,
              radius: Dimension.getScreenHeight(context) * 0.035,
            )),
        // Adding left circle
        Positioned(
            top: 0,
            left: 0,
            child: CircleAvatar(
              backgroundColor: AppColor.primaryColor,
              radius: Dimension.getScreenHeight(context) * 0.035,
            )),
      ],
    );
  }
}
