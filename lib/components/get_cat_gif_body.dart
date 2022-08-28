import 'package:flutter/material.dart';
import '../controller/home_page_controller.dart';

class ShowCatGif extends StatelessWidget {
  const ShowCatGif({Key? key, required this.controller}) : super(key: key);
  final HomepageController controller;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange[200],
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
                width: 3, color: Theme.of(context).colorScheme.primary),
          ),
          height: 300,
          width: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              'https://cataas.com/cat/${controller.myCat}',
              cacheWidth: 160,
              cacheHeight: 120,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgres) {
                if (loadingProgres == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgres.expectedTotalBytes != null
                        ? loadingProgres.cumulativeBytesLoaded /
                            loadingProgres.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
