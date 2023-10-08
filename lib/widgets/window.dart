import 'package:flutter/material.dart';
import 'package:window_animation/utils/colors.dart';
import 'package:window_animation/utils/dimensions.dart';

class WindowWidget extends StatefulWidget {
  final bool isFolded;
  const WindowWidget(this.isFolded, {super.key});

  @override
  State<WindowWidget> createState() => _WindowWidgetState();
}

class _WindowWidgetState extends State<WindowWidget> {
  // Width of curtain
  double leftSheetWidth = 50;
  double rightSheetWidth = 50;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Window with background image
        Positioned(
            top: Dimension.getScreenHeight(context) * 0.09,
            right: Dimension.getScreenWidth(context) * 0.2,
            left: Dimension.getScreenWidth(context) * 0.2,
            child: Container(
              height: Dimension.getScreenWidth(context) * 0.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.secondaryColor,
                  border: Border.all(
                      color: AppColor.secondaryColor,
                      width: Dimension.getScreenWidth(context) * 0.03),
                  image: const DecorationImage(
                      image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
            )),
        // Adding vertical separator
        Positioned(
            top: Dimension.getScreenHeight(context) * 0.09,
            child: Container(
              height: Dimension.getScreenWidth(context) * 0.7,
              width: Dimension.getScreenWidth(context) * 0.03,
              color: AppColor.secondaryColor,
            )),
        // Adding horizontal separator
        Positioned(
            top: Dimension.getScreenHeight(context) * 0.09 +
                ((Dimension.getScreenWidth(context) * 0.7) / 2),
            right: Dimension.getScreenWidth(context) * 0.2,
            left: Dimension.getScreenWidth(context) * 0.2,
            child: Container(
              height: Dimension.getScreenWidth(context) * 0.03,
              color: AppColor.secondaryColor,
            )),
        getLeftCurtain(),
        getRightCurtain()
      ],
    );
  }

  getLeftCurtain() {
    return Positioned(
        top: 0,
        left: Dimension.getScreenWidth(context) * 0.15,
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            // On dragging, update width of curtain
            double position = details.localPosition.dx + 30;
            if (Dimension.getScreenWidth(context) * 0.33 >= position &&
                position > 20) {
              setState(() {
                leftSheetWidth = position;
              });
            }
          },
          child: Container(
            height: Dimension.getScreenWidth(context) * 0.85,
            width: leftSheetWidth,
            decoration: BoxDecoration(
                color: AppColor.thirdyColor,
                image: const DecorationImage(
                  opacity: 0.5,
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/window.png'), // Remplacez par le chemin vers votre motif SVG
                ),
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                    bottomLeft: const Radius.circular(10),
                    bottomRight: Radius.circular(!widget.isFolded ? 10 : 100))),
          ),
        ));
  }

  getRightCurtain() {
    return Positioned(
        top: 0,
        right: Dimension.getScreenWidth(context) * 0.15,
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            // On dragging, update width of curtain
            double position = (details.localPosition.dx * -1) + 30;
            if (Dimension.getScreenWidth(context) * 0.33 >= position &&
                position > 20) {
              setState(() {
                rightSheetWidth = position;
              });
            }
          },
          child: Container(
            height: Dimension.getScreenWidth(context) * 0.85,
            width: rightSheetWidth,
            decoration: BoxDecoration(
                color: AppColor.thirdyColor,
                image: const DecorationImage(
                  opacity: 0.5,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/window.png'),
                ),
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(10),
                    topRight: const Radius.circular(10),
                    bottomRight: const Radius.circular(10),
                    bottomLeft: Radius.circular(!widget.isFolded ? 10 : 100))),
          ),
        ));
  }
}
