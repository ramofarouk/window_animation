import 'package:flutter/material.dart';
import 'package:window_animation/utils/colors.dart';
import 'package:window_animation/utils/dimensions.dart';

class WindowBottomWidget extends StatelessWidget {
  const WindowBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Trapezoid shelf
        Positioned(
            top: Dimension.getScreenHeight(context) * 0.09 +
                Dimension.getScreenWidth(context) * 0.7,
            right: Dimension.getScreenWidth(context) * 0.02,
            left: Dimension.getScreenWidth(context) * 0.02,
            child: Column(
              children: [
                CustomPaint(
                  size: Size(Dimension.getScreenWidth(context) * 2,
                      Dimension.getScreenHeight(context) * 0.02),
                  painter: TrapeziumPainter(),
                ),
                Container(
                  height: Dimension.getScreenHeight(context) * 0.03,
                  color: AppColor.secondaryColor,
                )
              ],
            )),
        // Adding book's image
        Positioned(
            top: Dimension.getScreenWidth(context) * 0.74,
            left: Dimension.getScreenWidth(context) * 0.22,
            child: Image.asset(
              "assets/books.png",
              scale: 2,
            )),
        // Adding cofee's image
        Positioned(
            top: Dimension.getScreenWidth(context) * 0.67,
            right: Dimension.getScreenWidth(context) * 0.22,
            child: Image.asset(
              "assets/cofee.png",
              scale: 1.5,
            )),
      ],
    );
  }
}

class TrapeziumPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColor.primaryColor.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width * 0.15, 0); // Upper left point
    path.lineTo(size.width * 0.85, 0); // Upper right stitch
    path.lineTo(size.width, size.height); // Bottom right stitch
    path.lineTo(0, size.height); // Lower left point
    path.close(); // Close the path to form the trapezoid

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
