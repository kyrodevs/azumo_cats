import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/get_cat_gif_body.dart';
import '../components/bottom_app_bar.dart';
import '../components/loading_page.dart';
import '../components/meow_button.dart';
import '../controller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomepageController homepageController = Get.put(HomepageController());

  @override
  Widget build(BuildContext contect) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Awesome Cat Gifs'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/v1008-25-a.jpg"),
                fit: BoxFit.cover),
          ),
          child: InkWell(
            child: GetBuilder<HomepageController>(
                init: HomepageController(),
                builder: (_) {
                  if (_.myCat != '') {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white30,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ShowCatGif(controller: _),
                          const SizedBox(
                            height: 25,
                          ),
                          MeowButton(
                              controller: _, buttonText: 'Meow', h: 50, w: 105),
                        ],
                      ),
                    );
                  } else {
                    return const LoadingPage(
                      loadingText: 'Loading an awesome Cat Gif',
                    );
                  }
                }),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.pets),
      ),
      bottomNavigationBar: const BottomPawAppBar(),
    );
  }
}
