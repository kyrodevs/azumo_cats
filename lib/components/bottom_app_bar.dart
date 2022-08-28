import 'package:flutter/material.dart';

class BottomPawAppBar extends StatelessWidget {
  const BottomPawAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).colorScheme.primary,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: SizedBox(height: 35.0),
        ),
      ),
    );
  }
}
