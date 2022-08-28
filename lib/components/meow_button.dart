import 'package:flutter/material.dart';

import '../controller/home_page_controller.dart';

class MeowButton extends StatelessWidget {
  const MeowButton(
      {required this.controller,
      required this.buttonText,
      Key? key,
      required this.h,
      required this.w})
      : super(key: key);

  final HomepageController controller;
  final String buttonText;
  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: const BorderSide(width: 3, color: Colors.white))),
            ),
            onPressed: () {
              controller.findACat();
            },
            child: SizedBox(
              height: h,
              width: w,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            )));
  }
}
