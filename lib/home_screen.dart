import 'package:flutter/material.dart';
import 'package:window_animation/utils/colors.dart';
import 'package:window_animation/utils/dimensions.dart';
import 'widgets/window_bottom.dart';
import 'widgets/window.dart';
import 'widgets/window_top.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFolded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            "An animated window",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "Powered By Omar Farouk",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.7),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 2.0,
              vertical: Dimension.getScreenWidth(context) * 0.1),
          child: Center(
              child: Stack(children: [
            const WindowTopWidget(), // Window's top
            WindowWidget(isFolded), // Window and Curtain
            const WindowBottomWidget(), // Window's bottom
            Positioned(
                top: Dimension.getScreenHeight(context) * 0.6,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isFolded ? "Unfold the curtain" : "Fold the curtain ",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FlutterSwitch(
                      activeColor: AppColor.primaryColor,
                      width: 60.0,
                      height: 30.0,
                      toggleSize: 25.0,
                      value: isFolded,
                      borderRadius: 20.0,
                      padding: 5.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          isFolded = val;
                        });
                      },
                    )
                  ],
                ))
          ])),
        ));
  }
}
