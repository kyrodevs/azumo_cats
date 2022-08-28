import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({required this.loadingText, Key? key}) : super(key: key);
  final String loadingText;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(
          height: 20,
        ),
        Text(loadingText),
      ],
    ));
  }
}
